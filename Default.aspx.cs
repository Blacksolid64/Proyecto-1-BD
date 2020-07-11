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

                command.Parameters.Add("@id", System.Data.SqlDbType.Int);
                command.Parameters["@id"].Direction = System.Data.ParameterDirection.Output;

                command.Parameters.Add("@Admin", System.Data.SqlDbType.Int);
                command.Parameters["@Admin"].Direction = System.Data.ParameterDirection.Output;
                command.ExecuteNonQuery();

                if ((int)command.Parameters["@id"].Value != 0)
                {
                    if ((int)command.Parameters["@Admin"].Value == 1)
                    {
                        Session["UserID"] = 0;
                        Session["AdminID"] = (int)command.Parameters["@id"].Value;
                        Session["Admin"] = (int)command.Parameters["@admin"].Value;
                        Session["UserName"] = txtUsername.Text;
                        Response.Redirect("Contact.aspx");
                    }
                    else
                        Session["UserID"] = (int)command.Parameters["@id"].Value;
                        Session["Admin"] = (int)command.Parameters["@admin"].Value;
                        Session["UserName"] = txtUsername.Text;
                        Response.Redirect("U_Propiedades.aspx");
                }
                else
                Response.Write("<script>alert('Error, datos no válidos');</script>");
                txtUsername.Text = string.Empty;
                connection.Close();
            }
        }
    }
}