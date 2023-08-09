﻿<%@  language="VBSCRIPT" codepage="65001" %>
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
                                            <td align="center" valign="middle" class="borda_lista"><a href="solicitacoes.asp">Solicitação</a></td>
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
                                <img src="/_images/_sistemas/sistema_rh/lista_presenca/correcao_lista.jpg" width="112" height="146" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- Fim do menu esquerdo -->
            </div>
        </aside>
        <section>

            <div id="conteudo">
                <img src="/_images/_sistemas/sistema_rh/lista_presenca/frase_correcao.jpg" width="235" height="37" />
                <form name="tipo_avaliacao" method="post" action="update_lista.asp">
                    <table width="100%" border="0" cellspacing="2" cellpadding="2" style="font-size: 12px;" class="formulario">
                        <tr>
                            <td width="25%" style="text-align: right; padding: 5px;">Nro da lista:</td>
                            <td style="padding-bottom: 5px; padding-top: 5px;">
                                <input class="form-control" type="hidden" name="numero_lista" value="<%=vNrLista%>" />
                                <input class="form-control" name="numero" type="text" id="numero" value="<%=vNrLista%>" size="10" readonly="readonly" />
                            </td>
                            <td rowspan="7" width="18%"></td>
                        </tr>
                        <tr>
                            <td rowspan="2" valign="top" style="text-align: right; padding-right: 5px; padding-top: 8px;">Tipo de avaliação:</td>
                            <td style="padding-bottom: 5px; padding-top: 5px;">
                                <input class="form-control" name="avaliacao" type="text" value="<%=objListaPresenca.TpAvaliacao%>" size="75" readonly="readonly" />
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-bottom: 5px;">
                                <span style="color: #09C">Caso queira modificar o tipo de avaliação, selecione um item abaixo:</span>
                                <br />
                                <select class="form-control" name="avaliacao_modificada" id="avaliacao_modificada" onchange="ajuda();">
                                    <option value=""></option>
                                    <option value="AULA / CURSO">AULA / CURSO</option>
                                    <option value="CURSOS / EVENTOS EXTERNOS">CURSOS / EVENTOS EXTERNOS</option>
                                    <option value="INTEGRAÇÃO DE NOVOS COLABORADORES">INTEGRAÇÃO DE NOVOS COLABORADORES</option>
                                    <option value="ORIENTAÇÃO CORRETIVA">ORIENTAÇÃO CORRETIVA</option>
                                    <option value="ORIENTAÇÃO PREVENTIVA">ORIENTAÇÃO PREVENTIVA</option>
                                    <option value="PALESTRA / SIMPÓSIO / JORNADA">PALESTRA / SIMPÓSIO / JORNADA</option>
                                    <option value="REUNIÃO">REUNIÃO</option>
                                    <option value="TREINAMENTO PARA APRIMORAMENTO">TREINAMENTO PARA APRIMORAMENTO</option>
                                    <option value="TREINAMENTO PARA CAPACITAÇÃO">TREINAMENTO PARA CAPACITAÇÃO (NOVA TECNOLOGIA / METODOLOGIA)</option>
                                    <option value="OUTROS">OUTROS</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px; padding-bottom: 5px; padding-top: 5px;">Solicitante:</td>
                            <td style="padding-bottom: 5px; padding-top: 5px;">
                                <input class="form-control" name="solicitante" type="text" id="solicitante" value="<%=objListaPresenca.NmSolicitante%>" size="75" readonly="readonly" />
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Título de evento:</td>
                            <td style="padding-bottom: 5px; padding-top: 5px;">
                                <input class="form-control" name="titulo_evento" type="text" onkeypress="uppercase()" value="<%=objListaPresenca.TituloEvento%>" size="75" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Tipo de Treinamento:</td>
                            <td>
                                <label style="font-weight: 500;">
                                    <input type="radio" name="tp_treinamento" value="C" style="border: none" <%=iif(vNrLista<>"" And objListaPresenca.TpTreinamento="C","checked='checked'","")%> <%=iif(vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista),"readonly='readonly'","")%>/>
                                    Comportamental
                                </label>
                                <label style="font-weight: 500;">
                                    <input type="radio" name="tp_treinamento" value="T" style="border: none" <%=iif(vNrLista<>"" And objListaPresenca.TpTreinamento="T","checked='checked'","")%> <%=iif(vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista),"readonly='readonly'","")%>/>
                                    Técnico
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="2" valign="top" style="text-align: right; padding-right: 5px; padding-top: 8px;">Área do responsável do evento:</td>
                            <td style="padding-bottom: 5px; padding-top: 5px;">
                                <input class="form-control" name="area" type="text" id="area" onkeypress="uppercase()" value="<%=objListaPresenca.AreaRespEvento%>" size="75" maxlength="255" readonly="readonly" />
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-bottom: 5px;">
                                <span style="color: #09C">Caso queira modificar a àrea do responsável do evento, selecione um item abaixo:</span>
                                <br />
                                <select class="form-control" name="area_modificada" id="area_modificada">
                                    <option value=""></option>
                                    <%=objListaPresenca.fListaCentroCusto()%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <hr style="border-color: #3291af" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                    <tbody>
                                        <tr>
                                            <td rowspan="3" width="20%" style="text-align: center;"><strong>1º Dia</strong></td>
                                            <td width="5%" style="text-align: right; padding-right: 5px;">Data:</td>
                                            <td width="10%">
                                                <input class="form-control" type="text" name="data_evento" value="<%=objListaPresenca.DtEvento%>" size="8" />
                                            </td>
                                            <td width="6%" style="text-align: right; padding-right: 5px;">Início:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="hr_inicial" value="<%=objListaPresenca.HrInicial%>" size="5" />
                                            </td>
                                            <td width="7%" style="text-align: right; padding-right: 5px;">Término:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="hr_final" value="<%=objListaPresenca.HrTermino%>" size="5" />
                                            </td>
                                            <!--<td width="13%" style="text-align: right; padding-right: 5px;">Carga Horária:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="carga_horaria" value="<%=objListaPresenca.HrCargaTotal%>" size="5" />
                                            </td>-->
                                            <td width="13%" style="text-align: right; padding-right: 5px;">Qtde de pessoas:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="qtd_participante" value="<%=objListaPresenca.QtdParticipantes%>" size="5" />
                                            </td>
                                            <td rowspan="3"></td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2" valign="top" style="text-align: right; padding-right: 5px; padding-top: 3px;">Local:</td>
                                            <td colspan="7">
                                                <input class="form-control" name="local_evento" type="text" value="<%=objListaPresenca.LocalEvento%>" readonly="readonly" size="75" />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td colspan="7" style="padding-top: 5px;">
                                                <span style="color: #09C">Caso queira modificar o local deste evento, selecione um item abaixo:</span>
                                                <br />
                                                <select class="form-control" name="local_modificado" id="local_modificado">
                                                    <option value=""></option>
                                                    <option value="AUDITÓRIO">AUDITÓRIO</option>
                                                    <option value="PRÓPRIO DEPARTAMENTO">PRÓPRIO DEPARTAMENTO</option>
                                                    <option value="SALA DE ENTREVISTA">SALA DE ENTREVISTA</option>
                                                    <option value="SALA DE REUNIAO TERREO">SALA DE REUNIÃO TÉRREO</option>
                                                    <option value="SALA DE REUNIAO PS">SALA DE REUNIÃO PS</option>
                                                    <option value="SALA DE REUNIAO PI">SALA DE REUNIÃO PI</option>
                                                    <option value="SALA DE REUNIAO SESMT">SALA DE REUNIÃO SESMT</option>
                                                    <option value="SALA DE REUNIAO 7 ANDAR">SALA DE REUNIÃO 7º ANDAR</option>
                                                    <option value="SALA DE REUNIAO UL">SALA DE REUNIÃO U.L.</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <hr style="border-color: #3291af" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                    <tbody>
                                        <tr>
                                            <td rowspan="3" width="20%" style="text-align: center;"><strong>2º Dia</strong></td>
                                            <td width="5%" style="text-align: right; padding-right: 5px;">Data:</td>
                                            <td width="10%">
                                                <input class="form-control" type="text" name="data2" value="<%=objListaPresenca.Data2%>" size="8" />
                                            </td>
                                            <td width="6%" style="text-align: right; padding-right: 5px;">Início:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="hr_inicio2" value="<%=objListaPresenca.HrInicio2%>" size="5" />
                                            </td>
                                            <td width="7%" style="text-align: right; padding-right: 5px;">Término:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="hr_termino2" value="<%=objListaPresenca.HrTermino2%>" size="5" />
                                            </td>
                                            <!-- <td width="13%" style="text-align: right; padding-right: 5px;">Carga Horária:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="carga_horaria2" value="<%=objListaPresenca.HrCargaTotal2%>" size="5" />
                                            </td> -->
                                            <td width="13%" style="text-align: right; padding-right: 5px;">Qtde de pessoas:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="qtde_pessoas2" value="<%=objListaPresenca.QtdParticipantes2%>" size="5" />
                                            </td>
                                            <td rowspan="3"></td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2" valign="top" style="text-align: right; padding-right: 5px; padding-top: 3px;">Local:</td>
                                            <td colspan="7">
                                                <input class="form-control" name="local_evento2" type="text" value="<%=objListaPresenca.LocalEvento2%>" readonly="readonly" size="75" />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td colspan="7" style="padding-top: 5px;">
                                                <span style="color: #09C">Caso queira modificar o local deste evento, selecione um item abaixo:</span>
                                                <br />
                                                <select class="form-control" name="local_modificado2" id="local_modificado2">
                                                    <option value=""></option>
                                                    <option value="AUDITÓRIO">AUDITÓRIO</option>
                                                    <option value="PRÓPRIO DEPARTAMENTO">PRÓPRIO DEPARTAMENTO</option>
                                                    <option value="SALA DE ENTREVISTA">SALA DE ENTREVISTA</option>
                                                    <option value="SALA DE REUNIAO TERREO">SALA DE REUNIÃO TÉRREO</option>
                                                    <option value="SALA DE REUNIAO PS">SALA DE REUNIÃO PS</option>
                                                    <option value="SALA DE REUNIAO PI">SALA DE REUNIÃO PI</option>
                                                    <option value="SALA DE REUNIAO SESMT">SALA DE REUNIÃO SESMT</option>
                                                    <option value="SALA DE REUNIAO 7 ANDAR">SALA DE REUNIÃO 7º ANDAR</option>
                                                    <option value="SALA DE REUNIAO UL">SALA DE REUNIÃO U.L.</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <hr style="border-color: #3291af" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                    <tbody>
                                        <tr>
                                            <td rowspan="3" width="20%" style="text-align: center;"><strong>3º Dia</strong></td>
                                            <td width="5%" style="text-align: right; padding-right: 5px;">Data:</td>
                                            <td width="10%">
                                                <input class="form-control" type="text" name="data3" value="<%=objListaPresenca.Data3%>" size="8" />
                                            </td>
                                            <td width="6%" style="text-align: right; padding-right: 5px;">Início:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="hr_inicio3" value="<%=objListaPresenca.HrInicio3%>" size="5" />
                                            </td>
                                            <td width="7%" style="text-align: right; padding-right: 5px;">Término:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="hr_termino3" value="<%=objListaPresenca.HrTermino3%>" size="5" />
                                            </td>
                                            <!-- <td width="13%" style="text-align: right; padding-right: 5px;">Carga Horária:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="carga_horaria3" value="<%=objListaPresenca.HrCargaTotal3%>" size="5" />
                                            </td> -->
                                            <td width="13%" style="text-align: right; padding-right: 5px;">Qtde de pessoas:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="qtde_pessoas3" value="<%=objListaPresenca.QtdParticipantes3%>" size="5" />
                                            </td>
                                            <td rowspan="3"></td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2" valign="top" style="text-align: right; padding-right: 5px; padding-top: 3px;">Local:</td>
                                            <td colspan="7">
                                                <input class="form-control" name="local_evento3" type="text" value="<%=objListaPresenca.LocalEvento3%>" readonly="readonly" size="75" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" style="padding-top: 5px;">
                                                <span style="color: #09C">Caso queira modificar o local deste evento, selecione um item abaixo:</span>
                                                <br />
                                                <select class="form-control" name="local_modificado3" id="local_modificado3">
                                                    <option value=""></option>
                                                    <option value="AUDITÓRIO">AUDITÓRIO</option>
                                                    <option value="PRÓPRIO DEPARTAMENTO">PRÓPRIO DEPARTAMENTO</option>
                                                    <option value="SALA DE ENTREVISTA">SALA DE ENTREVISTA</option>
                                                    <option value="SALA DE REUNIAO TERREO">SALA DE REUNIÃO TÉRREO</option>
                                                    <option value="SALA DE REUNIAO PS">SALA DE REUNIÃO PS</option>
                                                    <option value="SALA DE REUNIAO PI">SALA DE REUNIÃO PI</option>
                                                    <option value="SALA DE REUNIAO SESMT">SALA DE REUNIÃO SESMT</option>
                                                    <option value="SALA DE REUNIAO 7 ANDAR">SALA DE REUNIÃO 7º ANDAR</option>
                                                    <option value="SALA DE REUNIAO UL">SALA DE REUNIÃO U.L.</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <hr style="border-color: #3291af" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                    <tbody>
                                        <tr>
                                            <td rowspan="3" width="20%" style="text-align: center;"><strong>4º Dia</strong></td>
                                            <td width="5%" style="text-align: right; padding-right: 5px;">Data:</td>
                                            <td width="10%">
                                                <input class="form-control" type="text" name="data4" value="<%=objListaPresenca.Data4%>" size="8" />
                                            </td>
                                            <td width="6%" style="text-align: right; padding-right: 5px;">Início:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="hr_inicio4" value="<%=objListaPresenca.HrInicio4%>" size="5" />
                                            </td>
                                            <td width="7%" style="text-align: right; padding-right: 5px;">Término:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="hr_termino4" value="<%=objListaPresenca.HrTermino4%>" size="5" />
                                            </td>
                                            <!-- <td width="13%" style="text-align: right; padding-right: 5px;">Carga Horária:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="carga_horaria4" value="<%=objListaPresenca.HrCargaTotal4%>" size="5" />
                                            </td> -->
                                            <td width="13%" style="text-align: right; padding-right: 5px;">Qtde de pessoas:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="qtde_pessoas4" value="<%=objListaPresenca.QtdParticipantes4%>" size="5" />
                                            </td>
                                            <td rowspan="3"></td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2" valign="top" style="text-align: right; padding-right: 5px; padding-top: 3px;">Local:</td>
                                            <td colspan="7">
                                                <input class="form-control" name="local_evento4" type="text" value="<%=objListaPresenca.LocalEvento4%>" readonly="readonly" size="75" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" style="padding-top: 5px;">
                                                <span style="color: #09C">Caso queira modificar o local deste evento, selecione um item abaixo:</span>
                                                <br />
                                                <select class="form-control" name="local_modificado4" id="local_modificado4">
                                                    <option value=""></option>
                                                    <option value="AUDITÓRIO">AUDITÓRIO</option>
                                                    <option value="PRÓPRIO DEPARTAMENTO">PRÓPRIO DEPARTAMENTO</option>
                                                    <option value="SALA DE ENTREVISTA">SALA DE ENTREVISTA</option>
                                                    <option value="SALA DE REUNIAO TERREO">SALA DE REUNIÃO TÉRREO</option>
                                                    <option value="SALA DE REUNIAO PS">SALA DE REUNIÃO PS</option>
                                                    <option value="SALA DE REUNIAO PI">SALA DE REUNIÃO PI</option>
                                                    <option value="SALA DE REUNIAO SESMT">SALA DE REUNIÃO SESMT</option>
                                                    <option value="SALA DE REUNIAO 7 ANDAR">SALA DE REUNIÃO 7º ANDAR</option>
                                                    <option value="SALA DE REUNIAO UL">SALA DE REUNIÃO U.L.</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <hr style="border-color: #3291af" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                    <tbody>
                                        <tr>
                                            <td rowspan="3" width="20%" style="text-align: center;"><strong>5º Dia</strong></td>
                                            <td width="5%" style="text-align: right; padding-right: 5px;">Data:</td>
                                            <td width="10%">
                                                <input class="form-control" type="text" name="data5" value="<%=objListaPresenca.Data5%>" size="8" />
                                            </td>
                                            <td width="6%" style="text-align: right; padding-right: 5px;">Início:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="hr_inicio5" value="<%=objListaPresenca.HrInicio5%>" size="5" />
                                            </td>
                                            <td width="7%" style="text-align: right; padding-right: 5px;">Término:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="hr_termino5" value="<%=objListaPresenca.HrTermino5%>" size="5" />
                                            </td>
                                            <!-- <td width="13%" style="text-align: right; padding-right: 5px;">Carga Horária:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="carga_horaria5" value="<%=objListaPresenca.HrCargaTotal5%>" size="5" />
                                            </td> -->
                                            <td width="13%" style="text-align: right; padding-right: 5px;">Qtde de pessoas:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="qtde_pessoas5" value="<%=objListaPresenca.QtdParticipantes5%>" size="5" />
                                            </td>
                                            <td rowspan="3"></td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2" valign="top" style="text-align: right; padding-right: 5px; padding-top: 3px;">Local:</td>
                                            <td colspan="7">
                                                <input class="form-control" name="local_evento5" type="text" value="<%=objListaPresenca.LocalEvento5%>" readonly="readonly" size="75" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" style="padding-top: 5px;">
                                                <span style="color: #09C">Caso queira modificar o local deste evento, selecione um item abaixo:</span>
                                                <br />
                                                <select class="form-control" name="local_modificado5" id="local_modificado5">
                                                    <option value=""></option>
                                                    <option value="AUDITÓRIO">AUDITÓRIO</option>
                                                    <option value="PRÓPRIO DEPARTAMENTO">PRÓPRIO DEPARTAMENTO</option>
                                                    <option value="SALA DE ENTREVISTA">SALA DE ENTREVISTA</option>
                                                    <option value="SALA DE REUNIAO TERREO">SALA DE REUNIÃO TÉRREO</option>
                                                    <option value="SALA DE REUNIAO PS">SALA DE REUNIÃO PS</option>
                                                    <option value="SALA DE REUNIAO PI">SALA DE REUNIÃO PI</option>
                                                    <option value="SALA DE REUNIAO SESMT">SALA DE REUNIÃO SESMT</option>
                                                    <option value="SALA DE REUNIAO 7 ANDAR">SALA DE REUNIÃO 7º ANDAR</option>
                                                    <option value="SALA DE REUNIAO UL">SALA DE REUNIÃO U.L.</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <hr style="border-color: #3291af" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                    <tbody>
                                        <tr>
                                            <td rowspan="3" width="20%" style="text-align: center;"><strong>6º Dia</strong></td>
                                            <td width="5%" style="text-align: right; padding-right: 5px;">Data:</td>
                                            <td width="10%">
                                                <input class="form-control" type="text" name="data6" value="<%=objListaPresenca.Data6%>" size="8" />
                                            </td>
                                            <td width="6%" style="text-align: right; padding-right: 5px;">Início:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="hr_inicio6" value="<%=objListaPresenca.HrInicio6%>" size="5" />
                                            </td>
                                            <td width="7%" style="text-align: right; padding-right: 5px;">Término:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="hr_termino6" value="<%=objListaPresenca.HrTermino6%>" size="5" />
                                            </td>
                                            <!-- <td width="13%" style="text-align: right; padding-right: 5px;">Carga Horária:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="carga_horaria6" value="<%=objListaPresenca.HrCargaTotal6%>" size="5" />
                                            </td> -->
                                            <td width="13%" style="text-align: right; padding-right: 5px;">Qtde de pessoas:</td>
                                            <td width="7%">
                                                <input class="form-control" type="text" name="qtde_pessoas6" value="<%=objListaPresenca.QtdParticipantes6%>" size="5" />
                                            </td>
                                            <td rowspan="3"></td>
                                        </tr>
                                        <tr>
                                            <td rowspan="2" valign="top" style="text-align: right; padding-right: 5px; padding-top: 3px;">Local:</td>
                                            <td colspan="7">
                                                <input class="form-control" name="local_evento6" type="text" value="<%=objListaPresenca.LocalEvento6%>" readonly="readonly" size="75" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" style="padding-top: 5px;">
                                                <span style="color: #09C">Caso queira modificar o local deste evento, selecione um item abaixo:</span>
                                                <br />
                                                <select class="form-control" name="local_modificado6" id="local_modificado6">
                                                    <option value=""></option>
                                                    <option value="AUDITÓRIO">AUDITÓRIO</option>
                                                    <option value="PRÓPRIO DEPARTAMENTO">PRÓPRIO DEPARTAMENTO</option>
                                                    <option value="SALA DE ENTREVISTA">SALA DE ENTREVISTA</option>
                                                    <option value="SALA DE REUNIAO TERREO">SALA DE REUNIÃO TÉRREO</option>
                                                    <option value="SALA DE REUNIAO PS">SALA DE REUNIÃO PS</option>
                                                    <option value="SALA DE REUNIAO PI">SALA DE REUNIÃO PI</option>
                                                    <option value="SALA DE REUNIAO SESMT">SALA DE REUNIÃO SESMT</option>
                                                    <option value="SALA DE REUNIAO 7 ANDAR">SALA DE REUNIÃO 7º ANDAR</option>
                                                    <option value="SALA DE REUNIAO UL">SALA DE REUNIÃO U.L.</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <hr style="border-color: #3291af" />
                            </td>
                        </tr>
                        <tr>
                            <td width="25%" style="padding-right: 5px; padding-top: 5px; padding-bottom: 5px; text-align: right;">Tempo médio de desenvolvimento individual:</td>
                            <td style="padding-top: 5px; padding-bottom: 5px;">
                                <input name="tempo_medio" class="form-control" type="text" style="float: left; width: 59px; margin-right: 5px;" value="<%=objListaPresenca.TempoMedioDesInd%>" size="5" maxlength="5" />
                                &nbsp;<span style="color: #09C; float: left;">(Informe o tempo médio de treinamento por colaborador no formato 00:00)</span>
                            </td>
                            <td rowspan="7" width="18%"></td>
                        </tr>
                        <tr>
                            <td style="padding-right: 5px; padding-top: 5px; padding-bottom: 5px; text-align: right;">Ministrante(s):</td>
                            <td style="padding-top: 5px; padding-bottom: 5px;">
                                <input name="nome_ministrante" class="form-control" type="text" id="nome_ministrante" onkeypress="uppercase()" value="<%=objListaPresenca.NmMinistrante%>" size="75" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="padding-right: 5px; padding-top: 5px; padding-bottom: 5px; text-align: right;">Demanda*:</td>
                            <td style="height: 35px; padding-top: 5px; padding-bottom: 5px;">
                                <textarea name="objetivo" class="form-control" cols="80" rows="8" style="overflow: auto" onkeypress="uppercase()">
                                    <%=objListaPresenca.Objetivo%>
                                </textarea>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="padding-right: 5px; padding-top: 5px; padding-bottom: 5px; text-align: right;">Resultados esperados*:</td>
                            <td style="height: 35px; padding-top: 5px; padding-bottom: 5px;">
                                <textarea name="impacto" class="form-control" cols="80" rows="8" style="overflow: auto" onkeypress="uppercase()">
                                    <%=objListaPresenca.Impacto%>
                                </textarea>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="padding-right: 5px; padding-top: 5px; padding-bottom: 5px; text-align: right;">Como identificou o resultado esperado? <span style="font-size: 9px">(Especifique)</span> </td>
                            <td style="padding-top: 5px; padding-bottom: 5px;">
                                <span style="height: 35px;">
                                    <textarea name="como" class="form-control" cols="80" rows="8" style="overflow: auto" onkeypress="uppercase()"><%=objListaPresenca.ValidarTreinamentoComo%></textarea>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="padding-right: 5px; padding-top: 5px; padding-bottom: 5px; text-align: right;">Quem realizará a avaliação de eficácia? </td>
                            <td style="padding-top: 5px; padding-bottom: 5px;">
                                <span style="height: 35px;">
                                    <input class="form-control" type="text" name="validar_treinamento" size="75" value="<%=objListaPresenca.AvaliadoPor%>" />
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 5px; padding-top: 5px; padding-bottom: 5px; text-align: right;">Prazo para avaliação de eficácia:</td>
                            <td style="padding-top: 5px; padding-bottom: 5px;">
                                <input class="form-control" type="text" name="prazo_eficacia" size="9" value="<%=objListaPresenca.PrazoAvaliacao%>" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                        <tr>
                            <td align="center">
                                <label>
                                    <input name="salvar" class="btn btn-primary" type="submit" id="salvar" value="Salvar" />
                                </label>
                            </td>
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
                        © Copyright 2011 - 2017  HESAP | Todos os direitos reservados</span>
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

    <!--[if IE]><script src="/_js/excanvas.compiled.js" type="text/javascript"></script><![endif]-->

    <script type="text/javascript">
        function show() {
            if (document.getElementById('resultado').value == "Rejeitado") {
                document.getElementById('campo').style.display = '';
            }
            else {
                document.getElementById('campo').style.display = 'none';
            }
        }

        function soma() {
            if (document.tipo_avaliacao.hr_inicial.value > document.tipo_avaliacao.hr_final.value) {
                alert("Hora inicial não pode ser maior que o Término do evento");
                document.tipo_avaliacao.hr_inicial.focus();
                return false;
            }
            else {
                var entradaHora = (parseFloat(document.tipo_avaliacao.hr_inicial.value.substr(0, 2)));
                var entradaMinuto = (parseFloat(document.tipo_avaliacao.hr_inicial.value.substr(3, 4)));

                var saidaHora = (parseFloat(document.tipo_avaliacao.hr_final.value.substr(0, 2)));
                var saidaMinuto = (parseInt(document.tipo_avaliacao.hr_final.value.substr(3, 4)));

                //separa os minutos do valor inserido e faz o calculo
                var somaEntrada = (entradaHora * 60)
                var resultadoEntrada = (somaEntrada + entradaMinuto)

                //separa a hora do valor inserido e faz o calculo
                var somaSaida = (saidaHora * 60)
                var resultadoSaida = (somaSaida + saidaMinuto)

                //faz a quantidade em minutos
                var resultadoMin = (resultadoSaida - resultadoEntrada)
                var resultadoMinutos = (resultadoMin % 60)

                if (resultadoMinutos < 10) {
                    resultadoMinutos = "0" + resultadoMinutos;
                }

                //faz a quantidade em HORAS
                var resultadoHoras = (parseInt(resultadoMin / 60));
                if (resultadoHoras < 10) {
                    resultadoHoras = "0" + resultadoHoras;
                }
                document.tipo_avaliacao.carga_horaria.value = resultadoHoras + ":" + resultadoMinutos
            }
        }

        function ajuda() {
            if (document.tipo_avaliacao.avaliacao.value == "AULA / CURSO") {
                alert("Você selecionou Aula / Curso.\n\n Definição:\n\ Processo de ensino aprendizagem, no qual o aluno se dedica a aquisição e /ou aprimoramento de conhecimento.")
            }

            if (document.tipo_avaliacao.avaliacao.value == "ORIENTAÇÃO CORRETIVA") {
                alert("Você selecionou Orientação Corretiva.\n\nDefinição:\n\Esta é a ação tomada nas ocorrências de não-conformidades existentes ou situações indesejáveis de maneira a evitar recorrências.")
            }

            if (document.tipo_avaliacao.avaliacao.value == "ORIENTAÇÃO PREVENTIVA") {
                alert("Você escolheu Orientação Preventiva.\n\nDefinição:\n\Ação tomada para prevenir causas de não-conformidades potenciais ou situações indesejáveis. Normalmente, é aplicada antes das implementações de novos produtos, processos ou sistemas, ou antes de modificações existentes.")
            }

            if (document.tipo_avaliacao.avaliacao.value == "PALESTRA / SIMPÓSIO / JORNADA") {
                alert("Você escolheu Palestra / Simpósio / Jornada.\n\nDefinição:\n\Esta é a ação tomada nas ocorrências de não-conformidades existentes ou situações indesejáveis de maneira a evitar recorrências.")
            }

            if (document.tipo_avaliacao.avaliacao.value == "REUNIÃO") {
                alert("Você escolheu Orientação Reunião.\n\nDefinição:\n\Encontro para discussão de um tema ou realização de uma atividade.")
            }

            if (document.tipo_avaliacao.avaliacao.value == "TREINAMENTO PARA CAPACITAÇÃO") {
                alert("Você escolheu Treinamento para Capacitação.\n\nDefinição:\n\Aquisição de novos conhecimentos para uma determinada situação, na busca de qualidade, desempenho e produtividade.")
            }

            if (document.tipo_avaliacao.avaliacao.value == "TREINAMENTO PARA APRIMORAMENTO") {
                alert("Você escolheu Treinamento para Capacitação.\n\nDefinição:\n\Aperfeiçoamento de conhecimentos e métodos para a melhoria contínua do colaborador e da instituição.")
            }
        }

    </script>
</body>
</html>

<%
    Set objListaPresenca = Nothing		
%>
