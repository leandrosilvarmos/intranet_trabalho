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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="/_js/html5shiv.min.js"></script>
      <script src="/_js/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
        td {
            height: 25px;
            vertical-align: middle;
        }

        table {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
        }

        .lista td {
            border-bottom: dotted 1px #000;
            border-right: dotted 1px #000;
        }

        textarea.autosize {
            font-size: 11px;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            width: 100%;
            height: 100%;
            overflow: hidden;
            color: #000;
            border: 0;
        }
    </style>
</head>
<body>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td width="5%">
                    <img src="/_images/logo_65x48.png" />
                </td>
                <td width="95%">
                    <p style="font-family: Verdana, Geneva, sans-serif; font-size: 15px; color: #333;" align="center">
                        <strong>Avaliação de Eficácia </strong>- <strong><%=objListaPresenca.TituloEvento%></strong>
                    </p>
                </td>
            </tr>
        </tbody>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td width="20%">Tipo do Evento:</td>
                <td width="89%" colspan="2"><strong><%=objListaPresenca.TpAvaliacao%></strong></td>
            </tr>
            <tr>
                <td width="11%">Área Responsável:</td>
                <td width="89%" colspan="2"><strong><%=objListaPresenca.AreaRespEvento%></strong></td>
            </tr>
            <tr>
                <td width="11%">Data:</td>
                <td width="89%" colspan="2"><strong><%=objListaPresenca.DtEvento%></strong></td>
            </tr>
        </tbody>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td width="30%">Local:&nbsp;<strong><%=objListaPresenca.LocalEvento%></strong></td>
                <td width="30%">Qtde de Participantes:&nbsp;<strong><%=objListaPresenca.QtdParticipantes%></strong></td>
                <td width="40%">Tempo des. individual:&nbsp;<strong><%=objListaPresenca.QtdParticipantes%></strong></td>
            </tr>
            <tr>
                <td>Hora de Início:&nbsp;<strong><%=objListaPresenca.HrInicial%></strong></td>
                <td>Hora de Término:&nbsp;<strong><%=objListaPresenca.HrTermino%></strong></td>
                <td>Carga Horária:&nbsp;<strong><%=objListaPresenca.HrCargaTotal%></strong></td>
            </tr>
        </tbody>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="lista">
        <tbody>
            <tr>
                <td width="100%" style="border-top: dotted 1px #000; border-left: dotted 1px #000;">Ministrante(s):&nbsp;<strong><%=objListaPresenca.NmMinistrante%></strong></td>
            </tr>
        </tbody>
    </table>
    <br />
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="lista" style="font-size: 11px">
        <tbody>
            <tr>
                <td style="border-left: dotted 1px #000; border-top: dotted 1px #000">Objetivo<br />
                    <p style="margin-left: 40px;"><%=objListaPresenca.Objetivo%></p>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="border-left: dotted 1px #000;">Resultados esperados
                    <p style="margin-left: 40px;"><%=objListaPresenca.Impacto%></p>
                    <p style="margin-left: 40px;">&nbsp;</p>
                </td>
            </tr>
            <tr>
                <td style="border-left: dotted 1px #000;">Quem validará o treinamento? (Avaliação de eficácia)<p style="margin-left: 40px;"><%=objListaPresenca.AvaliadoPor%></p>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="border-left: dotted 1px #000;">Como identificou o resultado esperado?
                    <p style="margin-left: 40px;"><%=objListaPresenca.ValidarTreinamentoComo%></p>
                    <br />
                </td>
            </tr>
        </tbody>
    </table>
    <br />
    <% If objListaPresenca.EfNrLista <> "" Then %>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="lista" style="font-size: 11px">
        <tbody>
            <tr>
                <td colspan="2" style="border-left: dotted 1px #000; border-top: dotted 1px #000;">Prazo para Avaliação de Eficácia:&nbsp;<%=objListaPresenca.PrazoAvaliacao%></td>
            </tr>
            <tr>
                <td width="50%" style="border-left: dotted 1px #000;">Treinamento Eficaz:
	                <%=objListaPresenca.EfTreinamentoEficaz%>
                </td>

                <td width="50%" style="border-left: dotted 1px #000;">Nome do Avaliador: 
                    <%=objListaPresenca.EfNomeAvaliador%>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border-left: dotted 1px #000;">Como avaliou?
                <p style="margin-left: 40px;"><%=objListaPresenca.EfComoAvaliou%></p>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border-left: dotted 1px #000;">Data de Validação:&nbsp;<%=objListaPresenca.EfDataValidacao%></td>
            </tr>
            <tr>
                <td colspan="2" style="border-left: dotted 1px #000;">Campo complementar
                    <p style="margin-left: 40px;"><%=objListaPresenca.EfCampoComplementar%></p>
                    <br />
                </td>
            </tr>
        </tbody>
    </table>
    <% Else %>
    <table width="100%" border="0" cellpadding="1" cellspacing="1" class="formulario_off">
        <tr>
            <td>Prazo para Avaliação de Eficácia:&nbsp;<%=objListaPresenca.PrazoAvaliacao%></td>
        </tr>
        <tr>
            <td align="center">
                <h3><font color="#FF0000">A avaliação de eficácia ainda não foi realizada pelo solicitante</font></h3>
            </td>
        </tr>
    </table>
    <% End If %>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td width="50%">
                    <p>
                        Assinatura(s) Avaliador(es):<br />
                    </p>
                    <p>&nbsp;</p>
                    <p>
                        <br />
                        <br />
                        _______________________________________________
                    </p>
                </td>
                <td width="50%" align="right" valign="baseline">
                    <p style="font-size: 10px">&nbsp;</p>
                    <p style="font-size: 10px">&nbsp;</p>
                    <p style="font-size: 10px">
                        Lista de Presença <%=objListaPresenca.NrLista%>/<%=year(now)%><br />
                        RH - Desenvolvimento
                    </p>
                </td>
            </tr>
        </tbody>
    </table>

    <!--[if IE]><script src="/_js/excanvas.compiled.js" type="text/javascript"></script><![endif]-->
    <script language="javascript">
        function start() {
            alert("CASO QUEIRA IMPRIMIR MAIS QUE UMA LISTA, BASTA DIGITAR A QUANTIDADE DE COPIAS NA JANELA DE IMPRESSÃO.");
            window.print();
        }
    </script>
</body>
</html>

<%
    Set objListaPresenca = Nothing		
%>