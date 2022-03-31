﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frmvoluntariar.aspx.cs" Inherits="SysArcos.formularios.Voluntariar.frmvoluntariar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="areaformulario">
        <div class="container-fluid">
            <div class="row">
                <div class="entidade col">
                    Voluntariar
                </div>
            </div>

            <div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="form" />
            </div>

            <div class="row">
                <div class="acao col">
                    <asp:Label ID="lblAcao" runat="server" Text="NOVO"></asp:Label>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-lg-10 row_fields">
                    <asp:Label ID="lblID" runat="server"></asp:Label>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-lg-6 row_fields">
                    <asp:Label ID="Lbl_vdatainicial" runat="server" Text="Data Inicial"></asp:Label>
                    :
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Txt_vdatainicial" ErrorMessage="Data Inicial está vazio" Font-Size="Medium" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Txt_vdatainicial" ErrorMessage="Formato de Data Incorreto" ForeColor="Red" ValidationExpression="^(((0[1-9]|[12][0-9]|30)[-/]?(0[13-9]|1[012])|31[-/]?(0[13578]|1[02])|(0[1-9]|1[0-9]|2[0-8])[-/]?02)[-/]?[0-9]{4}|29[-/]?02[-/]?([0-9]{2}(([2468][048]|[02468][48])|[13579][26])|([13579][26]|[02468][048]|0[0-9]|1[0-6])00))$"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="Txt_vdatainicial" class="form-control" runat="server" MaxLength="10" Placeholder="DD/MM/AAAA" onkeydown="mascara(this,DATA);"></asp:TextBox>
                </div>

                <div class="col-12 col-lg-6 row_fields">
                    <asp:Label ID="lblDataFinal" runat="server" Text="Data Final"></asp:Label>
                    :
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Txt_vdatafinal" ErrorMessage="Data Final está vazio" Font-Size="Medium" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="Txt_vdatafinal" ErrorMessage="Formato de Data Incorreto" ForeColor="Red" ValidationExpression="^(((0[1-9]|[12][0-9]|30)[-/]?(0[13-9]|1[012])|31[-/]?(0[13578]|1[02])|(0[1-9]|1[0-9]|2[0-8])[-/]?02)[-/]?[0-9]{4}|29[-/]?02[-/]?([0-9]{2}(([2468][048]|[02468][48])|[13579][26])|([13579][26]|[02468][048]|0[0-9]|1[0-6])00))$"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="Txt_vdatafinal" class="form-control" runat="server" MaxLength="10" Placeholder="DD/MM/AAAA" onkeydown="mascara(this,DATA);"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-lg-6 row_fields">
                    <asp:Label ID="Lbl_voluntario" runat="server" Text="Voluntário"></asp:Label>
                    :
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Ddl_voluntario" ErrorMessage="Voluntário está vazio" Font-Size="Medium" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
                    <asp:DropDownList ID="Ddl_voluntario" runat="server" class="form-control">
                    </asp:DropDownList>
                </div>

                <div class="col-12 col-lg-6 row_fields">
                    <asp:Label ID="Lbl_ventidade" runat="server" Text="Voluntariado"></asp:Label>
                    :
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Ddl_vvoluntariado" ErrorMessage="Voluntariado está vazio" Font-Size="Medium" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
                    <asp:DropDownList ID="Ddl_vvoluntariado" runat="server" class="form-control">
                    </asp:DropDownList>
                </div>
            </div>

            <div class="row">
                <div class="col-12 row_fields">
                    <asp:Label ID="Lbl_vobservacao" runat="server" Text="Observação"></asp:Label>
                    :
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Txt_vobservacao" ErrorMessage="Observação está vazio" Font-Size="Medium" ForeColor="Red" ValidationGroup="form">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="Txt_vobservacao" class="form-control" runat="server" MaxLength="50" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-lg-4 row_buttons">
                    <asp:Button ID="Btn_Novo" runat="server" class="btn btn-primary" Text="Novo" OnClick="btnNovo_Click" Width="100%"/>
                </div>
                <div class="col-12 col-lg-4 row_buttons">
                    <asp:Button ID="Btn_Salvar" class="btn btn-primary" runat="server" Text="Salvar" OnClick="Btn_Salvar_Click1" Width="100%" ValidationGroup="form"/>
                </div>
                <div class="col-12 col-lg-4 row_buttons">
                    <asp:Button ID="Btn_Buscar" class="btn btn-primary" runat="server" Text="Buscar" OnClick="btn_buscar_Click" Width="100%"/>
                </div>
                <br />
            </div>
        </div>
    </div>
</asp:Content>

