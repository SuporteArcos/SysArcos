<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscaestoque.aspx.cs" Inherits="SysArcos.formularios.estoque.frmbuscaestoque" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="entidade">
        Buscar Estoque
    </div>

    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Filtro</span>
                </div>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Buscar" />
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <fieldset class="border p-2 border-primary">
                <asp:Label ID="lblEntidade" runat="server" Text="Entidade" for="ddlEntidade"></asp:Label>
                <div class="input-control">
                    <asp:DropDownList ID="ddlEntidade" runat="server" CssClass="form-control" Width="300px">
                    </asp:DropDownList>
                </div>
            </fieldset>
        </div>
    </div>

    <br />

    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField HeaderText="Produto" />
                <asp:BoundField HeaderText="Quantidade" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>

    <div class="row">
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-primary" OnClick="btnCancelar_Click" Text="Novo" Width="100%" />
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnEditar" runat="server" CssClass="btn btn-primary" Text="Editar" Width="100%" />
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnRemover" runat="server" CssClass="btn btn-primary" Text="Remover" Width="100%" />
        </div>
    </div>
</asp:Content>
