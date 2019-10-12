<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="EstadosDeCuenta.aspx.cs" Inherits="WebApplication4._EstadosDeCuenta" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Estados de cuenta<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringJoshua %>" SelectCommand="SELECT * FROM [EstadoDeCuenta] WHERE ([idCuenta] = @idCuenta)" OnSelecting="SqlDataSource1_Selecting">
            <SelectParameters>
                <asp:SessionParameter Name="idCuenta" SessionField="ClienteID" Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="260px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="860px">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" Visible ="false" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="idCuenta" HeaderText="idCuenta" Visible = "False" SortExpression="idCuenta" />
                    <asp:BoundField DataField="fechaInicio" HeaderText="fechaInicio" SortExpression="fechaInicio" />
                    <asp:BoundField DataField="fechaFinal" HeaderText="fechaFinal" SortExpression="fechaFinal" />
                    <asp:BoundField DataField="saldoInicial" HeaderText="saldoInicial" SortExpression="saldoInicial" />
                    <asp:BoundField DataField="saldoFinal" HeaderText="saldoFinal" SortExpression="saldoFinal" />
                    <asp:BoundField DataField="intereses" HeaderText="intereses" SortExpression="intereses" />
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Button ID="BtnSeleccionar" runat="server" Text="Seleccionar" OnClick="Row_Selected" CommandName='<%# Eval("id") %>'  />
                        </ItemTemplate>  
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </h1>

        <asp:Button ID="Button1" runat="server" Text="Volver" OnClientClick="volver" OnClick="Button1_Click"  />

        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Ver Movimientos" />

</div></asp:Content>