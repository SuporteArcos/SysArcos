﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmevento.aspx.cs" Inherits="ProjetoArcos.frmevento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="entidade">
        Eventos
    </div>

    <div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="form" />
    </div>

    <div class="acao">
        <asp:Label ID="lblAcao" runat="server" Text="Novo"></asp:Label>
    </div>

    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <asp:Label ID="lblEntidade" runat="server" Text="Entidade"></asp:Label>
            :
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlEntidade" ErrorMessage="Entidade está vazio" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
            <asp:DropDownList ID="ddlEntidade" runat="server" CssClass="form-control" Width="100%" MaxLength="50" Height="40px" ValidationGroup="form">
            </asp:DropDownList>
        </div>

        <div class="col-12 col-lg-6 row_fields">
            <asp:Label ID="lblTipoEvento" runat="server" Text="Tipo Evento"></asp:Label>
            :
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTipoEvento" ErrorMessage="Tipo Evento está vazio" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
            <asp:DropDownList ID="ddlTipoEvento" runat="server" CssClass="form-control" Width="100%" MaxLength="50" Height="40px" ValidationGroup="form">
            </asp:DropDownList>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-lg-6 row_fields">
            <asp:Label ID="lblNome" runat="server" Text="Nome"></asp:Label>
            :
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNome" ErrorMessage="Nome está vazio" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
            <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" Width="100%" MaxLength="50" Height="40px" ValidationGroup="form"></asp:TextBox>
        </div>

        <div class="col-12 col-lg-6 row_fields">
            <asp:Label ID="lblDescricao" runat="server" Text="Descricao"></asp:Label>
            :
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDescricao" ErrorMessage="Descrição está vazio" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
            <asp:TextBox ID="txtDescricao" runat="server" CssClass="form-control" Width="100%" MaxLength="50" Height="40px" ValidationGroup="form"></asp:TextBox>
        </div>
    </div>


    <div class="row">
        <div class="col-12 col-lg-3 row_fields">
            <asp:Label ID="lblDataInicio" runat="server" Text="Data Início"></asp:Label>
            :
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDataInicio" ErrorMessage="Data Início está vazio" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtDataInicio" ErrorMessage="Formato de Data Incorreto" ForeColor="Red" ValidationExpression="^(((0[1-9]|[12][0-9]|30)[-/]?(0[13-9]|1[012])|31[-/]?(0[13578]|1[02])|(0[1-9]|1[0-9]|2[0-8])[-/]?02)[-/]?[0-9]{4}|29[-/]?02[-/]?([0-9]{2}(([2468][048]|[02468][48])|[13579][26])|([13579][26]|[02468][048]|0[0-9]|1[0-6])00))$"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtDataInicio" runat="server" CssClass="form-control" Width="100%" MaxLength="10" Height="40px" Placeholder="DD/MM/AAAA" onkeydown="mascara(this,DATA);" ValidationGroup="form"></asp:TextBox>
        </div>

        <div class="col-12 col-lg-3 row_fields">
            <asp:Label ID="Label1" runat="server" Text="Hara Início"></asp:Label>
            :
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtHoraInicio" ErrorMessage="Hora Início está vazio" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtHoraInicio" ErrorMessage="Formato de Hora Incorreto" ForeColor="Red" ValidationExpression="^([01][0-9]|2[0-3]):([0-5][0-9])$"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtHoraInicio" runat="server" CssClass="form-control" Width="100%" MaxLength="5" Height="40px" ValidationGroup="form" Placeholder="HH:MM" onkeydown="mascara(this,HORA);"></asp:TextBox>
        </div>

        <div class="col-12 col-lg-3 row_fields">
            <asp:Label ID="lblDataFim" runat="server" Text="Data Fim"></asp:Label>
            :
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDataFim" ErrorMessage="Data Fim está vazio" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtDataFim" ErrorMessage="Formato de Data Incorreto" ForeColor="Red" ValidationExpression="^(((0[1-9]|[12][0-9]|30)[-/]?(0[13-9]|1[012])|31[-/]?(0[13578]|1[02])|(0[1-9]|1[0-9]|2[0-8])[-/]?02)[-/]?[0-9]{4}|29[-/]?02[-/]?([0-9]{2}(([2468][048]|[02468][48])|[13579][26])|([13579][26]|[02468][048]|0[0-9]|1[0-6])00))$"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtDataFim" runat="server" CssClass="form-control" Width="100%" MaxLength="10" Height="40px" Placeholder="DD/MM/AAAA" onkeydown="mascara(this,DATA);" ValidationGroup="form"></asp:TextBox>
        </div>

        <div class="col-12 col-lg-3 row_fields">
            <asp:Label ID="Label2" runat="server" Text="Hora Fim"></asp:Label>
            :
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtHoraFim" ErrorMessage="Hora Fim está vazio" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtHoraFim" ErrorMessage="Formato de Hora Incorreto" ForeColor="Red" ValidationExpression="^([01][0-9]|2[0-3]):([0-5][0-9])$"></asp:RegularExpressionValidator>
            <asp:TextBox ID="txtHoraFim" runat="server" CssClass="form-control" Width="100%" MaxLength="5" Height="40px" ValidationGroup="form" Placeholder="HH:MM" onkeydown="mascara(this,HORA);"></asp:TextBox>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnNovo" runat="server" CssClass="btn btn-primary" Text="Novo" Width="100%"/>
        </div>

        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnSalvar" runat="server" CssClass="btn btn-primary" Text="Salvar" Width="100%" OnClick="btnSalvar_Click" ValidationGroup="form" />
        </div>

        <div class="col-12 col-lg-4 row_buttons">
            <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click" Width="100%"/>
        </div>
    </div>

</asp:Content>
