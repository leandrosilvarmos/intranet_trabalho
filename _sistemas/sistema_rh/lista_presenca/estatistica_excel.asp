<%@  language="VBSCRIPT" codepage="65001" %>
<%  
	Response.Charset = "utf-8" 

    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    Response.AddHeader "Content-Disposition", "attachment; filename=RelatorioListaPresenca.xls"
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

    If vTpRelatorio = "LISTA DE PRESENÇA" Then
        estatisticas = objListaPresenca.fListaEstatisticas("1", vTpAvaliacao, vTpTreinamento, vDataInicial, vDataFinal, "S")
    Else
        estatisticas = objListaPresenca.fListaEstatisticas("2", vTpAvaliacao, vTpTreinamento, vDataInicial, vDataFinal, "S")
    End If
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//BR" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>SISTEMA RH - LISTA DE PRESENÇA</title>
    <meta charset="UTF-8">
</head>
<body>
    <table width="100%" border="1" cellspacing="0" cellpadding="0" style="font: Tahoma, Geneva, sans-serif; font-size: 11px;">
        <thead>
            <% If vTpRelatorio = "LISTA DE PRESENÇA" Then %>
            <tr>
                <th width="6%">Nº</th>
                <th width="20%">SOLICITANTE</th>
                <th width="20%">TÍTULO EVENTO</th>
                <th width="20%">TIPO DE TREINAMENTO</th>
                <th width="10%">DATA EVENTO</th>
                <th width="5%">TEMPO</th>
                <th width="10%">ANALISTA</th>
                <th width="5%">STATUS</th>
            </tr>
            <% ElseIf vTpRelatorio = "PRAZO DE AVALIAÇÃO" Then %>
            <tr>
                <th width="6%">Nº</th>
                <th width="20%">SOLICITANTE</th>
                <th width="20%">TÍTULO EVENTO</th>
                <th width="20%">TIPO DE TREINAMENTO</th>
                <th width="10%">DATA EVENTO</th>
                <th width="10%">PRAZO</th>
                <th width="10%">COBRANÇA AV.</th>
                <th width="5%">TEMPO</th>
                <th width="5%">STATUS</th>
                <th width="5%">STATUS AV.</th>
            </tr>
            <% End If %>
        </thead>
        <tbody>
            <%
               Response.Write estatisticas
            %>
        </tbody>
    </table>
    <script>
        window.close();
    </script>
</body>
</html>
