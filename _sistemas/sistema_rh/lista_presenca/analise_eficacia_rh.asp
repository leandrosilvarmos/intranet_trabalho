<%@  language="VBSCRIPT" codepage="65001" %>
<%  
	response.Charset = "utf-8" 
	response.ContentType = "text/html" 
%>

<%
    Dim vNrLista, vNmSolicitante, vTituloEvento, vAvaliacao, vResultadoLista, vAnalistaLista, vMotivoLista, vFinalizada
    
    vNrLista           = Request("numero_lista")
    vNmSolicitante     = Request("nome_solicitante")
    vTituloEvento      = Request("titulo_evento")
    vAvaliacao         = Request("avaliacao")
    vResultadoLista    = Request("resultado_lista")
    vAnalistaLista     = Request("analista_lista")
    vMotivoLista       = Request("motivo_lista")
    vFinalizada        = Request("finalizada")
%>

<!--#include virtual="/_funcoes/csRH.asp"-->
<%
    Dim objListaPresenca
    Set objListaPresenca = new clsListaPresenca

    'Consulta E-Mail do Solicitante
    Dim vEmailSolicitante
	vEmail = objListaPresenca.fRetornaEmailSolicitante(vNmSolicitante)
	
	If vEmail = ""  then
		vEmail = "treinamento@hesap.org.br"
    End If

    objListaPresenca.fAtualizaAnaliseEficacia vNrLista, vAnalistaLista, vResultadoLista, vMotivoLista, vFinalizada

    If vResultadoLista = "Aprovado" Then
        objListaPresenca.fAtualizaStatusAvEficacia vNrLista, "Av Eficacia aprovada pelo RH"
	Else
        objListaPresenca.fAtualizaStatusAvEficacia vNrLista, "Av Eficacia rejeitada pelo RH"
	End If

    Set objListaPresenca = Nothing
%>

