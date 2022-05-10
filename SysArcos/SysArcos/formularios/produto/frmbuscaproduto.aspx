<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscaproduto.aspx.cs" Inherits="ProjetoArcos.frmbuscaproduto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="entidade">
        Buscar Produtos
    </div>

    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Filtro</span>
                </div>
                <asp:TextBox ID="txtBusca" runat="server" placeholder="Pesquisar..." CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="btnBuscar" runat="server" Width="100%" class="btn btn-success" Text="Buscar" OnClick="btnBuscar_Click" />
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <fieldset class="border p-2 border-primary">
                <div>
                    <asp:RadioButton ID="rdDescricao" runat="server" Checked="True" GroupName="filtro" Text="Descrição" />
                </div>
                <div>
                    <asp:RadioButton ID="rdEspecificacao" runat="server" GroupName="filtro" Text="Especificações" />
                </div>
            </fieldset>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-12">
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="DESCRICAO" ShowHeaderWhenEmpty="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Descrição" DataField="DESCRICAO" />
                    <asp:BoundField HeaderText="Especificações" DataField="ESPECIFICACOES" 
                        ItemStyle-CssClass="d-none d-sm-block" HeaderStyle-CssClass="d-none d-sm-block"/>
                    <asp:BoundField HeaderText="Unidade" DataField="UNIDADE" />
                    <asp:BoundField DataField="CATEGORIA_PRODUTO.DESCRICAO" HeaderText="Categoria" 
                        ItemStyle-CssClass="d-none d-sm-block" HeaderStyle-CssClass="d-none d-sm-block"/>
                    <asp:CommandField ShowSelectButton="True" />
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
    </div>

    <div class="row">
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnCancelar" class="btn btn-primary" Width="100%" runat="server" Text="Novo" OnClick="btnCancelar_Click" />
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnSelecionar" class="btn btn-primary" Width="100%" runat="server" Text="Editar" OnClick="btnSelecionar_Click" /><
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnRemover" class="btn btn-primary" Width="100%" runat="server" Text="Remover" OnClick="btnRemover_Click"
                OnClientClick="return confirm('Deseja remover?');" />
        </div>
    </div>

</asp:Content>
