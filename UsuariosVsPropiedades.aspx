<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="UsuariosVsPropiedades.aspx.cs" Inherits="WebApplication4._UsuariosVsPropiedades" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Usuario de Propiedad</h1><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_UsuarioDePropiedad_Select" OnSelecting="SqlDataSource1_Selecting" DeleteCommand="SP_UsuarioDePropiedad_Delete" DeleteCommandType="StoredProcedure" InsertCommand="SP_UsuarioDePropiedad_Insert" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommand="SP_UsuarioDePropiedad_Update" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:controlParameter Name="idpropiedad" ControlID="Pidpropiedad" Type="Int32" />
            <asp:controlParameter Name="idusuario" ControlID="Pidusuario" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="idpropiedad" Type="Int32" />
            <asp:Parameter Name="idusuario" Type="Int32" />
        </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="600px" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id"  >
                <Columns>
                    <asp:BoundField DataField="id" Visible="false" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="idpropiedad" HeaderText="idpropiedad" SortExpression="idpropiedad" />
                    <asp:BoundField DataField="idusuario" HeaderText="idusuario" SortExpression="idusuario" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:CheckBoxField DataField="Activo" HeaderText="Activo" Visible="false" SortExpression="Activo"/>
                </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="true" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>

         <table border="1"  style="border-collapse: collapse">
    <tr>
        <td style="width: 150px">
            IdPropiedad:<br />
            <asp:TextBox ID="Pidpropiedad" runat="server" Width="140" />
        </td>
        <td style="width: 150px">
            IdUsuario:<br />
            <asp:TextBox ID="Pidusuario" runat="server" Width="140" />
        </td>
  
        
        <td style="width: 100px">
            <asp:Button ID="Agregar" runat="server" Text="Agregar" OnClick="Insert" />
        </td>
    </tr>
        </table>

        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver" OnClick="Button1_Click"  />

</div></asp:Content>