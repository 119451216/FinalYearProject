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
    public partial class EmployeeList  : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gv_Employees.DataBind();
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

        public void btn_Details_Click (object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int rowIndex = row.RowIndex;

            gv_Employees.DataBind();
            runAuthLevel_Details();
        }

        protected void btn_Edit_Click (object sender, EventArgs e)
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

        protected void gv_Employees_RowEditing (object sender, GridViewEditEventArgs e)
        {
            gv_Employees.SelectedIndex = e.NewEditIndex;
        }

        protected void btn_Confirm_Click (object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int rowIndex = row.RowIndex;
            System.Web.UI.WebControls.TextBox firstName = (System.Web.UI.WebControls.TextBox)gv_Employees.Rows[rowIndex].FindControl("txt_FirstName");
            System.Web.UI.WebControls.TextBox lastName = (System.Web.UI.WebControls.TextBox)gv_Employees.Rows[rowIndex].FindControl("txt_LastName");
            DropDownList department = (DropDownList)gv_Employees.Rows[rowIndex].FindControl("ddl_Department");
            System.Web.UI.WebControls.TextBox rate = (System.Web.UI.WebControls.TextBox)gv_Employees.Rows[rowIndex].FindControl("txt_Rate");
            System.Web.UI.WebControls.TextBox jobDescription = (System.Web.UI.WebControls.TextBox)gv_Employees.Rows[rowIndex].FindControl("txt_JobDescription");
            System.Web.UI.WebControls.Label hoursAssigned = (System.Web.UI.WebControls.Label)gv_Employees.Rows[rowIndex].FindControl("lbl_HoursAssigned");
            System.Web.UI.WebControls.TextBox projectsAllocated = (System.Web.UI.WebControls.TextBox)gv_Employees.Rows[rowIndex].FindControl("txt_ProjectsAllocated");

            int employeeID = Convert.ToInt32(Session["EmployeeID"]);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
            SqlCommand cmd = new SqlCommand("[P02004_EMPLOYEE_Update]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@employeeID", employeeID);
            cmd.Parameters.AddWithValue("@firstName", firstName.Text);
            cmd.Parameters.AddWithValue("@lastName", lastName.Text);
            cmd.Parameters.AddWithValue("@departmentID", department.SelectedValue);
            cmd.Parameters.AddWithValue("@rate", rate.Text);
            cmd.Parameters.AddWithValue("@jobDescription", jobDescription.Text);
            cmd.Parameters.AddWithValue("@hoursAssigned", hoursAssigned.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
                conn.Close();

            gv_Employees.EditIndex = -1;
            gv_Employees.DataBind();
        }

        public void btn_Cancel_Click (object sender, EventArgs e)
        {
            gv_Employees.EditIndex = -1;
            gv_Employees.DataBind();
        }

        protected void btn_Add_Click (object sender, EventArgs e)
        {
            runAuthLevel();

            System.Web.UI.WebControls.Button btn = (System.Web.UI.WebControls.Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            int rowIndex = row.RowIndex;
            System.Web.UI.WebControls.TextBox firstNameFooter = (System.Web.UI.WebControls.TextBox)gv_Employees.FooterRow.Cells[1].FindControl("FirstName");
            System.Web.UI.WebControls.TextBox lastNameFooter = (System.Web.UI.WebControls.TextBox)gv_Employees.FooterRow.Cells[2].FindControl("LastName");
            DropDownList department = (DropDownList)gv_Employees.FooterRow.Cells[3].FindControl("Department");
            System.Web.UI.WebControls.TextBox rate = (System.Web.UI.WebControls.TextBox)gv_Employees.FooterRow.Cells[4].FindControl("Rate");
            System.Web.UI.WebControls.TextBox jobDescription = (System.Web.UI.WebControls.TextBox)gv_Employees.FooterRow.Cells[5].FindControl("JobDescription");
            System.Web.UI.WebControls.TextBox projectAllocated = (System.Web.UI.WebControls.TextBox)gv_Employees.FooterRow.Cells[6].FindControl("ProjectsAllocated");

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
            SqlCommand cmd = new SqlCommand("[P02005_EMPLOYEE_Insert]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@firstName", firstNameFooter.Text);
            cmd.Parameters.AddWithValue("@lastName", lastNameFooter.Text);
            cmd.Parameters.AddWithValue("@department", department.SelectedValue);
            cmd.Parameters.AddWithValue("@rate", rate.Text);
            cmd.Parameters.AddWithValue("@jobDescription", jobDescription.Text);
            cmd.Parameters.AddWithValue("@projectsAllocated", projectAllocated.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}