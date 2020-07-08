<%@ Page Title="Home Page" Language="C#"  AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication4._Default" %>

  <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>Login</title>
  <link rel="stylesheet"  href="login.css" type="text/css" />
</head>
    <body>
        <div class="loginbox">
        <h1>Bienvenido</h1>
        <form runat="server">
        <asp:Label runat="server" ID="errorxd" ForeColor="Red"></asp:Label>
        <asp:Label ID="Label1" runat="server" CssClass="lbluser" placeholder="Ingrese el usuario" Text="Usuario:" Width="100px"></asp:Label>
        <asp:TextBox ID="txtUsername" CssClass="txtuser" runat="server"></asp:TextBox>
        <asp:Label ID="txtpass" runat="server" CssClass="lbluser" Text="Contraseña:" Width="100" />
        <asp:TextBox ID="txtPassword" TextMode="Password" placeholder="********" CssClass="txtpass" runat="server"></asp:TextBox>
        <asp:Button runat="server" Text="Ingresar aqui" CssClass="btningresar" OnClick="Unnamed_Click" />
        </form>
        </div>
    </body>
</html>
