<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscavoluntario.aspx.cs" Inherits="ProjetoArcos.frmbuscavoluntario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="entidade">
        Buscar Voluntários
    </div>
    
    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Filtro</span>
                </div>
                <asp:TextBox ID="txt_Busca" runat="server" placeholder="Pesquisa..." CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="btn_Busca" class="btn btn-success" runat="server" Text="Buscar" OnClick="btn_Busca_Click" Width="100%"/>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <fieldset class="border p-2 border-primary">
                <asp:RadioButtonList ID="rd_list" runat="server" RepeatDirection="Vertical" Width="209px">
                        <asp:ListItem>Nome</asp:ListItem>
                        <asp:ListItem>CPF</asp:ListItem>
                </asp:RadioButtonList>
            </fieldset>
        </div>
    </div>
    <br />
    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" CellPadding="3" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="grid_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField HeaderText="Nome" DataField="NOME" />
            <asp:BoundField HeaderText="CPF" DataField="CPF" />
            <asp:BoundField HeaderText="Disponibilidade" DataField="DISPONIBILIDADE" />
            <asp:BoundField HeaderText="Serviços Disponíveis" DataField="SERVICOS_DISPONIVEIS" />
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
    <br />
    <div class="row">
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btn_Voltar" runat="server" class="btn btn-primary" Font-Bold="True" Text="Novo" OnClick="btn_Voltar_Click" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btn_Alterar" runat="server" class="btn btn-primary" Font-Bold="True" Text="Editar" OnClick="btn_Alterar_Click" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btn_Remover" runat="server" class="btn btn-primary" Font-Bold="True" Text="Remover" OnClick="btn_Remover_Click" Width="100%"
                OnClientClick="return confirm('Deseja remover?');" />
        </div>
    </div>
</asp:Content>
