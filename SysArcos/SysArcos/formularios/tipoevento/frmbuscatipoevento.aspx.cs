using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SysArcos;
namespace ProjetoArcos
{
	public partial class frmbuscatipoevento : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        //buscar tipo evento com radio button
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            using (ARCOS_Entities entities = new ARCOS_Entities())
            {
                List<TIPO_EVENTO> lista = null;
                if (rdbLista.Text == "Nome")
                {
                    lista = entities.TIPO_EVENTO.Where(x => x.NOME.StartsWith(txtBusca.Text)).ToList();
                }
                else if (rdbLista.Text == "Descrição")
                {
                    lista = entities.TIPO_EVENTO.Where(x => x.DESCRICAO.StartsWith(txtBusca.Text)).ToList();
                }
                else
                {
                    lista = entities.TIPO_EVENTO.ToList();
                }
                grid.DataSource = lista.OrderBy(x => x.NOME);

                grid.DataBind();
            }
        }

        protected void btnAlterar_Click(object sender, EventArgs e)
        {
            if (grid.SelectedValue != null)
                //Redireciona para a página de cadastro com o login como parâmtro
                Response.Redirect("frmTipoEvento.aspx?ID=" + grid.SelectedValue.ToString());
        }

        protected void btnRemover_Click(object sender, EventArgs e)
        {
            if (grid.SelectedValue != null)
            {
                string tipo_evento = grid.SelectedValue.ToString();
                //obtendo a conexão com o banco de dados
                try
                {
                    using (ARCOS_Entities entities = new ARCOS_Entities())
                    {
                        TIPO_EVENTO evento = entities.TIPO_EVENTO.FirstOrDefault(x => x.ID.ToString().Equals(tipo_evento));
                        entities.TIPO_EVENTO.Remove(evento);
                        entities.SaveChanges();

                        //limpar grid
                        grid.DataSource = null;
                        grid.DataBind();
                        grid.SelectedIndex = -1;
                        Response.Write("<script>alert('Removido com sucesso!');</script>");
                    }
                }
                catch
                {
                    Response.Write("<script>alert('Falha ao remover registro!');</script>");
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmtipoevento.aspx");
        }
    }
}