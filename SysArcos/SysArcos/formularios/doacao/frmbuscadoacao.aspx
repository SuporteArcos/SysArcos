<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmbuscadoacao.aspx.cs" Inherits="SysArcos.formularios.doacao.frmbuscadoacao" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="entidade">
        Buscar Doação
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
            <asp:Button ID="btnBuscar" runat="server"  Font-Size="Larger" width="100%" Text="Buscar" CssClass="btn btn-success" OnClick="btnBuscar_Click" />
        </div>
    </div>  
    <div class="row">
        <div  class="col-12 col-lg-6 row_fields">
            <fieldset class="border p-2 border-primary">
                <div class="form-check">
                    <asp:RadioButton ID="rdDescricao" runat="server" Checked="True" GroupName="filtro"
                        CssClass="form-check-input"/>
                    <asp:Label ID="lblRdNome" Text="Descrição" runat="server"
                        CssClass="form-check-label" for="rdNome"></asp:Label>
                </div>
                <div class="form-check">
                    <asp:RadioButton ID="rdData" runat="server" GroupName="filtro"
                        CssClass="form-check-input"/>
                    <asp:Label ID="lblData" Text="Data" runat="server"
                        CssClass="form-check-label" for="rLogin"></asp:Label>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <asp:GridView ID="gridBusca" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <%--<AlternatingRowStyle BackColor="White" />--%>
            <Columns>
                <asp:BoundField HeaderText="Entidade" />
                <asp:BoundField HeaderText="Doador" />
                <asp:BoundField HeaderText="Data" />
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
    <br/>
    <div class="row">        
        <div class="col-12 col-lg-4 row_buttons">    
            <asp:Button ID="btnCancelar" runat="server" Text="Novo"  CssClass="btn btn-primary" OnClick="btnCancelar_Click" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">   
            <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-primary" Width="100%"/>
        </div>
        <div class="col-12 col-lg-4 row_buttons">       
            <asp:Button ID="btnRemover" runat="server" Text="Remover" CssClass="btn btn-primary" Width="100%"/>
        </div>
    </div>
</asp:Content>