using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SysArcos.utils;

namespace SysArcos
{
    public partial class AlterarSenhaProxLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if((bool)Session["altera_primeiro_login"] == false)
            {
                Response.Redirect("/permissao_negada.aspx");
            }
        }

        protected void btnAlterarSenha_Click(object sender, EventArgs e)
        {
            using(ARCOS_Entities entity = new ARCOS_Entities())
            {
                string login = (string)Session["usuariologado"];
                USUARIO u = entity.USUARIO.FirstOrDefault(
                    l => l.LOGIN.Equals(login));
                if (!u.SENHA.Equals(txtSenhaAtual.Text))
                {
                    Response.Write("<script>alert('Senha atual incorreta');</script>");
                }
                else if (!txtNovaSenha.Text.Equals(txtRepetirNovaSenha.Text))
                {
                    Response.Write("<script>alert('Nova senha não confere');</script>");
                }
                else if (txtNovaSenha.Text == u.SENHA)
                {
                    Response.Write("<script>alert('Insira uma senha diferente');</script>");
                }
                else
                {
                    u.SENHA = txtNovaSenha.Text;
                    u.ALTERA_SENHA_PROX_LOGIN = false;
                    entity.Entry(u);
                    entity.SaveChanges();
                    Session["altera_primeiro_login"] = false;
                    Response.Redirect("/PaginaInicial.aspx");
                }
            }
        }
    }
}