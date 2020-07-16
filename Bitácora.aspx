<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bitácora.aspx.cs" Inherits="WebApplication4.Bitácora" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        <h1>Bitácora de movimientos</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" DataKeyNames="Id" DataSourceID="SqlDataSource2" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="IdEntityType" HeaderText="IdEntityType" SortExpression="IdEntityType" />
                <asp:BoundField DataField="EntityId" HeaderText="EntityId" SortExpression="EntityId" />
                <asp:BoundField DataField="JsonAntes" HeaderText="JsonAntes" SortExpression="JsonAntes" />
                <asp:BoundField DataField="JsonDespues" HeaderText="JsonDespues" SortExpression="JsonDespues" />
                <asp:BoundField DataField="InsertedAt" HeaderText="InsertedAt" SortExpression="InsertedAt" />
                <asp:BoundField DataField="InsertedIn" HeaderText="InsertedIn" SortExpression="InsertedIn" />
                <asp:BoundField DataField="InsertedBy" HeaderText="InsertedBy" SortExpression="InsertedBy" />
            </Columns>
            </asp:GridView>
        <table style="margin-left:auto;margin-right:auto;"  cellpadding="0" cellspacing="0" width="450" border="0">
            <tr>
                <td>Tipo de entidad:</td>
                <td>
                    <asp:DropDownList ID="IdEntidad" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="Id" Style="margin-bottom: 0px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_EntityType_Select" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>Fecha Inicio:</td>
                <td><asp:TextBox   ID="FechaInicio" runat="server" Width="160px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Fecha Fin:</td> 
                <td><asp:TextBox  ID="FechaFin" Width="160px" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td> <asp:Button ID="BtnBusqueda" style="margin:1px" runat="server" Text="Buscar" OnClick="BtnBusqueda_Click" /> </td>
                <td> <asp:Button ID="BtnVolver" style="margin:1px" runat="server" Text="Volver" OnClick="BtnVolver_Click" /> 
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_Bitacora_Date_Select" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="FechaInicio" Name="Start" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="FechaFin" Name="Finish" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="IdEntidad" Name="IdEntidad" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%-- <asp:CompareValidator runat="server" ID="ValidarFechaInicio" Type="Date" Operator="DataTypeCheck" ControlToValidate="FechaInicio"></asp:CompareValidator>
        <asp:CompareValidator runat="server" ID="ValidarFechaFin" Type="Date" Operator="DataTypeCheck" ControlToValidate="FechaFin"></asp:CompareValidator> --%>
    </div>
        
        
</asp:Content>
