using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SysArcos.formularios.usuario
{
    public partial class frmgrupopermissao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (ARCOS_Entities entities = new ARCOS_Entities())
                {
                    carregaPermissoes(entities);
                    String ID = Request.QueryString["ID"];
                    if ((ID != null) && (!ID.Equals("")))
                    {

                        GRUPO_PERMISSAO gp = entities.GRUPO_PERMISSAO.
                            FirstOrDefault(x => x.ID.ToString().Equals(ID));
                        if (gp != null)
                        {
                            lblID.Text = ID;
                            txt_descricao.Text = gp.DESCRICAO;
                            lblAcao.Text = "ALTERANDO";
                            preenchePermissao(gp);
                        }

                    }
                }
            }
        }

        private void carregaPermissoes(ARCOS_Entities conn)
        {
            foreach (SISTEMA_GRUPO_ENTIDADE sge in conn.SISTEMA_GRUPO_ENTIDADE.OrderBy(x => x.ORDEM).ToList())
            {
                TreeNode itemGrupo = new TreeNode();
                itemGrupo.Text = sge.DESCRICAO;
                itemGrupo.Value = sge.DESCRICAO;
                itemGrupo.SelectAction = TreeNodeSelectAction.None;
                foreach (SISTEMA_ENTIDADE se in sge.SISTEMA_ENTIDADE.OrderBy(x => x.ID).ToList())
                {
                    TreeNode itemEntidade = new TreeNode();
                    itemEntidade.Text = se.DESCRICAO;
                    itemEntidade.Value = se.DESCRICAO;
                    itemGrupo.ChildNodes.Add(itemEntidade);
                    itemEntidade.SelectAction = TreeNodeSelectAction.None;
                    itemEntidade.ShowCheckBox = false;
                    if (se.TIPO_ENTIDADE.Equals("CADASTRO"))
                    {
                        itemEntidade.ChildNodes.Add(new TreeNode()
                        {
                            Text = "Incluir",
                            ShowCheckBox = true,
                            SelectAction = TreeNodeSelectAction.None,
                            Value = "incluir"
                        });
                        itemEntidade.ChildNodes.Add(new TreeNode()
                        {
                            Text = "Alterar",
                            ShowCheckBox = true,
                            SelectAction = TreeNodeSelectAction.None,
                            Value = "alterar"
                        });
                        itemEntidade.ChildNodes.Add(new TreeNode()
                        {
                            Text = "Remover",
                            ShowCheckBox = true,
                            SelectAction = TreeNodeSelectAction.None,
                            Value = "remover"
                        });
                    }
                    else if (se.TIPO_ENTIDADE.Equals("CONSULTA"))
                    {
                        itemEntidade.ChildNodes.Add(new TreeNode()
                        {
                            Text = "Consultar",
                            ShowCheckBox = true,
                            SelectAction = TreeNodeSelectAction.None,
                            Value = "consultar"
                        });
                    }
                }
                TreePermissoes.Nodes.Add(itemGrupo);
            }
        }

        protected void btnNovo_Click(object sender, EventArgs e)
        {
            limpar();
        }

        protected void btn_cadastrar_Click(object sender, EventArgs e)
        {
            if (txt_descricao.Text == "")
            {
                Response.Write("<script>alert('Há campos obrigatorios não preenchidos!');</script>");
            }
            else
            {
                try
                {
                    using (ARCOS_Entities entity = new ARCOS_Entities())
                    {
                        GRUPO_PERMISSAO gp = new GRUPO_PERMISSAO();


                        if (lblAcao.Text.Equals("NOVO"))
                        {
                            gp = new GRUPO_PERMISSAO();
                            gp.DESCRICAO = txt_descricao.Text;
                            atualizaPermissao(entity, gp);
                            entity.GRUPO_PERMISSAO.Add(gp);
                        }
                        else
                        {
                            gp = entity.GRUPO_PERMISSAO.FirstOrDefault(x => x.ID.ToString().Equals(lblID.Text));
                            gp.DESCRICAO = txt_descricao.Text;
                            atualizaPermissao(entity, gp);
                            entity.Entry(gp);
                        }
                        entity.SaveChanges();
                        limpar();

                        Response.Write("<script>alert('Grupo Permissão salvo com Sucesso!');</script>");
                    }
                }
                catch
                {
                    Response.Write("<script>alert('Registro não pode ser salvo!');</script>");
                }
            }
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmbuscagrupopermissao.aspx");
        }

        private void limpar()
        {
            lblAcao.Text = "NOVO";
            lblID.Text = string.Empty;
            txt_descricao.Text = string.Empty;

            TreePermissoes.CollapseAll();
            foreach (TreeNode grupo in TreePermissoes.Nodes)
            {
                foreach (TreeNode entidade in grupo.ChildNodes)
                {
                    foreach (TreeNode permissao in entidade.ChildNodes)
                    {
                        permissao.Checked = false;
                    }
                }
            }
        }

        private void atualizaPermissao(ARCOS_Entities conn, GRUPO_PERMISSAO gp)
        {
            //Intens Incluídos
            foreach (TreeNode grupoNode in TreePermissoes.Nodes)
            {
                foreach (TreeNode entidadeNode in grupoNode.ChildNodes)
                {
                    bool selected = false;
                    foreach (TreeNode node in entidadeNode.ChildNodes)
                    {
                        if (node.Checked)
                        {
                            selected = true;
                            break;
                        }
                    }
                    if (selected)
                    {
                        if (entidadeNode.ChildNodes.Count > 1)
                        {
                            //Cadastro
                            SISTEMA_ITEM_ENTIDADE_CADASTRO item = (SISTEMA_ITEM_ENTIDADE_CADASTRO)gp.SISTEMA_ITEM_ENTIDADE.FirstOrDefault(x => x.SISTEMA_ENTIDADE.DESCRICAO.Equals(entidadeNode.Text));
                            if (item == null)
                            {
                                //não possui permissão
                                item = new SISTEMA_ITEM_ENTIDADE_CADASTRO();
                                item.GRUPO_PERMISSAO = gp;
                                item.SISTEMA_ENTIDADE = conn.SISTEMA_ENTIDADE.First(x => x.DESCRICAO.Equals(entidadeNode.Text));
                                item.incluir = findNode(entidadeNode.ChildNodes, "incluir").Checked;
                                item.alterar = findNode(entidadeNode.ChildNodes, "alterar").Checked;
                                item.remover = findNode(entidadeNode.ChildNodes, "remover").Checked;
                                conn.SISTEMA_ITEM_ENTIDADE.Add(item);
                            }
                            else
                            {
                                //já possui alguma permissão
                                item.incluir = findNode(entidadeNode.ChildNodes, "incluir").Checked;
                                item.alterar = findNode(entidadeNode.ChildNodes, "alterar").Checked;
                                item.remover = findNode(entidadeNode.ChildNodes, "remover").Checked;
                                conn.Entry(item);
                            }
                        }
                        else
                        {
                            //Consulta
                            SISTEMA_ITEM_ENTIDADE_CONSULTA item = (SISTEMA_ITEM_ENTIDADE_CONSULTA)gp.SISTEMA_ITEM_ENTIDADE.FirstOrDefault(x => x.SISTEMA_ENTIDADE.DESCRICAO.Equals(entidadeNode.Text));
                            if (item == null)
                            {
                                //não possui permissão
                                item = new SISTEMA_ITEM_ENTIDADE_CONSULTA();
                                item.GRUPO_PERMISSAO = gp;
                                item.SISTEMA_ENTIDADE = conn.SISTEMA_ENTIDADE.First(x => x.DESCRICAO.Equals(entidadeNode.Text));
                                item.consultar = findNode(entidadeNode.ChildNodes, "consultar").Checked;
                                conn.SISTEMA_ITEM_ENTIDADE.Add(item);
                            }
                            else
                            {
                                //já possui alguma permissão
                                item.consultar = findNode(entidadeNode.ChildNodes, "consultar").Checked;
                                conn.Entry(item);
                            }

                        }
                    }
                }
            }

            //Itend Excluídos
            List<SISTEMA_ITEM_ENTIDADE> remocoes = new List<SISTEMA_ITEM_ENTIDADE>();
            foreach (SISTEMA_ITEM_ENTIDADE se in gp.SISTEMA_ITEM_ENTIDADE)
            {
                TreeNode node = TreePermissoes.FindNode(se.SISTEMA_ENTIDADE.SISTEMA_GRUPO_ENTIDADE.DESCRICAO + "/" + se.SISTEMA_ENTIDADE.DESCRICAO);
                bool selected = false;
                foreach (TreeNode n in node.ChildNodes)
                {
                    if (n.Checked)
                    {
                        selected = true;
                        break;
                    }
                }

                if (!selected)
                {
                    SISTEMA_ITEM_ENTIDADE item = conn
                        .SISTEMA_ITEM_ENTIDADE.Where(linha => linha.ID_SISTEMA_ENTIDADE.Equals(se.ID_SISTEMA_ENTIDADE) &&
                                                              linha.ID_GRUPO_PERMISSAO.Equals(se.ID_GRUPO_PERMISSAO))
                        .FirstOrDefault();
                    remocoes.Add(item);

                }
            }
            foreach(SISTEMA_ITEM_ENTIDADE i in remocoes)
            {
                conn.SISTEMA_ITEM_ENTIDADE.Remove(i);
            }

            conn.SaveChanges();
        }

        private TreeNode findNode(TreeNodeCollection arr, String value)
        {
            foreach (TreeNode node in arr)
            {
                if (node.Value.Equals(value))
                    return node;
            }
            return (TreeNode)null;
        }

        private void preenchePermissao(GRUPO_PERMISSAO gp)
        {
            foreach (SISTEMA_ITEM_ENTIDADE itemGeneric in gp.SISTEMA_ITEM_ENTIDADE)
            {
                if (itemGeneric is SISTEMA_ITEM_ENTIDADE_CADASTRO)
                {
                    SISTEMA_ITEM_ENTIDADE_CADASTRO item = (SISTEMA_ITEM_ENTIDADE_CADASTRO)itemGeneric;
                    if (item.incluir) TreePermissoes.FindNode(item.SISTEMA_ENTIDADE.SISTEMA_GRUPO_ENTIDADE.DESCRICAO + "/" + item.SISTEMA_ENTIDADE.DESCRICAO + "/incluir").Checked = true;
                    if (item.alterar) TreePermissoes.FindNode(item.SISTEMA_ENTIDADE.SISTEMA_GRUPO_ENTIDADE.DESCRICAO + "/" + item.SISTEMA_ENTIDADE.DESCRICAO + "/alterar").Checked = true;
                    if (item.remover) TreePermissoes.FindNode(item.SISTEMA_ENTIDADE.SISTEMA_GRUPO_ENTIDADE.DESCRICAO + "/" + item.SISTEMA_ENTIDADE.DESCRICAO + "/remover").Checked = true;
                }
                else if (itemGeneric is SISTEMA_ITEM_ENTIDADE_CONSULTA)
                {
                    SISTEMA_ITEM_ENTIDADE_CONSULTA item = (SISTEMA_ITEM_ENTIDADE_CONSULTA)itemGeneric;
                    if (item.consultar) TreePermissoes.FindNode(item.SISTEMA_ENTIDADE.SISTEMA_GRUPO_ENTIDADE.DESCRICAO + "/" + item.SISTEMA_ENTIDADE.DESCRICAO + "/consultar").Checked = true;
                }

            }
        }
    }
}