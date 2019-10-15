using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class _EditarCuentasObjetivo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contact");
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" || TextBox2.Text == "")
                ClientScript.RegisterStartupScript(GetType(),
                                                    "hwa",
                                                    "alert('" +
                                                        "Ningún campo debe estar vacío" +
                                                        "')",
                                                    true);
            else
            {
                lbl1.Visible = false;
                Label1.Visible = false;
                TextBox1.Visible = false;
                TextBox2.Visible = false;
                Button2.Visible = false;
                SqlDataSource1.Insert();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            lbl1.Visible = true;
            Label1.Visible = true;
            TextBox1.Visible = true;
            TextBox2.Visible = true;
            TextBox1.Text = "";
            TextBox2.Text = "";
            Button2.Visible = true;
        }
    }
}