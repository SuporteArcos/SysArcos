<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscacategoria_produto.aspx.cs" Inherits="SysArcos.formularios.categoria_produto.frmbuscacategoria_produto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="entidade">
        Buscar Tipo Produto
    </div>

    <div class="row">        
        <div class="col-8 col-lg-5">
            <div class="input-group">
               <div class="input-group-prepend">
                 <span class="input-group-text" id="">Filtro</span>
                </div>
                 <asp:TextBox ID="txtBusca" runat="server" class="form-control"></asp:TextBox>
             </div>
         </div>  
         <div class="col-4 col-lg-2">
            <asp:Button ID="btnBuscar" Width="100%" runat="server" class="btn btn-success" Text="Buscar" OnClick="btnBuscar_Click"/>
        </div>
    </div> 
    <div style="margin-top:10px">
        <asp:GridView ID="gridBusca" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="ID">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="DESCRICAO" HeaderText="Tipos Produtos" />
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
    <div class="row"> 
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="brnCancelar" runat="server" CssClass="btn btn-primary" Text="Novo" OnClick="brnCancelar_Click" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnEditar" runat="server" CssClass="btn btn-primary" Text="Editar" OnClick="btnEditar_Click" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">        
            <asp:Button ID="btnRemover" runat="server" CssClass="btn btn-primary" Text="Remover" OnClientClick="return confirm('Deseja remover?');" OnClick="btnRemover_Click" Width="100%"/>
        </div>
    </div>
</asp:Content>
