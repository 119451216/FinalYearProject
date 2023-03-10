using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace FYP_ResourceManagement
{
    public partial class AllProjects : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gv_Projects.DataBind();
            }
        }

        protected void btn_Edit_Click(object sender, EventArgs e)
        {
            int authLvl = Convert.ToInt32(Session["AuthLvl"]);

            if (authLvl == 0 || authLvl == 3 || authLvl == 4)
            {
                ImageButton btn = (ImageButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                int rowIndex = row.RowIndex;

                System.Web.UI.WebControls.Label lbl_ProjectID = (System.Web.UI.WebControls.Label)gv_Projects.Rows[rowIndex].FindControl("lbl_ProjectID");
                int projectID = 0;
                projectID = Convert.ToInt32(lbl_ProjectID.Text);

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
                SqlCommand cmd = new SqlCommand("P01001_PROJECT_Details", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@projectID", projectID);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Session["ProjectID"] = reader.GetValue(0);
                    Session["Group"] = reader.GetValue(1);
                    Session["ProjectNumber"] = reader.GetValue(2);
                    Session["ProjectSubNumber"] = reader.GetValue(3);
                    Session["ProjectTitle"] = reader.GetValue(4);
                    Session["Customer"] = reader.GetValue(5);
                    Session["InitiatedBy"] = reader.GetValue(6);
                    Session["ReviewedBy"] = reader.GetValue(7);
                    Session["ProjectCharge"] = reader.GetValue(8);
                    Session["ProjectStatus"] = reader.GetValue(9);
                    Session["Department"] = reader.GetValue(10);
                    Session["HoursCommitted"] = reader.GetValue(11);
                    Session["HoursExpected"] = reader.GetValue(12);
                    Session["PercentComplete"] = reader.GetValue(13);
                }
                reader.Close();

                conn.Close();
            }

            runAuthLevel();
        }

        private void runAuthLevel()
        {
            int authLvl = Convert.ToInt32(Session["AuthLvl"]);

            switch (authLvl)
            {
                case 0:
                    Response.Redirect("ProjectDetails.aspx");
                    break;
                case 1:
                    MessageBox.Show("You are not authorised to access this page", "Authentication Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case 2:
                    MessageBox.Show("You are not authorised to access this page", "Authentication Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case 3:
                    Response.Redirect("ProjectDetails.aspx");
                    break;
                case 4:
                    Response.Redirect("ProjectDetails.aspx");
                    break;
                default:
                    MessageBox.Show("You are not authorised to access this page", "Authentication Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
            }
        }
    }
}