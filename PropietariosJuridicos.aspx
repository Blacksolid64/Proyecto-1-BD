<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PropietariosJuridicos.aspx.cs" Inherits="WebApplication4.PropietariosJurídicos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" DeleteCommand="SP_PropJuridico_Delete" DeleteCommandType="StoredProcedure" InsertCommand="SP_PropJuridico_Insert" InsertCommandType="StoredProcedure" SelectCommand="SP_PropJuridico_Select" SelectCommandType="StoredProcedure" UpdateCommand="SP_PropJuridico_Update" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Identificacion" Type="String" />
            <asp:Parameter Name="IdentificacionRepresentante" Type="String" />
            <asp:Parameter Name="TipoDocIdRepresentante" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="PNombre" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" visible="false" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="idTipoDocId" HeaderText="idTipoDocId" SortExpression="idTipoDocId" />
            <asp:BoundField DataField="identificacion" HeaderText="identificacion" SortExpression="identificacion" />
            <asp:BoundField DataField="identificacionRepresentante" HeaderText="identificacionRepresentante" SortExpression="identificacionRepresentante" />
            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
            <asp:BoundField DataField="tipoDocIdRepresentante" HeaderText="tipoDocIdRepresentante" SortExpression="tipoDocIdRepresentante" />
            <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" visible="false"/>
        </Columns>
    </asp:GridView>
    <p> <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" /> </p>
</asp:Content>
