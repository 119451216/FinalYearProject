using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_ResourceManagement
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            runAuthLevel();
        }

        private void runAuthLevel()
        {
            int authLvl = Convert.ToInt32(Session["AuthLvl"]);

            switch (authLvl)
            {
                case 0:
                    
                    break;
                case 1:
                    li_Admin.Visible = false;
                    li_NewProject.Visible = false;
                    li_Workload.Visible = false;
                    break;
                case 2:
                    li_Admin.Visible = false;
                    li_NewProject.Visible = false;
                    li_Workload.Visible = false;
                    break;
                case 3:
                    
                    break;
                case 4:
                    
                    break;
                default:
                    li_Admin.Visible = false;
                    li_NewProject.Visible = false;
                    li_Workload.Visible = false;
                    break;
            }
        }
    }

}