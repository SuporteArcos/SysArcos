<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscaassistencia.aspx.cs" Inherits="ProjetoArcos.frmbuscaassistencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="entidade">
        Buscar Assistências
    </div>

    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Busca por CPF</span>
                </div>
                <asp:TextBox ID="txtBusca" runat="server" placeholder="Pesquisa..." class="form-control" onkeydown="mascara( this,CPF  );" MaxLength="14"></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="btnBuscar" Width="100%" runat="server" class="btn btn-success" Text="Buscar" OnClick="btnBuscar_Click" />
        </div>
    </div>

    <div class="row">
        <div class="col-12 row_fields">
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID" ShowHeaderWhenEmpty="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="DATA INICIAL" DataField="DATA_INICIAL" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField HeaderText="DATA FINAL" DataField="DATA_FINAL" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="ASSISTIDO.NOME" HeaderText="ASSISTIDO" />
                    <asp:BoundField DataField="TIPO_ASSISTENCIA.DESCRICAO" HeaderText="TIPO ASSISTÊNCIA" />
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
        <div class="col-md-12 col-lg-4 row_buttons">
            <asp:Button ID="btnCancelar" class="btn btn-primary" runat="server" Width="100%" Text="Novo" OnClick="btnCancelar_Click" />
        </div>
        <div class="col-md-12 col-lg-4 row_buttons">
            <asp:Button ID="btnSelecionar" class="btn btn-primary" runat="server" Width="100%" Text="Editar" OnClick="btnSelecionar_Click" />
        </div>
        <div class="col-md-12 col-lg-4 row_buttons">
            <asp:Button ID="btnRemover" class="btn btn-primary" runat="server" Width="100%" Text="Remover" OnClick="btnRemover_Click"
                OnClientClick="return confirm('Deseja remover?');" />
        </div>
    </div>
</asp:Content>
