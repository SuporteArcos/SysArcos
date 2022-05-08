using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SysArcos;
using SysArcos.utils;
namespace ProjetoArcos
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Valida Permissões
                String url = HttpContext.Current.Request.Url.AbsolutePath;
                if (!url.Equals("/AlterarSenhaProxLogin.aspx"))
                    verificarSenhaPrimeiroLogin();

                String login = (string)Session["usuariologado"]; 
                if (login != null)
                {
                    using (ARCOS_Entities entity = new ARCOS_Entities())
                    {

                        //if (!Permissoes.possuiPermissaoURL(entity, url, login))
                        //    Response.Redirect("/permissao_negada.aspx");
                        //else
                        {
                            string grupo_permissao_nome = "";
                            USUARIO u = entity.USUARIO.FirstOrDefault(x => x.LOGIN.Equals(login));
                            if (u.GRUPO_PERMISSAO != null)
                                grupo_permissao_nome = u.GRUPO_PERMISSAO.DESCRICAO;
                            lbl_welcomeUser.Text = (u.NOME + "(" + grupo_permissao_nome + ")"); // em 'u' vai recuperar o atributo NOME

                            carregaItensMenu(entity);
                        }    
                    }
                }
                else
                {
                    Response.Redirect("/Default.aspx");
                }

            }
        }

        private void carregaItensMenu(ARCOS_Entities conn)
        {
            RepeaterMenu.DataSource = conn.SISTEMA_GRUPO_ENTIDADE.OrderBy(x => x.ORDEM).ToList();
            RepeaterMenu.DataBind();
        }

        protected void lnk_logout_Click(object sender, EventArgs e)
        {
            // Remove todas as variáveis da sessão servidor.
            Session.RemoveAll();       //OU   Session["usuariologado"] = null;

            //Redireciona para a página principal
            Response.Redirect("/Default.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void verificarSenhaPrimeiroLogin()
        {
            if (Session["altera_primeiro_login"] != null)
            {
                bool altera_primeiro_login = (bool)Session["altera_primeiro_login"];
                if (altera_primeiro_login)
                {
                    Response.Redirect("/AlterarSenhaProxLogin.aspx");
                }
            }
            
        }
    }
}