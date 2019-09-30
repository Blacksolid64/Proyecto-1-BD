<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EstadosDeCuenta.aspx.cs" Inherits="WebApplication4._EstadosDeCuenta" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Estados de cuenta<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Base_de_Datos_1ConnectionString %>" SelectCommand="SELECT top 8  [fechaInicio], [fechaFinal], [saldoInicial], [saldoFinal], [intereses] FROM [EstadoDeCuenta] WHERE ([idCuenta] = @idCuenta) ORDER BY [fechaInicio] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="idCuenta" SessionField="CuentaID" Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>
        </h1>

        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <span style="background-color: #FFF8DC;">Fecha inicio:
                <asp:Label ID="fechaInicioLabel" runat="server" Text='<%# Eval("fechaInicio") %>' />
                    <br />
                    Fecha final:
                <asp:Label ID="fechaFinalLabel" runat="server" Text='<%# Eval("fechaFinal") %>' />
                    <br />
                    Saldo inicial:
                <asp:Label ID="saldoInicialLabel" runat="server" Text='<%# Eval("saldoInicial") %>' />
                    <br />
                    Saldo final:
                <asp:Label ID="saldoFinalLabel" runat="server" Text='<%# Eval("saldoFinal") %>' />
                    <br />
                    Intereses:
                <asp:Label ID="interesesLabel" runat="server" Text='<%# Eval("intereses") %>' />
                    <br />
                    <br />
                </span>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <span style="background-color: #008A8C; color: #FFFFFF;">fechaInicio:
                <asp:TextBox ID="fechaInicioTextBox" runat="server" Text='<%# Bind("fechaInicio") %>' />
                    <br />
                    fechaFinal:
                <asp:TextBox ID="fechaFinalTextBox" runat="server" Text='<%# Bind("fechaFinal") %>' />
                    <br />
                    saldoInicial:
                <asp:TextBox ID="saldoInicialTextBox" runat="server" Text='<%# Bind("saldoInicial") %>' />
                    <br />
                    saldoFinal:
                <asp:TextBox ID="saldoFinalTextBox" runat="server" Text='<%# Bind("saldoFinal") %>' />
                    <br />
                    intereses:
                <asp:TextBox ID="interesesTextBox" runat="server" Text='<%# Bind("intereses") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    <br />
                    <br />
                </span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No hay estados de cuenta xd.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">fechaInicio:
                <asp:TextBox ID="fechaInicioTextBox" runat="server" Text='<%# Bind("fechaInicio") %>' />
                    <br />
                    fechaFinal:
                <asp:TextBox ID="fechaFinalTextBox" runat="server" Text='<%# Bind("fechaFinal") %>' />
                    <br />
                    saldoInicial:
                <asp:TextBox ID="saldoInicialTextBox" runat="server" Text='<%# Bind("saldoInicial") %>' />
                    <br />
                    saldoFinal:
                <asp:TextBox ID="saldoFinalTextBox" runat="server" Text='<%# Bind("saldoFinal") %>' />
                    <br />
                    intereses:
                <asp:TextBox ID="interesesTextBox" runat="server" Text='<%# Bind("intereses") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                    <br />
                    <br />
                </span>
            </InsertItemTemplate>
            <ItemTemplate>
                <span style="background-color: #DCDCDC; color: #000000;">fechaInicio:
                <asp:Label ID="fechaInicioLabel" runat="server" Text='<%# Eval("fechaInicio") %>' />
                    <br />
                    fechaFinal:
                <asp:Label ID="fechaFinalLabel" runat="server" Text='<%# Eval("fechaFinal") %>' />
                    <br />
                    saldoInicial:
                <asp:Label ID="saldoInicialLabel" runat="server" Text='<%# Eval("saldoInicial") %>' />
                    <br />
                    saldoFinal:
                <asp:Label ID="saldoFinalLabel" runat="server" Text='<%# Eval("saldoFinal") %>' />
                    <br />
                    intereses:
                <asp:Label ID="interesesLabel" runat="server" Text='<%# Eval("intereses") %>' />
                    <br />
                    <br />
                </span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">fechaInicio:
                <asp:Label ID="fechaInicioLabel" runat="server" Text='<%# Eval("fechaInicio") %>' />
                    <br />
                    fechaFinal:
                <asp:Label ID="fechaFinalLabel" runat="server" Text='<%# Eval("fechaFinal") %>' />
                    <br />
                    saldoInicial:
                <asp:Label ID="saldoInicialLabel" runat="server" Text='<%# Eval("saldoInicial") %>' />
                    <br />
                    saldoFinal:
                <asp:Label ID="saldoFinalLabel" runat="server" Text='<%# Eval("saldoFinal") %>' />
                    <br />
                    intereses:
                <asp:Label ID="interesesLabel" runat="server" Text='<%# Eval("intereses") %>' />
                    <br />
                    <br />
                </span>
            </SelectedItemTemplate>
        </asp:ListView>
        
        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver"  />

</div></asp:Content>