using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class _Movimientos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

     

        protected void Consultar_Click(object sender, EventArgs e)
        {
            SqlDataSource1.Update();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("EstadosDeCuenta");
        }

        protected void Descripcion_Movimiento_TextChanged(object sender, EventArgs e)
        {

        }
    }
    
}