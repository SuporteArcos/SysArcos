using System;
using System.Collections.Generic;
using System.Collections;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SysArcos;
using SysArcos.utils;
namespace ProjetoArcos
{
    public partial class frmassistido : System.Web.UI.Page
    {
        private static String ASSISTIDO_RESPONSAVEL = "ASSISTIDO RESPONSÁVEL";
        private String COD_VIEW = "ASSD";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (ARCOS_Entities entities = new ARCOS_Entities())
                {
                    carregarEstadoCivil(entities);
                    carregarEntidades(entities);
                    carregarListaParentesco(entities);
                    String ID = Request.QueryString["ID"];
                    if ((ID != null) && (!ID.Equals("")))
                    {
                        lblID.Text = ID;
                        ASSISTIDO u = entities.ASSISTIDO.FirstOrDefault(x => x.ID.ToString().Equals(ID));
                        if (u != null)
                        {
                            preencheCampos(u);
                            lblAcao.Text = "ALTERANDO";
                        }
                    }
                }
            }
        }

        protected void btnCadastra_Click(object sender, EventArgs e)
        {


        }

        private void limpar()
        {
            ddlEntidade.SelectedIndex = -1;
            txtNomeAssistido.Text = string.Empty;
            txtApelido.Text = string.Empty;
            txtDataNascimento.Text = string.Empty;
            ddlEstadoCivil.SelectedIndex = -1;
            txtCPF.Text = string.Empty;
            txtRG.Text = string.Empty;
            txtNIS.Text = string.Empty;
            txtProfissao.Text = string.Empty;
            txtTelefone.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtLogradouro.Text = string.Empty;
            txtNumero.Text = string.Empty;
            txtBairro.Text = string.Empty;
            txtCEP.Text = string.Empty;
            txtCidade.Text = string.Empty;
            drpEstado.SelectedValue = null;
            ddlParentesco.SelectedValue = null;
            txtIdResponsavelAssistido.Text = string.Empty;
            txtNomeResponsavelAssistido.Text = string.Empty;
            lblAcao.Text = "NOVO";
            lblID.Text = string.Empty;
        }

        protected void btnConsulta_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmbuscaassistido.aspx");
        }

        protected void btnNovo_Click(object sender, EventArgs e)
        {

            txtNomeAssistido.ReadOnly = false;
            limpar();

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmbuscaassistido.aspx");
        }

        protected void btn_cadastrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtNomeAssistido.Text == "" || txtCPF.Text == ""
                      || txtDataNascimento.Text == "" || txtLogradouro.Text == "" || txtNumero.Text == ""
                      || txtBairro.Text == "" || txtCEP.Text == "" || txtCidade.Text == ""
                      || drpEstado.Text == "" || ddlEntidade.Text == "")
                {
                    Response.Write("<script>alert('Há campos obrigatórios não preenchidos!');</script>");
                }
                else
                {
                    using (ARCOS_Entities entity = new ARCOS_Entities())
                    {
                        //Valida Permissao
                        if (!Permissoes.possuiPermissaoTela(lblAcao.Text.Equals("NOVO") ? Acoes.INCLUIR : Acoes.ALTERAR,
                                                Session["usuariologado"].ToString(),
                                                COD_VIEW,
                                                entity))
                        {
                            Response.Write("<script>alert('Permissão Negada');</script>");
                        }
                        else
                        {
                            if (!e_CPF_Repetido(txtCPF.Text, entity))
                            {
                                ASSISTIDO assistido = null;
                                if (lblAcao.Text.Equals("NOVO"))
                                    assistido = new ASSISTIDO();
                                else
                                {
                                    assistido = entity.ASSISTIDO.FirstOrDefault(x => x.ID.ToString().Equals(lblID.Text));
                                    String usuariologado = (String)Session["usuariologado"];
                                    USUARIO usuario = entity.USUARIO
                                        .FirstOrDefault(linha => linha.LOGIN.Equals(usuariologado));
                                    if (!usuario.ENTIDADE.Contains(assistido.ENTIDADE))
                                    {
                                        Response.Write("<script>alert('Seu usuário não possui permissão para essa ação!');</script>");
                                        return;
                                    }
                                }

                                assistido.ID_ENTIDADE = Convert.ToInt32(ddlEntidade.SelectedValue);
                                assistido.NOME = txtNomeAssistido.Text;
                                assistido.APELIDO = txtApelido.Text;
                                assistido.DATA_NASCIMENTO = DateTime.ParseExact(txtDataNascimento.Text, "dd/MM/yyyy", null);
                                assistido.ID_ESTADO_CIVIL = Convert.ToInt32(ddlEstadoCivil.SelectedValue);
                                assistido.CPF = txtCPF.Text;
                                assistido.RG = txtRG.Text;
                                assistido.NUM_NIS = txtNIS.Text;
                                assistido.PROFISSAO = txtProfissao.Text;
                                assistido.TELEFONE = txtTelefone.Text;
                                assistido.EMAIL = txtEmail.Text;
                                assistido.LOGRADOURO = txtLogradouro.Text;
                                assistido.NUMERO = txtNumero.Text;
                                assistido.BAIRRO = txtBairro.Text;
                                assistido.CEP = txtCEP.Text;
                                assistido.CIDADE = txtCidade.Text;
                                assistido.ESTADO = drpEstado.Text;
                                assistido.ID_GRAU_DEPENDENCIA = Convert.ToInt32(ddlParentesco.SelectedValue);
                                if (txtNomeResponsavelAssistido.Text.Equals(ASSISTIDO_RESPONSAVEL))
                                    assistido.ID_ASSISTIDO_RESPONSAVEL = null;
                                else
                                    assistido.ID_ASSISTIDO_RESPONSAVEL = Convert.ToInt32(txtIdResponsavelAssistido.Text);
                                assistido.DATA_HORA_CRIACAO_REGISTRO = DateTime.Now;

                                if (lblAcao.Text.Equals("NOVO"))
                                    entity.ASSISTIDO.Add(assistido);
                                else
                                    entity.Entry(assistido);

                                limpar();
                                entity.SaveChanges();

                                Response.Write("<script>alert('Assistido salvo!');</script>");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Registro não pode ser salvo!\r\nErro:" + ex.Message+"');</script>");
            }
        }

        private void carregarEstadoCivil(ARCOS_Entities conn)
        {
            List<ESTADO_CIVIL> lista = conn.ESTADO_CIVIL
                .OrderBy(linha => linha.DESCRICAO)
                .ToList();
            ddlEstadoCivil.DataTextField = "DESCRICAO";
            ddlEstadoCivil.DataValueField = "ID";
            ddlEstadoCivil.DataSource = lista;
            ddlEstadoCivil.DataBind();
            ddlEstadoCivil.Items.Insert(0, "");
        }

        private void carregarEntidades(ARCOS_Entities conn)
        {
            String loginLogado = (String)Session["usuariologado"];
            if (loginLogado != null)
            {
                USUARIO u = conn.USUARIO.FirstOrDefault(linha => linha.LOGIN.Equals(loginLogado));

                List<ENTIDADE> lista = null;
                if (u.ADM)
                {
                    lista = conn.ENTIDADE
                        .Where(linha => linha.ATIVA == true)
                        .OrderBy(linha => linha.NOME)
                        .ToList();
                }
                else
                {
                    lista = u.ENTIDADE
                        .Where(linha => linha.ATIVA)
                        .OrderBy(linha => linha.NOME)
                        .ToList();
                }
                ddlEntidade.DataTextField = "NOME";
                ddlEntidade.DataValueField = "ID";
                ddlEntidade.DataSource = lista;
                ddlEntidade.DataBind();
                ddlEntidade.Items.Insert(0, "");
            }
        }

        private void preencheCampos(ASSISTIDO u)
        {
            txtNomeAssistido.Text = u.NOME;
            txtApelido.Text = u.APELIDO;


            DateTime dnsc = u.DATA_NASCIMENTO.Value;
            txtDataNascimento.Text = dnsc.ToString("dd/MM/yyyy");
            ddlEntidade.SelectedValue = u.ENTIDADE.ID.ToString();
            ddlEstadoCivil.SelectedValue = u.ID_ESTADO_CIVIL.ToString();
            txtCPF.Text = u.CPF;
            txtRG.Text = u.RG;
            txtNIS.Text = u.NUM_NIS;
            txtProfissao.Text = u.PROFISSAO;
            txtTelefone.Text = u.TELEFONE;
            txtEmail.Text = u.EMAIL;
            txtLogradouro.Text = u.LOGRADOURO;
            txtNumero.Text = u.NUMERO;
            txtBairro.Text = u.BAIRRO;
            txtCEP.Text = u.CEP;
            txtCidade.Text = u.CIDADE;
            drpEstado.Text = u.ESTADO;
            ddlParentesco.SelectedValue = u.ID_GRAU_DEPENDENCIA.ToString();
            if (u.ID_ASSISTIDO_RESPONSAVEL == null)
                txtNomeResponsavelAssistido.Text = ASSISTIDO_RESPONSAVEL;
            else
                txtNomeResponsavelAssistido.Text = u.ASSISTIDO_TITULAR.NOME;
        }

        protected void btnBuscarAssistido_Click(object sender, EventArgs e)
        {
            using (ARCOS_Entities conn = new ARCOS_Entities())
            {
                List<ASSISTIDO> lista =
                    conn.ASSISTIDO.Where(linha => linha.NOME.Contains(txtBusca.Text))
                    .OrderBy(linha => linha.NOME).ToList();
                gridBuscar.DataSource = lista;
                gridBuscar.DataBind();
            }
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
                    txtNomeResponsavelAssistido.Text = assistido.NOME;
                    txtIdResponsavelAssistido.Text = assistido.ID.ToString();
                }
            }

        }

        protected void btnDefinidorTitular_Click(object sender, EventArgs e)
        {
            txtIdResponsavelAssistido.Text = "";
            txtNomeResponsavelAssistido.Text = ASSISTIDO_RESPONSAVEL;
        }

        private void carregarListaParentesco(ARCOS_Entities conn)
        {
            List<GRAU_DEPENDENCIA> lista = conn.GRAU_DEPENDENCIA.OrderBy(linha => linha.DESCRICAO).ToList();
            ddlParentesco.DataTextField = "DESCRICAO";
            ddlParentesco.DataValueField = "ID";
            ddlParentesco.DataSource = lista;
            ddlParentesco.DataBind();
            ddlParentesco.Items.Insert(0, "");
        }

        private bool e_CPF_Repetido(String CPF, ARCOS_Entities conn)
        {
            ASSISTIDO ass = conn.ASSISTIDO.Where(linha => linha.CPF.Equals(txtCPF.Text)).FirstOrDefault();
            bool e_repetido = false;
            if ( (lblAcao.Text=="NOVO" && ass != null) || 
                 (lblAcao.Text != "NOVO" && !lblID.Text.Equals(ass.ID.ToString()))
               )
            {
                e_repetido = true;
                Response.Write("<script>alert('Este CPF já esta cadastrado!');</script>");
                txtCPF.Text = string.Empty;
            }

            return e_repetido;
        }
    }
}