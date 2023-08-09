<%@  language="VBSCRIPT" codepage="65001" %>
<%  
	response.Charset = "utf-8" 
	response.ContentType = "text/html" 
%>

<!--#include virtual="/_funcoes/csRH.asp"-->
<%
    Dim objListaPresenca
    Set objListaPresenca = new clsListaPresenca

    Dim vNrLista

    vNrLista = Request("lista")

    'Consulta lista de presença
    objListaPresenca.fRetornaListaPresenca vNrLista

    'Consulta avaliação de eficacia
    objListaPresenca.fRetornaAvaliacaoEficacia vNrLista
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
                                <img src="/_images/_sistemas/sistema_rh/lista_presenca/analise_rh.jpg" width="112" height="146" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- Fim do menu esquerdo -->
            </div>
        </aside>
        <section>
            <div id="conteudo">
                <img src="/_images/_sistemas/sistema_rh/lista_presenca/frase_resumo.jpg" width="199" height="37" />
                <form name="tipo_avaliacao" method="post" action="analise_eficacia_rh.asp">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="font-size: 12px;" class="formulario_off">
                        <tbody>
                            <tr>
                                <td width="25%" style="text-align: right; padding-right: 5px;">Lista de Nro:</td>
                                <td colspan="5">
                                    <input type="hidden" name="numero_lista3" value="<%=vNrLista%>" />
                                    <input class="form-control" name="numero_lista" type="text" id="numero_lista" value="<%=objListaPresenca.NrLista%>" size="10" readonly="readonly" /></td>
                                <td width="15%"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right; padding-right: 5px;">Tipo de avaliação:</td>
                                <td colspan="5">
                                    <input class="form-control" name="avaliacao" type="text" value="<%=objListaPresenca.TpAvaliacao%>" readonly="readonly" size="75" />
                                </td>

                            </tr>
                            <tr>
                                <td style="text-align: right; padding-right: 5px;">Nome do solicitante:</td>
                                <td colspan="5">
                                    <input class="form-control" name="nome_solicitante" type="text" value="<%=objListaPresenca.NmSolicitante%>" readonly="readonly" size="75" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; padding-right: 5px;">Título de evento:</td>
                                <td colspan="5">
                                    <input class="form-control" name="titulo_evento" type="text" value="<%=objListaPresenca.TituloEvento%>" size="75" readonly="readonly" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; padding-right: 5px;">Tipo de Treinamento:</td>
                                <td colspan="5">
                                    <input class="form-control" name="tp_treinamento" type="text" value="<%=ucase(iif(objListaPresenca.TpTreinamento="C","Comportamental",iif(objListaPresenca.TpTreinamento="T","Técnico","")))%>" size="75" readonly="readonly" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; padding-right: 5px;">Área do responsável do evento:</td>
                                <td colspan="3">
                                    <input class="form-control" type="text" name="setor" value="<%=objListaPresenca.AreaRespEvento%>" readonly="readonly" size="75" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" align="center">
                                    <hr style="border-color: #3291af" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                        <tbody>
                                            <tr>
                                                <td rowspan="2" width="20%" style="text-align: center;"><strong>1º Dia</strong></td>
                                                <td width="5%" style="text-align: right; padding-right: 5px;">Data:</td>
                                                <td width="10%">
                                                    <input class="form-control" type="text" name="data_evento" value="<%=objListaPresenca.DtEvento%>" readonly="readonly" size="8" />
                                                </td>
                                                <td width="6%" style="text-align: right; padding-right: 5px;">Início:</td>
                                                <td width="7%">
                                                    <input class="form-control" type="text" name="hr_inicial" value="<%=objListaPresenca.HrInicial%>" readonly="readonly" size="5" />
                                                </td>
                                                <td width="7%" style="text-align: right; padding-right: 5px;">Término:</td>
                                                <td width="7%">
                                                    <input class="form-control" type="text" name="hr_final" value="<%=objListaPresenca.HrTermino%>" readonly="readonly" size="5" />
                                                </td>
                                                <td width="13%" style="text-align: right; padding-right: 5px;">Carga Horária:</td>
                                                <td width="7%">
                                                    <input class="form-control" type="text" name="carga_horaria" value="<%=objListaPresenca.HrCargaTotal%>" readonly="readonly" size="5" />
                                                </td>
                                                <td width="15%"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right; padding-right: 5px;">Local:</td>
                                                <td colspan="5">
                                                    <input class="form-control" name="local_evento" type="text" value="<%=objListaPresenca.LocalEvento%>" readonly="readonly" size="75" />
                                                </td>
                                                <td style="text-align: right; padding-right: 5px;">Qtde de pessoas:</td>
                                                <td>
                                                    <input class="form-control" type="text" name="qtd_participante" value="<%=objListaPresenca.QtdParticipantes%>" readonly="readonly" size="5" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" align="center">
                                    <hr style="border-color: #3291af" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                        <tbody>
                                            <tr>
                                                <td rowspan="2" width="20%" style="text-align: center;"><strong>2º Dia</strong></td>
                                                <td width="5%" style="text-align: right; padding-right: 5px;">Data:</td>
                                                <td width="10%">
                                                    <input class="form-control" type="text" name="data_evento2" value="<%=objListaPresenca.Data2%>" readonly="readonly" size="8" />
                                                </td>
                                                <td width="6%" style="text-align: right; padding-right: 5px;">Início:</td>
                                                <td width="7%">
                                                    <input class="form-control" type="text" name="hr_inicial2" value="<%=objListaPresenca.HrInicio2%>" readonly="readonly" size="5" />
                                                </td>
                                                <td width="7%" style="text-align: right; padding-right: 5px;">Término:</td>
                                                <td width="7%">
                                                    <input class="form-control" type="text" name="hr_final2" value="<%=objListaPresenca.HrTermino2%>" readonly="readonly" size="5" />
                                                </td>
                                                <td width="13%" style="text-align: right; padding-right: 5px;">Carga Horária:</td>
                                                <td width="7%">
                                                    <input class="form-control" type="text" name="carga_horaria2" value="<%=objListaPresenca.HrCargaTotal2%>" readonly="readonly" size="5" />
                                                </td>
                                                <td width="15%"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right; padding-right: 5px;">Local:</td>
                                                <td colspan="5">
                                                    <input class="form-control" name="local_evento2" type="text" value="<%=objListaPresenca.LocalEvento2%>" readonly="readonly" size="75" />
                                                </td>
                                                <td style="text-align: right; padding-right: 5px;">Qtde de pessoas:</td>
                                                <td>
                                                    <input class="form-control" type="text" name="qtd_participante2" value="<%=objListaPresenca.QtdParticipantes2%>" readonly="readonly" size="5" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" align="center">
                                    <hr style="border-color: #3291af" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                        <tbody>
                                            <tr>
                                                <td rowspan="2" width="20%" style="text-align: center;"><strong>3º Dia</strong></td>
                                                <td width="5%" style="text-align: right; padding-right: 5px;">Data:</td>
                                                <td width="10%">
                                                    <input class="form-control" name="data_evento3" type="text" id="data_evento3" value="<%=objListaPresenca.Data3%>" size="8" readonly="readonly" />
                                                </td>
                                                <td width="6%" style="text-align: right; padding-right: 5px;">Início:</td>
                                                <td width="7%">
                                                    <input class="form-control" name="hr_inicial3" type="text" id="hr_inicial3" value="<%=objListaPresenca.HrInicio3%>" size="5" readonly="readonly" />
                                                </td>
                                                <td width="7%" style="text-align: right; padding-right: 5px;">Término:</td>
                                                <td width="7%">
                                                    <input class="form-control" name="hr_final3" type="text" id="hr_final3" value="<%=objListaPresenca.HrTermino3%>" size="5" readonly="readonly" />
                                                </td>
                                                <td width="13%" style="text-align: right; padding-right: 5px;">Carga Horária:</td>
                                                <td width="7%">
                                                    <input class="form-control" name="carga_horaria3" type="text" id="carga_horaria3" value="<%=objListaPresenca.HrCargaTotal3%>" size="5" readonly="readonly" />
                                                </td>
                                                <td width="15%"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right; padding-right: 5px;">Local:</td>
                                                <td colspan="5">
                                                    <input class="form-control" name="local_evento3" type="text" id="local_evento3" value="<%=objListaPresenca.LocalEvento3%>" size="75" readonly="readonly" />
                                                </td>
                                                <td style="text-align: right; padding-right: 5px;">Qtde de pessoas:</td>
                                                <td>
                                                    <input class="form-control" name="qtd_participante3" type="text" id="qtd_participante3" value="<%=objListaPresenca.QtdParticipantes3%>" size="5" readonly="readonly" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" align="center">
                                    <hr style="border-color: #3291af" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                        <tbody>
                                            <tr>
                                                <td rowspan="2" width="20%" style="text-align: center;"><strong>4º Dia</strong></td>
                                                <td width="5%" style="text-align: right; padding-right: 5px;">Data:</td>
                                                <td width="10%">
                                                    <input class="form-control" name="data_evento4" type="text" id="data_evento4" value="<%=objListaPresenca.Data4%>" size="8" readonly="readonly" />
                                                </td>
                                                <td width="6%" style="text-align: right; padding-right: 5px;">Início:</td>
                                                <td width="7%">
                                                    <input class="form-control" name="hr_inicial4" type="text" id="hr_inicial4" value="<%=objListaPresenca.HrInicio4%>" size="5" readonly="readonly" />
                                                </td>
                                                <td width="7%" style="text-align: right; padding-right: 5px;">Término:</td>
                                                <td width="7%">
                                                    <input class="form-control" name="hr_final4" type="text" id="hr_final4" value="<%=objListaPresenca.HrTermino4%>" size="5" readonly="readonly" />
                                                </td>
                                                <td width="13%" style="text-align: right; padding-right: 5px;">Carga Horária: </td>
                                                <td width="7%">
                                                    <input class="form-control" name="carga_horaria4" type="text" id="carga_horaria4" value="<%=objListaPresenca.HrCargaTotal4%>" size="5" readonly="readonly" />
                                                </td>
                                                <td width="15%"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right; padding-right: 5px;">Local:</td>
                                                <td colspan="5">
                                                    <input class="form-control" name="local_evento4" type="text" id="local_evento4" value="<%=objListaPresenca.LocalEvento4%>" size="75" readonly="readonly" />
                                                </td>
                                                <td style="text-align: right; padding-right: 5px;">Qtde de pessoas:</td>
                                                <td>
                                                    <input class="form-control" name="qtd_participante4" type="text" id="qtd_participante4" value="<%=objListaPresenca.QtdParticipantes4%>" size="5" readonly="readonly" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" align="center">
                                    <hr style="border-color: #3291af" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                        <tbody>
                                            <tr>
                                                <td rowspan="2" width="20%" style="text-align: center;"><strong>5º Dia</strong></td>
                                                <td width="5%" style="text-align: right; padding-right: 5px;">Data:</td>
                                                <td width="10%">
                                                    <input class="form-control" name="data_evento5" type="text" id="data_evento5" value="<%=objListaPresenca.Data5%>" size="8" readonly="readonly" />
                                                </td>
                                                <td width="6%" style="text-align: right; padding-right: 5px;">Início:</td>
                                                <td width="7%">
                                                    <input class="form-control" name="hr_inicial5" type="text" id="hr_inicial5" value="<%=objListaPresenca.HrInicio5%>" size="5" readonly="readonly" />
                                                </td>
                                                <td width="7%" style="text-align: right; padding-right: 5px;">Término:</td>
                                                <td width="7%">
                                                    <input class="form-control" name="hr_final5" type="text" id="hr_final5" value="<%=objListaPresenca.HrTermino5%>" size="5" readonly="readonly" />
                                                </td>
                                                <td width="13%" style="text-align: right; padding-right: 5px;">Carga Horária: </td>
                                                <td width="7%">
                                                    <input class="form-control" name="carga_horaria5" type="text" id="carga_horaria5" value="<%=objListaPresenca.HrCargaTotal5%>" size="5" readonly="readonly" />
                                                </td>
                                                <td width="15%"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right; padding-right: 5px;">Local:</td>
                                                <td colspan="5">
                                                    <input class="form-control" name="local_evento5" type="text" id="local_evento5" value="<%=objListaPresenca.LocalEvento5%>" size="75" readonly="readonly" />
                                                </td>
                                                <td style="text-align: right; padding-right: 5px;">Qtde de pessoas: </td>
                                                <td>
                                                    <input class="form-control" name="qtd_participante5" type="text" id="qtd_participante5" value="<%=objListaPresenca.QtdParticipantes5%>" size="5" readonly="readonly" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" align="center">
                                    <hr style="border-color: #3291af" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                        <tbody>
                                            <tr>
                                                <td rowspan="2" width="20%" style="text-align: center;"><strong>6º Dia</strong></td>
                                                <td width="5%" style="text-align: right; padding-right: 5px;">Data:</td>
                                                <td width="10%">
                                                    <input class="form-control" name="data_evento6" type="text" id="data_evento6" value="<%=objListaPresenca.Data6%>" size="8" readonly="readonly" />
                                                </td>
                                                <td width="6%" style="text-align: right; padding-right: 5px;">Início:</td>
                                                <td width="7%">
                                                    <input class="form-control" name="hr_inicial6" type="text" id="hr_inicial6" value="<%=objListaPresenca.HrInicio6%>" size="5" readonly="readonly" />
                                                </td>
                                                <td width="7%" style="text-align: right; padding-right: 5px;">Término:</td>
                                                <td width="7%">
                                                    <input class="form-control" name="hr_final6" type="text" id="hr_final6" value="<%=objListaPresenca.HrTermino6%>" size="5" readonly="readonly" />
                                                </td>
                                                <td width="13%" style="text-align: right; padding-right: 5px;">Carga Horária: </td>
                                                <td width="7%">
                                                    <input class="form-control" name="carga_horaria6" type="text" id="carga_horaria6" value="<%=objListaPresenca.HrCargaTotal6%>" size="5" readonly="readonly" />
                                                </td>
                                                <td width="15%"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right; padding-right: 5px;">Local:</td>
                                                <td colspan="5">
                                                    <input class="form-control" name="local_evento6" type="text" id="local_evento6" value="<%=objListaPresenca.LocalEvento6%>" size="75" readonly="readonly" />
                                                </td>
                                                <td style="text-align: right; padding-right: 5px;">Qtde de pessoas:</td>
                                                <td>
                                                    <input class="form-control" name="qtd_participante6" type="text" id="qtd_participante6" value="<%=objListaPresenca.QtdParticipantes6%>" size="5" readonly="readonly" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7" align="center">
                                    <hr style="border-color: #3291af" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="formulario_off">
                        <tr>
                            <td width="25%" style="text-align: right; padding-right: 5px;">Ministrante(s):</td>
                            <td width="65%">
                                <input type="text" class="form-control" name="nome_ministrante" value="<%=objListaPresenca.NmMinistrante%>" readonly="readonly" size="75" /></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="3"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Demanda:</td>
                            <td><span style="height: 35px;">
                                <textarea class="form-control" readonly="readonly"><%=objListaPresenca.Objetivo%></textarea></span></td>
                        </tr>
                        <tr>
                            <td colspan="3"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Resultados esperados:</td>
                            <td><span style="height: 35px;">
                                <textarea class="form-control" readonly="readonly"><%=objListaPresenca.Impacto%></textarea></span></td>
                        </tr>
                        <tr>
                            <td colspan="3"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Como identificou o resultado esperado?</td>
                            <td><span style="height: 35px;">
                                <textarea class="form-control" readonly="readonly"><%=objListaPresenca.ValidarTreinamentoComo%></textarea></span></td>
                        </tr>
                    </table>
                    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="formulario_off">
                        <tr>
                            <td colspan="4" align="center">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="5" align="center">
                                <h3>Avaliação de eficácia</h3>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%" style="text-align: right; padding-right: 5px;">Treinamento eficaz?</td>
                            <td width="35%">
                                <span style="height: 35px;">
                                    <% If objListaPresenca.EfTreinamentoEficaz = "Sim" Then %>
                                    <label>
                                        <input type="radio" name="treinamento_eficaz" value="Sim" disabled="disabled" style="border: none" checked="checked" />
                                        Sim
                                    </label>
                                    <label>
                                        <input type="radio" name="treinamento_eficaz" value="Não" disabled="disabled" style="border: none" />
                                        Não
                                    </label>
                                    <% Else %>
                                    <label>
                                        <input type="radio" name="treinamento_eficaz" value="Sim" disabled="disabled" style="border: none" />
                                        Sim
                                    </label>
                                    <label>
                                        <input type="radio" name="treinamento_eficaz" value="Não" disabled="disabled" style="border: none" checked="checked" />
                                        Não
                                    </label>
                                    <% End If %>
                                </span>
                            </td>
                            <td width="15%">&nbsp;</td>
                            <td width="15%">&nbsp;</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 10px;"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Nome do avaliador:</td>
                            <td>
                                <input name="nome_avaliador" class="form-control" type="text" value="<%=objListaPresenca.EfNomeAvaliador%>" size="50" maxlength="50" readonly="readonly" /></td>
                            <td style="text-align: right; padding-right: 5px;">Data de Validação:</td>
                            <td>
                                <input name="data_validacao" class="form-control" type="text" value="<%=objListaPresenca.EfDataValidacao%>" size="9" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 10px;"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Como avaliou? Houve o impacto (resultado) esperado?</td>
                            <td colspan="3">
                                <span style="height: 35px;">
                                    <textarea class="form-control" readonly="readonly"><%=objListaPresenca.EfComoAvaliou%></textarea>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 10px;"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Campo complementar:</td>
                            <td colspan="3">
                                <span style="height: 35px;">
                                    <textarea class="form-control" readonly="readonly"><%=objListaPresenca.EfCampoComplementar%></textarea>
                                </span>
                            </td>
                        </tr>
                    </table>
                    <table width="100%" border="0" cellpadding="1" cellspacing="1">
                        <tr>
                            <td colspan="3"></td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <h3>Para preenchimento do RH</h3>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%" style="text-align: right; padding-right: 5px;">Analista:</td>
                            <td width="30%">
                                <select name="analista_lista" class="form-control">
                                    <option value="<%=objListaPresenca.EfAnalista%>"><%=objListaPresenca.Analista%></option>
                                    <option value=""></option>
                                    <option value="Amanda Cordeiro de Camargo">Amanda Cordeiro de Camargo</option>
                                    <option value="Kelly Matos do Nascimento">Kelly Matos do Nascimento</option>
                                    <option value="Pamela Gabrielly Rodrigues de Lima">Pamela Gabrielly Rodrigues de Lima</option>
                                </select></td>
                            <td width="45%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 10px;"></td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Resultado:</td>
                            <td>
                                <select name="resultado_lista" id="resultado" class="form-control" onchange="show()">
                                    <option value="<%=objListaPresenca.EfResultado%>" selected="selected"><%=objListaPresenca.EfResultado%></option>
                                    <option value="Pendente">Pendente</option>
                                    <option value="Aprovado">Aprovado</option>
                                    <option value="Rejeitado">Rejeitado</option>
                                </select></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td valign="top">
                                <span id="campo" style="display: none;">Motivo:
                                    <textarea name="motivo_lista" class="form-control" cols="60" rows="3" id="motivo" style="color: #000" onkeypress="uppercase();"></textarea>
                                </span>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top" style="text-align: right; padding-right: 5px;">Finalizado?</td>
                            <td valign="top">
                                <label>
                                    <input type="radio" name="finalizada" value="Sim" style="border: none" />
                                    Sim
                                </label>
                                <label>
                                    <input type="radio" name="finalizada" value="Não" style="border: none" checked="checked" />
                                    Não
                                </label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <table width="300" border="0" cellspacing="0" cellpadding="0" align="center">
                        <tr>
                            <td align="center"><a href="javascript:void(0)" onclick="valida();">
                                <label>
                                    <input name="enviar" class="btn btn-primary" type="submit" id="enviar" value="Salvar &amp; Enviar" />
                                </label>
                            </a></td>
                        </tr>
                    </table>
                </form>
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

    <!--[if IE]><script src="/_js/excanvas.compiled.js" type="text/javascript"></script><![endif]-->

    <script type="text/javascript">
        function show() {   
            if(document.getElementById('resultado').value == "Rejeitado") {   
                document.getElementById('campo').style.display = '';   
            } else {   
			    document.getElementById('campo').style.display = 'none';
            }   
        }  
    </script>
</body>
</html>

<%
    Set objListaPresenca = Nothing		
%>