using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class _EstadosDeCuenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void volver(object sender, EventArgs e)
        {
            Response.Redirect("Contact");
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Movimientos.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Row_Selected(object sender, EventArgs e)
        {
            Button BtnSeleccionar = (sender as Button);
            string commandName = BtnSeleccionar.CommandName;
            Session["IDEstado"] = Convert.ToInt32(commandName);
            Response.Redirect("Movimientos.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       
    }
    
}