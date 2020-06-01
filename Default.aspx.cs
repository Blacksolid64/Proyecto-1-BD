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
                string query = "select id from Usuario where usuario='" + txtUsername.Text + "' and password='" + txtPassword.Text + "'";
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    Session["UserID"] = reader.GetValue(0);
                    reader.Close();
                    Session["UserName"] = new SqlCommand("select top 1 usuario from Usuario where id=" + Session["UserID"], connection).ExecuteScalar().ToString();
                    Response.Redirect("Contact.aspx");
                }
                else
                    errorxd.Text="*Error, datos no coincidentes";
                connection.Close();
            }
        }
    }
}