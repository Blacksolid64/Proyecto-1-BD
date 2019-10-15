<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EstadosDeCuenta.aspx.cs" Inherits="WebApplication4._EstadosDeCuenta" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Estados de cuenta
        </h1><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Base_de_Datos_1ConnectionString %>" SelectCommand="SELECT * FROM [EstadoDeCuenta] WHERE ([idCuenta] = @idCuenta) ">
            <SelectParameters>
                <asp:SessionParameter Name="idCuenta" SessionField="CuentaID" Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="600px" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3"  >
                <Columns>
                    <asp:BoundField DataField="fechaInicio" HeaderText="Fecha Inicio" SortExpression="fechaInicio" />
                    <asp:BoundField DataField="fechaFinal" HeaderText="Fecha Final" SortExpression="fechaFinal" />
                    <asp:BoundField DataField="saldoInicial" HeaderText="Saldo Inicial" SortExpression="saldoInicial" />
                    <asp:BoundField DataField="saldoFinal" HeaderText="Saldo Final" SortExpression="saldoFinal" />
                    <asp:BoundField DataField="intereses" HeaderText="Intereses" SortExpression="intereses" />
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Button ID="BtnSeleccionar" runat="server" Text="Seleccionar" OnClick="Row_Selected" CommandName='<%# Eval("id") %>'  />
                        </ItemTemplate>  
                    </asp:TemplateField>
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

        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver" OnClick="Button1_Click"  />

</div></asp:Content>