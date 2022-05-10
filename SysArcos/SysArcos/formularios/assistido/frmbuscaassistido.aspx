<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscaassistido.aspx.cs" Inherits="ProjetoArcos.frmbuscaassistido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="entidade">
        Buscar Assistidos
    </div>

    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Busca por CPF</span>
                </div>
                <asp:TextBox ID="txtBusca" runat="server" placeholder="Pesquisa..." CssClass="form-control" onkeydown="mascara( this,CPF  );" MaxLength="14"></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="btnBuscar" runat="server" class="btn btn-success" Text="Buscar" OnClick="btnBuscar_Click" Width="100%"/>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-12">
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" ShowHeaderWhenEmpty="True" DataKeyNames="ID">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ENTIDADE" HeaderText="Entidade" />
                    <asp:BoundField HeaderText="Nome" DataField="NOME" />
                    <asp:BoundField HeaderText="CPF" DataField="CPF" />
                    <asp:BoundField HeaderText="DATA DE NASCIMENTO" DataField="DATA_NASCIMENTO" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField HeaderText="RESPONSÁVEL" DataField="PARENTESCO_ASSISTIDO_RESPONSAVEl" />
                    <asp:BoundField DataField="RESPONSABILIDADE" HeaderText="RESPONSABILIDADE" />
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

    <br />

    <div class="row">
        <div class="col-md-12 col-lg-4 row_buttons">
            <asp:Button ID="btnCancelar" class="btn btn-primary" runat="server" Text="Novo" OnClick="btnCancelar_Click" Width="100%"/>
        </div>
        <div class="col-md-12 col-lg-4 row_buttons">
            <asp:Button ID="btnSelecionar" class="btn btn-primary" runat="server" Text="Editar" OnClick="btnSelecionar_Click"  Width="100%" />
        </div>
        <div class="col-md-12 col-lg-4 row_buttons">
            <asp:Button ID="btnRemover" class="btn btn-primary" runat="server" Text="Remover" OnClick="btnRemover_Click"
                OnClientClick="return confirm('Deseja remover?');"  Width="100%" />
        </div>
    </div>

</asp:Content>
