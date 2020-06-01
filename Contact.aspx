<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication4.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Title %>
        Bienvenido</h2>
    <h3>
        Propietarios
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInserted="SqlDataSource1_Inserted" OnDeleted="SqlDataSource1_Deleted" OnUpdated="SqlDataSource1_Updated" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_Propietarios_Select" DeleteCommand="SP_Propietarios_Delete" InsertCommand="SP_Propietarios_Insert" UpdateCommand="SP_Propietarios_Update" CancelSelectOnNullParameter="False" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Direction="ReturnValue" Name="ReturnValue" />
                <asp:Parameter Name="ValorDocId" Type="Int32" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="Activo" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Id" SessionField="Propietarios" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ReturnValue" Direction="ReturnValue" />
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="ValorDocId" Type="Int32" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="Activo" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </h3>
    <h4>
        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"/>
    </h4>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" ShowHeaderWhenEmpty="True"
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" 
        DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting" 
        OnRowCommand="GridView1_RowCommand" OnRowUpdating="GridView1_RowUpdating">
        <%-- Theme Properties --%>
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="ValorDocId" HeaderText="ValorDocId" SortExpression="ValorDocId" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
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
    <asp:Button ID="Button1" runat="server" Text="Ver estados de cuenta" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Editar cuentas objetivo" />
</asp:Content>
