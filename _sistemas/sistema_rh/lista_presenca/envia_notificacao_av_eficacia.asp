<%@  language="VBSCRIPT" codepage="65001" %>
<%  
    On Error Resume Next
    
	response.Charset = "utf-8" 
	response.ContentType = "text/html" 
%>

<%
    Dim vNrLista, vNmSolicitante
    
    vNrLista           = Request("lista")
    vNmSolicitante     = Request("nome_solicitante")

%>

<!--#include virtual="/_funcoes/csRH.asp"-->
<%
    Dim objListaPresenca
    Set objListaPresenca = new clsListaPresenca

    'Consulta E-Mail do Solicitante
    Dim vEmailSolicitante
	vEmail = objListaPresenca.fRetornaEmailSolicitante(vNmSolicitante)
	
	If vEmail = "" Then
		vEmail = "treinamento@hesap.org.br"
    End If

    'Atualiza campo de envio ENVIO_NOTIFICACAO_RH_AV com a data atual
    objListaPresenca.fGravaEnvioNotificacaoRhAv vNrLista

    Set objListaPresenca = Nothing
%>
	<!--#include virtual="/_funcoes/csEmail.asp"-->
<%
    Dim objEmail

    Set objEmail = new clsEmail

    objEmail.pTipo = "HTML"

    objEmail.pFrom = "naoresponder@hesap.org.br"

	objEmail.pBCC = vEmail
	
	objEmail.pTitulo = "REALIZE A AVALIAÇÃO DE EFICÁCIA - NOTIFICAÇÃO RH"

    MyBody = "<p>Sistemas Interno HESAP - Lista de Presença</p>" & vbcrlf	
	MyBody = MyBody & "<p><span style='color:#ff0000;'>ATENÇÃO: ATENÇÃO: A AVALIAÇÃO DE EFICÁCIA DO TREINAMENTO SOLICITADO DEVERÁ SER REALIZADA NO PRAZO ESTIPULADO NA SOLICITAÇÃO DE DESENVOLVIMENTO.</span></p>" & vbcrlf
	MyBody = MyBody & "<p><span style='color:#ff0000;'>AVALIAÇÕES REALIZADAS FORA DO PRAZO, SERÃO COMUNICADAS À GERÊNCIA RESPONSÁVEL.</span></p>" & vbcrlf
    MyBody = MyBody & "<p>Clique no link para realizar a avaliação de eficácia:</p>" & vbcrlf 
	MyBody = MyBody & "<p>"&fGetUrlPage(EnumURL_ParcialUrl)&"avaliacao_eficacia.asp?lista="&vNrLista&"</p>" & vbcrlf
	
    objEmail.pCorpo = MyBody

    If Instr(lcase(objEmail.pBCC), "@hesap.org.br") > 0 Then
        objEmail.fEnviaEmail()
    End If
	
    Set objEmail = Nothing	
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
                <br />
                <br />
                <br />
                <p align="center" style="font-size: 18px">O e-mail de notificação (cobrança da AVALIAÇÃO DE EFICÁCIA) foi enviado com sucesso ao solicitante da lista.</p>
                <br />
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
