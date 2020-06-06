<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="BusquedaPorUsuarioDePropiedad.aspx.cs" Inherits="WebApplication4._BusquedaPorUsuarioDePropiedad" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Búsqueda por Usuario Propiedad</h1>
        <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="NumFinca" HeaderText="NumFinca" SortExpression="NumFinca" />
                    <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor" />
                    <asp:BoundField DataField="direccion" HeaderText="direccion" SortExpression="direccion" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_C3" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Busqueda" Name="PNombreUsuario" PropertyName="Text" Type="String" />
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