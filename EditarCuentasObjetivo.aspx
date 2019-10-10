<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EstadosDeCuenta.aspx.cs" Inherits="WebApplication4._EstadosDeCuenta" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Cuentas Objetivo</h1>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringJoshua %>" SelectCommand="SP_getCuentaObjetivo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idCuenta" SessionField="IdCuenta" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver"  />

        <asp:Button ID="Button2" runat="server" Text="Agregar Cuenta Objetivo" />

</div></asp:Content>