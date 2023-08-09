<%@  language="VBSCRIPT" codepage="65001" %>
<%  
	response.Charset = "utf-8" 
	response.ContentType = "text/html" 
%>

<!--#include virtual="/_funcoes/csRH.asp"-->
<%
    Dim objListaPresenca
    Set objListaPresenca = new clsListaPresenca

    'Consulta listas não finalizadas
    Dim pendencias
    pendencias = objListaPresenca.fListasAvaliacaoNaoFinalizada
%>

<!DOCTYPE html>
<html lang="pt-br" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="cache-control" content="no-cache" />

    <title>SISTEMA RH - LISTA DE PRESENÇA</title>

    <!-- Bootstrap core CSS -->
    <link href="/_css/bootstrap.min.css" rel="stylesheet" media="screen" />

    <link href="/_css/font-awesome.css" rel="stylesheet" />

    <link href="/_css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

    <link href="/_css/style.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="/_js/html5shiv.min.js"></script>
      <script src="/_js/respond.min.js"></script>
    <![endif]-->

    <!--[if lte IE 8]>
        <style>
            input {
                font-family: Arial;
            }
        </style>
    <![endif]-->

    <link type="text/css" rel="stylesheet" href="/_css/_sistemas/sistema_rh/lista_presenca.css" />
