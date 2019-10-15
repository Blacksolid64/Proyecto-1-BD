<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EditarCuentasObjetivo.aspx.cs" Inherits="WebApplication4._EditarCuentasObjetivo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Cuentas Objetivo</h1>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Base_de_Datos_1ConnectionString %>" SelectCommand="SP_getCuentaObjetivo" SelectCommandType="StoredProcedure" DeleteCommand="SP_borrarCuentaObjetivo" DeleteCommandType="StoredProcedure" InsertCommand="SP_crearCuentaObjetivo" InsertCommandType="StoredProcedure" UpdateCommand="SP_actualizarCuentaObjetivo" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:SessionParameter Name="idCuenta" SessionField="CuentaID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="idCuenta" SessionField="CuentaID" Type="Int32" />
                <asp:ControlParameter Name="descripcion" Type="String" ControlID="Textbox1"/>
                <asp:ControlParameter Name="cantMensual" Type="Decimal" ControlID="Textbox2" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="idCuenta" SessionField="CuentaID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="idCuenta" SessionField ="CuentaID" Type="Int32" />
                <asp:Parameter Name="descripcion" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" style="margin-right: 0px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
            </Columns>
        </asp:GridView>
        
        Descripcion&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        Cantidad Mensual <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        
        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver" OnClick="Button1_Click"  />

        <asp:Button ID="Button2" runat="server" Text="Añadir Cuenta Objetivo" OnClick="Button2_Click1" />

</div></asp:Content>