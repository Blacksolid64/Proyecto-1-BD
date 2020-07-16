using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Reflection;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace WebApplication4
{
    public partial class _BusquedaPorPropiedad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

     

        protected void Consultar_Click(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contact.aspx");
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        { 
            int i;
            if (Int32.TryParse(Busqueda.Text, out i) == false)
            {
                MessageBox.Show("Error! Tipo de dato inválido!", "Error!", MessageBoxButton.OK);
                e.Cancel = true;
            }
        }

        protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows < 1)
                MessageBox.Show("No se encuentran datos!", "Error!", MessageBoxButton.OK);

        }
    }
    
}