</head>
<body class="colunas">
    <div id="tudo">
        <header>
            <div style="position: absolute; width: 130px; height: 70px; background-color: #fff; padding-top: 15px; padding-left: 10px;">
                <img src="/_images/_sistemas/sistema_rh/lista_presenca/logo1.jpg" width="110" height="40" border="0" />
            </div>

            <div id="cabecalho" align="center" style="background-image: url(/_images/sistemas_topo.png);">
            </div>
        </header>
        <aside>
            <div id="menu_esquerdo">
                <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" class="css_menuEsquerdo_tudo">
                    <tbody>
                        <tr valign="top">
                            <td align="center">
                                <table width="100%" border="0" align="center" cellpadding="2" cellspacing="2" class="css_menuEsquerdo">
                                    <tbody>
                                        <tr>
                                            <td align="center" style="background-color: #3291af; color: #FFF">
                                                <label><strong>M E N U</strong></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" valign="middle" class="borda_lista"><a href="solicitacoes_rh.asp">Solicitação</a></td>
                                        </tr>
                                        <tr>
                                            <td align="center" valign="middle" class="borda_lista"><a href="analise.asp">Análise</a></td>
                                        </tr>
                                        <tr>
                                            <td align="center" valign="middle" class="borda_lista"><a href="analise_canceladas.asp">Listas Canceladas</a></td>
                                        </tr>

                                        <!-- erro de hiperlink na linha abaixo	-->

                                        <tr>
                                            <td align="center" valign="middle" class="borda_lista"><a href="analise_finalizadas.asp">An. Finalizadas</a></td>
                                        </tr>


                                        <!-- erro de hiperlink na linha acima	-->

                                        <tr>
                                            <td align="center" valign="middle" class="borda_lista"><a href="listagem_av_eficacia.asp">Av. Eficácia</a> </td>
                                        </tr>
                                        <tr>
                                            <td align="center" valign="middle" class="borda_lista"><a href="editFuncionario.asp">Cadastro de Funcionário</a> </td>
                                        </tr>
                                        <tr>
                                            <td align="center" valign="middle" class="borda_lista"><a href="estatistica.asp">Estatísticas</a></td>
                                        </tr>

                                        <tr>
                                            <td align="center" valign="middle" class="borda_lista"><a href="javascript: void(0)" onclick="window.open('/arquivo/sistemas/administrativos/lista_presenca/manual.pdf','MANUAL','fullscreen=1, scrollbars=yes');return false;">Manual</a></td>
                                        </tr>
                                        <tr>
                                            <td align="center" valign="middle" class="borda_lista"><a href="login_confirm.asp?sair=1">Sair</a></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                                <img src="/_images/_sistemas/sistema_rh/lista_presenca/email.jpg" width="112" height="146" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- Fim do menu esquerdo -->
            </div>
        </aside>
        <section>
            <div id="conteudo">
                <% If pendencias = "" Then %>
                <p align="left" style="font-size: 18px">
                    <img src="/_images/_sistemas/sistema_rh/lista_presenca/frase_listagem.jpg" width="340" height="37" />
                </p>
                <br />
                <p align="center" style="font-size: 14px">Nenhum registro até o momento.</p>
                <% Else %>
                <p align="left" style="font-size: 18px">
                    <img src="/_images/_sistemas/sistema_rh/lista_presenca/frase_listagem2.jpg" width="340" height="37" /><br />
                    A listagem abaixo mostra apenas as listas APROVADAS pelo RH e que não foram finalizadas a avaliação de eficácia
                </p>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="font: Tahoma, Geneva, sans-serif; font-size: 11px;">
                    <tr>
                        <td width="5%" class="borda_lista">
                            <p>
                                <strong>Para enviar email individual clique no ícone de carta que aparece na coluna 'Envio de E-MAIL'
                                        <br />
                                    Clique no ícone em rosa abaixo para ENVIO DE TODOS DA LISTA que tiverem data do prazo de avaliação = ou < que a informada no campo abaixo:</strong><br />
                                <strong>
                                    <input name="data_prazo" type="text" id="data_prazo" size="15" maxlength="8" />
                                    Informe a data no formato dd/mm/yy, exemplo: 31/12/15
                                        <br />
                                    <span class="borda_lista" style="cursor: hand;">
                                        <img src="/_images/icon_email_rose.gif" border="0" alt="Clique aqui para envio a todos os solicitante presentes na lista abaixo" onclick="window.self.location.href='envia_email_coletivo.asp?data_prazo='+document.getElementById('data_prazo').value;" />
                                    </span>
                                </strong>
                            </p>
                        </td>
                    </tr>
                </table>
                <br />
                <table id="tbPendentes" class="table-hover table-bordered table-striped" width="100%" border="0" cellspacing="0" cellpadding="0" style="font: Tahoma, Geneva, sans-serif; font-size: 11px;">
                    <thead>
                        <tr>
                            <th width="5%" style="width: 14px;padding-right: 20px;">Nº</th>
                            <th width="15%">SOLICITANTE</th>
                            <th width="15%">TITULO EVENTO</th>
                            <th width="8%" align="center">DATA EVENTO</th>
                            <th width="8%" align="center">PRAZO</th>
                            <th width="8%" align="center" >EMAIL</th>
                            <th width="8%" align="center">DATA COBRANÇA</th>
                            <th width="7%" align="center">VER</th>
                            <th width="8%" align="center">CANCELAR</th>
                            <th width="8%" align="center">FIM</th>
                            <th width="10%" align="center">STATUS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Response.Write pendencias
                        %>
                    </tbody>
                </table>
                <% End If%>
                <!-- Fim do conteúdo central da página -->
            </div>
            <!-- Aqui diz que o conteúdo de acima está finalizado , ou seja, esta linha finaliza o a divisão de conteúdo que foi usado pelo menu flutuante esquerdo-->
            <br class="finaliza_conteudo" />
        </section>
        <footer>
            <div id="rodape">
                <p align="center">
                    HESAP - Hospital Estadual Sapopemba<br />
                    <span style="font-size: 9px;">Desenvolvido pela equipe de Tecnologia do HESAP.<br />
                        © Copyright  2011 - 2017  HESAP | Todos os direitos reservados</span>
                </p>
            </div>
        </footer>
    </div>
    <!-- Mainly scripts -->
    <!--[if (!IE)|(gt IE 8)]><!-->
    <script src="/_js/jquery-2.1.1.js"></script>
    <!--<![endif]-->

    <!--[if lte IE 8]>
    <script src="/_js/jquery-1.9.1.min.js"></script>
    <![endif]-->

    <script src="/_js/bootstrap.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="/_js/plugins/pace/pace.min.js"></script>

    <script src="/_js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="/_js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <!--[if IE]><script src="/_js/excanvas.compiled.js" type="text/javascript"></script><![endif]-->

    <script type="text/javascript">
        $(document).ready(function () {
            $("#tbPendentes").DataTable({
                "pageLength": 25,
                "order": [[0, "desc"]]
            });
        });

        function VisualizarLista(pNrLista) {
            window.location.href = 'analise_eficacia_visualizar.asp?lista=' + pNrLista;
        }

        function CancelarLista(pNrLista) {
            window.location.href = 'cancelar_lista.asp?lista=' + pNrLista;

        }

        function FinalizarLista(pNrLista) {
            window.location.href = 'finalizar_lista_av_eficacia.asp?lista=' + pNrLista;
        }

        function EnviarNotificacao(pNrLista, pNmSolicitante) {
            window.location.href = 'envia_notificacao_av_eficacia.asp?lista=' + pNrLista + '&nome_solicitante=' + pNmSolicitante;
        }
    </script>
</body>
</html>

<%
    Set objListaPresenca = Nothing
%>