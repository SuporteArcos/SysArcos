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
    public partial class frmTipoAssistencia : System.Web.UI.Page
    {
        private String COD_VIEW = "TASS";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (ARCOS_Entities entities = new ARCOS_Entities())
                {
                    String ID = Request.QueryString["ID"];
                    if ((ID != null) && (!ID.Equals("")))
                    {
                        TIPO_ASSISTENCIA t = entities.TIPO_ASSISTENCIA.FirstOrDefault(x => x.ID.ToString().Equals(ID));
                        if (t != null)
                        {
                            lblID.Text = t.ID.ToString();
                            txtTipoAssistencia.Text = t.DESCRICAO;
                            lblAcao.Text = "ALTERANDO";
                        }
                    }

                }
            }
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {

            if (txtTipoAssistencia.Text == "")
            {
                Response.Write("<script>alert('Há campos obrigatorios não preenchidos!');</script>");
            }
            else
            {
                try
                {
                    using (ARCOS_Entities entity = new ARCOS_Entities())
                    {
                        if (!Permissoes.possuiPermissaoTela(lblAcao.Text.Equals("NOVO") ? Acoes.INCLUIR : Acoes.ALTERAR,
                        Session["usuariologado"].ToString(),
                        COD_VIEW,
                        entity))
                        {
                            Response.Write("<script>alert('Permissão Negada');</script>");
                        }
                        else
                        {
                            //String pagina = HttpContext.Current.Request.Url.AbsolutePath;
                            //validaPermissao(pagina);

                            TIPO_ASSISTENCIA tipo_assistencia = null;

                            if (lblAcao.Text.Equals("NOVO"))
                            {
                                tipo_assistencia = new TIPO_ASSISTENCIA();
                                //entidade.ID = Convert.ToInt32(txtID.Text);
                                tipo_assistencia.DESCRICAO = txtTipoAssistencia.Text;

                                // Insere o objeto
                                entity.TIPO_ASSISTENCIA.Add(tipo_assistencia);

                            }
                            else
                            {
                                tipo_assistencia = entity.TIPO_ASSISTENCIA.FirstOrDefault(x => x.ID.ToString().Equals(lblID.Text));

                                tipo_assistencia.DESCRICAO = txtTipoAssistencia.Text;

                                entity.Entry(tipo_assistencia);
                            }


                            //Salva no disco rígido
                            entity.SaveChanges();

                            limpar();

                            // Commit
                            Response.Write("<script>alert('Tipo de assistência salvo com sucesso!');</script>");

                            limpar();
                        }
                    }
                }
                catch
                {
                    Response.Write("<script>alert('Registro não pode ser salvo!');</script>");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            limpar();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmbuscatipoassistencia.aspx");
        }

        private void limpar()
        {
            txtTipoAssistencia.Text = string.Empty;
            lblAcao.Text = "NOVO";
        }
    }
}