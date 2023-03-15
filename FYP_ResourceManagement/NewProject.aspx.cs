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

namespace FYP_ResourceManagement
{
    public partial class NewProject : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);

            if (!chk_RepeatCustomer.Checked)
            {

                SqlCommand cmd_ProjectID = new SqlCommand("SELECT MAX(ProjectID) FROM Projects", conn);
                cmd_ProjectID.CommandType = CommandType.Text;

                conn.Open();

                object obj_ProjectID = cmd_ProjectID.ExecuteScalar();
                int projectID = Convert.ToInt32(obj_ProjectID.ToString());
                projectID = projectID + 1;
                txt_ProjectID.Text = Convert.ToString(projectID);

                SqlCommand cmd_ProjectNumber = new SqlCommand("SELECT MAX(ProjectNumber) FROM Projects", conn);
                cmd_ProjectNumber.CommandType = CommandType.Text;

                object obj_ProjectNumber = cmd_ProjectNumber.ExecuteScalar();
                int projectNumber = Convert.ToInt32(obj_ProjectNumber.ToString());
                projectNumber = projectNumber + 1;
                txt_ProjectNumber.Text = Convert.ToString(projectNumber);

                conn.Close();


                txt_ProjectSubNumber.Text = "0";

                conn.Close();
            }
        }

        protected void BindGv()
        {
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT [CustomerID], [Customer] FROM [Project_Customer]", conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);
            conn.Close();

            ddl_Customer_Repeat.DataSource = dt;
            ddl_Customer_Repeat.DataBind();
            ddl_Customer_Repeat.Items.Insert(0, new ListItem("Select...", ""));
            ddl_ProjectNumber_Filter.Items.Insert(0, new ListItem("Select...", ""));
        }

        protected void BindProjNo()
        {
            int customerID = ddl_Customer_Repeat.SelectedIndex;
            int projectID = 0;
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("P01007_PROJECT_New_ProjectNo_Filter", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@customerID", customerID);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                projectID = Convert.ToInt32(reader.GetString(1));
            }

            reader.Close();

            adapter.Fill(dt);
            conn.Close();
            ddl_ProjectNumber_Filter.DataSource = dt;
            ddl_ProjectNumber_Filter.DataTextField = "ProjectNumber";
            ddl_ProjectNumber_Filter.DataValueField = "ProjectID";
            Session["ProjectID"] = projectID;
            ddl_ProjectNumber_Filter.DataBind();
            ddl_ProjectNumber_Filter.Items.Insert(0, new ListItem("Select...", ""));
        }

        protected void chk_RepeatCustomer_OnChecked (object sender, EventArgs e)
        {
            tbl_NewProject.Visible = false;
            tbl_NewProject_Repeat.Visible = true;
            ddl_Customer_Repeat.Visible = true;

            BindGv();
        }

        protected void ddl_ProjectCustomer_Repeat_OnSelectedIndexChanged (object sender, EventArgs e)
        {
            lbl_ProjectNumber_Repeat.Visible = true;
            ddl_ProjectNumber_Filter.Visible = true;

                BindProjNo();
        }

        protected void ddl_ProjectNumber_Filter_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            string projectNo = ddl_ProjectNumber_Filter.SelectedValue;
            int projSubNo = 0;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT [ProjectSubNumber] FROM [Projects] WHERE [ProjectID] = @projectID", conn);
            cmd.CommandType = CommandType.Text;
            conn.Open();
            cmd.Parameters.AddWithValue("@projectID", Session["ProjectID"]);

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                int value = reader.GetInt32(0);
                projSubNo = Convert.ToInt32(value);
            }

            reader.Close();
            conn.Close();
            projSubNo = projSubNo + 1;
            txt_ProjectSubNumber_Repeat.Text = Convert.ToString(projSubNo);
            txt_ProjectID_Repeat.Text = Convert.ToString(Session["ProjectID"]);

            BindDepartment();
        }

        private void BindDepartment()
        {
            string projectID = Session["ProjectID"].ToString();
            string departmentID = string.Empty;
            string department = string.Empty;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
            conn.Open();
            SqlCommand cmdID= new SqlCommand("SELECT [DepartmentID] FROM [Projects] WHERE [ProjectID] = @projectID", conn);
            cmdID.CommandType = CommandType.Text;
            cmdID.Parameters.AddWithValue("@projectID", projectID);

            SqlDataReader readerID = cmdID.ExecuteReader();

            while (readerID.Read())
            {
                string value = readerID.GetString(0);
                departmentID = value;
            }

            readerID.Close();

            SqlCommand cmd = new SqlCommand("SELECT [DepartmentName] FROM [Project_Department] WHERE [DepartmentID] = @departmentID", conn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@departmentID", departmentID);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string result = reader.GetString(0);
                department = result;
            }

            reader.Close();
            conn.Close();
            txt_Department_Repeat.Text = department;
            txt_Department_Repeat.DataBind();
        }

        protected void btn_Add_Click (object sender, EventArgs e)
        {
            Button btn = (Button)sender;
                string customer = txt_ProjectCustomer.Text;
                string projectNumber = txt_ProjectNumber.Text;
                string projectSubNumber = txt_ProjectSubNumber.Text;
                string projectID = txt_ProjectID.Text;
                string group = ddl_Group.SelectedValue;
                string title = txt_ProjectTitle.Text;
                string initiatedBy = ddl_InitiatedBy.SelectedValue;
                string reviewedBy = ddl_ReviewedBy.SelectedValue;
                string charge = ddl_Charge.SelectedValue;
                string status = ddl_Status.SelectedValue;
                string hoursExpected = txt_HoursExpected.Text;

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
                SqlCommand cmd = new SqlCommand("P01008_PROJECT_Insert", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@projectID", projectID);
                cmd.Parameters.AddWithValue("@projectGroupID", group);
                cmd.Parameters.AddWithValue("@projectTitle", title);
                cmd.Parameters.AddWithValue("@projectNumber", projectNumber);
                cmd.Parameters.AddWithValue("@projectSubNumber", projectSubNumber);
                cmd.Parameters.AddWithValue("@customer", customer);
                cmd.Parameters.AddWithValue("@initiatedBy", initiatedBy);
                cmd.Parameters.AddWithValue("@reviewedBy", reviewedBy);
                cmd.Parameters.AddWithValue("@charge", charge);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@hoursExpected", hoursExpected);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("~/AllProjects.aspx");
        }

        protected void btn_Add_Repeat_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

                string customerRepeat = ddl_Customer_Repeat.SelectedValue;
                string projectNumberRepeat = ddl_ProjectNumber_Filter.SelectedValue;
                string projectSubNumberRepeat = txt_ProjectSubNumber_Repeat.Text;
                string projectIDRepeat = txt_ProjectID_Repeat.Text;
                string groupRepeat = ddl_ProjectGroup_Repeat.SelectedValue;
                string titleRepeat = txt_Title_Repeat.Text;
                string initiatedByRepeat = ddl_InitiatedBy_Repeat.SelectedValue;
                string reviewedByRepeat = ddl_ReviewedBy_Repeat.SelectedValue;
                string chargeRepeat = ddl_Charge_Repeat.SelectedValue;
                string statusRepeat = ddl_Status_Repeat.SelectedValue;
                string hoursExpectedRepeat = txt_HoursExpected_Repeat.Text;

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
                SqlCommand cmd = new SqlCommand("P01008_PROJECT_Insert", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@projectID", projectIDRepeat);
                cmd.Parameters.AddWithValue("@projectGroupID", groupRepeat);
                cmd.Parameters.AddWithValue("@projectTitle", titleRepeat);
                cmd.Parameters.AddWithValue("@projectNumber", projectNumberRepeat);
                cmd.Parameters.AddWithValue("@projectSubNumber", projectSubNumberRepeat);
                cmd.Parameters.AddWithValue("@customer", customerRepeat);
                cmd.Parameters.AddWithValue("@initiatedBy", initiatedByRepeat);
                cmd.Parameters.AddWithValue("@reviewedBy", reviewedByRepeat);
                cmd.Parameters.AddWithValue("@charge", chargeRepeat);
                cmd.Parameters.AddWithValue("@status", statusRepeat);
                cmd.Parameters.AddWithValue("@hoursExpected", hoursExpectedRepeat);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("~/AllProjects.aspx");
        }
    }
}