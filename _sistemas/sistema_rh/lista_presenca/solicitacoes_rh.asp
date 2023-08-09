<%@  language="VBSCRIPT" codepage="65001" %>
<%  
	response.Charset = "utf-8" 
	response.ContentType = "text/html" 
%>

<!--#include virtual="/_funcoes/csRH.asp"-->
<%
    Dim objListaPresenca
    Set objListaPresenca = new clsListaPresenca

    Dim tmpMeiaHora
    tmpMeiaHora = objListaPresenca.fListaTempoMeiaHora()

    Dim vNrLista

    vNrLista = Request("nr_lista_ref")

    If vNrLista <> "" Then
        'Consulta lista de presença de referência
        objListaPresenca.fRetornaListaPresenca vNrLista
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

    <link href="/_css/style.css" rel="stylesheet" />

    <link href="/_css/plugins/select2/select2.min.css" rel="stylesheet" />

    <link href="/_css/plugins/datapicker/datepicker3.css" rel="stylesheet" />

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
                                <img src="/_images/_sistemas/sistema_rh/lista_presenca/funny.jpg" width="112" height="146" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- Fim do menu esquerdo -->
            </div>
        </aside>
        <section>
            <div id="conteudo">
                <img src="/_images/_sistemas/sistema_rh/lista_presenca/frase_solicitacao.jpg" width="294" height="37" />
                <form name="tipo_avaliacao" method="post" action="solicitacao_completa_rh.asp" onsubmit="return validar();	">
                    <input name="plano_acao" type="hidden" value="" />
                    <table width="100%" border="0" cellspacing="1" cellpadding="1" style="font-size: 12px;" class="formulario">
                        <tbody>
                            <tr>
                                <td width="25%" style="text-align: right; padding-right: 5px;">Tipo de avaliação:</td>
                                <td colspan="2">
                                    <select name="avaliacao" class="form-control" style="width: 430px;" onchange="ajuda(); desbilita_campos();" <%=iif(vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista),"readonly=readonly","")%>>
                                        <option value="">SELECIONE O TIPO DO EVENTO</option>
                                        <option value="AULA / CURSO">AULA / CURSO</option>
                                        <option value="CURSOS / EVENTOS EXTERNOS">CURSOS / EVENTOS EXTERNOS</option>
                                        <option value="INTEGRAÇÃO DE NOVOS COLABORADORES">INTEGRAÇÃO DE NOVOS COLABORADORES</option>
                                        <option value="ORIENTAÇÃO CORRETIVA">ORIENTAÇÃO CORRETIVA</option>
                                        <option value="ORIENTAÇÃO PREVENTIVA">ORIENTAÇÃO PREVENTIVA</option>
                                        <option value="PALESTRA / SIMPÓSIO / JORNADA">PALESTRA / SIMPÓSIO / JORNADA</option>
                                        <option value="REUNIÃO">REUNIÃO</option>
                                        <option value="TREINAMENTO PARA APRIMORAMENTO">TREINAMENTO PARA APRIMORAMENTO</option>
                                        <option value="TREINAMENTO PARA CAPACITAÇÃO">TREINAMENTO PARA CAPACITAÇÃO (NOVA TECNOLOGIA / METODOLOGIA)</option>
                                        <option value="CONTINUAÇÃO DO TREINAMENTO" <%=iif(vNrLista<>"","selected='selected'","")%>>CONTINUAÇÃO DO TREINAMENTO</option>
                                        <option value="OUTROS">OUTROS</option>
                                    </select>
                                </td>
                            </tr>
                            <tr id="tr_nr_lista" style="<%=iif(vNrLista<>"","","display: none;")%>">
                                <td style="text-align: right; padding-right: 5px;">Nº da Lista:</td>
                                <td colspan="2">
                                    <input type="text" name="nr_lista_ref" id="nr_lista_ref" class="form-control" style="width: 75px; float: left;" size="9" value="<%=vNrLista%>" <%=iif(vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista),"readonly='readonly'","")%> />
                                    <%If (vNrLista<>"" And objListaPresenca.NrLista="") Or vNrLista="" Then%>&nbsp;<input type="image" src="/_images/icon_save.png" border="0" style="border: 0px;" /><%End If%>
                                    <%If vNrLista<>"" And objListaPresenca.NrLista="" Then%>&nbsp;&nbsp;&nbsp;<span style="color: #ff0000;">Lista não encontrada!</span><%End If%>
                                </td>
                            </tr>
                            <tr class="dados_lista">
                                <td style="text-align: right; padding-right: 5px;">Solicitante:</td>
                                <td colspan="2">
                                    <select id="nome_solicitante" name="nome_solicitante" class="form-control" style="width: 430px;">
                                        <option value=""></option>
                                        <%
                                            Response.Write objListaPresenca.fListaUsuario()
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr class="dados_lista">
                                <td valign="top" style="text-align: right; padding-right: 5px;">Título de evento:</td>
                                <td colspan="2">
                                    <input type="text" name="titulo_evento" class="form-control" style="width: 430px;" size="75" maxlength="100" onkeypress="uppercase()" value="<%=iif(vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista),"(LISTA "&objListaPresenca.NrLista&") "&objListaPresenca.TituloEvento,"")%>" <%=iif(vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista),"readonly='readonly'","")%>/>
                                    <!--<span>*limite de 60 caracteres para o titulo da lista</span>-->
                                </td>
                            </tr>
                            <tr class="dados_lista">
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
                            <tr class="dados_lista">
                                <td style="text-align: right; padding-right: 5px;">Área do responsável do evento:</td>
                                <td width="52%">
                                    <select id="setor" name="setor" class="form-control" style="width: 430px;" <%=iif(vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista),"readonly='readonly'","")%>>
                                        <% If vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista) Then %>
                                            <option value="<%=objListaPresenca.AreaRespEvento%>" selected="selected"><%=objListaPresenca.AreaRespEvento%></option>
                                        <% Else %>
                                            <option value=""></option>
                                        <% End If %>
                                        <%
                                            Response.Write objListaPresenca.fListaCentroCusto()
                                        %>
                                    </select></td>
                                <td width="28%">&nbsp;</td>
                            </tr>
                            <tr class="dados_lista">
                                <td style="text-align: right; padding-right: 5px;">Duração do Evento:</td>
                                <td>
                                    <select name="dias" id="dias" class="form-control" style="width: 74px;" onchange="dias_treinamento();" class="drop">
                                        <option value="1">1 Dia</option>
                                        <option value="2">2 Dias</option>
                                        <option value="3">3 Dias</option>
                                        <option value="4">4 Dias</option>
                                        <option value="5">5 Dias</option>
                                        <option value="6">6 Dias</option>
                                    </select></td>
                            </tr>
                            <tr class="dados_lista">
                                <td style="text-align: right; padding-right: 5px;">Enfermagem?</td>
                                <td>
                                    <label style="font-weight: 500;">
                                        <input type="radio" name="setor_enfermagem" value="Sim" style="border: none" <%=iif(vNrLista<>"" And objListaPresenca.SetorEnfermagem="Sim","checked='checked'","")%> <%=iif(vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista),"readonly='readonly'","")%>/>
                                        Sim
                                    </label>
                                    <label style="font-weight: 500;">
                                        <input type="radio" name="setor_enfermagem" value="Nao" style="border: none" <%=iif(vNrLista<>"" And objListaPresenca.SetorEnfermagem="Nao","checked='checked'","")%> <%=iif(vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista),"readonly='readonly'","")%>/>
                                        Não
                                    </label>
                                </td>
                            </tr>
                            <tr class="dados_lista">
                                <td colspan="3" align="center" style="color: #09C; padding-bottom: 0px; padding-top: 15px;">Caso a duração do evento seja superior a  um dia, pedimos que escolha datas no mesmo mês </td>
                            </tr>
                            <tr class="dados_lista">
                                <td colspan="3" align="center">
                                    <hr style="border-color: #3291af" />
                                </td>
                            </tr>
                            <tr id="dt_inicio1" class="dados_lista">
                                <td style="text-align: center;"><strong>1º Dia</strong></td>
                                <td colspan="2">
                                    <span style="padding-left: 2px; float: left; margin-right: 4px;">Data:</span>
                                    <a href="javascript:void(0)" class="input-data">
                                        <input type="text" name="data_evento" id="data_evento" size="9" maxlength="10" class="form-control" style="float: left; width: 75px;" />
                                        <img src="/_images/icon_calendar.png" alt="" name="popcal" border="0" align="middle" id="popcal" />
                                    </a>

                                    <span>Início:</span>
                                    <select name="hr_inicial" style="width: 70px;">
                                        <option value=""></option>
                                        <%
                                            Response.Write tmpMeiaHora
                                        %>
                                    </select>

                                    <span>Término:</span>
                                    <select name="hr_final" onblur="soma();">
                                        <option value=""></option>
                                        <%
                                            Response.Write tmpMeiaHora
                                        %>
                                    </select>

                                    <span style="padding-left: 15px;">Carga Horária:</span>
                                    <input type="text" name="carga_horaria" size="4" maxlength="5" value="" readonly="readonly" style="width: 40px;" />

                                    <br />

                                    <span style="float: left; margin-right: 4px; margin-top: 5px;">Local:</span>
                                    <select name="local_evento" class="form-control" style="float: left; width: 332px; margin-top: 5px;">
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

                                    <span style="padding-left: 4px; margin-top: 5px;">Qtde de Pessoas:</span>
                                    <input type="text" size="3" maxlength="3" name="qtd_participante" style="width: 40px; margin-top: 5px;" />
                                </td>
                            </tr>
                            <tr id="linha2" style="display: none;" class="dados_lista_dia">
                                <td colspan="3" align="center">
                                    <hr style="border-color: #3291af" />
                                </td>
                            </tr>
                            <tr id="dt_inicio2" style="display: none" class="dados_lista_dia">
                                <td style="text-align: center;"><strong>2º Dia</strong></td>
                                <td colspan="2">
                                    <span style="padding-left: 2px; float: left; margin-right: 4px;">Data:</span>
                                    <a href="javascript:void(0)" class="input-data">
                                        <input type="text" name="data_evento2" id="data_evento2" size="9" maxlength="10" class="form-control" style="float: left; width: 75px;" />
                                        <img src="/_images/icon_calendar.png" alt="" name="popcal" border="0" align="middle" id="popcal" />
                                    </a>

                                    <span>Início:</span>
                                    <select name="hr_inicial2" id="hr_inicial2" style="width: 70px;">
                                        <option value=""></option>
                                        <%
                                            Response.Write tmpMeiaHora
                                        %>
                                    </select>

                                    <span>Término:</span>
                                    <select name="hr_final2" id="hr_final2" onblur="soma2();">
                                        <option value=""></option>
                                        <%
                                            Response.Write tmpMeiaHora
                                        %>
                                    </select>

                                    <span style="padding-left: 15px;">Carga Horária:</span>
                                    <input type="text" name="carga_horaria2" size="4" maxlength="5" value="" readonly="readonly" style="width: 40px;" />

                                    <br />

                                    <span style="float: left; margin-right: 4px; margin-top: 5px;">Local:</span>
                                    <select name="local_evento2" id="local_evento2" class="form-control" style="float: left; width: 332px; margin-top: 5px;">
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

                                    <span style="padding-left: 4px; margin-top: 5px;">Qtde de Pessoas:</span>
                                    <input type="text" size="3" maxlength="3" name="qtd_participante2" style="width: 40px; margin-top: 5px;" />
                                </td>
                            </tr>
                            <tr id="linha3" style="display: none;" class="dados_lista_dia">
                                <td colspan="3" align="center">
                                    <hr style="border-color: #3291af" />
                                </td>
                            </tr>
                            <tr id="dt_inicio3" style="display: none" class="dados_lista_dia">
                                <td style="text-align: center;"><strong>3º Dia</strong></td>
                                <td colspan="2">
                                    <span style="padding-left: 2px; float: left; margin-right: 4px;">Data:</span>
                                    <a href="javascript:void(0)" class="input-data">
                                        <input type="text" name="data_evento3" id="data_evento3" size="9" maxlength="10" class="form-control" style="float: left; width: 75px;" />
                                        <img src="/_images/icon_calendar.png" alt="" name="popcal" border="0" align="middle" id="popcal" />
                                    </a>

                                    <span>Início:</span>
                                    <select name="hr_inicial3" id="hr_inicial3" style="width: 70px;">
                                        <option value=""></option>
                                        <%
                                            Response.Write tmpMeiaHora
                                        %>
                                    </select>

                                    <span>Término:</span>
                                    <select name="hr_final3" id="hr_final3" onblur="soma3();">
                                        <option value=""></option>
                                        <%
                                            Response.Write tmpMeiaHora
                                        %>
                                    </select>

                                    <span style="padding-left: 15px;">Carga Horária:</span>
                                    <input name="carga_horaria3" type="text" id="carga_horaria3" value="" size="4" maxlength="5" readonly="readonly" style="width: 40px;" />

                                    <br />

                                    <span style="float: left; margin-right: 4px; margin-top: 5px;">Local:</span>
                                    <select name="local_evento3" id="local_evento3" class="form-control" style="float: left; width: 332px; margin-top: 5px;">
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

                                    <span style="padding-left: 4px; margin-top: 5px;">Qtde de Pessoas:</span>
                                    <input name="qtd_participante3" type="text" id="qtd_participante3" size="3" maxlength="3" style="width: 40px; margin-top: 5px;" />
                                </td>
                            </tr>
                            <tr id="linha4" style="display: none;" class="dados_lista_dia">
                                <td colspan="3" align="center">
                                    <hr style="border-color: #3291af" />
                                </td>
                            </tr>
                            <tr id="dt_inicio4" style="display: none" class="dados_lista_dia">
                                <td style="text-align: center;"><strong>4º Dia</strong></td>
                                <td colspan="2">
                                    <span style="padding-left: 2px; float: left; margin-right: 4px;">Data:</span>
                                    <a href="javascript:void(0)" class="input-data">
                                        <input type="text" name="data_evento4" id="data_evento4" size="9" maxlength="10" class="form-control" style="float: left; width: 75px;" />
                                        <img src="/_images/icon_calendar.png" alt="" name="popcal" border="0" align="middle" id="popcal" />
                                    </a>

                                    <span>Inicio:</span>
                                    <select name="hr_inicial4" id="hr_inicial4" style="width: 70px;">
                                        <option value=""></option>
                                        <%
                                            Response.Write tmpMeiaHora
                                        %>
                                    </select>

                                    <span>Término:</span>
                                    <select name="hr_final4" id="hr_final4" onblur="soma4();">
                                        <option value=""></option>
                                        <%
                                            Response.Write tmpMeiaHora
                                        %>
                                    </select>

                                    <span style="padding-left: 15px;">Carga Horária:</span>
                                    <input name="carga_horaria4" type="text" id="carga_horaria4" value="" size="4" maxlength="5" readonly="readonly" style="width: 40px;" />
                                    <br />

                                    <span style="float: left; margin-right: 4px; margin-top: 5px;">Local:</span>
                                    <select name="local_evento4" id="select4" class="form-control" style="float: left; width: 332px; margin-top: 5px;">
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

                                    <span style="padding-left: 4px; margin-top: 5px;">Qtde de Pessoas:</span>
                                    <input name="qtd_participante4" type="text" id="qtd_participante4" size="3" maxlength="3" style="width: 40px; margin-top: 5px;" /></td>
                            </tr>
                            <tr id="linha5" style="display: none;" class="dados_lista_dia">
                                <td colspan="3" align="center">
                                    <hr style="border-color: #3291af" />
                                </td>
                            </tr>
                            <tr id="dt_inicio5" style="display: none" class="dados_lista_dia">
                                <td style="text-align: center;"><strong>5º Dia</strong></td>
                                <td colspan="2">
                                    <span style="padding-left: 2px; float: left; margin-right: 4px;">Data:</span>
                                    <a href="javascript:void(0)" class="input-data">
                                        <input type="text" name="data_evento5" id="data_evento5" size="9" maxlength="10" class="form-control" style="float: left; width: 75px;" />
                                        <img src="/_images/icon_calendar.png" alt="" name="popcal" border="0" align="middle" id="popcal" />
                                    </a>

                                    <span>Inicio:</span>
                                    <select name="hr_inicial5" id="hr_inicial5" style="width: 70px;">
                                        <option value=""></option>
                                        <%
                                                Response.Write tmpMeiaHora
                                        %>
                                    </select>

                                    <span>Término:</span>
                                    <select name="hr_final5" id="hr_final5" onblur="soma5();">
                                        <option value=""></option>
                                        <%
                                                Response.Write tmpMeiaHora
                                        %>
                                    </select>

                                    <span style="padding-left: 15px;">Carga Horária:</span>
                                    <input name="carga_horaria5" type="text" id="carga_horaria5" value="" size="4" maxlength="5" readonly="readonly" style="width: 40px;" />
                                    <br />

                                    <span style="float: left; margin-right: 4px; margin-top: 5px;">Local:</span>
                                    <select name="local_evento5" id="select7" class="form-control" style="float: left; width: 332px; margin-top: 5px;">
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

                                    <span style="padding-left: 4px; margin-top: 5px;">Qtde de Pessoas:</span>
                                    <input name="qtd_participante5" type="text" id="qtd_participante5" size="3" maxlength="3" style="width: 40px; margin-top: 5px;" />
                                </td>
                            </tr>
                            <tr id="linha6" style="display: none;" class="dados_lista_dia">
                                <td colspan="3" align="center">
                                    <hr style="border-color: #3291af" />
                                </td>
                            </tr>
                            <tr id="dt_inicio6" style="display: none" class="dados_lista_dia">
                                <td style="text-align: center;"><strong>6º Dia</strong></td>
                                <td colspan="2">
                                    <span style="padding-left: 2px; float: left; margin-right: 4px;">Data:</span>
                                    <a href="javascript:void(0)" class="input-data">
                                        <input type="text" name="data_evento6" id="data_evento6" size="9" maxlength="10" class="form-control" style="float: left; width: 75px;" />
                                        <img src="/_images/icon_calendar.png" alt="" name="popcal" border="0" align="middle" id="popcal" />
                                    </a>

                                    <span>Inicio:</span>
                                    <select name="hr_inicial6" id="hr_inicial6" style="width: 70px;">
                                        <option value=""></option>
                                        <%
                                                Response.Write tmpMeiaHora
                                        %>
                                    </select>

                                    <span>Término:</span>
                                    <select name="hr_final6" id="hr_final6" onblur="soma6();">
                                        <option value=""></option>
                                        <%
                                                Response.Write tmpMeiaHora
                                        %>
                                    </select>

                                    <span style="padding-left: 15px;">Carga Horária:</span>
                                    <input name="carga_horaria6" type="text" id="carga_horaria6" value="" size="4" maxlength="5" readonly="readonly" style="width: 40px;" />
                                    <br />

                                    <span style="float: left; margin-right: 4px; margin-top: 5px;">Local:</span>
                                    <select name="local_evento6" id="select7" class="form-control" style="float: left; width: 332px; margin-top: 5px;">
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

                                    <span style="padding-left: 4px; margin-top: 5px;">Qtde de Pessoas:</span>
                                    <input name="qtd_participante6" type="text" id="qtd_participante6" size="3" maxlength="3" style="width: 40px; margin-top: 5px;" />
                                </td>
                            </tr>
                            <tr class="dados_lista">
                                <td colspan="3" align="center">
                                    <hr style="border-color: #3291af" />
                                </td>
                            </tr>
                            <tr class="dados_lista">
                                <td style="text-align: right; padding-right: 5px;">Tempo médio de desenvolvimento individual:</td>
                                <td colspan="2">
                                    <input type="text" size="5" maxlength="5" name="tempo_medio" class="form-control" style="width: 50px; float: left;" />
                                    &nbsp;(Informe o tempo médio de treinamento por colaborador no formato 00:00 (hora : minutos))
                                </td>
                            </tr>
                            <tr class="dados_lista">
                                <td style="text-align: right; padding-right: 5px; padding-top: 5px;">Ministrante(s):</td>
                                <td colspan="2" style="padding-top: 5px;">
                                    <input type="text" name="nome_ministrante" id="nome_ministrante" size="75" class="form-control" style="width: 430px;" onkeypress="uppercase()" />
                                </td>
                            </tr>
                            <tr class="dados_lista">
                                <td valign="top" style="text-align: right; padding-right: 5px; padding-top: 5px;">Demanda*:</td>
                                <td align="left" valign="top" style="height: 35px; padding-top: 5px;">
                                    <textarea name="objetivo" cols="80" rows="8" class="form-control" style="width: 430px; overflow: auto" onkeypress="uppercase()" <%=iif(vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista),"disabled='disabled'","")%>></textarea>
                                </td>
                                <td align="left" valign="top" style="height: 35px;">
                                    <img src="/_images/_sistemas/sistema_rh/lista_presenca/msg1.jpg" width="142" height="111" />
                                </td>
                            </tr>
                            <tr class="dados_lista">
                                <td valign="top" style="text-align: right; padding-right: 5px; padding-top: 5px;">Resultados esperados*:</td>
                                <td align="left" valign="top" style="height: 35px; padding-top: 5px;">
                                    <textarea name="impacto" cols="80" rows="8" class="form-control" style="width: 430px; overflow: auto" onkeypress="uppercase()" <%=iif(vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista),"disabled='disabled'","")%>></textarea>
                                </td>
                                <td align="left" valign="top" style="height: 35px;">
                                    <img src="/_images/_sistemas/sistema_rh/lista_presenca/msg2.jpg" width="168" height="122" />
                                </td>
                            </tr>
                            <tr class="dados_lista">
                                <td valign="top" style="text-align: right; padding-right: 5px; padding-top: 5px;">Como identificará o resultado esperado? <span style="font-size: 9px">(Especifique)</span></td>
                                <td align="left" valign="top" style="padding-top: 5px;">
                                    <span style="height: 35px;">
                                        <textarea name="como" cols="80" rows="10" class="form-control" style="width: 430px; overflow: auto" onkeypress="uppercase()" <%=iif(vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista),"disabled='disabled'","")%>></textarea>
                                    </span>
                                </td>
                                <td align="left" valign="top">
                                    <span style="height: 35px;">
                                        <img src="/_images/_sistemas/sistema_rh/lista_presenca/msg3.jpg" width="151" height="117" />
                                    </span>
                                </td>
                            </tr>
                            <tr class="dados_lista">
                                <td valign="top" style="text-align: right; padding-right: 5px;">Quem realizará a avaliação de eficácia?</td>
                                <td colspan="2"><span style="height: 35px;">
                                    <input name="validar_treinamento" type="text" class="form-control" style="width: 430px;" onkeypress="uppercase()" size="80" <%=iif(vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista),"disabled='disabled'","")%> />
                                </span></td>
                            </tr>
                            <tr class="dados_lista">
                                <td style="text-align: right; padding-right: 5px;">Prazo para avaliação de eficácia:</td>
                                <td colspan="2">
                                    <a href="javascript:void(0)" class="input-data">
                                        <input type="text" name="prazo_eficacia" class="form-control" style="width: 75px; float: left;" size="9" <%=iif(vNrLista<>"" And CStr(objListaPresenca.NrLista)=CStr(vNrLista),"disabled='disabled'","")%>/>

                                        <img src="/_images/icon_calendar.png" alt="" name="popcal" border="0" align="middle" id="popcal" />
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                    <p class="dados_lista" align="right" style="font-size: 9px">* Tópicos devem ser separados por vírgula.</p>
                    <table width="30%" border="0" cellspacing="0" cellpadding="0" align="center" class="formulario dados_lista" style="font-size: 11px">
                        <tbody>
                            <tr>
                                <td align="center" width="50%">
                                    <a href="solicitacoes_rh.asp">
                                        <img src="/_images/icon_cancel.png" border="0" />
                                        <br />
                                        Cancelar
                                    </a>
                                </td>
                                <td align="center">
                                    <input type="image" src="/_images/icon_save.png" border="0" style="border: 0px;" />
                                    <br />
                                    Salvar
                                </td>
                            </tr>
                        </tbody>
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
                        ©Copyright  2011 - 2017  HESAP | Todos os direitos reservados</span>
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

    <!-- Select2 -->
    <script src="/_js/plugins/select2/select2.full.min.js"></script>

    <!-- DatePicker -->
    <script src="/_js/plugins/datapicker/bootstrap-datepicker.js"></script>

    <!--[if IE]><script src="/_js/excanvas.compiled.js" type="text/javascript"></script><![endif]-->

    <script type="text/javascript" src="/_js/uppercase.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#nome_solicitante, #setor").select2({
                "language": {
                    "noResults": function () {
                        return "Nenhum resultado encontrado";
                    }
                }
            });

            $("#setor").select2({
                placeholder: "SELECIONE A ÁREA",
                "language": {
                    "noResults": function () {
                        return "Nenhum resultado encontrado";
                    }
                }
            });

            $('.input-data input').datepicker({
                format: "dd/mm/yyyy",
                language: "pt-BR",
                startView: 0,
                autoclose: true,
                clearBtn: true
            });

            $('.input-data').click(function () {
                $(this).find('input').datepicker('show');
            });

            <% If vNrLista<>"" And objListaPresenca.NrLista="" Then %>
                $(".dados_lista").hide();
            <% End If %>
        });

        function soma() {
            if (document.tipo_avaliacao.hr_inicial.value > document.tipo_avaliacao.hr_final.value) {
                alert("Hora inicial não pode ser maior que o Término do evento");
                document.tipo_avaliacao.hr_inicial.focus();
                return false;

            } else {

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

        //por Bruna em 23/04/2014, para a soma dos 2º evento
        function soma2() {
            if (document.tipo_avaliacao.hr_inicial2.value > document.tipo_avaliacao.hr_final2.value) {
                alert("Hora inicial não pode ser maior que o Término do evento");
                document.tipo_avaliacao.hr_inicial2.focus();
                return false;
            } else {

                var entradaHora = (parseFloat(document.tipo_avaliacao.hr_inicial2.value.substr(0, 2)));
                var entradaMinuto = (parseFloat(document.tipo_avaliacao.hr_inicial2.value.substr(3, 4)));
                var saidaHora = (parseFloat(document.tipo_avaliacao.hr_final2.value.substr(0, 2)));
                var saidaMinuto = (parseInt(document.tipo_avaliacao.hr_final2.value.substr(3, 4)));

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

                document.tipo_avaliacao.carga_horaria2.value = resultadoHoras + ":" + resultadoMinutos
            }
        }
        //////fim soma do 2º evento

        function soma3() {
            if (document.tipo_avaliacao.hr_inicial3.value > document.tipo_avaliacao.hr_final3.value) {
                alert("Hora inicial não pode ser maior que o Término do evento");
                document.tipo_avaliacao.hr_inicial3.focus();
                return false;
            } else {

                var entradaHora = (parseFloat(document.tipo_avaliacao.hr_inicial3.value.substr(0, 2)));
                var entradaMinuto = (parseFloat(document.tipo_avaliacao.hr_inicial3.value.substr(3, 4)));
                var saidaHora = (parseFloat(document.tipo_avaliacao.hr_final3.value.substr(0, 2)));
                var saidaMinuto = (parseInt(document.tipo_avaliacao.hr_final3.value.substr(3, 4)));

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

                document.tipo_avaliacao.carga_horaria3.value = resultadoHoras + ":" + resultadoMinutos
            }
        }

        function soma4() {
            if (document.tipo_avaliacao.hr_inicial4.value > document.tipo_avaliacao.hr_final4.value) {
                alert("Hora inicial não pode ser maior que o Término do evento");
                document.tipo_avaliacao.hr_inicial4.focus();
                return false;
            } else {

                var entradaHora = (parseFloat(document.tipo_avaliacao.hr_inicial4.value.substr(0, 2)));
                var entradaMinuto = (parseFloat(document.tipo_avaliacao.hr_inicial4.value.substr(3, 4)));
                var saidaHora = (parseFloat(document.tipo_avaliacao.hr_final4.value.substr(0, 2)));
                var saidaMinuto = (parseInt(document.tipo_avaliacao.hr_final4.value.substr(3, 4)));

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

                document.tipo_avaliacao.carga_horaria4.value = resultadoHoras + ":" + resultadoMinutos
            }
        }

        function soma5() {
            if (document.tipo_avaliacao.hr_inicial5.value > document.tipo_avaliacao.hr_final5.value) {
                alert("Hora inicial não pode ser maior que o Término do evento");
                document.tipo_avaliacao.hr_inicial5.focus();
                return false;
            } else {

                var entradaHora = (parseFloat(document.tipo_avaliacao.hr_inicial5.value.substr(0, 2)));
                var entradaMinuto = (parseFloat(document.tipo_avaliacao.hr_inicial5.value.substr(3, 4)));
                var saidaHora = (parseFloat(document.tipo_avaliacao.hr_final5.value.substr(0, 2)));
                var saidaMinuto = (parseInt(document.tipo_avaliacao.hr_final5.value.substr(3, 4)));

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

                document.tipo_avaliacao.carga_horaria5.value = resultadoHoras + ":" + resultadoMinutos
            }
        }

        function soma6() {
            if (document.tipo_avaliacao.hr_inicial6.value > document.tipo_avaliacao.hr_final6.value) {
                alert("Hora inicial não pode ser maior que o Término do evento");
                document.tipo_avaliacao.hr_inicial6.focus();
                return false;
            } else {

                var entradaHora = (parseFloat(document.tipo_avaliacao.hr_inicial6.value.substr(0, 2)));
                var entradaMinuto = (parseFloat(document.tipo_avaliacao.hr_inicial6.value.substr(3, 4)));
                var saidaHora = (parseFloat(document.tipo_avaliacao.hr_final6.value.substr(0, 2)));
                var saidaMinuto = (parseInt(document.tipo_avaliacao.hr_final6.value.substr(3, 4)));

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

                document.tipo_avaliacao.carga_horaria6.value = resultadoHoras + ":" + resultadoMinutos
            }
        }

        function validar() {
            //<!--VALIDAR O TIPO DE AVALIAÇÃO-->
            if (document.tipo_avaliacao.avaliacao.value == "") {
                document.tipo_avaliacao.avaliacao.style.backgroundColor = "#FC9389";
                document.tipo_avaliacao.avaliacao.focus();
                alert("Selecione o Tipo de avaliação.");
                return false;
            } else {
                document.tipo_avaliacao.avaliacao.style.backgroundColor = "#FFF";
            }

            //<!--VALIDAR O Nº DA LISTA-->
            if (document.tipo_avaliacao.avaliacao.value == "CONTINUAÇÃO DO TREINAMENTO") {
                if (document.tipo_avaliacao.nr_lista_ref.value == "") {
                    document.tipo_avaliacao.nr_lista_ref.style.backgroundColor = "#FC9389";
                    document.tipo_avaliacao.nr_lista_ref.focus();
                    alert("Informe o Nº da Lista do Treinamento");
                    return false;
                }
                <%If (vNrLista<>"" And objListaPresenca.NrLista="") Or vNrLista="" Then%>
                else
                {
                    window.location.href = "solicitacoes_rh.asp?nr_lista_ref=" + document.tipo_avaliacao.nr_lista_ref.value;
                    return false;
                }
                <%End If%>

                
            } else {
                document.tipo_avaliacao.nr_lista_ref.style.backgroundColor = "#FFF";
            }

            //<!--VALIDAR O NOME DO SOLICITANTE-->
            if (document.tipo_avaliacao.nome_solicitante.value == "") {
                //document.tipo_avaliacao.nome_solicitante.style.backgroundColor = "#FC9389";
                //document.tipo_avaliacao.nome_solicitante.focus();
                $("#select2-nome_solicitante-container").css("background-color", "#FC9389");
                $('#nome_solicitante').next().find('.select2-selection').focus();
                alert("Selecione o Nome do Solicitante.");
                return false;
            } else {
                //document.tipo_avaliacao.nome_solicitante.style.backgroundColor = "#FFF";
                $("#select2-nome_solicitante-container").css("background-color", "#FFF");
            }

            //<!--VALIDAR O TITULO DO EVENTO-->
            if (document.tipo_avaliacao.titulo_evento.value == "") {
                document.tipo_avaliacao.titulo_evento.style.backgroundColor = "#FC9389";
                document.tipo_avaliacao.titulo_evento.focus();
                alert("Digite o Título do Evento.");
                return false;
            } else {
                document.tipo_avaliacao.titulo_evento.style.backgroundColor = "#FFF";
            }

            //<!--VALIDAR TIPO DE TREINAMENTO-->
            if (document.tipo_avaliacao.tp_treinamento[0].checked == false && document.tipo_avaliacao.tp_treinamento[1].checked == false) {
                document.tipo_avaliacao.tp_treinamento[0].style.backgroundColor = "#F33";
                document.tipo_avaliacao.tp_treinamento[1].style.backgroundColor = "#F33";
                document.tipo_avaliacao.tp_treinamento[0].focus();
                alert("Selecione o tipo de treinamento.");
                return false;
            } else {
                document.tipo_avaliacao.tp_treinamento[0].style.backgroundColor = "#FFF";
                document.tipo_avaliacao.tp_treinamento[1].style.backgroundColor = "#FFF";
            }

            //<!--VALIDAR O AREA RESPONSAVEL PELO EVENTO-->
            if (document.tipo_avaliacao.setor.value == "") {
                //document.tipo_avaliacao.setor.style.backgroundColor = "#FC9389";
                //document.tipo_avaliacao.setor.focus();
                $("#select2-setor-container").css("background-color", "#FC9389");
                $('#setor').next().find('.select2-selection').focus();
                alert("Selecione a área responsável do evento.");
                return false;
            } else {
                //document.tipo_avaliacao.setor.style.backgroundColor = "#FFF";
                $("#select2-setor-container").css("background-color", "#FFF");
            }

            //<!--VALIDAR ENFERMAGEM-->
            if (document.tipo_avaliacao.setor_enfermagem[0].checked == false && document.tipo_avaliacao.setor_enfermagem[1].checked == false) {
                document.tipo_avaliacao.setor_enfermagem[0].style.backgroundColor = "#F33";
                document.tipo_avaliacao.setor_enfermagem[1].style.backgroundColor = "#F33";
                document.tipo_avaliacao.setor_enfermagem[0].focus();
                alert("Selecione o campo Enfermagem.");
                return false;
            } else {
                document.tipo_avaliacao.setor_enfermagem[0].style.backgroundColor = "#FFF";
                document.tipo_avaliacao.setor_enfermagem[1].style.backgroundColor = "#FFF";
            }

            //<!--VALIDAR A DATA DO EVENTO-->
            if (document.tipo_avaliacao.data_evento.value == "") {
                document.tipo_avaliacao.data_evento.style.backgroundColor = "#FC9389";
                document.tipo_avaliacao.data_evento.focus();
                alert("Selecione a data do evento.");
                return false;
            } else {
                document.tipo_avaliacao.data_evento.style.backgroundColor = "#FFF";
            }


            //<!--VALIDAR O TEMPO PREVISTO-->
            if (document.tipo_avaliacao.hr_inicial.value == "" && document.tipo_avaliacao.hr_inicial.value == "") {
                document.tipo_avaliacao.hr_inicial.style.backgroundColor = "#F33";
                document.tipo_avaliacao.hr_final.style.backgroundColor = "#F33";
                document.tipo_avaliacao.hr_inicial.focus();
                alert("Se o evento não for o dia inteiro, selecione o horário do início e término do evento.");
                return false;

            } else {
                document.tipo_avaliacao.hr_inicial.style.backgroundColor = "#FFF";
                document.tipo_avaliacao.hr_final.style.backgroundColor = "#FFF";
            }

            //<!--VALIDAR O LOCAL DO EVENTO-->
            if (document.tipo_avaliacao.local_evento.value == "") {
                document.tipo_avaliacao.local_evento.style.backgroundColor = "#FC9389";
                document.tipo_avaliacao.local_evento.focus();
                alert("Selecione o local do evento.");
                return false;
            } else {
                document.tipo_avaliacao.local_evento.style.backgroundColor = "#FFF";
            }

            //<!--VALIDAR QUANTIDADE DE PARTICIPANTES  -->
            if (document.tipo_avaliacao.qtd_participante.value == "") {
                document.tipo_avaliacao.qtd_participante.style.backgroundColor = "#FC9389";
                document.tipo_avaliacao.qtd_participante.focus();
                alert("Digite a quantidade estimada de participantes");
                return false;
            } else {
                document.tipo_avaliacao.qtd_participante.style.backgroundColor = "#FFF";
            }

            //<!--VALIDAR O MINISTRANTE-->
            if (document.tipo_avaliacao.nome_ministrante.value == "") {
                document.tipo_avaliacao.nome_ministrante.style.backgroundColor = "#FC9389";
                document.tipo_avaliacao.nome_ministrante.focus();

                alert("Digite o nome do Ministrante.");
                return false;
            } else {
                document.tipo_avaliacao.nome_ministrante.style.backgroundColor = "#FFF";
            }

            if (document.tipo_avaliacao.avaliacao.value != "REUNIÃO" && document.tipo_avaliacao.avaliacao.value != "PALESTRA / SIMPÓSIO / JORNADA" && document.tipo_avaliacao.avaliacao.value != "CONTINUAÇÃO DO TREINAMENTO") {

                //<!--VALIDAR O OBEJTIVO-->
                if (document.tipo_avaliacao.objetivo.value == "") {
                    document.tipo_avaliacao.objetivo.style.backgroundColor = "#FC9389";
                    document.tipo_avaliacao.objetivo.focus();
                    alert("Digite qual é a Demanda.");
                    return false;
                } else {
                    document.tipo_avaliacao.objetivo.style.backgroundColor = "#FFF";
                }

                //<!--VALIDAR O RESULTADO ESPERADO - IMPACTO-- >
                if (document.tipo_avaliacao.impacto.value == "") {
                    document.tipo_avaliacao.impacto.style.backgroundColor = "#FC9389";
                    document.tipo_avaliacao.impacto.focus();
                    alert("Digite qual será o resultado esperado (impacto).");
                    return false;
                } else {
                    document.tipo_avaliacao.impacto.style.backgroundColor = "#FFF";
                }

                //<!--VALIDAR como será a validação -->
                if (document.tipo_avaliacao.como.value == "") {
                    document.tipo_avaliacao.como.style.backgroundColor = "#FC9389";
                    document.tipo_avaliacao.como.focus();
                    alert("Digite como será feita a validação.");
                    return false;
                } else {
                    document.tipo_avaliacao.como.style.backgroundColor = "#FFF";
                }

                //<!--VALIDAR QUEM IRÁ VALIDAR O TREINAMENTO -->
                if (document.tipo_avaliacao.validar_treinamento.value == "") {
                    document.tipo_avaliacao.validar_treinamento.style.backgroundColor = "#FC9389";
                    document.tipo_avaliacao.validar_treinamento.focus();
                    alert("Digite quem validará o treinamento.");
                    return false;
                } else {
                    document.tipo_avaliacao.validar_treinamento.style.backgroundColor = "#FFF";
                }

                //<!--VALIDAR PRAZO DE EFICÁCIA -->
                if (document.tipo_avaliacao.prazo_eficacia.value == "") {
                    document.tipo_avaliacao.prazo_eficacia.style.backgroundColor = "#FC9389";
                    document.tipo_avaliacao.prazo_eficacia.focus();
                    alert("Informe uma data para o prazo de eficácia.");
                    return false;
                } else {
                    var parts = document.tipo_avaliacao.data_evento.value.split('/');
                    var dtEvento = new Date(parts[2], parts[1] - 1, parts[0]);

                    parts = document.tipo_avaliacao.prazo_eficacia.value.split('/');
                    var dtEficacia = new Date(parts[2], parts[1] - 1, parts[0]);

                    if (dtEficacia < dtEvento) {
                        document.tipo_avaliacao.prazo_eficacia.style.backgroundColor = "#FC9389";
                        document.tipo_avaliacao.prazo_eficacia.focus();
                        alert("A data do prazo de eficácia deve ser maior que a data do evento");
                        return false;
                    } else {
                        document.tipo_avaliacao.prazo_eficacia.style.backgroundColor = "#FFF";
                    }
                }
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
                alert("Você escolheu Treinamento para Aprimoramento.\n\nDefinição:\n\Aperfeiçoamento de conhecimentos e métodos para a melhoria contínua do colaborador e da instituição.")
            }
        }

        function desbilita_campos() {
            if (document.tipo_avaliacao.avaliacao.value == "PALESTRA / SIMPÓSIO / JORNADA" || document.tipo_avaliacao.avaliacao.value == "REUNIÃO" || document.tipo_avaliacao.avaliacao.value == "CONTINUAÇÃO DO TREINAMENTO") {

                //document.tipo_avaliacao.conteudo_programatico.disabled=true;
                document.tipo_avaliacao.objetivo.disabled = true;
                document.tipo_avaliacao.impacto.disabled = true;
                document.tipo_avaliacao.validar_treinamento.disabled = true;
                document.tipo_avaliacao.como.disabled = true;
                document.tipo_avaliacao.prazo_eficacia.disabled = true;


                //document.tipo_avaliacao.conteudo_programatico.style.backgroundColor="#CCC";
                document.tipo_avaliacao.objetivo.style.backgroundColor = "#CCC";
                document.tipo_avaliacao.impacto.style.backgroundColor = "#CCC";
                document.tipo_avaliacao.validar_treinamento.style.backgroundColor = "#CCC";
                document.tipo_avaliacao.como.style.backgroundColor = "#CCC";
                document.tipo_avaliacao.prazo_eficacia.style.backgroundColor = "#CCC";

                //Por Bruna em 14/05/2014: coloca vazio no campo
                document.tipo_avaliacao.objetivo.value = "";
                document.tipo_avaliacao.impacto.value = "";
                document.tipo_avaliacao.validar_treinamento.value = "";
                document.tipo_avaliacao.como.value = "";
                document.tipo_avaliacao.prazo_eficacia.value = "";


            } else {

                //document.tipo_avaliacao.conteudo_programatico.disabled=false;
                document.tipo_avaliacao.objetivo.disabled = false;
                document.tipo_avaliacao.impacto.disabled = false;
                document.tipo_avaliacao.validar_treinamento.disabled = false;
                document.tipo_avaliacao.como.disabled = false;
                document.tipo_avaliacao.prazo_eficacia.disabled = false;


                //document.tipo_avaliacao.conteudo_programatico.style.backgroundColor="#FFF";
                document.tipo_avaliacao.objetivo.style.backgroundColor = "#FFF";
                document.tipo_avaliacao.impacto.style.backgroundColor = "#FFF";
                document.tipo_avaliacao.validar_treinamento.style.backgroundColor = "#FFF";
                document.tipo_avaliacao.como.style.backgroundColor = "#FFF";
                document.tipo_avaliacao.prazo_eficacia.style.backgroundColor = "#FFF";
            }

            if (document.tipo_avaliacao.avaliacao.value == "CONTINUAÇÃO DO TREINAMENTO") {
                document.getElementById('tr_nr_lista').style.display = '';
                document.tipo_avaliacao.nr_lista_ref.focus();
                $(".dados_lista").hide();
                $(".dados_lista_dia").hide();
            }
            else {
                document.getElementById('tr_nr_lista').style.display = 'none';
                $(".dados_lista").show();
            }
        }

        function dias_treinamento() {
            if (document.tipo_avaliacao.dias.value == "1") {
                document.getElementById('dt_inicio1').style.display = '';

                document.getElementById('linha2').style.display = 'none';
                document.getElementById('dt_inicio2').style.display = 'none';

                document.getElementById('linha3').style.display = 'none';
                document.getElementById('dt_inicio3').style.display = 'none';

                document.getElementById('linha4').style.display = 'none';
                document.getElementById('dt_inicio4').style.display = 'none';

                document.getElementById('linha5').style.display = 'none';
                document.getElementById('dt_inicio5').style.display = 'none';

                document.getElementById('linha6').style.display = 'none';
                document.getElementById('dt_inicio6').style.display = 'none';
            }

            if (document.tipo_avaliacao.dias.value == "2") {
                document.getElementById('dt_inicio1').style.display = '';

                document.getElementById('linha2').style.display = '';
                document.getElementById('dt_inicio2').style.display = '';

                document.getElementById('linha3').style.display = 'none';
                document.getElementById('dt_inicio3').style.display = 'none';

                document.getElementById('linha4').style.display = 'none';
                document.getElementById('dt_inicio4').style.display = 'none';

                document.getElementById('linha5').style.display = 'none';
                document.getElementById('dt_inicio5').style.display = 'none';

                document.getElementById('linha6').style.display = 'none';
                document.getElementById('dt_inicio6').style.display = 'none';
            }

            if (document.tipo_avaliacao.dias.value == "3") {
                document.getElementById('dt_inicio1').style.display = '';

                document.getElementById('linha2').style.display = '';
                document.getElementById('dt_inicio2').style.display = '';

                document.getElementById('linha3').style.display = '';
                document.getElementById('dt_inicio3').style.display = '';

                document.getElementById('linha4').style.display = 'none';
                document.getElementById('dt_inicio4').style.display = 'none';

                document.getElementById('linha5').style.display = 'none';
                document.getElementById('dt_inicio5').style.display = 'none';

                document.getElementById('linha6').style.display = 'none';
                document.getElementById('dt_inicio6').style.display = 'none';
            }

            if (document.tipo_avaliacao.dias.value == "4") {
                document.getElementById('dt_inicio1').style.display = '';

                document.getElementById('linha2').style.display = '';
                document.getElementById('dt_inicio2').style.display = '';

                document.getElementById('linha3').style.display = '';
                document.getElementById('dt_inicio3').style.display = '';

                document.getElementById('linha4').style.display = '';
                document.getElementById('dt_inicio4').style.display = '';

                document.getElementById('linha5').style.display = 'none';
                document.getElementById('dt_inicio5').style.display = 'none';

                document.getElementById('linha6').style.display = 'none';
                document.getElementById('dt_inicio6').style.display = 'none';
            }

            if (document.tipo_avaliacao.dias.value == "5") {
                document.getElementById('dt_inicio1').style.display = '';

                document.getElementById('linha2').style.display = '';
                document.getElementById('dt_inicio2').style.display = '';

                document.getElementById('linha3').style.display = '';
                document.getElementById('dt_inicio3').style.display = '';

                document.getElementById('linha4').style.display = '';
                document.getElementById('dt_inicio4').style.display = '';

                document.getElementById('linha5').style.display = '';
                document.getElementById('dt_inicio5').style.display = '';

                document.getElementById('linha6').style.display = 'none';
                document.getElementById('dt_inicio6').style.display = 'none';
            }

            if (document.tipo_avaliacao.dias.value == "6") {
                document.getElementById('dt_inicio1').style.display = '';

                document.getElementById('linha2').style.display = '';
                document.getElementById('dt_inicio2').style.display = '';

                document.getElementById('linha3').style.display = '';
                document.getElementById('dt_inicio3').style.display = '';

                document.getElementById('linha4').style.display = '';
                document.getElementById('dt_inicio4').style.display = '';

                document.getElementById('linha5').style.display = '';
                document.getElementById('dt_inicio5').style.display = '';

                document.getElementById('linha6').style.display = '';
                document.getElementById('dt_inicio6').style.display = '';
            }

        }
    </script>
</body>
</html>

<%
    Set objListaPresenca = Nothing		
%>