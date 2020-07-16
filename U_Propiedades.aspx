<%@ Page Title="" Language="C#" MasterPageFile="~/Usuarios.Master" AutoEventWireup="true" CodeBehind="U_Propiedades.aspx.cs" Inherits="WebApplication4.U_Propiedades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
     <h1>Mis Propiedades</h1>
        <asp:GridView ID="GridView1" HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" width="600px" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id" Visible="true" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="NumFinca" HeaderText="NumFinca" SortExpression="NumFinca" />
                <asp:BoundField DataField="valor" HeaderText="valor" SortExpression="valor" />
                <asp:BoundField DataField="M3Acumulados" HeaderText="M3Acumulados" SortExpression="M3Acumulados" />
                <asp:BoundField DataField="direccion" HeaderText="direccion" SortExpression="direccion" />
                <asp:BoundField DataField="M3AcumuladosUR" HeaderText="M3AcumuladosUR" SortExpression="M3AcumuladosUR" />
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="idusuario" Visible="false" HeaderText="idusuario" SortExpression="idusuario" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_Consulta_Propiedades_Usuarios" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="PIdUsuario" SessionField="UserID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
