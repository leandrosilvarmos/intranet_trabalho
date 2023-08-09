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
                                <img src="/_images/_sistemas/sistema_rh/lista_presenca/correcao_av_eficacia.jpg" width="112" height="146" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- Fim do menu esquerdo -->
            </div>
        </aside>
        <section>

            <div id="conteudo">
                <form name="tipo_avaliacao" method="post" action="update_eficacia.asp">
                    <img src="/_images/_sistemas/sistema_rh/lista_presenca/frase_resumo.jpg" width="199" height="37" />
                    <table width="100%" border="0" cellspacing="1" cellpadding="1" style="font-size: 12px;" class="formulario">
                        <tr>
                            <td colspan="5" align="center">
                                <hr style="border-color: #3291af" />
                            </td>
                        </tr>
                        <tr>
                            <td width="15%" style="text-align: right; padding-right: 5px;">Tipo de avaliação:</td>
                            <td width="30%">
                                <span style="height: 35px;">
                                    <input name="avaliacao" type="text" id="avaliacao" class="form-control" value="<%=objListaPresenca.TpAvaliacao%>" size="40" maxlength="40" readonly="readonly" />
                                </span>
                            </td>
                            <td width="15%" style="text-align: right; padding-right: 5px;">Nome do solicitante:</td>
                            <td width="35%">
                                <input name="nome_solicitante" type="text" id="nome_solicitante" class="form-control" value="<%=objListaPresenca.NmSolicitante%>" size="40" maxlength="40" readonly="readonly" />
                            </td>
                            <td rowspan="13"></td>
                        </tr>
                        <tr>
                            <td align="left">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Título de evento:</td>
                            <td>
                                <input name="titulo_evento" type="text" id="titulo_evento" class="form-control" value="<%=objListaPresenca.TituloEvento%>" size="40" maxlength="40" readonly="readonly" />
                            </td>
                            <td style="text-align: right; padding-right: 5px;">Área do responsável:</td>
                            <td>
                                <input type="text" class="form-control" readonly="readonly" value="<%=objListaPresenca.AreaRespEvento%>" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Ministrante(s):</td>
                            <td>
                                <input type="text" class="form-control" readonly="readonly" value="<%=objListaPresenca.NmMinistrante%>" /></td>
                            <td style="text-align: right; padding-right: 5px;">Data do evento:</td>
                            <td>
                                <input type="text" class="form-control" readonly="readonly" value="<%=objListaPresenca.DtEvento%>" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Data Limite para Av Eficácia:</td>
                            <td colspan="3" align="left" valign="top">
                                <textarea class="form-control" readonly="readonly"><%=objListaPresenca.PrazoAvaliacao%></textarea></td>
                        </tr>
                        <tr>
                            <td align="left" valign="top">&nbsp;</td>
                            <td colspan="3" align="left" valign="top">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Demanda:</td>
                            <td colspan="3" align="left" valign="top"><span style="height: 35px;">
                                <textarea class="form-control" readonly="readonly"><%=objListaPresenca.Objetivo%></textarea></span></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Resultados esperados:</td>
                            <td colspan="3" align="left" valign="top"><span style="height: 35px;">
                                <textarea class="form-control" readonly="readonly"><%=objListaPresenca.Impacto%></textarea></span></td>
                        </tr>
                        <tr>
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="left" valign="top">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Como identificou o resultado esperado? </td>
                            <td colspan="3" align="left" valign="top"><span style="height: 35px;">
                                <textarea class="form-control" readonly="readonly"><%=objListaPresenca.ValidarTreinamentoComo%></textarea></span></td>
                        </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="1" cellpadding="1" style="font-size: 12px;" class="formulario">
                        <tr>
                            <td colspan="3" align="center" style="color: #99CC00">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <hr style="border-color: #3291af" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <img src="/_images/_sistemas/sistema_rh/lista_presenca/frase_av_eficacia.jpg" width="216" height="37" /><br />
                                Preencha os dados abaixo e clique em 'Salvar & enviar para RH'</td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center" style="color: #99CC00">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center" valign="middle" style="color: #FF0000">
                                <img src="/_images/_sistemas/sistema_rh/lista_presenca/icon_pdf.png" width="20" height="20" /><a href="Default.aspx" target="_blank" onclick="window.open(this.href,'galeria','width=600,height=300'); return false;" title="Galeria de fotos" id="galeria">Clique aqui para enviar arquivo PDF</a><img src="/_images/_sistemas/sistema_rh/lista_presenca/icon_pdf.png" width="20" height="20" /></td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center" style="color: #99CC00">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="30%" style="text-align: right; padding-right: 5px;">Número da lista: </td>
                            <td>
                                <input name="numero_lista" type="text" id="numero_lista" class="form-control" style="width: 64px;" value="<%=objListaPresenca.NrLista%>" size="10" maxlength="10" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Treinamento Eficaz: </td>
                            <td><span style="height: 35px;">
                                <% If objListaPresenca.EfTreinamentoEficaz = "Sim" Then %>
                                <label style="font-weight: 500;">
                                    <input type="radio" name="treinamento_eficaz" value="Sim" style="border: none" checked="checked" />
                                    Sim</label>
                                <label style="font-weight: 500;">
                                    <input type="radio" name="treinamento_eficaz" value="Não" style="border: none" />
                                    Não</label>
                                <% Else %>
                                <label style="font-weight: 500;">
                                    <input type="radio" name="treinamento_eficaz" value="Sim" style="border: none" />
                                    Sim</label>
                                <label style="font-weight: 500;">
                                    <input type="radio" name="treinamento_eficaz" value="Não" style="border: none" checked="checked" />
                                    Não</label>
                                <% End If %>
                            </span></td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 5px;">Nome do avaliador: </td>
                            <td>
                                <input name="nome_avaliador" class="form-control" style="width: 392px;" type="text" size="50" maxlength="50" onkeypress="uppercase()" value="<%=objListaPresenca.EfNomeAvaliador %>" /></td>
                        </tr>
                        <tr>
                            <td valign="top" style="text-align: right; padding-right: 5px; padding-top: 5px;">Como avaliou? Houve o impacto (resultado) esperado?</td>
                            <td style="padding-bottom: 5px; padding-top: 5px;"><span style="height: 35px;">
                                <textarea name="como_avaliou" class="form-control" cols="75" rows="5" style="width: 392px; height: 65px;" onkeypress="uppercase()"><%=objListaPresenca.EfComoAvaliou %></textarea>
                            </span></td>
                        </tr>
                        <tr id="dt_inicio1">
                            <td style="text-align: right; padding-right: 5px;">Data de Validação: </td>
                            <td colspan="2" style="padding-bottom: 5px; padding-top: 5px;"><a href="javascript:void(0)" class="input-data">
                                <input type="text" name="data_validacao" id="data_validacao" class="form-control" style="width: 70px; height: 13px; float: left; margin-right: 5px;" size="9" maxlength="10" value="<%=objListaPresenca.EfDataValidacao %>" readonly="readonly" />
                                <img src="/_images/icon_calendar.png" alt="" name="popcal" border="0" align="middle" id="popcal" /></a>

                                <label>&nbsp;</label></td>
                        </tr>
                        <tr>
                            <td valign="top" style="text-align: right; padding-right: 5px; padding-top: 5px;">Campo complementar: </td>
                            <td colspan="2" style="padding-top: 5px;">
                                <textarea name="campo_complementar" class="form-control" style="width: 392px; height: 130px;" cols="75" rows="10" onkeypress="uppercase()"><%=objListaPresenca.EfCampoComplementar %></textarea></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <table width="300" border="0" cellspacing="0" cellpadding="0" align="center">
                        <tr>
                            <td align="center">
                                <p>
                                    <label>
                                        <input type="submit" name="Submit" class="btn btn-primary" value="Salvar & enviar para RH" />
                                    </label>
                                </p>
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

    <!-- DatePicker -->
    <script src="/_js/plugins/datapicker/bootstrap-datepicker.js"></script>

    <!--[if IE]><script src="/_js/excanvas.compiled.js" type="text/javascript"></script><![endif]-->

    <script type="text/javascript"> 
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
    </script>
</body>
</html>

<%
    Set objListaPresenca = Nothing		
%>