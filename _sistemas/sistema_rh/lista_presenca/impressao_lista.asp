<%@  language="VBSCRIPT" codepage="65001" %>
<%  
	response.Charset = "utf-8" 
	response.ContentType = "text/html" 
%>
<!--#include virtual="/_conexoes/con_ora_intranet.asp" -->

<!--#include virtual="/_funcoes/csRH.asp"-->
<%
    Dim objListaPresenca
    Set objListaPresenca = new clsListaPresenca

    Dim vNrLista, vQtdDias

    vNrLista = Request("lista")

    'Consulta lista de presença
    objListaPresenca.fRetornaListaPresenca vNrLista

    'Consulta a quantidade de dias
    vQtdDias = objListaPresenca.fRetornaQtdDiasListaPresenca(vNrLista)

    If objListaPresenca.Resultado <> "Aprovado"  and objListaPresenca.Resultado <> "Pendente" Then
        Response.End
    end if
    
    
     
    
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
            border-collapse: collapse;
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

        .style3 {
            font-size: 14px
        }

        .style4 {
            font-size: 12px
        }

        .quebrapagina {
            page-break-before: always;
        }

        #tbLista > tbody > tr:last-child td {
            border-bottom: solid 1px #000;
        }
    </style>
</head>
<body onload="start()">
    <%
        Dim i, j
        For i = 1 To cInt(vQtdDias)
            objListaPresenca.fRetornaDiaListaPresenca vNrLista, i
    %>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td width="5%">
                    <img src="/_images/logo_65x48.png" /></td>
                <td width="95%" valign="top">
                    <p align="center" style="font-family: Verdana, Geneva, sans-serif; font-size: 12px; color: #333"><strong>LISTA DE PRESENÇA</strong> - <strong><%=objListaPresenca.TituloEvento%></strong></p>
                </td>
            </tr>
        </tbody>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td width="20%"><span class="style4">Tipo do Evento:</span></td>
                <td colspan="2"><span class="style4"><strong><%=objListaPresenca.TpAvaliacao%></strong></span></td>
            </tr>
            <tr>
                <td width="12%"><span class="style4">Área Resp.:</span></td>
                <td colspan="2"><span class="style4"><strong><%=objListaPresenca.AreaRespEvento%></strong></span></td>
            </tr>
            <tr>
                <td width="12%"><span class="style4">Data:</span></td>
                <td width="18%"><span class="style4"><strong><%=objListaPresenca.LstData%></strong></span></td>
                <td width="70%"><span class="style4">Data Avaliação de Eficácia:&nbsp;<strong><%=objListaPresenca.LstPrazoAvaliacao%></strong></span></td>
            </tr>
        </tbody>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td width="40%"><span class="style4">Local:&nbsp;<strong><%=objListaPresenca.LstLocalEvento%></strong></span></td>
                <td width="30%"><span class="style4">Qtde de participantes:&nbsp;<strong><%=objListaPresenca.LstQtdParticipantes%></strong></span></td>
                <td width="30%"><span class="style4">Tempo médio individual:&nbsp;<strong><%=objListaPresenca.LstTempoMedioDesInd%></strong></span></td>
            </tr>
            <tr>
                <td><span class="style4">Hora de Início:&nbsp;<strong><%=objListaPresenca.LstHrInicio%></strong></span></td>
                <td><span class="style4">Hora de Término:&nbsp;<strong><%=objListaPresenca.LstHrTermino%></strong></span></td>
                <td><span class="style4">Carga Horária:&nbsp;<strong><%=objListaPresenca.LstHrCargaTotal%></strong></span></td>
            </tr>
        </tbody>
    </table>
    <table id="tbLista" width="100%" border="0" cellspacing="0" cellpadding="0" class="lista">
        <tbody>
            <tr>
                <td colspan="6" style="border: solid 1px #000;"><span class="style4">Ministrantes (s) <strong><%=objListaPresenca.NmMinistrante%></strong></span></td>
            </tr>
            <tr>
                <td width="2%" style="border-left: solid 1px #000;">&nbsp;Nº&nbsp;</td>
                <td width="7%">&nbsp;DRT</td>
                <td width="40%">&nbsp;NOME</td>
                <td width="17%" class="border_bottom">&nbsp;SETOR</td>
                <td width="20%" class="border_bottom">&nbsp;FUNÇÃO</td>
                <td width="14%" class="border_bottom" style="border-right: solid 1px #000;">&nbsp;ASSINATURA</td>
            </tr>
            <% For j = 1 To 25 %>
            <tr>
                <td style="border-left: solid 1px #000!important;">&nbsp;<%=j%>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td style="border-right: solid 1px #000!important;">&nbsp;</td>
            </tr>
            <% Next %>
        </tbody>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
            <tr>
                <td width="50%">
                    <p>Assinatura(s) Ministrante(s)</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                </td>
                <td width="50%" align="right" valign="bottom">
                    <p style="font-size: 10px">
                        Lista de Presença <%=objListaPresenca.NrLista%>/<%=year(now)%><br />
                        RH - Desenvolvimento
                    </p>
                    <p style="font-size: 10px">&nbsp;      </p>
            </tr>
        </tbody>
    </table>
    <%      If i < cInt(vQtdDias) Then %>
    <div class="quebrapagina"></div>
    <%      End If 
        Next
    %>
    <br />

    <script type="text/javascript">
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