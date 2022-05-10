<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmtipoassistencia.aspx.cs" Inherits="ProjetoArcos.frmTipoAssistencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="entidade">
        Tipo de Assistência
    </div>

    <div >
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="form" />
    </div>

    <div class="acao">
        <asp:Label ID="lblAcao" runat="server" Text="NOVO"></asp:Label>
    </div>

    <div>
        <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
    </div>
    <br />
    <div class="form-group">
        <div class="row">
            <div class="col-12 col-lg-4">
                <asp:Label ID="lblTipoAssistencia" runat="server" Text="Tipo de Assistência"></asp:Label>
                :
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTipoAssistencia" ErrorMessage="Tipo de Assistência está vazio" Font-Size="Medium" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtTipoAssistencia" runat="server" Width="100%" MaxLength="50" CssClass="form-control" ValidationGroup="form"></asp:TextBox>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Novo" Width="100%"/>
        </div>

        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnCadastrar" class="btn btn-success" runat="server" OnClick="btnCadastrar_Click" Text="Salvar" CssClass="btn btn-primary" Width="100%" ValidationGroup="form"/>
        </div>

        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" OnClick="Button2_Click" Text="Buscar" Width="100%"/>
        </div>
    </div>
</asp:Content>
