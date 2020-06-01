<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Propiedades.aspx.cs" Inherits="WebApplication4._EstadosDeCuenta" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Propiedades</h1><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SELECT [NumFinca], [valor], [direccion] FROM [Propiedad]" OnSelecting="SqlDataSource1_Selecting">
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="600px" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"  >
                <Columns>
                    <asp:BoundField DataField="NumFinca" HeaderText="NumFinca" SortExpression="NumFinca" />
                    <asp:BoundField DataField="valor" HeaderText="valor" SortExpression="valor" />
                    <asp:BoundField DataField="direccion" HeaderText="direccion" SortExpression="direccion" />
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

        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver" OnClick="Button1_Click"  />

</div></asp:Content>