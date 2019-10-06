<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Movimientos.aspx.cs" Inherits="WebApplication4._EstadosDeCuenta" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Movimientos<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Base_de_Datos_1ConnectionString %>" SelectCommand="SELECT top 8  [fechaInicio], [fechaFinal], [saldoInicial], [saldoFinal], [intereses] FROM [EstadoDeCuenta] WHERE ([idCuenta] = @idCuenta) ORDER BY [fechaInicio] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="idCuenta" SessionField="CuentaID" Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>
        </h1>
        <p>
            <asp:GridView ID="ListaMovimientos" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p>
            <asp:TextBox ID="Descripcion_Movimiento" runat="server" BorderStyle="Outset" ToolTip="Digite la descripción del movimiento" Width="191px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Consultar" runat="server" BorderStyle="Inset" Text="Consultar" />
        </p>

        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver" Width="60px"  />

</div></asp:Content>