<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscarecurso.aspx.cs" Inherits="SysArcos.formularios.recurso.frmBuscaRecurso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="entidade">
        Buscar Recursos
    </div>

    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Filtro</span>
                </div>
                <asp:TextBox ID="txtBuscar" runat="server" placeholder="Pesquisar..." CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-success" Text="Buscar" Width="100%"/>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <fieldset class="border p-2 border-primary">
                <div>
                    <asp:RadioButton ID="rbNome" runat="server" Text="Nome" />
                </div>
                <div>
                    <asp:RadioButton ID="rbDescricao" runat="server" Text="Descrição" />
                </div>
            </fieldset>
        </div>
    </div>
    
    <div class="row">
        <div class="col-12">
            <asp:GridView ID="gridBusca" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Nome" />
                    <asp:BoundField HeaderText="Descrição" />
                    <asp:BoundField HeaderText="Entidade" />
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
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" OnClick="Button2_Click" Text="Novo" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary" Text="Alterar" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="Button4" runat="server" CssClass="btn btn-primary" Text="Remover" Width="100%"/>
        </div>
    </div>

</asp:Content>
