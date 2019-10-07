<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication4.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Title %>
        Bienvenido <asp:Label ID="JAJAPRUEBA" runat="server" Text="Pablito:3"></asp:Label>
    </h2>
    <h3>
        Beneficiarios 
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Base_de_Datos_1ConnectionString %>" SelectCommand="SELECT [id], [nombre] FROM [Parentesco]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInserted="SqlDataSource1_Inserted" OnDeleted="SqlDataSource1_Deleted" OnUpdated="SqlDataSource1_Updated" ConnectionString="<%$ ConnectionStrings:Base_de_Datos_1ConnectionString %>" SelectCommand="SP_selectBeneficiarios" DeleteCommand="SP_borrarBeneficiario" InsertCommand="SP_insertarBeneficiario" UpdateCommand="SP_actualizarBeneficiario" CancelSelectOnNullParameter="False" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Direction="ReturnValue" Name="ReturnValue" />
                <asp:Parameter Name="idCuenta" Type="Int32" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="ced" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="parentesco" Type="String" />
                <asp:Parameter Name="porcentajeBeneficio" Type="Int16" />
                <asp:Parameter Name="telefono" Type="String" />
                <asp:Parameter DbType="Date" Name="fechaNac" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="idCuenta" SessionField="CuentaID" DefaultValue="" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="ced" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="porcentajeBeneficio" Type="Int16" />
                <asp:Parameter Name="telefono" Type="String" />
                <asp:Parameter DbType="Date" Name="fechaNac" />
                <asp:Parameter Name="idParentesco" Type="Int32" />
                <asp:Parameter Direction="ReturnValue" Name="ReturnValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </h3>
    <h4>
        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"/>
    </h4>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" ShowHeaderWhenEmpty="True"
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id" 
        DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting" 
        OnRowCommand="GridView1_RowCommand" OnRowUpdating="GridView1_RowUpdating">
        <%-- Theme Properties --%>
        <Columns>
            <asp:TemplateField Visible="false">
                <EditItemTemplate>
                    <asp:Label ID="idEdit" Text='<%#Bind("id") %>' runat="server"/>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="idDelete" Text='<%#Bind("id") %>' runat="server"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre" SortExpression="nombre">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombre") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="FooterTextBox1" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("nombre") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Identificación" SortExpression="ced">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ced") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="FooterTextBox2" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ced") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="email" SortExpression="email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="FooterTextBox3" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Parentesco" SortExpression="parentesco">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="id" SelectedValue='<%# Bind("idParentesco") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("parentesco") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="id" SelectedValue='<%# Bind("idParentesco") %>'>
                    </asp:DropDownList>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Porcentaje" SortExpression="porcentajeBeneficio">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" TextMode="Number" runat="server" Text='<%# Bind("porcentajeBeneficio") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="FooterTextBox4" TextMode="Number" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("porcentajeBeneficio") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telefono" SortExpression="telefono">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("telefono") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="FooterTextBox5" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("telefono") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fecha nacimiento" SortExpression="fechaNac">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" TextMode="Date" Text='<%# Eval("fechaNac","{0:d}") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="FooterTextBox6" TextMode="Date" runat="server" ></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("fechaNac","{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="UpdateButton" runat="server" CommandName="Edit" ImageUrl="~/Images/edit.png" Width="20px" Height="20px"/>
                    <asp:ImageButton ID="DeleteButton" runat="server" CommandName="Delete" ImageUrl="~/Images/delete.png" Width="20px" Height="20px"/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:ImageButton ID="CancelButton" runat="server" CommandName="Cancel" ImageUrl="~/Images/cancel.png" Width="20px" Height="20px"/>
                    <asp:ImageButton ID="SaveButton" runat="server" CommandName="Update" ImageUrl="~/Images/save.png" Width="20px" Height="20px"/>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:ImageButton ID="InsertButton" runat="server" CommandName="AddNew" ImageUrl="~/Images/addnew.png" Width="20px" Height="20px"/>
                </FooterTemplate>
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
    <asp:Button ID="Button1" runat="server" Text="Ver estados de cuenta" OnClick="Button1_Click" />
</asp:Content>
