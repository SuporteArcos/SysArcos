﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmvoluntariado.aspx.cs" Inherits="ProjetoArcos.frmvoluntariado1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="areaformulario">
        <div class="container-fluid">
            <div class="row">
                <div class="entidade">
                    Voluntariado
                </div>
            </div>
        </div>

        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="form"/>
        </div>

        <div class="row">
            <div class="acao col">
                <asp:Label ID="lbl_acao" runat="server" Text="NOVO"></asp:Label>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-lg-6 row_fields">
                <asp:Label ID="lblEntidade" runat="server" Text="Entidade"></asp:Label>
                :
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlEntidade" ErrorMessage="Entidade está Obrigatório" ForeColor="Red" ValidationGroup="form" Font-Size="Medium">*</asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlEntidade" class="form-control" MaxLength="50" runat="server" ValidationGroup="form">
                </asp:DropDownList>
            </div>

            <div class="col-12 col-lg-6 row_fields">
                <asp:Label ID="lblDescricao" runat="server" Text="Descrição"></asp:Label>
                :
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDesc" ErrorMessage="Descrição está vazio" ForeColor="Red" ValidationGroup="form" Font-Size="Medium">*</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtDesc" class="form-control" runat="server" MaxLength="255" ValidationGroup="form"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-lg-6 row_fields">
                <asp:Label ID="lblDataini" runat="server" Text="Data Inicial"></asp:Label>
                :
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDataini" ErrorMessage="Data Inicial está vazio" ForeColor="Red" ValidationGroup="form" Font-Size="Medium">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtDataini" ErrorMessage="Formato de Data Incorreto" ForeColor="Red" ValidationExpression="^(((0[1-9]|[12][0-9]|30)[-/]?(0[13-9]|1[012])|31[-/]?(0[13578]|1[02])|(0[1-9]|1[0-9]|2[0-8])[-/]?02)[-/]?[0-9]{4}|29[-/]?02[-/]?([0-9]{2}(([2468][048]|[02468][48])|[13579][26])|([13579][26]|[02468][048]|0[0-9]|1[0-6])00))$"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtDataini" class="form-control" runat="server" MaxLength="10" Placeholder="DD/MM/AAAA" ValidationGroup="form" onkeydown="mascara(this,DATA);"></asp:TextBox>
            </div>

            <div class="col-12 col-lg-6 row_fields">
                <asp:Label ID="lblDataFinal" runat="server" Text="Data Final"></asp:Label>
                :
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDatafinal" ErrorMessage="Data Final está vazio" ForeColor="Red" ValidationGroup="form" Font-Size="Medium">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtDatafinal" ErrorMessage="Formato de Data Incorreto" ForeColor="Red" ValidationExpression="^(((0[1-9]|[12][0-9]|30)[-/]?(0[13-9]|1[012])|31[-/]?(0[13578]|1[02])|(0[1-9]|1[0-9]|2[0-8])[-/]?02)[-/]?[0-9]{4}|29[-/]?02[-/]?([0-9]{2}(([2468][048]|[02468][48])|[13579][26])|([13579][26]|[02468][048]|0[0-9]|1[0-6])00))$"></asp:RegularExpressionValidator>
                <asp:TextBox ID="txtDatafinal" class="form-control" runat="server" MaxLength="10" Placeholder="DD/MM/AAAA" ValidationGroup="form" onkeydown="mascara(this,DATA);"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-12 row_fields">
                <asp:Label ID="lblObser" runat="server" Text="Observação"></asp:Label>
                :
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtObser" ErrorMessage="Observação está vazio" ForeColor="Red" ValidationGroup="form" Font-Size="Medium">*</asp:RequiredFieldValidator>
                <asp:TextBox ID="txtObser" class="form-control" runat="server" MaxLength="255" ValidationGroup="form"></asp:TextBox>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-lg-4 row_buttons">
                <asp:Button ID="btnNovo" runat="server" class="btn btn-primary" Text="Novo" OnClick="btnNovo_Click" Width="100%"/>
            </div>
            <div class="col-12 col-lg-4 row_buttons">
                <asp:Button ID="btnSalvar" runat="server" class="btn btn-primary" OnClick="btnSalvar_Click" Text="Salvar" ValidationGroup="form" Width="100%"/>
            </div>
            <div class="col-12 col-lg-4 row_buttons">
                <asp:Button ID="btnBusca" runat="server" class="btn btn-primary" OnClick="btnBusca_Click" Text="Busca" Width="100%"/>
            </div>
            <br />
        </div>
    </div>
</asp:Content>
