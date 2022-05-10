<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscausuario.aspx.cs" Inherits="ProjetoArcos.frmbuscausuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="entidade">
        Buscar Usuários
    </div>

    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Filtro</span>
                </div>
                <asp:TextBox ID="txtBusca" runat="server" CssClass="form-control" placeholder="Pesquisar..."></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="btnBuscar" runat="server" class="btn btn-success" Text="Buscar" OnClick="btnBuscar_Click" Width="100%"/>
        </div>
    </div>
 
        
    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <fieldset class="border p-2 border-primary">
                <div><asp:RadioButton ID="rdNome" runat="server" Checked="True" GroupName="filtro" Text="Nome" Width="100%"/></div>
                <div><asp:RadioButton ID="rdLogin" runat="server" GroupName="filtro" Text="Login" Width="100%"/></div>
            </fieldset>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-12">
            <asp:GridView ID="grid" runat="server" 
                AutoGenerateColumns="False" CellPadding="4" 
                ForeColor="#333333" GridLines="None" Width="100%" 
                DataKeyNames="login" ShowHeaderWhenEmpty="True" 
                AllowPaging="True" PageSize="20" OnPageIndexChanging="grid_PageIndexChanging">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="Nome" DataField="NOME" />
                    <asp:BoundField HeaderText="Login" DataField="LOGIN" 
                        ItemStyle-CssClass="d-none d-sm-block" HeaderStyle-CssClass="d-none d-sm-block"/>

                    <asp:BoundField HeaderText="CPF" DataField="CPF"/>

                    <asp:BoundField HeaderText="E-mail" DataField="EMAIL" 
                        ItemStyle-CssClass="d-none d-sm-block" HeaderStyle-CssClass="d-none d-sm-block"/>

                    <asp:CommandField ShowSelectButton="True" />

                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                <PagerSettings Position="Bottom"
                    PreviousPageText=""
                    NextPageText=""
                    FirstPageText="Primeiro | "
                    LastPageText="| Último" PageButtonCount="20" />

                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center"
                    CssClass="GridPager" />

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
            <asp:Button ID="btnCancelar" class="btn btn-primary" runat="server" Text="Novo" OnClick="btnCancelar_Click" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnSelecionar" class="btn btn-primary" runat="server" Text="Editar" OnClick="btnSelecionar_Click" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnRemover" class="btn btn-primary" runat="server" Text="Remover" OnClick="btnRemover_Click" Width="100%" OnClientClick="return confirm('Deseja remover?');" />
        </div>
    </div>
</asp:Content>
