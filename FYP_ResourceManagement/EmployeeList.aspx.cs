using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace FYP_ResourceManagement
{
    public partial class EmployeeList : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                gv_Employees.DataBind();
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
                    MessageBox.Show("You are not authorised to access this feature", "Authentication Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    gv_Employees.EditIndex = -1;
                    break;
                case 2:
                    MessageBox.Show("You are not authorised to access this feature", "Authentication Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    gv_Employees.EditIndex = -1;
                    break;
                case 3:

                    break;
                case 4:

                    break;
                default:
                    MessageBox.Show("You are not authorised to access this feature", "Authentication Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    gv_Employees.EditIndex = -1;
                    break;
            }
        }

        private void runAuthLevel_Details()
        {
            int authLvl = Convert.ToInt32(Session["AuthLvl"]);

            switch (authLvl)
            {
                case 0:
                    Response.Redirect("EmployeeDetails.aspx");
                    break;
                case 1:
                    MessageBox.Show("You are not authorised to access this page", "Authentication Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case 2:
                    MessageBox.Show("You are not authorised to access this page", "Authentication Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                case 3:
                    Response.Redirect("EmployeeDetails.aspx");
                    break;
                case 4:
                    Response.Redirect("EmployeeDetails.aspx");
                    break;
                default:
                    MessageBox.Show("You are not authorised to access this page", "Authentication Alert", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
            }
        }

        protected void gv_Employees_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        public void btn_Details_Click(object sender, EventArgs e)
        {
            runAuthLevel();

            int authLvl = Convert.ToInt32(Session["AuthLvl"]);

            if (authLvl == 0 || authLvl == 3 || authLvl == 4)
            {
                ImageButton btn = (ImageButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                int rowIndex = row.RowIndex;

                System.Web.UI.WebControls.Label lbl_EmployeeID = (System.Web.UI.WebControls.Label)gv_Employees.Rows[rowIndex].FindControl("lbl_EmployeeID");
                int employeeID = Convert.ToInt32(lbl_EmployeeID.Text);

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
                SqlCommand cmd = new SqlCommand("P02002_EMPLOYEE_Details", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@employeeID", employeeID);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Session["EmployeeID"] = reader.GetValue(0);
                    Session["FirstName"] = reader.GetValue(1);
                    Session["LastName"] = reader.GetValue(2);
                    Session["Department"] = reader.GetValue(3);
                    Session["Rate"] = reader.GetValue(4);
                    Session["JobDescription"] = reader.GetValue(5);
                    Session["HoursAssigned"] = reader.GetValue(6);
                    Session["Workload"] = reader.GetValue(7);
                    Session["ProjectsAllocated"] = reader.GetValue(8);
                }
                reader.Close();

                conn.Close();
            }
            gv_Employees.DataBind();

            runAuthLevel_Details();
        }

        protected void btn_Edit_Click(object sender, EventArgs e)
        {

            ImageButton btn = (ImageButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int rowIndex = row.RowIndex;

            gv_Employees.DataBind();
            runAuthLevel();

            int authLvl = Convert.ToInt32(Session["AuthLvl"]);

            if (authLvl == 0)
            {
                gv_Employees.EditIndex = row.RowIndex;
            }

            if (authLvl == 3)
            {
                gv_Employees.EditIndex = row.RowIndex;
            }

            if (authLvl == 4)
            {
                gv_Employees.EditIndex = row.RowIndex;
            }
        }

        protected void gv_Employees_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_Employees.SelectedIndex = e.NewEditIndex;
        }

        protected void btn_Confirm_Click (object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int rowIndex = row.RowIndex;

            System.Web.UI.WebControls.Label lbl_EmployeeID = (System.Web.UI.WebControls.Label)gv_Employees.Rows[rowIndex].FindControl("lbl_EmployeeID_Edit");
            int employeeID = Convert.ToInt32(lbl_EmployeeID.Text);

            System.Web.UI.WebControls.TextBox txt_FirstName = (System.Web.UI.WebControls.TextBox)gv_Employees.Rows[rowIndex].FindControl("txt_FirstName");
            System.Web.UI.WebControls.TextBox txt_LastName = (System.Web.UI.WebControls.TextBox)gv_Employees.Rows[rowIndex].FindControl("txt_LastName");
            System.Web.UI.WebControls.DropDownList ddl_Department = (DropDownList)gv_Employees.Rows[rowIndex].FindControl("ddl_Department");
            System.Web.UI.WebControls.TextBox txt_Rate = (System.Web.UI.WebControls.TextBox)gv_Employees.Rows[rowIndex].FindControl("txt_Rate");
            System.Web.UI.WebControls.TextBox txt_JobDescription = (System.Web.UI.WebControls.TextBox)gv_Employees.Rows[rowIndex].FindControl("txt_JobDescription");

            string firstName = txt_FirstName.Text;
            string lastName = txt_LastName.Text;
            string rate = txt_Rate.Text;
            string jobDescription = txt_JobDescription.Text;

            if (!Regex.IsMatch(firstName, "^[a-zA-Z ]+$"))
            {
                System.Web.UI.WebControls.Label lbl_FirstName = (System.Web.UI.WebControls.Label)gv_Employees.Rows[rowIndex].FindControl("lbl_FirstName_Error");
                lbl_FirstName.Visible = true;
            }
            else if (!Regex.IsMatch(lastName, "^[a-zA-Z ]+$"))
            {
                System.Web.UI.WebControls.Label lbl_LastName = (System.Web.UI.WebControls.Label)gv_Employees.Rows[rowIndex].FindControl("lbl_LastName_Error");
                lbl_LastName.Visible = true;
            }
            else if (!Regex.IsMatch(rate, "^\\d*\\.?\\d*$"))
            {
                System.Web.UI.WebControls.Label lbl_Rate = (System.Web.UI.WebControls.Label)gv_Employees.Rows[rowIndex].FindControl("lbl_Rate_Error");
                lbl_Rate.Visible = true;
            }
            else if (!Regex.IsMatch(jobDescription, "^[a-zA-Z ]+$"))
            {
                System.Web.UI.WebControls.Label lbl_JobDescription = (System.Web.UI.WebControls.Label)gv_Employees.Rows[rowIndex].FindControl("lbl_JobDescription_Error");
                lbl_JobDescription.Visible = true;
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
                SqlCommand cmd = new SqlCommand("[P02004_EMPLOYEE_Update]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@employeeID", employeeID);
                cmd.Parameters.AddWithValue("@firstName", firstName);
                cmd.Parameters.AddWithValue("@lastName", lastName);
                cmd.Parameters.AddWithValue("@departmentID", ddl_Department.SelectedValue);
                cmd.Parameters.AddWithValue("@rate", rate);
                cmd.Parameters.AddWithValue("@jobDescription", jobDescription);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                gv_Employees.EditIndex = -1;
                gv_Employees.DataBind();
            }
        }

        public void btn_Cancel_Click (object sender, EventArgs e)
        {
            gv_Employees.EditIndex = -1;
            gv_Employees.DataBind();
        }

        protected void btn_Add_Click (object sender, EventArgs e)
        {
            runAuthLevel();

            System.Web.UI.WebControls.ImageButton btn = (System.Web.UI.WebControls.ImageButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int rowIndex = row.RowIndex;

            System.Web.UI.WebControls.TextBox txt_FirstNameFooter = (System.Web.UI.WebControls.TextBox)gv_Employees.FooterRow.Cells[1].FindControl("txt_FirstName_Footer");
            System.Web.UI.WebControls.TextBox txt_LastNameFooter = (System.Web.UI.WebControls.TextBox)gv_Employees.FooterRow.Cells[2].FindControl("txt_LastName_Footer");
            DropDownList ddl_DepartmentFooter = (DropDownList)gv_Employees.FooterRow.Cells[3].FindControl("ddl_Department_Footer");
            System.Web.UI.WebControls.TextBox txt_RateFooter = (System.Web.UI.WebControls.TextBox)gv_Employees.FooterRow.Cells[4].FindControl("txt_Rate_Footer");
            System.Web.UI.WebControls.TextBox txt_JobDescriptionFooter = (System.Web.UI.WebControls.TextBox)gv_Employees.FooterRow.Cells[5].FindControl("txt_JobDescription_Footer");

            string firstNameFooter = txt_FirstNameFooter.Text;
            string lastNameFooter = txt_LastNameFooter.Text;
            string rateFooter = txt_RateFooter.Text;
            string jobDescriptionFooter = txt_JobDescriptionFooter.Text;

            if (!Regex.IsMatch(firstNameFooter, "^[a-zA-Z ]+$"))
            {
                System.Web.UI.WebControls.Label lbl_FirstName_Footer = (System.Web.UI.WebControls.Label)gv_Employees.Rows[rowIndex].FindControl("lbl_FirstName_Error_Footer");
                lbl_FirstName_Footer.Visible = true;
            }
            else if (!Regex.IsMatch(lastNameFooter, "^[a-zA-Z ]+$"))
            {
                System.Web.UI.WebControls.Label lbl_LastName_Footer = (System.Web.UI.WebControls.Label)gv_Employees.Rows[rowIndex].FindControl("lbl_LastName_Error_Footer");
                lbl_LastName_Footer.Visible = true;
            }
            else if (!Regex.IsMatch(rateFooter, "^\\d*\\.?\\d*$"))
            {
                System.Web.UI.WebControls.Label lbl_Rate_Footer = (System.Web.UI.WebControls.Label)gv_Employees.Rows[rowIndex].FindControl("lbl_Rate_Error_Footer");
                lbl_Rate_Footer.Visible = true;
            }
            else if (!Regex.IsMatch(jobDescriptionFooter, "^[a-zA-Z ]+$"))
            {
                System.Web.UI.WebControls.Label lbl_JobDescription_Footer = (System.Web.UI.WebControls.Label)gv_Employees.Rows[rowIndex].FindControl("lbl_JobDescription_Error_Footer");
                lbl_JobDescription_Footer.Visible = true;
            }
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
                SqlCommand cmd_ID = new SqlCommand("SELECT MAX([EmployeeID]) FROM [Employees]", conn);
                cmd_ID.CommandType = CommandType.Text;
                conn.Open();
                SqlDataReader reader = cmd_ID.ExecuteReader();

                int employeeID = 999;

                while (reader.Read())
                {
                    employeeID = reader.GetInt32(0);
                }

                reader.Close();

                employeeID = employeeID + 1;
                decimal rate = Convert.ToDecimal(rateFooter);

                SqlCommand cmd = new SqlCommand("[P02005_EMPLOYEE_Insert]", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@employeeID", employeeID);
                cmd.Parameters.AddWithValue("@firstName", firstNameFooter);
                cmd.Parameters.AddWithValue("@lastName", lastNameFooter);
                cmd.Parameters.AddWithValue("@departmentID", ddl_DepartmentFooter.SelectedValue);
                cmd.Parameters.AddWithValue("@rate", rate);
                cmd.Parameters.AddWithValue("@jobDescription", jobDescriptionFooter);
                cmd.ExecuteNonQuery();
                conn.Close();

                gv_Employees.DataBind();
            }
        }
    }
}