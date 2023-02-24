using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace FYP_ResourceManagement
{

    public partial class Availability : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "UnrenderCalendar", "document.getElementById('calendar').style.display = 'none';", true);
            tbl_Input.Visible = true;
            btn_Add.Visible = false;
        }

        protected void img_StartDate_Click(object sender, ImageClickEventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "UnrenderCalendar", "document.getElementById('calendar').style.display = 'none';", true);
            cal_StartDatePicker.Visible = true;
        }

        protected void cal_StartDatePicker_SelectionChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "UnrenderCalendar", "document.getElementById('calendar').style.display = 'none';", true);
            txt_StartDate.Text = cal_StartDatePicker.SelectedDate.ToShortDateString();
            cal_StartDatePicker.Visible = false;
        }

        protected void img_EndDate_Click(object sender, ImageClickEventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "UnrenderCalendar", "document.getElementById('calendar').style.display = 'none';", true);
            cal_EndDatePicker.Visible = true;
        }

        protected void cal_EndDatePicker_SelectionChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "UnrenderCalendar", "document.getElementById('calendar').style.display = 'none';", true);
            txt_EndDate.Text = cal_EndDatePicker.SelectedDate.ToShortDateString();
            cal_EndDatePicker.Visible = false;
        }

        public class Event
        {
            public string Title { get; set; }
            public DateTime startDate { get; set; }
            public DateTime endDate { get; set; }
            public string addInfo { get; set; }
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            lbl_TitleError.Visible = false;
            lbl_InfoError.Visible = false;

            string title = txt_Title.Text;
            bool invalidTitle = false;
            foreach (char c in title)
            {
                if (!char.IsLetter(c))
                {
                    invalidTitle = true;
                    break;
                }
            }

            if (invalidTitle)
            {
                txt_Title.Text = "";
                lbl_TitleError.Visible = true;
                ClientScript.RegisterStartupScript(GetType(), "UnrenderCalendar", "document.getElementById('calendar').style.display = 'none';", true);
            }
            else
            {
                lbl_TitleError.Visible = false;

                string info = txt_Info.Text;
                bool invalidInfo = false;
                foreach (char c in info)
                {
                    //if (!char.IsLetter(c))
                    //{
                    //    invalidInfo = true;
                    //    break;
                    //}
                }

                if (invalidInfo)
                {
                    txt_Info.Text = "";
                    lbl_InfoError.Visible = true;
                    lbl_Optional.Visible = false;
                    ClientScript.RegisterStartupScript(GetType(), "UnrenderCalendar", "document.getElementById('calendar').style.display = 'none';", true);
                }
                else
                {
                    lbl_InfoError.Visible = false;

                    string username = User.Identity.Name;
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ND_ResourceManagement"].ConnectionString);
                    SqlCommand cmd = new SqlCommand("[dbo].[P09001_REQUEST_Insert]", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@title", txt_Title.Text);
                    cmd.Parameters.AddWithValue("@startDate", cal_StartDatePicker.SelectedDate);
                    cmd.Parameters.AddWithValue("@endDate", cal_EndDatePicker.SelectedDate);
                    cmd.Parameters.AddWithValue("@add_Info", txt_Info.Text);
                    cmd.Parameters.AddWithValue("@username", username);
                    conn.Open();
                    int apt = cmd.ExecuteNonQuery();
                    conn.Close();

                    if (apt < 0)
                    {
                        MessageBox.Show("Request has been sent", "Request Status", MessageBoxButtons.OK);
                    }

                    ClientScript.RegisterStartupScript(GetType(), "ReRenderCalendar", "document.getElementById('calendar').style.display = '';", true);
                    tbl_Input.Visible = false;
                    btn_Add.Visible = true;



                    var newEvent = new Event();
                    newEvent.Title = txt_Title.Text;
                    newEvent.startDate = Convert.ToDateTime(txt_StartDate.Text);
                    newEvent.endDate = Convert.ToDateTime(txt_EndDate.Text);
                    newEvent.addInfo = txt_Info.Text;

                    var script = string.Format("$('#calendar').fullCalendar('renderEvent, {{ title: '{0}', startDate: '{1}', endDate: '{2}', addInfo: '{3}' }});",
                        newEvent.Title, newEvent.startDate.ToString("dd-MMM-yyyy"), newEvent.endDate.ToString("dd-MMM-yyyy"), newEvent.addInfo);
                    ScriptManager.RegisterStartupScript(this, GetType(), "InsertEvent", script, true);
                }
            }
        }
    }
}