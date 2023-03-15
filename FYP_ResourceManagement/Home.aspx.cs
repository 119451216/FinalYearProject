using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FYP_ResourceManagement
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            runAuthLvl();
        }

        private void runAuthLvl()
        {
            int authLvl = Convert.ToInt32(Session["AuthLvl"]);

            switch (authLvl)
            {
                case 0:
                    
                    break;
                case 1:
                    txt_NewProject.Visible = false;
                    break;
                case 2:
                    txt_NewProject.Visible = false;
                    break;
                case 3:
                    
                    break;
                case 4:
                    
                    break;
                default:
                    txt_NewProject.Visible = false;
                    break;
            }
        }
    }
}