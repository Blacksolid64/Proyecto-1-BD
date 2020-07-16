<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Usuarios.aspx.cs" Inherits="WebApplication4._Usuarios" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Usuarios</h1><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_Usuario_Select" OnSelecting="SqlDataSource1_Selecting" DeleteCommand="SP_Usuario_Delete" DeleteCommandType="StoredProcedure" InsertCommand="SP_Usuario_Insert" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommand="SP_Usuario_Update" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:controlParameter Name="usuario" Type="String" ControlID="Pusuario" />
            <asp:controlParameter Name="password" Type="String" ControlID="Ppassword" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="usuario" Type="String" />
            <asp:Parameter Name="password" Type="String" />   
       </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="600px" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id" AllowPaging="True"  >
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="id" SortExpression="id" Visible="false" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="usuario" HeaderText="usuario" SortExpression="usuario" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" Visible="false"/>
                    <asp:CheckBoxField DataField="Admin" HeaderText="Admin" SortExpression="Admin" Visible="false" />
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
            Nombre de usuario:<br />
            <asp:TextBox ID="Pusuario" runat="server" Width="140" />
        </td>
        <td style="width: 150px">
            Password:<br />
            <asp:TextBox ID="Ppassword" runat="server" Width="140" />
        </td>
        
        <td style="width: 100px">
            <asp:Button ID="Agregar" runat="server" Text="Agregar" OnClick="Insert" />
        </td>
    </tr>
        </table>
        
        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver" OnClick="Button1_Click"  />

        <br />

</div></asp:Content>