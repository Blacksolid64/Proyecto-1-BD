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
        private String connectionString = @"Data Source=ZLAPTOP22;Initial Catalog=Base_de_Datos_1;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            if (Session["UserId"] == null || Session["UserName"] == null)
                Response.Redirect("About.aspx");
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
                    /*
                    <InsertParameters>
                        <asp:ControlParameter Name="idUsuario" />
                        <asp:ControlParameter Name="nombre" />
                        <asp:ControlParameter Name="ced"  />
                        <asp:ControlParameter Name="email"  />
                        <asp:ControlParameter Name="parentesco" />
                        <asp:ControlParameter Name="porcentajeBeneficio" />
                        <asp:ControlParameter Name="telefono"  />
                        <asp:ControlParameter Name="fechaNac" />
                    </InsertParameters>
                    */
                    SqlDataSource1.InsertParameters.Clear();
                    SqlDataSource1.InsertParameters.Add("idUsuario", TypeCode.Int32, Session["CuentaID"].ToString());
                    String[] nombres = { "nombre", "ced", "email", "porcentajeBeneficio", "telefono", "fechaNac" };
                    for (int i = 0; i < nombres.Length; i++)
                    {
                        t = (GridView1.FooterRow.FindControl("FooterTextBox" + (i + 1)) as TextBox);
                        if (t.Text != "")
                            SqlDataSource1.InsertParameters.Add(nombres[i], t.Text.Trim());
                        else
                        {
                            if (i >= 3) i += 1;
                            Response.Write("<script>alert('Debe llenar todos los campos, el campo de " + GridView1.Columns[i + 2].HeaderText.ToLower() + " está vacío.')</script>");
                            return;
                        }
                    }
                    SqlDataSource1.InsertParameters.Add("parentesco", (GridView1.FooterRow.FindControl("DropDownList2") as DropDownList).SelectedValue);
                    t = (GridView1.FooterRow.FindControl("FooterTextBox4") as TextBox);
                    if (Int32.Parse(t.Text) <= 0 || Int32.Parse(t.Text) > 100)
                        Response.Write("<script>alert('El porcentaje de beneficio debe ser un porcentaje válido. ]0,100]')</script>");
                    else if (1==puedeAniadirse(Int32.Parse(t.Text)))
                    {
                        SqlDataSource1.Insert();
                        Response.Write("<script>alert('Se ha añadido exitosamente')</script>");
                        actualizarRotulitoLlamativo();
                    }
                    else if (0 == puedeAniadirse(Int32.Parse(t.Text)))
                    {
                        Response.Write("<script>alert('La suma de los porcentajes sobrepasa el 100')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Ya se han añadido 3 beneficiarios, no se puede ingresar más.')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        
        }

        private int puedeAniadirse(int porcentaje,string viejoPorcentaje=null)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlDataReader reader = new SqlCommand(
                    "select porcentajeBeneficio from Beneficiario where activo=1 and idUsuario="+Session["CuentaID"], conn).ExecuteReader();
                    int cantRows=0;
                    int suma = 0;
                    while (reader.Read())
                    {
                        suma += Convert.ToInt32(reader["porcentajeBeneficio"]);
                        cantRows++;
                    }
                    if (viejoPorcentaje != null)
                        suma -= Convert.ToInt32(viejoPorcentaje);
                    else if (cantRows >= 3)
                        return 2;
                    suma += porcentaje;
                    return Convert.ToInt32(suma <= 100);
                }
            }catch
            {
                return 3;
            }
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                /*
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="ced" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="idParentesco" Type="Int32" />
                <asp:Parameter Name="porcentajeBeneficio" Type="Int16" />
                <asp:Parameter Name="telefono" Type="String" />
                <asp:Parameter DbType="Date" Name="fechaNac" />
                <asp:Parameter Name="original_id" Type="Int32" />*/
                TextBox t;
                SqlDataSource1.UpdateParameters.Clear();
                SqlDataSource1.UpdateParameters.Add("original_id", (GridView1.Rows[e.RowIndex].FindControl("idEdit") as Label).Text);
                String[] nombres = { "nombre", "ced", "email", "porcentajeBeneficio", "telefono", "fechaNac" };
                for (int i = 0; i < nombres.Length; i++)
                {
                    t = (GridView1.Rows[e.RowIndex].FindControl("TextBox" + (i + 1)) as TextBox);
                    if (t.Text != "")
                        SqlDataSource1.UpdateParameters.Add(nombres[i], t.Text.Trim());
                    else
                    {
                        if (i >= 3) i += 1;
                        Response.Write("<script>alert('Debe llenar todos los campos, el campo de " + GridView1.Columns[i + 2].HeaderText.ToLower() + " está vacío.')</script>");
                        e.Cancel=true;
                        return;
                    }
                }
                SqlDataSource1.UpdateParameters.Add("idParentesco", (GridView1.Rows[e.RowIndex].FindControl("DropDownList1") as DropDownList).SelectedValue);
                t = (GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox);
                int a = puedeAniadirse(Convert.ToInt32(t.Text), e.OldValues[4].ToString());
                if (Int32.Parse(t.Text) <= 0 || Int32.Parse(t.Text) > 100)
                    Response.Write("<script>alert('El porcentaje de beneficio debe ser un porcentaje válido. ]0,100]')</script>");
                else if(a==1)
                {
                    SqlDataSource1.Update();
                    Response.Write("<script>alert('Se ha actualizado exitosamente')</script>");
                    actualizarRotulitoLlamativo();
                }else if (a == 0)
                {
                    Response.Write("<script>alert('La suma de porcentajes sobrepasa el 100%, no se puede actualizar')</script>");

                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"')</script>");
            }
}

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlDataSource1.DeleteParameters.Clear();
            try
            {
                SqlDataSource1.DeleteParameters.Add("id", (GridView1.Rows[e.RowIndex].FindControl("idDelete") as Label).Text);
                SqlDataSource1.Delete();
                Response.Write("<script>alert('Se ha eliminado exitosamente')</script>");
            actualizarRotulitoLlamativo();
            } 
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
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

            }
        }
    }
}
