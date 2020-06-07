<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PropietariosVsPropiedades.aspx.cs" Inherits="WebApplication4._PropietariosVsPropiedades" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Propietarios Vs Propiedades</h1><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_Propiedad del propietario_Select" OnSelecting="SqlDataSource1_Selecting" DeleteCommand="SP_Propiedad del propietario_Delete" DeleteCommandType="StoredProcedure" InsertCommand="SP_Propiedad del propietario_Insert" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommand="SP_Propiedad del propietario_Update" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:controlParameter Name="Idpropietario" ControlID="PIdpropietario" Type="Int32" />
            <asp:controlParameter Name="Idpropiedad" ControlID="PIdpropiedad" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="Id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Idpropietario" Type="Int32" />
            <asp:Parameter Name="Idpropiedad" Type="Int32" />
        </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="600px" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id"  >
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" Visible="false" ReadOnly="True" />
                    <asp:BoundField DataField="Idpropietario" HeaderText="Idpropietario" SortExpression="Idpropietario" />
                    <asp:BoundField DataField="Idpropiedad" HeaderText="Idpropiedad" SortExpression="Idpropiedad" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:CheckBoxField DataField="Activo" HeaderText="Activo" Visible="false" SortExpression="Activo"/>
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
            IDpropietario:<br />
            <asp:TextBox ID="PIdpropietario" runat="server" Width="140" />
        </td>
        <td style="width: 150px">
            IDpropiedad:<br />
            <asp:TextBox ID="PIdpropiedad" runat="server" Width="140" />
        </td>
        
        <td style="width: 100px">
            <asp:Button ID="Agregar" runat="server" Text="Agregar" OnClick="Insert" />
        </td>
    </tr>
        </table>

        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver" OnClick="Button1_Click"  />

</div></asp:Content>