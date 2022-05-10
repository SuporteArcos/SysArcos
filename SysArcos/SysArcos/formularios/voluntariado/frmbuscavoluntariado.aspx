<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscavoluntariado.aspx.cs" Inherits="ProjetoArcos.frmvoluntariado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="entidade">
        Buscar Voluntáriado
    </div>
    
    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Filtro</span>
                </div>
                 <asp:TextBox ID="txt_Busca" runat="server" CssClass="form-control" placeholder="Pesquisa..."></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="btn_Buscar" runat="server" class="btn btn-primary" Text="Buscar" OnClick="btn_Buscar_Click" Width="100%"/>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <fieldset class="border p-2 border-primary">
                <div><asp:RadioButton ID="rd_entidade" runat="server" Text="Entidade" GroupName="tipo" /></div>
                <div><asp:RadioButton ID="rd_datainicial" runat="server" Text="Data Inicial (dd/mm/aaaa)" GroupName="tipo" /></div>
                <div><asp:RadioButton ID="rd_descricao" runat="server" Text="Descrição" GroupName="tipo" /></div>
            </fieldset>
        </div>
    </div>
    

    <br />

    <div class="row">
        <div class="col-12">
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID" ShowHeaderWhenEmpty="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Entidade" DataField="ENTIDADE.NOME" />
                    <asp:BoundField HeaderText="Data Inicial" DataField="DATA_INICIAL" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField HeaderText="Data Final" DataField="DATA_FINAL" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField HeaderText="Descrição" DataField="DESCRICAO" />
                    <asp:BoundField DataField="OBSERVACAO" HeaderText="Observação" />
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
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btn_Selecionar" runat="server" class="btn btn-primary" Text="Alterar" OnClick="btn_Selecionar_Click" Width="100%"/>
        </div>    
        <div class="col-12 col-lg-4 row_buttons">    
            <asp:Button ID="btn_Cancelar" runat="server" class="btn btn-primary" Text="Novo" OnClick="btn_Cancelar_Click"  Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btn_Remover" runat="server" class="btn btn-primary" Text="Remover" OnClick="btn_Remover_Click"  Width="100%"
                OnClientClick="return confirm('Deseja remover?');" />
        </div>
    </div>
</asp:Content>
