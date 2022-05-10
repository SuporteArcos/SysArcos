<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscavoluntariar.aspx.cs" Inherits="SysArcos.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="entidade">
        Buscar Voluntariar
    </div>

    <div class="row">
        <div class="col-8 col-lg-5">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="">Filtro</span>
                </div>  
                <asp:TextBox ID="txtBusca" runat="server" placeholder="Pesquisar..." CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-4 col-lg-2">
            <asp:Button ID="btnBuscar" runat="server" class="btn btn-success" Text="Buscar" OnClick="btnBuscar_Click" />
        </div>
    </div>       
    
    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <fieldset class="border p-2 border-primary">
                <div><asp:RadioButton ID="rbVoluntario" runat="server" Text="Voluntário" GroupName="filtro" /></div>
                <div><asp:RadioButton ID="rbVoluntariado" runat="server" Text="Voluntariado" GroupName="filtro" /></div>
            </fieldset>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-12">
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID" ShowHeaderWhenEmpty="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField HeaderText="VOLUNTÁRIO" DataField="VOLUNTARIO.NOME" />
                    <asp:BoundField DataField="VOLUNTARIADO.DESCRICAO" HeaderText="VOLUNTARIADO" />
                    <asp:BoundField HeaderText="DATA INICIAL" DataField="DATA_INICIAL" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField HeaderText="DATA FINAL" DataField="DATA_FINAL" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField HeaderText="OBSERVACÕES" DataField="OBSERVACAO" />
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
            <asp:Button ID="btnCancelar" class="btn btn-primary" runat="server" Text="Novo" OnClick="btnCancelar_Click" Width="100%" />
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnEditar" runat="server" Text="Editar" class="btn btn-primary" OnClick="btnEditar_Click" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnRemover" class="btn btn-primary" runat="server" Text="Remover" OnClick="btnRemover_Click" Width="100%"
                OnClientClick="return confirm('Deseja remover?');" />
        </div>
    </div>
</asp:Content>
