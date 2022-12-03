using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_ResourceManagement
{
    public partial class EmployeeList : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gv_Employees.DataBind();
        }

        public void btn_Details_Click (object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            Response.Redirect("~/EmployeeDetails.aspx");
        }

        public void btn_Edit_Click (object sender, EventArgs e)
        {
            gv_Employees.EditIndex = 1;
            gv_Employees.DataBind();
        }

        public void btn_Cancel_Click (object sender, EventArgs e)
        {
            gv_Employees.EditIndex = -1;
            gv_Employees.DataBind();
        }
    }

}