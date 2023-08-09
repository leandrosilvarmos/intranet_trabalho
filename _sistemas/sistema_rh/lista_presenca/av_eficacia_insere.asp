<%@  language="VBSCRIPT" codepage="65001" %>
<%  
	response.Charset = "utf-8" 
	response.ContentType = "text/html" 
%>

<%
    Dim vNumeroLista, vTreinamentoEficaz, vNomeAvaliador, vDataValidacao, vComoAvaliou, vCampoComplementar, vTituloEvento, vNomeSolicitante, vAvaliacao
    
    vNumeroLista       = Request("numero_lista")
    vTreinamentoEficaz = Request("treinamento_eficaz")
    vNomeAvaliador     = Request("nome_avaliador")
    vDataValidacao     = Request("data_validacao")
    vComoAvaliou       = Request("como_avaliou")
    vCampoComplementar = Request("campo_complementar")
    vTituloEvento      = Request("titulo_evento")
    vNomeSolicitante   = Request("nome_solicitante")
    vAvaliacao         = Request("avaliacao")
%>

<!--#include virtual="/_funcoes/csRH.asp"-->
<%
    Dim objListaPresenca
    Set objListaPresenca = new clsListaPresenca

    objListaPresenca.fGravaAvEficacia vNumeroLista, vTreinamentoEficaz, vNomeAvaliador, vDataValidacao, vComoAvaliou, vCampoComplementar

    objListaPresenca.fAtualizaStatusAvEficaciaII vNumeroLista, "S", "AV EFICACIA REALIZADA PELO SOLICITANTE"

    Set objListaPresenca = Nothing
%>

<!--#include virtual="/_funcoes/csEmail.asp"-->
<%
    Dim objEmail

    Set objEmail = new clsEmail

    objEmail.pTipo = "TEXT"

    objEmail.pFrom = "naoresponder@hesap.org.br"

	objEmail.pBCC = "treinamento@hesap.org.br"
	
	objEmail.pTitulo = "AVISO - Avaliação de eficácia REALIZADA"

    MyBody = "Sistemas Interno HESAP - Lista de Presença"	 & vbcrlf & vbcrlf  & vbcrlf	
	MyBody = MyBody & "Há uma lista AVALIADA PELO GESTOR (AVALIAÇÃO DE EFICÁCIA) e PENDENTE de APROVAÇÃO do RH " & vbcrlf & vbcrlf
	
	MyBody = MyBody & "Veja abaixo os detalhes da lista. " & vbcrlf
	MyBody = MyBody & "Título da Lista: "&vTituloEvento&""	& vbcrlf
	MyBody = MyBody & "Solicitante: "    &vNomeSolicitante&""	& vbcrlf
	MyBody = MyBody & "Tipo de Avaliação: "&vAvaliacao&""	& vbcrlf & vbcrlf

    MyBody = MyBody & "Clique no link abaixo para acessar essa lista de presença " & vbcrlf 
	MyBody = MyBody & fGetUrlPage(EnumURL_ParcialUrl)&"analise_eficacia.asp?lista="&vNumeroLista&"" & vbcrlf & vbcrlf 
	
    MyBody = MyBody & "O solicitante pode ter anexado um documento. Verifique na pasta abaixo:" & vbcrlf 
	MyBody = MyBody & "O:\Recursos Humanos\Avaliação de Eficacia" & vbcrlf

	objEmail.pCorpo = MyBody

    objEmail.fEnviaEmail()	
	
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
                                <img src="/_images/_sistemas/sistema_rh/lista_presenca/mensagem_informe.jpg" width="112" height="146" />
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
                <p align="center" style="font-size: 18px">Sua avaliação de eficácia foi realizada e enviada para a equipe de Treinamento do HESAP.</p>
                <br />
                <p align="center">Aguarde, em breve entraremos em contato.</p>
                <br />
                <br />
                <p align="center">Utilize o menu lateral para fazer uma nova solicitação ou sair do sistema.</p>
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
