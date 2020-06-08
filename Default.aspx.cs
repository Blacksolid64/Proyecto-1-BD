using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["masterConnectionString"].ConnectionString);
                connection.Open();
                string query = "SP_Usuario_Login";
                SqlCommand command = new SqlCommand(query, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@usuario", txtUsername.Text);
                command.Parameters.AddWithValue("@password", txtPassword.Text);
                int esValido = (Int32)command.ExecuteScalar();

                if (esValido == 1)
                {
                    Session["UserID"] = 0;
                    Session["IDpropiedad"] = 4;
                    Session["UserName"] = "Jaa";
                    Response.Redirect("Contact.aspx");
                }
                else
                    errorxd.Text="*Error, datos no coincidentes";
                connection.Close();
            }
        }
    }
}