<!--#include virtual="/_funcoes/csEmail.asp"-->
<%
    Dim objEmail

    '==================== E-MAIL PARA O SOLICITANTE ====================

    Set objEmail = new clsEmail

    objEmail.pTipo = "TEXT"

    objEmail.pFrom = "naoresponder@hesap.org.br"

	objEmail.pBCC = vEmail
	
	'Envia e-mail somente para listas aprovadas ou reprovadas
	If vResultadoLista = "Aprovado" Then
		objEmail.pTitulo = "AVISO - Avaliação de eficácia APROVADA"

		MyBody = "Sistemas Interno HESAP - Lista de Presença" & vbcrlf & vbcrlf  & vbcrlf	
		MyBody = MyBody & "A avaliação de eficácia foi APROVADA pelo RH." & vbcrlf & vbcrlf
		MyBody = MyBody & "Veja abaixo os detalhes desta lista." & vbcrlf  
		MyBody = MyBody & "Título da Lista: "&vTituloEvento&"" & vbcrlf & vbcrlf & vbcrlf
		MyBody = MyBody & "Tipo de Avaliação: "&vAvaliacao&""	& vbcrlf & vbcrlf
		'MyBody = MyBody & "Pedimos a gentileza de comparecer ao setor de Recursos Humanos para a assinatura da análise de eficácia"	& vbcrlf 
        MyBody = MyBody & vbcrlf
		
        objEmail.pCorpo = MyBody

        objEmail.fEnviaEmail()
	End If
	
	If vResultadoLista = "Rejeitado" Then
		objEmail.pTitulo = "AVISO - Avaliação de eficácia REJEITADA"

		MyBody = "Sistemas Interno HESAP - Lista de Presença "	 & vbcrlf & vbcrlf  & vbcrlf	
		MyBody = MyBody & "Sua avaliação de eficácia foi REJEITADA pelo RH." & vbcrlf & vbcrlf 
		MyBody = MyBody & "Veja abaixo os detalhes da lista. " & vbcrlf
		MyBody = MyBody & "Título da Lista: "&vTituloEvento&""	& vbcrlf & vbcrlf & vbcrlf
		MyBody = MyBody & "Tipo de Avaliação: "&vAvaliacao&""	& vbcrlf & vbcrlf & vbcrlf
		MyBody = MyBody & "Motivo da REJEIÇÃO: "&vMotivoLista&""	& vbcrlf & vbcrlf
		MyBody = MyBody & "O RH está aguardando a alteração desta avaliação de eficácia. Clique no link abaixo para corrigi-la " & vbcrlf
		MyBody = MyBody & fGetUrlPage(EnumURL_ParcialUrl)&"correcao_eficacia.asp?lista="&vNrLista&"" & vbcrlf & vbcrlf 

	    objEmail.pCorpo = MyBody

        objEmail.fEnviaEmail()
	End If	
	
    Set objEmail = Nothing	

    '==================== E-MAIL PARA O RH ====================

    Set objEmail = new clsEmail

    objEmail.pTipo = "TEXT"

    objEmail.pFrom = "naoresponder@hesap.org.br"

	objEmail.pBCC = "treinamento@hesap.org.br"
	
	'Envia e-mail somente para listas aprovadas ou reprovadas
	If vResultadoLista = "Aprovado" Then
		objEmail.pTitulo = "AVISO - Avaliação de eficácia APROVADA RH"

		MyBody = "Sistemas Interno HESAP - Lista de Presença "	 & vbcrlf & vbcrlf  & vbcrlf	
		MyBody = MyBody & "A avaliação de eficácia foi APROVADA pelo RH." & vbcrlf & vbcrlf
		MyBody = MyBody & "Veja abaixo os detalhes desta lista. " & vbcrlf 
		MyBody = MyBody & "Título da Lista: "&vTituloEvento&""	& vbcrlf  
		MyBody = MyBody & "Tipo de Avaliação: "&vAvaliacao&""	& vbcrlf 
		MyBody = MyBody & "Clique no link abaixo para imprimir a avaliação de eficácia " & vbcrlf
		MyBody = MyBody & fGetUrlPage(EnumURL_ParcialUrl)&"impressao_eficacia.asp?lista="&vNrLista&"" & vbcrlf & vbcrlf 

        objEmail.pCorpo = MyBody

        objEmail.fEnviaEmail()
	End If
	
	If vResultadoLista = "Rejeitado" Then
		objEmail.pTitulo = "AVISO - Avaliação de eficácia REJEITADA RH"

		MyBody = "Sistemas Interno HESAP - Lista de Presença"	 & vbcrlf & vbcrlf  & vbcrlf	
		MyBody = MyBody & "Uma avaliação de eficácia foi rejeitada pelo RH e enviada ao gestor para que o mesmo possa corrigi-lá." & vbcrlf & vbcrlf 
		MyBody = MyBody & "Veja abaixo os detalhes da lista." & vbcrlf
		MyBody = MyBody & "Título da Lista: "&vTituloEvento&""	& vbcrlf 
		MyBody = MyBody & "Tipo de Avaliação: "&vAvaliacao&""	& vbcrlf 
		MyBody = MyBody & "Motivo da REJEIÇÃO: "&vMotivoLista&""	& vbcrlf & vbcrlf
		MyBody = MyBody & "Aguarde a correção desta avaliação pelo gestor, o RH será notificado." & vbcrlf

	    objEmail.pCorpo = MyBody

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
                                <img src="/_images/_sistemas/sistema_rh/lista_presenca/mensagem_informe.jpg" width="112" height="146" /></p>
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

                <% If vResultadoLista = "Rejeitado" Then %>

                        <p align="center" style="font-size: 18px">A avaliação de eficácia foi REJEITADA. O solicitante receberá um e-mail para a alteração dos dados.</p>
                        <br />

                <% Else 
                        If vResultadoLista = "Aprovado" Then %>

                            <p align="center" style="font-size: 18px">A avaliação de eficácia foi APROVADA. O solicitante receberá um e-mail para a impressão da lista.</p>
                            <br />
                            <p align="center" style="font-size: 14px">
                                <a href="../lista_presenca/impressao_eficacia.asp?lista=<%=vNrLista%>">Clique aqui para impressão da avaliação de eficácia.
                                            <img src="/_images/icon_printer.gif" border="0" /></a>
                            </p>

                <%      Else %>

                            <p align="center" style="font-size: 18px">ANÁLISE ATUALIZADA!</p>
                            <br />

                <%      End If
                   End If
                %>
                <br />
                <br />
                <br />
                <p align="center">
                    <a href="analise.asp">Clique aqui para voltar para as análises pendentes.<br />
                        <img src="/_images/icon_back.png" border="0" /></a>
                </p>
                <br />
                <br />
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

    <!--[if IE]><script src="/_js/excanvas.compiled.js" type="text/javascript"></script><![endif]-->
</body>
</html>
