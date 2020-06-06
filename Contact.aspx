<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication4.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class = "jumbotron">
    <h2>Bienvenido</h2>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_Propietarios_Select" DeleteCommand="SP_Propietarios_Delete" InsertCommand="SP_Propietarios_Insert" UpdateCommand="SP_Propietarios_Update" CancelSelectOnNullParameter="False" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Direction="ReturnValue" Name="ReturnValue" />
                <asp:Parameter Name="ValorDocId" Type="Int32" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="Activo" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ReturnValue" Direction="ReturnValue" />
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="ValorDocId" Type="Int32" />
                <asp:Parameter Name="nombre" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HorizontalAlign="Center" DataKeyNames="Id" style="margin-left: 0px" Height="262px" Width="488px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="false" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="ValorDocId" HeaderText="ValorDocId" SortExpression="ValorDocId" />
                <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" Visible="false"/>
            </Columns>
        </asp:GridView>
    <p style="width: 246px">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ver Lista de Propiedades" Width="243px" />
    <asp:Button ID="Button6" runat="server" Text="Ver Lista de Usuarios" Width="243px" OnClick="Button6_Click" /> </p> <p style="width: 449px"> 
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Buscar Propiedades de un Propietario" Width="450px" />
    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Buscar Propiedades Visibles para un usuario" Width="450px" />
    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Buscar Usuario de una propiedad" Width="450px" />
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Buscar Propietarios de un Propiedad" Width="450px" />
    </p>
        </div>
    </asp:Content>
