using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SysArcos.formularios.tipoassistencia
{
    public partial class frmbuscatipoassistencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            buscar();
        }

        private void buscar()
        {
            using (ARCOS_Entities entities = new ARCOS_Entities())
            {
                List<TIPO_ASSISTENCIA> lista = null;
                lista = entities.TIPO_ASSISTENCIA.Where(x => x.DESCRICAO.StartsWith(txtBusca.Text))
                    .OrderBy(x => x.DESCRICAO)
                    .ToList();

                grid.DataSource = lista;
                grid.DataBind();
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmtipoassistencia.aspx");
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            if (grid.SelectedValue != null)
                Response.Redirect("frmtipoassistencia.aspx?ID=" + grid.SelectedValue.ToString());
        }

        protected void btnRemover_Click(object sender, EventArgs e)
        {
            if (grid.SelectedValue != null)
            {
                string ID = grid.SelectedValue.ToString();
                //obtendo a conexão com o banco de dados
                try
                {
                    using (ARCOS_Entities entities = new ARCOS_Entities())
                    {
                        TIPO_ASSISTENCIA assistencia = entities.TIPO_ASSISTENCIA.FirstOrDefault(x => x.ID.ToString().Equals(ID));
                        entities.TIPO_ASSISTENCIA.Remove(assistencia);
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
    }
}