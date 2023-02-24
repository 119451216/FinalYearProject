using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Web.Security;
using System.Data;

namespace FYP_ResourceManagement
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        // M. Khan, 11 Jan 2014 - "Simple User Loggin Form Example in ASP.NET" - https://www.aspsnippets.com/Articles/Simple-User-Login-Form-example-in-ASPNet.aspx 
        protected void ValidateUser(object sender, EventArgs e)
        {
            int userID = 0;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
            SqlCommand cmd = new SqlCommand("P08001_LOGIN", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", login.UserName);
            cmd.Parameters.AddWithValue("@password", login.Password);
            conn.Open();
            userID = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();

            switch (userID)
            {
                case -1:
                    login.FailureText = "Username and/or password is incorrect.";
                    break;
                case -2:
                    login.FailureText = "Account does not exist.";
                    break;
                default:
                    runUser();
                    FormsAuthentication.RedirectFromLoginPage(login.UserName, login.RememberMeSet);
                    break;
            }
        }

        private void runUser()
        {
            string username = login.UserName;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand("P06001_AUTHENTICATION_Select", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", username);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Session["EmployeeID"] = reader.GetValue(0);
                Session["Username"] = reader.GetString(1);
                Session["AuthLvl"] = reader.GetInt32(2);
            }
        }
    }
};