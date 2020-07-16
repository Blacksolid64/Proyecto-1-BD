<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Propiedades.aspx.cs" Inherits="WebApplication4._Propiedades" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Propiedades</h1><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_Propiedad_Select" OnSelecting="SqlDataSource1_Selecting" DeleteCommand="SP_Propiedad_Delete" DeleteCommandType="StoredProcedure" InsertCommand="SP_Propiedad_Insert" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommand="SP_Propiedad_Update" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:controlParameter Name="NumFinca" ControlID="Pnumfinca" Type="Int32" />
            <asp:controlParameter Name="valor" ControlID="Pvalor" Type="Int32" />
            <asp:controlParameter Name="direccion" ControlID="Pdireccion" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="NumFinca" Type="Int32" />
            <asp:Parameter Name="valor" Type="Decimal" />
            <asp:Parameter Name="direccion" Type="String" />
        </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="600px" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id"  >
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" Visible="false" />
                    <asp:BoundField DataField="NumFinca" HeaderText="NumFinca" SortExpression="NumFinca" />
                    <asp:BoundField DataField="valor" HeaderText="valor" SortExpression="valor" />
                    <asp:BoundField DataField="direccion" HeaderText="direccion" SortExpression="direccion" />
                    <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" Visible="false"/>
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

         <table border="1"  style="border-collapse: collapse">
    <tr>
        <td style="width: 150px">
            Numfinca:<br />
            <asp:TextBox ID="Pnumfinca" runat="server" Width="140" />
        </td>
        <td style="width: 150px">
            Valor:<br />
            <asp:TextBox ID="Pvalor" runat="server" Width="140" />
        </td>
        <td style="width: 150px">
            Direccion:<br />
            <asp:TextBox ID="Pdireccion" runat="server" Width="140" />
        </td>
        
        <td style="width: 100px">
            <asp:Button ID="Agregar" runat="server" Text="Agregar" OnClick="Insert" />
        </td>
    </tr>
        </table>

        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver" OnClick="Button1_Click"  />

</div></asp:Content>