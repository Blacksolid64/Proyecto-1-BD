using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class Movimientos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridBinding();
            }
        }

        protected void GridBinding()
        {
            
        }

        protected void volver(object sender, EventArgs e)
        {
            Response.Redirect("Contact");
        }
    }
    
}