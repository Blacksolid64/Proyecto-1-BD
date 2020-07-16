using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Session["UserId"] == null || Session["UserName"] == null)
                Response.Redirect("Default.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Propiedades.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("BusquedaPorPropietario.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("BusquedaPorPropiedad.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("BusquedaPorPropiedadDeUsuario.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("BusquedaPorUsuarioDePropiedad.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx");
        }

        protected void Insert(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
            Response.Redirect("Contact.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("PropietariosVsPropiedades.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("UsuariosVsPropiedades.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConceptoDeCobroVsPropiedades.aspx");
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bitácora.aspx");
        }
    }
}
