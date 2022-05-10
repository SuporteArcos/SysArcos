<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscaevento.aspx.cs" Inherits="SysArcos.formularios.evento.frmbuscaevento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="entidade">
        Buscar Eventos
    </div>

    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Filtro</span>
                </div>

                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" placeholder="Pesquisar..."></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-success" Width="100%"  OnClick="btnBuscar_Click" />
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <fieldset class="border p-2 border-primary">
                <div><asp:RadioButton ID="rbNome" runat="server" GroupName="filtro" Text="Nome" Checked="True" Width="100%" MaxLength="50" Height="40px" /></div>
                <div><asp:RadioButton ID="rbDescricao" runat="server" GroupName="filtro" Text="Descrição" Width="100%" MaxLength="50" Height="40px" /></div>
            </fieldset>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Entidade" DataField="ENTIDADE.NOME" />
                    <asp:BoundField HeaderText="Nome" DataField="NOME" />
                    <asp:BoundField HeaderText="Descrição" DataField="DESCRICAO" 
                        ItemStyle-CssClass="d-none d-sm-block" HeaderStyle-CssClass="d-none d-sm-block">
<HeaderStyle CssClass="d-none d-sm-block"></HeaderStyle>

<ItemStyle CssClass="d-none d-sm-block"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Data Início" DataField="DATA_HORA_INICIO" />
                    <asp:BoundField HeaderText="Data Fim" DataField="DATA_HORA_TERMINO" 
                        ItemStyle-CssClass="d-none d-sm-block" HeaderStyle-CssClass="d-none d-sm-block">
<HeaderStyle CssClass="d-none d-sm-block"></HeaderStyle>

<ItemStyle CssClass="d-none d-sm-block"></ItemStyle>
                    </asp:BoundField>
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
            <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-primary" OnClick="btnCancelar_Click" Text="Novo" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnEditar" runat="server" CssClass="btn btn-primary" Text="Editar" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnRemover" runat="server" CssClass="btn btn-primary" Text="Remover" Width="100%"/>
        </div>
    </div>
    
</asp:Content>
