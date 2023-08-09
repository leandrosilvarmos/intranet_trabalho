﻿<%@  language="VBSCRIPT" codepage="65001" %>
<%  
	response.Charset = "utf-8" 
	response.ContentType = "text/html" 
%>

<%
    Dim vTpAvaliacao, vTpTreinamento, vDataInicial, vDataFinal, vTpRelatorio

    vTpRelatorio = Request("tipo")
    vTpAvaliacao = Request("treinamento")
    vTpTreinamento = Request("tp_treinamento")
    vDataInicial = Request("inicio")
    vDataFinal   = Request("fim")
%>

<!--#include virtual="/_funcoes/csRH.asp"-->
<%
    Dim objListaPresenca
    Set objListaPresenca = new clsListaPresenca

    Dim vHrCargaTotal

    If vTpRelatorio = "LISTA DE PRESENÇA" Then
        objListaPresenca.fRetornaEstatistica "1", vTpAvaliacao, vTpTreinamento, vDataInicial, vDataFinal

        vHrCargaTotal = objListaPresenca.fRetornaEstatisticaHrTotal("1", vTpAvaliacao, vTpTreinamento, vDataInicial, vDataFinal)

        estatisticas = objListaPresenca.fListaEstatisticas("1", vTpAvaliacao, vTpTreinamento, vDataInicial, vDataFinal, "N")
    Else
        objListaPresenca.fRetornaEstatistica "2", vTpAvaliacao, vTpTreinamento, vDataInicial, vDataFinal

        vHrCargaTotal = objListaPresenca.fRetornaEstatisticaHrTotal("2", vTpAvaliacao, vTpTreinamento, vDataInicial, vDataFinal)

        estatisticas = objListaPresenca.fListaEstatisticas("2", vTpAvaliacao, vTpTreinamento, vDataInicial, vDataFinal, "N")
    End If
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
                                <img src="/_images/_sistemas/sistema_rh/lista_presenca/grafico.jpg" width="112" height="146" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- Fim do menu esquerdo -->
            </div>
        </aside>
        <section>
            <div id="conteudo">

                <div align="center">
                    <img src="/_images/_sistemas/sistema_rh/lista_presenca/frase_estatistica.jpg" width="128" height="37" />

                </div>
                <% If estatisticas = "" Then %>
                <br />
                <br />
                <p align="center" style="font-size: 14px">Nenhum registro encontrado.</p>
                <br />
                <br />
                <p align="center"><a href="estatistica.asp">Clique aqui para voltar.</a></p>
                <% Else %>

                <table width="30%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px">
                    <tr>
                        <td class="borda_lista">Total de Registros</td>
                        <td class="borda_lista"><strong><%=objListaPresenca.EstQtdTotal%></strong></td>

                    </tr>

                    <tr>
                        <td class="borda_lista">Registros Aprovados</td>
                        <td class="borda_lista"><strong><%=objListaPresenca.EstQtdAprovado%></strong></td>
                    </tr>

                    <tr>
                        <td class="borda_lista">Registros Rejeitados</td>
                        <td class="borda_lista"><strong><%=objListaPresenca.EstQtdRejeitado%></strong></td>
                    </tr>

                    <tr>
                        <td class="borda_lista">Registros Cancelados</td>
                        <td class="borda_lista"><strong><%=objListaPresenca.EstQtdCancelado%></strong></td>
                    </tr>

                    <tr>
                        <td class="borda_lista">Total de Horas*</td>
                        <td class="borda_lista"><strong><%=vHrCargaTotal%></strong></td>
                    </tr>

                </table>
                <p style="font-size: 9px">*Hora contabilizadas são apenas para listas aprovadas.</p>


                <p align="center" style="font-size: 18px">Relatório do período de <%=vDataInicial%> à <%=vDataFinal%> </p>
                <p align="center"><a href="estatistica_excel.asp?tipo=<%=vTpRelatorio%>&treinamento=<%=vTpAvaliacao%>&inicio=<%=vDataInicial%>&fim=<%=vDataFinal%>"><img src="/_images/xls-icon.gif" />&nbsp;Exportar lista</a></p>

                <table id="tbEstatisticas" class="table-hover table-bordered table-striped" width="100%" border="0" cellspacing="0" cellpadding="0" style="font: Tahoma, Geneva, sans-serif; font-size: 11px;">
                    <thead>
                        <% If vTpRelatorio = "LISTA DE PRESENÇA" Then %>
                        <tr>
                            <th width="6%">Nº</th>
                            <th width="20%">SOLICITANTE</th>
                            <th width="20%">TÍTULO EVENTO</th>
                            <th width="20%">TIPO</th>
                            <th width="10%">DATA EVENTO</th>
                            <th width="5%">TEMPO</th>
                            <th width="10%">ANALISTA</th>
                            <th width="5%">STATUS</th>
                            <th width="7%" align="center">PRINT LISTA </th>
                            <th width="7%" align="center">PRINT AV EFICACIA </th>
                        </tr>
                        <% ElseIf vTpRelatorio = "PRAZO DE AVALIAÇÃO" Then %>
                        <tr>
                            <th width="6%">Nº</th>
                            <th width="20%">SOLICITANTE</th>
                            <th width="20%">TÍTULO EVENTO</th>
                            <th width="20%">TIPO</th>
                            <th width="10%">DATA EVENTO</th>
                            <th width="10%">PRAZO</th>
                            <th width="10%">COBRANÇA AV.</th>
                            <th width="5%">TEMPO</th>
                            <th width="5%">STATUS</th>
                            <th width="5%">STATUS AV.</th>
                            <th width="7%" align="center">PRINT LISTA</th>
                        </tr>
                        <% End If %>
                    </thead>
                    <tbody>
                        <%
                            Response.Write estatisticas
                        %>
                    </tbody>
                </table>
                <% End If %>

                <!-- Fim do conteúdo central da página -->
            </div>

            <!-- Aqui diz que o conteúdo acima está finalizado , ou seja, esta linha finaliza o a divisão de conteúdo que foi usado pelo menu flutuante esquerdo-->
            <br class="finaliza_conteudo" />
        </section>
        <footer>
            <div id="rodape">
                <p align="center">
                    HESAP - Hospital Estadual Sapopemba<br />
                    <span style="font-size: 9px;">Desenvolvido pela equipe de Tecnologia do HESAP.<br />
                        ©Copyright  2011 - 2017  HESAP | Todos os direitos reservados</span>
                </p>
            </div>
        </footer>
    </div>
    <!--Chama o Calendário -->
    <iframe width="199" height="178" name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="calendario\ipopeng.htm" scrolling="no" frameborder="0" style="visibility: visible; z-index: 999; position: absolute; top: -500px; left: -500px;"></iframe>

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
    <script src="/_js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!--[if IE]><script src="/_js/excanvas.compiled.js" type="text/javascript"></script><![endif]-->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#tbEstatisticas").DataTable({
                "pageLength": 25
            });
        });

        function ImprimirLista(pNrLista) {
            window.location.href = 'impressao_lista.asp?lista=' + pNrLista

        }

        function ImprimirListaEficacia(pNrLista) {
            window.location.href = 'impressao_eficacia_visualizar.asp?lista=' + pNrLista

        }
    </script>
</body>
</html>

<%
    Set objListaPresenca = Nothing
%>