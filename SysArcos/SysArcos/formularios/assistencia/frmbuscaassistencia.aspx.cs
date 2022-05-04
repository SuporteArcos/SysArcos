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
    public partial class frmbuscaassistencia : System.Web.UI.Page
    {
        private String COD_VIEW = "ASSD";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

            Response.Redirect("frmassistencia.aspx");
        }

        protected void btnSelecionar_Click(object sender, EventArgs e)
        {
            if (grid.SelectedValue != null)
                //Redireciona para a página de cadastro com o login como parâmtro
                Response.Redirect("frmassistencia.aspx?ID=" + grid.SelectedValue.ToString());
        }

        protected void btnRemover_Click(object sender, EventArgs e)
        {
            if (grid.SelectedValue != null)
            {
                string ID = grid.SelectedValue.ToString();
                using (ARCOS_Entities entities = new ARCOS_Entities())
                {
                    try
                    {
                        if (!Permissoes.possuiPermissaoTela(Acoes.REMOVER,
                                            Session["usuariologado"].ToString(),
                                            COD_VIEW,
                                            entities))
                        {
                            Response.Write("<script>alert('Permissão negada!');</script>");
                        }
                        else
                        {
                            ASSISTENCIA assistencia = entities.ASSISTENCIA.FirstOrDefault(x => x.ID.ToString().Equals(ID));
                            entities.ASSISTENCIA.Remove(assistencia);
                            entities.SaveChanges();

                            //Limpar Grid 
                            grid.DataSource = null;
                            grid.DataBind();
                            grid.SelectedIndex = -1;
                            Response.Write("<script>alert('Removido com sucesso!');</script>");
                        }
                    }
                    catch
                    {
                        Response.Write("<script>alert('Registro não pode ser removido!');</script>");
                    }
                }
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            using (ARCOS_Entities entities = new ARCOS_Entities())
            {
                IQueryable<ASSISTENCIA> query = entities.ASSISTENCIA.Where(x => x.ASSISTIDO.CPF.Equals(txtBusca.Text));
                var lista = query.ToList();
                grid.DataSource = lista;
                grid.DataBind();
            }
        }
    }
}