<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="BusquedaPorPropietario.aspx.cs" Inherits="WebApplication4._Busqueda" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Búsqueda por Propietario</h1>
        <p>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="NumFinca" HeaderText="Numero de Finca" SortExpression="NumFinca" />
                    <asp:BoundField DataField="valor" HeaderText="Valor" SortExpression="valor" />
                    <asp:BoundField DataField="direccion" HeaderText="Direccion" SortExpression="direccion" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_C1" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Busqueda" Name="Pnombre" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            <asp:TextBox ID="Busqueda" runat="server" BorderStyle="Solid" Width="191px"> </asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Consultar" runat="server" BorderStyle="Inset" Text="Consultar" OnClick="Consultar_Click" />
        </p>

        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver" Width="60px" Height="26px" OnClick="Button1_Click"  />

</div></asp:Content>