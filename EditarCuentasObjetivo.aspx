<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EditarCuentasObjetivo.aspx.cs" Inherits="WebApplication4.EditarCuentasObjetivo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Cuentas Objetivo</h1>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringJoshua %>" SelectCommand="SP_getCuentaObjetivo" SelectCommandType="StoredProcedure" DeleteCommand="SP_borrarCuentaObjetivo" DeleteCommandType="StoredProcedure" InsertCommand="SP_crearCuentaObjetivo" InsertCommandType="StoredProcedure" UpdateCommand="SP_actualizarCuentaObjetivo" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:SessionParameter Name="idCuenta" SessionField="CuentaID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idCuenta" Type="Int32" />
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter Name="cantMensual" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="idCuenta" SessionField="CuentaID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="idCuenta" Type="Int32" />
                <asp:Parameter Name="descripcion" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="margin-right: 0px">
            <Columns>
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        
        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver"  />

        <asp:Button ID="Button2" runat="server" Text="Añadir Cuenta Objetivo" OnClick="Button2_Click1" />

</div></asp:Content>