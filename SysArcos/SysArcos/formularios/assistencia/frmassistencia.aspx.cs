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
    public partial class frmassistencia : System.Web.UI.Page
    {
        private String COD_VIEW = "ASST";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (ARCOS_Entities entities = new ARCOS_Entities())
                {
                    carregaEntidade(entities);
                    carregaTipoAssistencia(entities);
                    String ID = Request.QueryString["ID"];
                    if ((ID != null) && (!ID.Equals("")))
                    {
                        lblAcao.Text = "ALTERANDO";
                        txtID.Text = ID;
                        ASSISTENCIA u = entities.ASSISTENCIA.FirstOrDefault(x => x.ID.ToString().Equals(ID));
                        if (u != null)
                        {
                            txt_inicial.Text = u.DATA_INICIAL.ToString("dd/MM/yyyy");
                            txt_final.Text = ((DateTime)u.DATA_FINAL).ToString("dd/MM/yyyy");
                            txt_observacao.Text = u.OBSERVACOES;
                            ddlEntidade.SelectedValue = u.ENTIDADE.ID.ToString();
                            ddlTipoAssistencia.SelectedValue = u.TIPO_ASSISTENCIA.ID.ToString();
                            txtIdAssistido.Text = u.ASSISTIDO.ID.ToString();
                            txtNomeAssistido.Text = u.ASSISTIDO.NOME.ToString();
                        }
                    }
                    else
                    {
                        limpar();
                    }
                }
            }

        }

        protected void btn_cadastrar_Click(object sender, EventArgs e)
        {

            if (txt_inicial.Text == "" || txt_final.Text == "" || txt_observacao.Text == "")

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
                            if (!isAssistidoEntidadeValido(entity, Convert.ToInt32(ddlEntidade.SelectedValue), Convert.ToInt32(txtIdAssistido.Text)))
                            {
                                Response.Write("<script>alert('Assistido " + txtNomeAssistido.Text + " não está vinculado à entidade " + ddlEntidade.SelectedItem.Text + "!');</script>");
                            }
                            else
                            {

                                ASSISTENCIA assistencia = null;

                                if (lblAcao.Text.Equals("NOVO"))
                                {
                                    assistencia = new ASSISTENCIA();
                                }
                                else
                                {
                                    assistencia = entity.ASSISTENCIA.FirstOrDefault(x => x.ID.ToString().Equals(txtID.Text));
                                }
                                assistencia.DATA_INICIAL = DateTime.ParseExact(txt_inicial.Text, "dd/MM/yyyy", null);
                                assistencia.DATA_FINAL = DateTime.ParseExact(txt_final.Text, "dd/MM/yyyy", null);
                                assistencia.OBSERVACOES = txt_observacao.Text;
                                assistencia.DATA_HORA_CRIACAO_REGISTRO = DateTime.Now;
                                assistencia.ENTIDADE = entity.ENTIDADE.FirstOrDefault(linha => linha.ID.ToString().Equals(ddlEntidade.SelectedValue));
                                assistencia.TIPO_ASSISTENCIA = entity.TIPO_ASSISTENCIA.FirstOrDefault(linha => linha.ID.ToString().Equals(ddlTipoAssistencia.SelectedValue));
                                assistencia.ASSISTIDO = entity.ASSISTIDO.FirstOrDefault(linha => linha.ID.ToString().Equals(txtIdAssistido.Text));
                                if (lblAcao.Text.Equals("NOVO"))
                                {
                                    entity.ASSISTENCIA.Add(assistencia);
                                }
                                else
                                {
                                    entity.Entry(assistencia);
                                }
                                entity.SaveChanges();
                                limpar();

                                Response.Write("<script>alert('Assistência salvo com Sucesso!');</script>");
                            }
                        }
                    }
                }
                catch
                {
                    Response.Write("<script>alert('Registro não pode ser salvo!');</script>");
                }
            }
        }

        private bool isAssistidoEntidadeValido(ARCOS_Entities entity, int IDEntidade, int IDAssistido)
        {
            ASSISTIDO assistido = entity.ASSISTIDO.Where(linha => ((int) linha.ID).Equals(IDAssistido) && 
                                                                  ((int)linha.ID_ENTIDADE).Equals(IDEntidade)).FirstOrDefault();
            return assistido!=null;
        }

        protected void btnNovo_Click(object sender, EventArgs e)
        {
            limpar();
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmbuscaassistencia.aspx");
        }

        private void limpar()
        {
            if (ddlEntidade.Items.Count == 2)
            {
                ddlEntidade.SelectedIndex = 1;
            }
            else
            {
                ddlEntidade.SelectedIndex = 0;
            }
            txt_inicial.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txt_final.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txt_observacao.Text = string.Empty;
            ddlTipoAssistencia.SelectedIndex = 0;
            txtIdAssistido.Text = string.Empty;
            txtNomeAssistido.Text = string.Empty;
            lblAcao.Text = "NOVO";
        }

        private void carregaEntidade(ARCOS_Entities conn)
        {
            String login = (string)Session["usuariologado"]; //Verificando usuário logado

            USUARIO usuario = conn.USUARIO.Where(linha => linha.LOGIN.Equals(login)).FirstOrDefault();
            List<ENTIDADE> list = new List<ENTIDADE>();
            if (usuario.ADM)
                list.AddRange(conn.ENTIDADE.OrderBy(x => x.NOME).ToList());
            else
                list.AddRange(conn.ENTIDADE.Where(linha => linha.LOGIN_USUARIO_ADMINISTRADOR.Equals(login)).OrderBy(x => x.NOME).ToList());
            ddlEntidade.DataTextField = "NOME";//Carrega o campo que será mostrado
            ddlEntidade.DataValueField = "ID";//Carrega Primary Key
            ddlEntidade.DataSource = list;
            ddlEntidade.DataBind();
            ddlEntidade.Items.Insert(0, "");
        }

        private void carregaTipoAssistencia(ARCOS_Entities conn)
        {
            List<TIPO_ASSISTENCIA> list = conn.TIPO_ASSISTENCIA.OrderBy(x => x.DESCRICAO).ToList();
            ddlTipoAssistencia.DataTextField = "DESCRICAO";//Carrega o campo que será mostrado
            ddlTipoAssistencia.DataValueField = "ID";//Carrega Primary Key
            ddlTipoAssistencia.DataSource = list;
            ddlTipoAssistencia.DataBind();
            ddlTipoAssistencia.Items.Insert(0, "");
        }

        protected void btnSelecionarBuscar_Click(object sender, EventArgs e)
        {
            if (gridBuscar.SelectedValue != null)
            {
                int ID = Convert.ToInt32(gridBuscar.SelectedValue.ToString());
                using (ARCOS_Entities conn = new ARCOS_Entities())
                {
                    ASSISTIDO assistido =
                        conn.ASSISTIDO.Where(linha => linha.ID.Equals(ID)).FirstOrDefault();
                    txtNomeAssistido.Text = assistido.NOME;
                    txtIdAssistido.Text = assistido.ID.ToString();
                }
            }
        }

        protected void btnBuscarAssistido_Click(object sender, EventArgs e)
        {
            if (ddlEntidade.SelectedIndex > 0)
            {
                using (ARCOS_Entities entities = new ARCOS_Entities())
                {
                    var lista = entities.ASSISTIDO
                        .Where(linha => linha.CPF.Equals(txtBusca.Text) && 
                                        linha.ID_ENTIDADE.ToString().Equals(ddlEntidade.SelectedValue.ToString()))
                        .Select(linha => new { linha.ID, linha.CPF, linha.NOME }).ToList();
                    gridBuscar.DataSource = lista;
                    gridBuscar.DataBind();
                }
            }
        }
    }
}