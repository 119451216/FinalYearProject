using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.Json;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Drawing;

namespace FYP_ResourceManagement
{

    public partial class Availability : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEvents();
            }

            gv_Events.Visible = false;
        }

        private void BindEvents()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
            SqlCommand cmd = new SqlCommand("P10001_LEAVE_Select", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            gv_Events.DataSource = dt;
            gv_Events.DataBind();
        }

        protected void cal_Leave_SelectionChanged(object sender, System.EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT [LeaveID], [LeaveTitle], [LeaveStartDate], [LEaveEndDate], [LeaveAddInfo], [Username] FROM [Workforce_Leave] WHERE [LeaveStartDate] = @startDate", conn);
            cmd.Parameters.AddWithValue("@startDate", cal_Leave.SelectedDate);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            gv_Events.DataSource = dt;
            gv_Events.DataBind();

            gv_Events.Visible = true;
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            cal_Leave.Visible = false;
            tbl_Input.Visible = true;
            btn_Add.Visible = false;
        }

        protected void img_StartDate_Click(object sender, ImageClickEventArgs e)
        {
            cal_Leave.Visible = false;
            cal_StartDatePicker.Visible = true;
        }

        protected void cal_StartDatePicker_SelectionChanged(object sender, EventArgs e)
        {
            cal_Leave.Visible = false;
            txt_StartDate.Text = cal_StartDatePicker.SelectedDate.ToShortDateString();
            cal_StartDatePicker.Visible = false;
        }

        protected void img_EndDate_Click(object sender, ImageClickEventArgs e)
        {
            cal_Leave.Visible = false;
            cal_EndDatePicker.Visible = true;
        }

        protected void cal_EndDatePicker_SelectionChanged(object sender, EventArgs e)
        {
            cal_Leave.Visible = false;
            txt_EndDate.Text = cal_EndDatePicker.SelectedDate.ToShortDateString();
            cal_EndDatePicker.Visible = false;
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            rfv_Title.Visible = false;
            rev_Title.Visible = false;

            int requestID = 0;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
            conn.Open();
            SqlCommand cmdID = new SqlCommand("SELECT MAX([RequestID]) FROM [Requests]", conn);
            cmdID.CommandType = CommandType.Text;

            SqlDataReader reader = cmdID.ExecuteReader();

            while (reader.Read())
            {
                int value = reader.GetInt32(0);
                requestID = Convert.ToInt32(value);
            }

            reader.Close();

            requestID = requestID + 1;

            string username = User.Identity.Name;

            SqlCommand cmd = new SqlCommand("[dbo].[P09001_REQUEST_Insert]", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@requestID", requestID);
            cmd.Parameters.AddWithValue("@title", txt_Title.Text);
            cmd.Parameters.AddWithValue("@startDate", cal_StartDatePicker.SelectedDate);
            cmd.Parameters.AddWithValue("@endDate", cal_EndDatePicker.SelectedDate);
            cmd.Parameters.AddWithValue("@add_Info", txt_Info.Text);
            cmd.Parameters.AddWithValue("@username", username);
            int apt = cmd.ExecuteNonQuery();
            conn.Close();

            if (apt < 0)
            {
                MessageBox.Show("Request has been sent", "Request Status", MessageBoxButtons.OK);
            }

            cal_Leave.Visible = true;
            tbl_Input.Visible = false;
            btn_Add.Visible = true;

            Session["RequestID"] = requestID;
            Session["Title"] = txt_Title.Text;
            Session["StartDate"] = txt_StartDate.Text;
            Session["EndDate"] = txt_EndDate.Text;
            Session["AddInfo"] = txt_Info.Text;
            Session["RequestUser"] = username;
        }
    }
}