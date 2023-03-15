using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace FYP_ResourceManagement
{
    public partial class EmployeeDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            runAuthLevel();

            int authLvl = Convert.ToInt32(Session["AuthLvl"]);

            if (authLvl == 0 || authLvl == 3 || authLvl == 4)
            {
                lbl_EmployeeHeader.Text = Session["LastName"] + ", " + Session["FirstName"].ToString() + " - " + Session["JobDescription"].ToString();

                hdn_EmployeeID.Value = Session["EmployeeID"].ToString();
                lbl_EmployeeID.Text = Session["EmployeeID"].ToString();
                lbl_Department.Text = Session["Department"].ToString();
                lbl_Rate.Text = Session["Rate"].ToString();
                lbl_JobDescription.Text = Session["JobDescription"].ToString();
                lbl_HoursAssigned.Text = Session["HoursAssigned"].ToString();
                decimal workload = Convert.ToDecimal(Session["Workload"].ToString());
                lbl_Workload.Text = Convert.ToString(Math.Round(workload, 2));
            }
        }
        private void runAuthLevel()
        {
            int authLvl = Convert.ToInt32(Session["AuthLvl"]);

            switch (authLvl)
            {
                case 0:
                    
                    break;
                case 1:
                    MessageBox.Show("You are not authorised to access this page", "Authentication Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    Response.Redirect("~/Home.aspx");
                    break;
                case 2:
                    MessageBox.Show("You are not authorised to access this page", "Authentication Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    Response.Redirect("~/Home.aspx");
                    break;
                case 3:

                    break;
                case 4:
                    
                    break;
                default:
                    MessageBox.Show("You are not authorised to access this page", "Authentication Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    Response.Redirect("Home.aspx");
                    break;
            }
        }
    }
}