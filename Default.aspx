<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication4._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Login</h1>
        <asp:Label runat="server" ID="errorxd" ForeColor="Red"></asp:Label>
        <asp:Table ID="Table1" runat="server" CellSpacing="10">
            <asp:TableRow>
                <asp:TableCell><asp:Label ID="Label1" runat="server" Text="Usuario:" Width="100"></asp:Label></asp:TableCell>
                <asp:TableCell><asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><asp:Label runat="server" Text="Contraseña:" Width="100" /></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox></asp:TableCell>
            </asp:TableRow></asp:Table>
        <p><asp:Button runat="server" Text="Ingresar &raquo;" OnClick="Unnamed_Click" /></p>

    </div></asp:Content>