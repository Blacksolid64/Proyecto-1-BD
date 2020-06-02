<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication4.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Title %>
        Bienvenido</h2>
    <h3>
        Propietarios
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_Propietarios_Select" DeleteCommand="SP_Propietarios_Delete" InsertCommand="SP_Propietarios_Insert" UpdateCommand="SP_Propietarios_Update" CancelSelectOnNullParameter="False" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
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
                <asp:SessionParameter Name="Id" SessionField="IDPropietarios" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ReturnValue" Direction="ReturnValue" />
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="ValorDocId" Type="Int32" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="Activo" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="ValorDocId" HeaderText="ValorDocId" SortExpression="ValorDocId" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
            </Columns>
        </asp:GridView>
        </h3>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ver Lista de Propietarios" />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Buscar Propiedades de un Propietarios" />
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Buscar Propietarios de un Propiedad" />
    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Buscar Propiedades Visibles para un usuario" />
    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Buscar Usuario de una propiedad" />
</asp:Content>
