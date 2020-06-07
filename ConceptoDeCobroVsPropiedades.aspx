<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ConceptoDeCobroVsPropiedades.aspx.cs" Inherits="WebApplication4._ConceptoDeCobroVsPropiedades" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Concepto de cobro de la propiedad</h1><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_ConceptoCobroPorPropiedad_Select" OnSelecting="SqlDataSource1_Selecting" DeleteCommand="SP_ConceptoCobroPorPropiedad_Delete" DeleteCommandType="StoredProcedure" InsertCommand="SP_ConceptoCobroPorPropiedad_Insert" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommand="SP_ConceptoCobroPorPropiedad_Update" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:controlParameter Name="idPropiedad" ControlID="Pidpropiedad" Type="Int32" />
            <asp:controlParameter Name="idCCCobro" ControlID="Pidcccobro" Type="Int32" />
            <asp:controlParameter DbType="Date" ControlID="Pfechainicio" Name="FechaInicio" />
            <asp:controlParameter DbType="Date" ControlID="Pfechafin" Name="FechaFin" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="Id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="idPropiedad" Type="Int32" />
            <asp:Parameter Name="idCCCobro" Type="Int32" />
            <asp:Parameter Name="FechaInicio" DbType="Date" />
            <asp:Parameter DbType="Date" Name="FechaFin" />
        </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="600px" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id"  >
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" Visible="false" ReadOnly="True" />
                    <asp:BoundField DataField="idPropiedad" HeaderText="idPropiedad" SortExpression="idPropiedad" />
                    <asp:BoundField DataField="idCCCobro" HeaderText="idCCCobro" SortExpression="idCCCobro" />
                    <asp:BoundField DataField="FechaInicio" HeaderText="FechaInicio" SortExpression="FechaInicio" />
                    <asp:BoundField DataField="FechaFin" HeaderText="FechaFin" SortExpression="FechaFin" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:CheckBoxField visible="false" DataField="Activo" HeaderText="Activo" SortExpression="Activo"/>
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
            idPropiedad:<br />
            <asp:TextBox ID="Pidpropiedad" runat="server" Width="140" />
        </td>
        <td style="width: 150px">
            idCCCobro:<br />
            <asp:TextBox ID="Pidcccobro" runat="server" Width="140" />
        </td>
        <td style="width: 150px">
            FechaInicio:<br />
            <asp:TextBox ID="Pfechainicio" runat="server" Width="140" />
        </td>
        <td style="width: 150px">
            FechaFin:<br />
            <asp:TextBox ID="Pfechafin" runat="server" Width="140" />
        </td>
        <td style="width: 100px">
            <asp:Button ID="Agregar" runat="server" Text="Agregar" OnClick="Insert" />
        </td>
    </tr>
        </table>

        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver" OnClick="Button1_Click"  />

</div></asp:Content>