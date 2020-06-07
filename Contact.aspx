﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication4.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class = "jumbotron">
    <h2>Bienvenido a los propietarios</h2>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SP_Propietarios_Select" DeleteCommand="SP_Propietarios_Delete" InsertCommand="SP_Propietarios_Insert" UpdateCommand="SP_Propietarios_Update" CancelSelectOnNullParameter="False" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="Id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:controlParameter Name="ValorDocId" ControlID="PNombre" Type="Int32" />
                <asp:controlParameter Name="nombre" ControlID="PdocId" Type="String" />
                <asp:ControlParameter Name="Identificacion" ControlID="PIdentificacion" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ReturnValue" Direction="ReturnValue" />
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="ValorDocId" Type="Int32" />
                <asp:Parameter Name="nombre" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
            <table border="1"  style="border-collapse: collapse">
    <tr>
        <td style="width: 150px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HorizontalAlign="Center" DataKeyNames="Id" style="margin-left: 0px" Height="262px" Width="488px">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="ValorDocId" HeaderText="ValorDocId" SortExpression="ValorDocId" />
                <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" Visible="false"/>
                <asp:BoundField DataField="Identificacion" HeaderText="Identificacion" SortExpression="Identificacion" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        </td>
        <td style="width: 150px">
            Nombre:<br />
            <asp:TextBox ID="PdocId" runat="server" Width="140" />
        </td>
        <td style="width: 150px">
            ValorDocId:<br />
            <asp:TextBox ID="PNombre" runat="server" Width="140" />
        </td>
        <td style="width: 150px">
            Identificacion:<br />
            <asp:TextBox ID="PIdentificacion" runat="server" Width="140" />
        </td>
        
        <td style="width: 100px">
            <asp:Button ID="Agregar" runat="server" Text="Agregar" OnClick="Insert" />
        </td>
    </tr>
        </table>

    <table border="1"  style="border-collapse: collapse">
        <tr>
    <td style="width: 150px">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ver Lista de Propiedades" Width="352px" Height="32px" />
        </td>
    
    <td style ="width: 150px"> 
        <asp:Button ID="Button6" runat="server" Text="Ver Lista de Usuarios" Width="342px" OnClick="Button6_Click" /> 
    </td>
     
    <td style ="width: 150px">
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Buscar Propiedades de un Propietario" Width="287px" />
    </td>
    </tr>
   <tr>
    <td style ="width: 150px">
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Buscar Propiedades Visibles para un usuario" Width="418px" />
    </td>

    <td style ="width: 150px">
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Buscar Usuario de una propiedad" Width="343px" />
    </td>

    <td style ="width: 150px">
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Buscar Propietarios de un Propiedad" Width="285px" />
    </td>
   </tr>
        <tr>
     <td style ="width: 150px">
        <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Ver PropietariosVsPropiedades" Width="285px" />
    </td>
   <td style ="width: 150px">
        <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Ver UsuarioVsPropiedad" Width="342px" />
    </td>
            <td style ="width: 150px">
        <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Ver ConceptodecobroVsPropiedad" Width="285px" />
    </td>
     </tr>
            </table>
        </div>
    </asp:Content>
