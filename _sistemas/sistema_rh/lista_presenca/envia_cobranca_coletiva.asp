<%@  language="VBSCRIPT" codepage="65001" %>
<%  
    On Error Resume Next

	response.Charset = "utf-8" 
	response.ContentType = "text/html" 
%>

<%
    Dim vLog, vDtLimite
    vLog = Request("log")
    vDtLimite = Request("dt_limite")
%>

<!--#include virtual="/_funcoes/csRH.asp"-->
<%
    Dim objListaPresenca

    If vLog <> "1" Then
        Set objListaPresenca = new clsListaPresenca

        'Consulta listas não finalizadas
        Dim arrEmails
        arrEmails = objListaPresenca.fArrayEmailListasNaoFinalizadasII(vDtLimite)

        ' - arrEmails(?, 0) - NM_SOLICITANTE
        ' - arrEmails(?, 1) - NR_LISTA
        ' - arrEmails(?, 2) - TITULO_EVENTO
        ' - arrEmails(?, 3) - EMAIL

    End If
%>

<!--#include virtual="/_funcoes/csEmail.asp"-->
<%
    If vLog <> "1" Then
        Response.Buffer = true

        Dim objEmail

        'envio para todos os e-mails da lista
        Dim i, j
        For i = 0 to UBound(arrEmails, 1)
                If arrEmails(i, 3) <> "" Then
                    Set objEmail = new clsEmail

                    objEmail.pFrom = "naoresponder@hesap.org.br"

                    'Carrega email do solicitante
                    objEmail.pBCC = arrEmails(i, 3) ' - EMAIL
	
                    numLista    = Split(arrEmails(i, 1), ",") ' - NR_LISTA
                    titulo      = Split(arrEmails(i, 2), ",") ' - TITULO_EVENTO
                    solicitante = Split(arrEmails(i, 0), ",") ' - NM_SOLICITANTE
	        
                    'Define o título do e-mail
                    objEmail.pTitulo = "Notificação RH – Lista(s) de Presença Atrasada(s)"

                    'Agora vamos construir o corpo do e-mail a partir dos dados sob a form
                    MyBody = "<p>Sistemas Interno HESAP - Lista de Presença</p>"
                    MyBody = MyBody & "<p>O prazo para devolução da(s) lista(s) de presença abaixo está vencido. Favor verificar e encaminhar ao RH – Treinamento.</p>"

                    MyBody = MyBody & "<table style='font-size: 12px; width:100%;' border='1' cellspacing='1'>"
                        MyBody = MyBody & "<thead>"
                            MyBody = MyBody & "<tr>"
                                MyBody = MyBody & "<th>Nº</th>"
                                MyBody = MyBody & "<th>TÍTULO EVENTO</th>"
                                MyBody = MyBody & "<th>SOLICITANTE</th>"
                            MyBody = MyBody & "</tr>"
                        MyBody = MyBody & "</thead>"
                        MyBody = MyBody & "<tbody>"
                
                    For j = 0 to UBound(numLista)
                            MyBody = MyBody & "<tr>"
                                MyBody = MyBody & "<td>"
                                    MyBody = MyBody & "<a href='"&fGetUrlPage(EnumURL_ParcialUrl)&"impressao_lista.asp?lista="&numLista(j)&"'>"
                                        MyBody = MyBody & numLista(j)
                                    MyBody = MyBody & "</a>"
                                MyBody = MyBody & "</td>"
                                MyBody = MyBody & "<td>"&Replace(titulo(j),"¬",",")&"</td>"
                                MyBody = MyBody & "<td>"&solicitante(j)&"</td>"
                            MyBody = MyBody & "</tr>"
                    Next'j - Lista

                        MyBody = MyBody & "</tbody>"
                    MyBody = MyBody & "</table>"

	                'Carrega o corpo do e-mail
                    objEmail.pCorpo = MyBody
	                   
                    If Instr(lcase(objEmail.pBCC), "@hesap.org.br") > 0 Then
                        'Envia o e-mail
                        objEmail.fEnviaEmail()
                    End If

                    Set objEmail = Nothing

                    'Atualiza 'ENVIO_NOTIFICACAO_RH' com a data atual
                    objListaPresenca.fGravaEnvioNotificacaoRhII arrEmails(i, 1) ' - NR_LISTA

                    Response.Clear()
                    Response.Write "Enviando e-mail para: " & arrEmails(i, 3) & "<br/>"
                    Response.Flush
                End If

                Sleep(0.6)
        Next 'i - Linha
		
        Set objEmail = Nothing
    End If

    Set objListaPresenca = Nothing
%>

<% If vLog <> "1" Then %>
<script type="text/javascript">
    window.location = 'envia_cobranca_coletiva.asp?log=1';
</script>
<%      Response.End
   End If 
%>


<!DOCTYPE html>
<html lang="pt-br" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="cache-control" content="no-cache"/>

    <title>SISTEMA RH - LISTA DE PRESENÇA</title>

    <!-- Bootstrap core CSS -->
    <link href="/_css/bootstrap.min.css" rel="stylesheet" media="screen"/>

    <link href="/_css/font-awesome.css" rel="stylesheet"/>

    <link href="/_css/style.css" rel="stylesheet"/>

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

    <link type="text/css" rel="stylesheet" href="/_css/_sistemas/sistema_rh/lista_presenca.css"/>
</head>
<body class="colunas">

    <div id="tudo">
        <header>
            <div style="position: absolute; width: 130px; height: 70px; background-color: #fff; padding-top: 15px; padding-left: 10px;">
                <img src="/_images/_sistemas/sistema_rh/lista_presenca/logo1.jpg" width="110" height="40" border="0"/>
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
                                <img src="/_images/_sistemas/sistema_rh/lista_presenca/email.jpg" width="112" height="146"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- Fim do menu esquerdo -->
            </div>
        </aside>
        <section>
            <div id="conteudo">
                <br />
                <br />
                <br />
                <p align="center" style="font-size: 18px">O e-mail de cobran&ccedil;a  foi enviado com sucesso ao(s) solicitante(s) da lista. </p>
                <br />
                <!-- Fim do conteúdo central da página -->
            </div>
            <!-- Aqui diz que o conteúdo acima está finalizado , ou seja, esta linha finaliza o a divisão de conteúdo que foi usado pelo menu flutuante esquerdo-->
            <br class="finaliza_conteudo"/>
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

    <!--[if IE]><script src="/_js/excanvas.compiled.js" type="text/javascript"></script><![endif]-->
</body>
</html>
