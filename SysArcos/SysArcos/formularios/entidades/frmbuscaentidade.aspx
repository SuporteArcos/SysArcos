<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscaentidade.aspx.cs" Inherits="ProjetoArcos.frmbuscaentidade" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="entidade">
        Buscar Entidade
    </div>

    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Filtro</span>
                </div>
                <asp:TextBox ID="txtbusca" CssClass="form-control" runat="server" placeholder="Pesquisar..."></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="btnbuscar" runat="server" Width="100%" Font-Size="Larger" class="btn btn-success" OnClick="btnbuscar_Click" Text="Buscar" />
        </div>
    </div>
    
    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <fieldset class="border p-2 border-primary">
                <div><asp:CheckBox ID="ckAtivo" runat="server" Font-Size="Larger" Checked="True" Text="Usuários ativos" /></div>
                <div><asp:RadioButton ID="rdnome" runat="server" Font-Size="Medium" Text="Nome" GroupName="filtro" Checked="True" /></div>
                <div><asp:RadioButton ID="rdcidade" runat="server" Font-Size="Medium" Text="Cidade" GroupName="filtro" /></div>
                <div><asp:RadioButton ID="rdpresidente" runat="server" Font-Size="Medium" Text="Presidente" GroupName="filtro" /></div>
                <div><asp:RadioButton ID="rdCNPJ" runat="server" Font-Size="Medium" Text="CNPJ" GroupName="filtro" /></div>
            </fieldset>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-12">
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID" ShowHeaderWhenEmpty="True" AllowPaging="True" PageSize="20" OnPageIndexChanging="grid_PageIndexChanging">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="NOME" HeaderText="Nome" />
                    <asp:BoundField DataField="CIDADE" HeaderText="Cidade" 
                        ItemStyle-CssClass="d-none d-sm-block" HeaderStyle-CssClass="d-none d-sm-block"/>
                    <asp:BoundField DataField="PRESIDENTE" HeaderText="Presidente" />
                    <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" 
                        ItemStyle-CssClass="d-none d-sm-block" HeaderStyle-CssClass="d-none d-sm-block"/>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" CssClass="GridPager" />
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
            <asp:Button ID="btncancelar" runat="server" OnClick="btncancelar_Click" Text="Novo" CssClass="btn btn-primary" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnselecionar" runat="server" OnClick="btnselecionar_Click" Text="Editar" CssClass="btn btn-primary" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnremover" runat="server" OnClick="btnremover_Click" Text="Remover" CssClass="btn btn-primary" OnClientClick="return confirm('Deseja remover?');" Width="100%"/>
        </div>
    </div>
</asp:Content>
