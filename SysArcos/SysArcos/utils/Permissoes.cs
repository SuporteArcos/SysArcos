using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace SysArcos.utils
{
    public enum Acoes
    {
        INCLUIR,
        ALTERAR,
        REMOVER,
    }

    public class Permissoes
    {
        public static bool possuiPermissaoTela(Acoes acao, String login_usuario_logado, String COD_VIEW, ARCOS_Entities conn)
        {
            String ID_GRUPO_PERMISSAO = conn.USUARIO.Where(l => l.LOGIN.Equals(login_usuario_logado)).First().GRUPO_PERMISSAO.ID.ToString();
            SISTEMA_ITEM_ENTIDADE_CADASTRO sie = (SISTEMA_ITEM_ENTIDADE_CADASTRO)
                conn.SISTEMA_ITEM_ENTIDADE.Where(l => l.SISTEMA_ENTIDADE.COD_VIEW.Equals(COD_VIEW) &&
                                                      l.ID_GRUPO_PERMISSAO.ToString().Equals(ID_GRUPO_PERMISSAO)).FirstOrDefault();
            if (sie != null)
            {
                if (acao == Acoes.ALTERAR)
                    return sie.alterar;
                else if (acao == Acoes.INCLUIR)
                    return sie.incluir;
                else if (acao == Acoes.REMOVER)
                    return sie.remover;
                else
                    return false;
            }
            else
            {
                return false;
            }
        }

        public static bool possuiPermissaoURL(ARCOS_Entities con, String url, String login)
        {
            List<String> paginas_livres = new List<String>();
            paginas_livres.Add("/permissao_negada.aspx");
            paginas_livres.Add("/PaginaInicial.aspx");

            if (paginas_livres.Contains(url))
                return true;
            else
            {
                USUARIO u =
                    con.USUARIO.FirstOrDefault(linha => linha.LOGIN.Equals(login));
                if (u != null && !u.ADM)
                {
                    SISTEMA_ENTIDADE item = con.SISTEMA_ENTIDADE.FirstOrDefault(x => x.URL.Equals(url));
                    if (item != null)
                    {
                        SISTEMA_ITEM_ENTIDADE perm = u.GRUPO_PERMISSAO.SISTEMA_ITEM_ENTIDADE.
                            FirstOrDefault(x => x.ID_SISTEMA_ENTIDADE.ToString().Equals(item.ID.ToString()));
                        if (perm == null)
                        {
                            return false;
                        }
                        else
                        {
                            return true;
                        }
                    }
                    else
                    {
                        return false;
                    }

                }
                else
                {
                    return true;
                }
            }
        }
    }
}