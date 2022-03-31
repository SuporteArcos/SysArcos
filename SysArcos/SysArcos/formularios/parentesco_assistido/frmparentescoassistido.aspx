﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmparentescoassistido.aspx.cs" Inherits="SysArcos.formularios.parentesco_assistido.frmparentescoassistido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="entidade">
        Parentesco Assistido
    </div>

    <div class="acao">
        <asp:Label ID="lblAcao" runat="server" Text="NOVO"></asp:Label>
    </div>

    <div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="form" />
    </div>

    <div>
        <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
    </div>

    <br />

    <div class="row">
        <div class="col-12 col-lg-4">
            <asp:Label ID="lblParentesco" runat="server" Text="Parentesco"></asp:Label>
            :
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtParentesco" ErrorMessage="Parentesco está vazio" Font-Size="Medium" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
            <asp:TextBox ID="txtParentesco" runat="server" Width="100%" MaxLength="50" Height="40px" CssClass="form-control" ValidationGroup="form"></asp:TextBox>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnNovo" runat="server" CssClass="btn btn-primary" OnClick="btnNovo_Click" Text="Novo" Width="100%" />
        </div>

        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnSalvar" class="btn btn-success" OnClick="btnSalvar_Click" runat="server" Text="Salvar" CssClass="btn btn-primary" Width="100%" ValidationGroup="form" />
        </div>

        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" OnClick="btnBuscar_Click" Text="Buscar" Width="100%" />
        </div>
    </div>
</asp:Content>
