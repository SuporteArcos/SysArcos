<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscadoador.aspx.cs" Inherits="ProjetoArcos.frmbusca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="entidade">
        Buscar Doadores
    </div>

    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Filtro</span>
                </div>
                <asp:TextBox ID="txtbusca" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="btnbuscar" runat="server" class="btn btn-success" Width="100%" Text="Buscar" OnClick="btnbuscar_Click" />
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <fieldset class="border p-2 border-primary">
                <div class="form-check">
                    <asp:RadioButton ID="rdcidade" runat="server" Text="Cidade" GroupName="filtro" />
                </div>
                <div class="form-check">
                    <asp:RadioButton ID="rdtipodoaçao" runat="server" Text="Tipo de doação" GroupName="filtro" />
                </div>
                <div class="form-check">
                    <asp:RadioButton ID="rdnome" runat="server" Text="Nome" GroupName="filtro" />
                </div>
            </fieldset>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-12">
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="NOME" HeaderText="Nome" />
                    <asp:BoundField DataField="CIDADE" HeaderText="Cidade" />
                    <asp:BoundField DataField="TIPO_DOACAO" HeaderText="Tipo de Doação" />
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
            <asp:Button ID="btncancelar" class="btn btn-primary" runat="server" Width="100%" Text="Novo" OnClick="btncancelar_Click" />
        </div>
        <div class="col-md-12 col-lg-4 row_buttons">
            <asp:Button ID="btnselecionar" class="btn btn-primary" runat="server" Width="100%" Text="Editar" OnClick="btnselecionar_Click" />
        </div>
        <div class="col-md-12 col-lg-4 row_buttons">
            <asp:Button ID="btnremover" class="btn btn-primary" runat="server" Width="100%" Text="Remover" OnClick="btnremover_Click" />
        </div>
    </div>
</asp:Content>
