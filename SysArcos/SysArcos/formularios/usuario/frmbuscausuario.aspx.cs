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
    public partial class frmbuscausuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmusuario.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            buscar();
           
        }

        protected void btnSelecionar_Click(object sender, EventArgs e)
        {
            if (grid.SelectedValue != null)
                //Redireciona para a página de cadastro com o login como parâmtro
                Response.Redirect("frmusuario.aspx?login=" + grid.SelectedValue.ToString());
        }

        protected void btnRemover_Click(object sender, EventArgs e)
        {
            
            if (grid.SelectedValue==null)
            {
                Response.Write("<script>alert('NÃO É POSSÍVEL EXCLUIR, NÃO FOI SELECIONADO NENHUM VALOR');</script>");
            }

            else

            if (grid.SelectedValue != null)
            {
                string login = grid.SelectedValue.ToString();
                try
                {
                    using (ARCOS_Entities entities = new ARCOS_Entities())
                    {
                        if (Permissoes.possuiPermissaoTela(Acoes.REMOVER, Session["usuariologado"].ToString(), "COUR", entities))
                        {
                            USUARIO usuario = entities.USUARIO.FirstOrDefault(x => x.LOGIN.Equals(login));
                            entities.USUARIO.Remove(usuario);
                            entities.SaveChanges();

                            //Limpar Grid 
                            grid.DataSource = null;
                            grid.DataBind();
                            grid.SelectedIndex = -1;
                            Response.Write("<script>alert('Removido com sucesso!');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Permissão negada!');</script>");
                        }
                    }
                }
                catch
                {
                    
                    Response.Write("<script>alert('Falha ao remover registro!');</script>");
                }
            }

            
        }

        protected void btnPermissoes_Click(object sender, EventArgs e)
        {
            if (grid.Rows.Count > 0)
            {
                if (grid.SelectedValue != null)
                {
                    string login = grid.SelectedValue.ToString();
                    if (login != null && !login.Equals(""))
                    {
                        Response.Redirect("frmpermissoes.aspx?login=" + login);
                    }
                }
            }
        }

        protected void grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid.PageIndex = e.NewPageIndex;
            buscar();
        }

        private void buscar()
        {
           
            using (ARCOS_Entities entities = new ARCOS_Entities())
            {
                List<USUARIO> lista = null;
                if (rdLogin.Checked)
                {
                    lista = entities.USUARIO.Where(x => x.LOGIN.StartsWith(txtBusca.Text))
                        .OrderBy(x => x.NOME)
                        .ToList();
                }
                else if (rdNome.Checked)
                {
                    lista = entities.USUARIO.Where(x => x.NOME.StartsWith(txtBusca.Text))
                        .OrderBy(x => x.NOME)
                        .ToList();
                }
                else
                {
                    lista = entities.USUARIO
                        .OrderBy(x => x.NOME)
                        .ToList();
                }
                grid.DataSource = lista;
                grid.DataBind();
            }
        }
    }
}