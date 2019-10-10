<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EstadosDeCuenta.aspx.cs" Inherits="WebApplication4._EstadosDeCuenta" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Estados de cuenta<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Base_de_Datos_1ConnectionString %>" SelectCommand="SELECT top 8  [fechaInicio], [fechaFinal], [saldoInicial], [saldoFinal], [intereses] FROM [EstadoDeCuenta] WHERE ([idCuenta] = @idCuenta) ORDER BY [fechaInicio] DESC" OnSelecting="SqlDataSource1_Selecting">
            <SelectParameters>
                <asp:SessionParameter Name="idCuenta" SessionField="CuentaID" Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" Height="260px" Width="860px">
            </asp:GridView>
        </h1>

        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver" OnClick="Button1_Click"  />

        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Ver Movimientos" />

</div></asp:Content>