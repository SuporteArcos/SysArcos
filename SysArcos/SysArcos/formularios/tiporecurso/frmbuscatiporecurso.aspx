<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscatiporecurso.aspx.cs" Inherits="ProjetoArcos.frmbuscatiporecurso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="entidade">
        Buscar Tipo Recurso
    </div>

    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Filtro</span>
                </div>
                <asp:TextBox ID="txtbusca" runat="server" placeholder="Pesquisar..." CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="btnbuscar" runat="server" Text="Buscar" OnClick="btnbuscar_Click" CssClass="btn btn-success" Width="100%"/>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <fieldset class="border p-2 border-primary">
                <div>
                    <asp:RadioButton ID="rddescricao" runat="server" Text="Descrição" />
                </div>
            </fieldset>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-12">
            <asp:GridView ID="Grid" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" ForeColor="#333333" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="DESCRICAO" HeaderText="RECURSO" />
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
            <asp:Button ID="btnvoltar" Width="100%" runat="server" Text="Novo" CssClass="btn btn-primary" OnClick="btnvoltar_Click" />
        </div>
        <div class="col-md-12 col-lg-4 row_buttons">
            <asp:Button ID="btnselecionar" Width="100%" runat="server" Text="Editar" OnClick="btnselecionar_Click" CssClass="btn btn-primary" />
        </div>
        <div class="col-md-12 col-lg-4 row_buttons">
            <asp:Button ID="btnremover" Width="100%" runat="server" Text="Remover" OnClick="btnremover_Click" CssClass="btn btn-primary"
                OnClientClick="return confirm('Deseja remover?');" />
        </div>
    </div>

</asp:Content>
