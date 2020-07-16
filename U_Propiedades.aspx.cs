using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class U_Propiedades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedRow = GridView1.SelectedIndex;
            Session["IdPropiedadUsuario"] = GridView1.Rows[selectedRow].Cells[0].Text;
            Response.Redirect("U_RecibosPendientes");
        }
    }
}