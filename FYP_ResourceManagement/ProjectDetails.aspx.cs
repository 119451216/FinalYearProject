using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace FYP_ResourceManagement
{
    public partial class ProjectDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            runAuthLevel();

            int authLvl = Convert.ToInt32(Session["AuthLvl"]);

            if (authLvl == 0 || authLvl == 3 || authLvl == 4)
            {
                lbl_ProjectHeader.Text = Session["Customer"] + " " + Session["ProjectNumber"].ToString() + "." + Session["ProjectSubNumber"].ToString() + " - " + Session["ProjectTitle"].ToString() + ":";

                hdn_ProjectID.Value = Session["ProjectID"].ToString();
                lbl_ProjectGroup.Text = Session["Group"].ToString();
                lbl_ProjectNumber.Text = Session["ProjectNumber"].ToString();
                lbl_ProjectSubNumber.Text = Session["ProjectSubNumber"].ToString();
                lbl_ProjectTitle.Text = Session["ProjectTitle"].ToString();
                lbl_Customer.Text = Session["Customer"].ToString();
                lbl_InitiatedBy.Text = Session["InitiatedBy"].ToString();
                lbl_ReviewedBy.Text = Session["ReviewedBy"].ToString();
                lbl_Charge.Text = Session["ProjectCharge"].ToString();
                lbl_Status.Text = Session["ProjectStatus"].ToString();
                lbl_Department.Text = Session["Department"].ToString();
                decimal percentComplete = Convert.ToDecimal(Session["PercentComplete"].ToString());
                lbl_PercentComplete.Text = Convert.ToString(Math.Round(percentComplete, 2));
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