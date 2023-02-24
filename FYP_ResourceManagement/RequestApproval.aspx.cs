using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_ResourceManagement
{
    public partial class RequestApproval : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_Approve_Click (object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int rowIndex = row.RowIndex;

            Label requestID = (Label)gv_Requests.Rows[rowIndex].FindControl("lbl_RequestID");
            Label username = (Label)gv_Requests.Rows[rowIndex].FindControl("lbl_Username");

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
            SqlCommand cmd = new SqlCommand("P09003_REQUEST_Approved", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@requestID", requestID.Text);
            cmd.Parameters.AddWithValue("@username", username.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            gv_Requests.DataBind();
        }

        protected void btn_Disapprove_Click (object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int rowIndex = row.RowIndex;

            Label lbl_RequestID = (Label)gv_Requests.Rows[rowIndex].FindControl("lbl_RequestID");
            Label lbl_username = (Label)gv_Requests.Rows[rowIndex].FindControl("lbl_Username");

            string requestID = lbl_RequestID.Text;
            string username = lbl_username.Text;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
            SqlCommand cmd = new SqlCommand("P09004_REQUEST_Disapprove", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@requestID", requestID);
            cmd.Parameters.AddWithValue("@username", username);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            gv_Requests.DataBind();
        }
    }
}