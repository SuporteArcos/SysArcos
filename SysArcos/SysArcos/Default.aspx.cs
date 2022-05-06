using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SysArcos;
using SysArcos.utils;
namespace ProjetoArcos
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PreencheCodigoCaptcha();
            }
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            if (txtUsuario.Text == string.Empty ||
                txtSenha.Text == string.Empty ||
                txtCaptcha.Text == string.Empty)
            {
                PreencheCodigoCaptcha();
                Response.Write("<script>alert('Os campos Usuário/Senha e da Figura são obrigatórios');</script>");
            }
            else
            {
                using (ARCOS_Entities entities = new ARCOS_Entities())
                {
                    USUARIO u = entities.USUARIO.Where(x => x.LOGIN.Equals(txtUsuario.Text)).FirstOrDefault();
                    if (u == null)
                    {
                        //conexão falhada
                        PreencheCodigoCaptcha();
                        Response.Write("<script>alert('Login ou senha incorretos');</script>");
                    }
                    else if (Session["codigoCaptcha"]==null || Session["codigoCaptcha"].ToString() != txtCaptcha.Text)
                    {
                        if (Criptografia.Compara(txtSenha.Text, u.SENHA))
                        {
                            PreencheCodigoCaptcha();
                            txtUsuario.Text = string.Empty;
                            txtSenha.Text = string.Empty;
                            txtCaptcha.Text = string.Empty;
                            Response.Write("<script>alert('Verifique os caracteres da imagem');</script>");
                        }
                        else
                        {
                            PreencheCodigoCaptcha();
                            Response.Write("<script>alert('Login ou senha incorretos');</script>");
                        }
                    }
                    else
                    {
                        //Verifica se é administrador e caso não seja, 
                        //verifica as entidades que está vinculado
                        ArrayList entidades = new ArrayList();
                        foreach (ENTIDADE i in u.ENTIDADE)
                            entidades.Add(i.ID);


                        // conexão bem sucedida
                        Session["usuariologado"] = u.LOGIN.ToString();
                        Session["entidades"] = entidades;
                        if (u.ALTERA_SENHA_PROX_LOGIN)
                        {
                            //Redireciona para outra página
                            Session["altera_primeiro_login"] = true;
                            Response.Redirect("PaginaInicial.aspx");
                        }
                        else
                            //Redireciona para outra página
                            Session["altera_primeiro_login"] = false;
                        Response.Redirect("PaginaInicial.aspx");
                    }
                }
            }
        }

        protected void PreencheCodigoCaptcha()
        {
            try
            {
                Random objAleatorio = new Random();
                string combinacao = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
                StringBuilder codigoCaptcha = new StringBuilder();
                for (int i = 0; i < 5; i++)
                {
                    codigoCaptcha.Append(combinacao[objAleatorio.Next(combinacao.Length)]);
                }

                Session["codigoCaptcha"] = codigoCaptcha.ToString();
                imgCodigoCaptcha.ImageUrl = "GerarCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnAtualizaCodigo_Click(object sender, EventArgs e)
        {
            PreencheCodigoCaptcha();
        }
    }
}