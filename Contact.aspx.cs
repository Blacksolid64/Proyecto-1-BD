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
        private String connectionString = @"Data Source=HORCHATÁSTICO;Initial Catalog=Banco;Integrated Security=True";
        //private String connectionString = @"Data Source=ZLAPTOP22;Initial Catalog=Base_de_Datos_1;Integrated Security=True";// Cambiado para mi base de datos xd
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Session["UserId"] == null || Session["UserName"] == null)
                Response.Redirect("Default.aspx");
            else
            {
                JAJAPRUEBA.Text = Session["UserName"].ToString();
            }
            actualizarRotulitoLlamativo();

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    TextBox t;
                    try
                    {
                        SqlDataSource1.InsertParameters.Remove(SqlDataSource1.InsertParameters["idCuenta"]);
                    }
                    catch { }
                    SqlDataSource1.InsertParameters.Add("idCuenta", Session["CuentaID"].ToString());
                    String[] nombres = { "nombre", "ced", "email", "porcentajeBeneficio", "telefono", "fechaNac" };
                    for (int i = 0; i < nombres.Length; i++)
                    {
                        SqlDataSource1.InsertParameters.Remove(SqlDataSource1.InsertParameters[nombres[i]]);
                        t = (GridView1.FooterRow.FindControl("FooterTextBox" + (i + 1)) as TextBox);
                        if (t.Text != "")
                            SqlDataSource1.InsertParameters.Add(nombres[i], t.Text.Trim());
                        else
                        {
                            if (i >= 3) i += 1;
                            ClientScript.RegisterStartupScript(GetType(),"hwa","alert('Debe llenar todos los campos, el campo de " + GridView1.Columns[i + 2].HeaderText.ToLower() + " está vacío.')",true);
                            return;
                        }
                    }
                    SqlDataSource1.InsertParameters.Remove(SqlDataSource1.InsertParameters["parentesco"]);
                    SqlDataSource1.InsertParameters.Add("parentesco", (GridView1.FooterRow.FindControl("DropDownList2") as DropDownList).SelectedValue);
                    t = (GridView1.FooterRow.FindControl("FooterTextBox4") as TextBox);
                    if (Int32.Parse(t.Text) <= 0 || Int32.Parse(t.Text) > 100)
                    ClientScript.RegisterStartupScript(GetType(),"hwa","alert('El porcentaje de beneficio debe ser un porcentaje válido. ]0,100]')",true);
                    else
                        SqlDataSource1.Insert();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(),"hwa","alert('" + ex.Message + "')",true);
            }

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.Cancel = true;
            TextBox t;
            try
            {
                t = (GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox);
                if (Int32.Parse(t.Text) <= 0 || Int32.Parse(t.Text) > 100)
                {
                    ClientScript.RegisterStartupScript(GetType(),"hwa","alert('El porcentaje de beneficio debe ser un porcentaje válido. ]0,100]')",true);
                    
                }
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("SP_actualizarBeneficiario",conn);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("id", (GridView1.Rows[e.RowIndex].FindControl("idEdit") as Label).Text);
                    String[] nombres = { "nombre", "ced", "email", "porcentajeBeneficio", "telefono", "fechaNac" };
                    for (int i = 0; i < nombres.Length; i++)
                    {
                        t = (GridView1.Rows[e.RowIndex].FindControl("TextBox" + (i + 1)) as TextBox);
                        if (t.Text != "")
                            command.Parameters.AddWithValue(nombres[i], t.Text.Trim());
                        else
                        {
                            if (i >= 3) i += 1;
                            ClientScript.RegisterStartupScript(GetType(),"hwa","alert('Debe llenar todos los campos, el campo de " + GridView1.Columns[i + 2].HeaderText.ToLower() + " está vacío.')",true);
                            return;
                        }
                    }
                    command.Parameters.AddWithValue("idParentesco", (GridView1.Rows[e.RowIndex].FindControl("DropDownList1") as DropDownList).SelectedValue);
                    command.Parameters.AddWithValue("idCuenta", Session["CuentaID"]);

                    SqlParameter p = new SqlParameter("@ReturnValue",SqlDbType.Int);
                    p.Direction = ParameterDirection.ReturnValue;
                    command.Parameters.Add(p);
                    conn.Open();
                    command.ExecuteScalar();
                    object result = p.Value;
                    
                    if (Convert.ToInt32(result) == 0)
                    {
                        GridView1.DataBind();
                        GridView1.EditIndex = -1;
                        ClientScript.RegisterStartupScript(GetType(),"hwa","alert('Se ha actualizado exitosamente')",true);
                        actualizarRotulitoLlamativo();
                    }
                    else
                        ClientScript.RegisterStartupScript(GetType(),"hwa","alert('La suma de los porcentajes sobrepasa el 100')",true);
                    command.Dispose();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(),"hwa","alert('" + ex.Message + "')",true);
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlDataSource1.DeleteParameters.Clear();
            SqlDataSource1.DeleteParameters.Add("id", (GridView1.Rows[e.RowIndex].FindControl("idDelete") as Label).Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("EstadosDeCuenta.aspx");
        }

        protected void actualizarRotulitoLlamativo()
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlCommand sqlCommand = new SqlCommand("select sum(B.porcentajeBeneficio)" +
                    " from Beneficiario B where B.activo = 1 and B.idUsuario=" + Session["CuentaID"].ToString(),
                    sqlCon);
                object result = sqlCommand.ExecuteScalar();
                if (result != null && Convert.ToInt32(result) == 100)
                    Label1.Text = "";
                else
                    Label1.Text = "*La cantidad de porcentajes para cada beneficiario es incorrecta. Debe sumar 100.";
                sqlCommand.Dispose();

            }
        }

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            try
            {
                int result = Convert.ToInt32(e.Command.Parameters["@ReturnValue"].Value);
                if (result == 0)
                {
                    GridView1.DataBind();
                    ClientScript.RegisterStartupScript(GetType(),"hwa","alert('Se ha añadido exitosamente')",true);
                    actualizarRotulitoLlamativo();
                }
                else if (result == -1)
                    ClientScript.RegisterStartupScript(GetType(),"hwa","alert('La suma de los porcentajes sobrepasa el 100')",true);
                else
                    ClientScript.RegisterStartupScript(GetType(),"hwa","alert('Ya se han añadido 3 beneficiarios, no se puede ingresar más.')",true);
            }
            catch { ClientScript.RegisterStartupScript(GetType(),"hwa","alert('Error inesperado')",true); }
        }

        protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
           
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(),"hwa","alert('Se ha eliminado exitosamente')",true);
            actualizarRotulitoLlamativo();
        }
    }
}
