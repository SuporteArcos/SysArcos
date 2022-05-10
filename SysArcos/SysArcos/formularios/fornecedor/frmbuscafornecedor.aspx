<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscafornecedor.aspx.cs" Inherits="SysArcos.frmbuscafornecedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="entidade">
        Buscar Fornecedores
    </div>

    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Filtro</span>
                </div>
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Pesquisar..." CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="Button1" runat="server" Text="Buscar" CssClass="btn btn-success" OnClick="Button1_Click" />
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <fieldset class="border p-2 border-primary">
                <div><asp:RadioButton ID="RadioButton1" runat="server" Text="CNPJ" /></div>
                <div><asp:RadioButton ID="RadioButton2" runat="server" Checked="True" Text="Nome" /></div>
            </fieldset>
        </div>
    </div>

    <br />
    
    <div class="row">
        <div class="col-12">
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
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
    </div>

    <br />

    <div class="row">
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnCancelar" runat="server" Text="Novo" CssClass="btn btn-primary" Width="100%" OnClick="btnCancelar_Click" />
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnSelecionar" runat="server" Text="Editar" CssClass="btn btn-primary"  Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnRemover" runat="server" Text="Remover" CssClass="btn btn-primary"  Width="100%"
                OnClientClick="return confirm('Deseja remover?');" />
        </div>
    </div>
</asp:Content>
