<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscatipoevento.aspx.cs" Inherits="ProjetoArcos.frmbuscatipoevento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="entidade">
        Buscar Tipo Evento
    </div>

    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Filtro</span>
                </div>
                <asp:TextBox ID="txtBusca" runat="server" MaxLength="50" placeholder="Pesquisa..." CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="btnBuscar" class="btn btn-success" runat="server" Text="Buscar" OnClick="btnBuscar_Click" Width="100%" />
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <fieldset class="border p-2 border-primary">
                <asp:RadioButtonList ID="rdbLista" runat="server" RepeatDirection="Horizontal" Width="100%">
                    <asp:ListItem>Nome</asp:ListItem>
                    <asp:ListItem>Descrição</asp:ListItem>
                </asp:RadioButtonList>
            </fieldset>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-12">
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="NOME" HeaderText="NOME" />
                    <asp:BoundField DataField="DESCRICAO" HeaderText="DESCRIÇÃO" />
                    <asp:CommandField HeaderText="SELECIONAR" ShowSelectButton="True" />
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

    <br />

    <div class="row">
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnCancelar" class="btn btn-primary" runat="server" Text="Novo" Width="100%" OnClick="btnCancelar_Click" />
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnAlterar" class="btn btn-primary" runat="server" Text="Editar" Width="100%" OnClick="btnAlterar_Click" />
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnRemover" class="btn btn-primary" runat="server" Text="Remover" Width="100%" OnClick="btnRemover_Click" OnClientClick="return confirm('Deseja remover?');" />
        </div>
    </div>
</asp:Content>
