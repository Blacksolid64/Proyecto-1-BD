<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication4.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        <h2>Bienvenido Administrador</h2>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_Propietarios_Select" DeleteCommand="SP_Propietarios_Delete" InsertCommand="SP_Propietarios_Insert" UpdateCommand="SP_Propietarios_Update" CancelSelectOnNullParameter="False" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter Name="ValorDocId" ControlID="PNombre" Type="Int32" />
                <asp:ControlParameter Name="nombre" ControlID="PdocId" Type="String" />
                <asp:ControlParameter Name="Identificacion" ControlID="PIdentificacion" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="Id" SessionField="AdminID" Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="EsAdmin" SessionField="Admin" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="ValorDocId" Type="Int32" />
                <asp:Parameter Name="nombre" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HorizontalAlign="Center" DataKeyNames="Id" Style="margin-left: 0px" Height="488" Width="488" AllowPaging="True">
            <PagerSettings LastPageText="true" FirstPageText="true" />
            
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="ValorDocId" HeaderText="ValorDocId" SortExpression="ValorDocId" />
                <asp:CheckBoxField DataField="Activo" HeaderText="Activo" Visible="false" SortExpression="Activo" />
                <asp:BoundField DataField="Identificacion" HeaderText="Identificacion" SortExpression="Identificacion" />
            </Columns>
        </asp:GridView>
        <table style="margin-left: auto; margin-right: auto;" cellpadding="0" cellspacing="0" width="488" border="0">
            <tr>
                <td style="width: 150px">Nombre:<br />
                    <asp:TextBox ID="PdocId" runat="server" Width="140" />
                </td>
                <td style="width: 150px">ValorDocId:<br />
                    <asp:TextBox ID="PNombre" runat="server" Width="140" />
                </td>
                <td style="width: 150px">Identificacion:<br />
                    <asp:TextBox ID="PIdentificacion" runat="server" Width="140" />
                </td>
                <td style="width: 100px">
                    <asp:Button ID="Agregar" runat="server" Text="Agregar" OnClick="Insert"/>
                </td>
            </tr>
            </table>
        <table style="margin-right: auto;" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td style="width: 150px">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Lista de Propiedades"/>
                </td>
                <td style="width: 150px">
                    <asp:Button ID="Button6" runat="server" Text="Lista de Usuarios" OnClick="Button6_Click" />
                </td>

                <td style="width: 150px">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Propiedades de un Propietario" />
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Propiedades de un usuario"/>
                </td>

                <td style="width: 150px">
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Usuarios asociados a propiedad"/>
                </td>

                <td style="width: 150px">
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Propietarios de un Propiedad"/>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Ver PropietariosVsPropiedades"/>
                </td>
                <td style="width: 150px">
                    <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Ver UsuarioVsPropiedad"/>
                </td>
                <td style="width: 150px">
                    <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Ver ConceptodecobroVsPropiedad"/>
                </td>
            </tr>
            <tr><td> <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="Bitacora" /></td></tr>
        </table>
    </div>
</asp:Content>
