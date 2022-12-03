using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_ResourceManagement
{
    public partial class AllProjects : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void btn_Edit_Click (object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            Response.Redirect("ProjectDetails.aspx");
        }
    }
}