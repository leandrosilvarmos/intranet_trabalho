<%@  language="VBSCRIPT" codepage="65001" %>

<%  
	response.Charset = "utf-8" 
	response.ContentType = "text/html" 
%>
<%

  '' Set conexao = Server.CreateObject("ADODB.Connection")
  '' conexao.open(OraConn)  

%>



<%
    Dim vAvaliacao, vCargaHoraria, vCargaHoraria2, vCargaHoraria3, vCargaHoraria4, vCargaHoraria5, vCargaHoraria6, vComo, vDataEvento, vDataEvento2, vDataEvento3, vDataEvento4, vDataEvento5, vDataEvento6, vHrFinal, vHrFinal2, vHrFinal3, vHrFinal4, vHrFinal5, vHrFinal6, vHrInicial, vHrInicial2, vHrInicial3, vHrInicial4, vHrInicial5, vHrInicial6, vImpacto, vLocalEvento, vLocalEvento2, vLocalEvento3, vLocalEvento4, vLocalEvento5, vLocalEvento6, vNomeMinistrante, vNomeSolicitante, vObjetivo, vPrazoEficacia, vQtdParticipante, vQtdParticipante2, vQtdParticipante3, vQtdParticipante4, vQtdParticipante5, vQtdParticipante6, vSetor, vSetorEnfermagem, vTempoMedio, vTituloEvento, vTpTreinamento, vValidarTreinamento, vPlanoAcao, vNrListaRef

    vAvaliacao          = fCorrigeTexto(Request("avaliacao"))
    vCargaHoraria       = Request("carga_horaria")
    vCargaHoraria2      = Request("carga_horaria2")
    vCargaHoraria3      = Request("carga_horaria3")
    vCargaHoraria4      = Request("carga_horaria4")
    vCargaHoraria5      = Request("carga_horaria5")
    vCargaHoraria6      = Request("carga_horaria6")
    vComo               = fCorrigeTexto(Request("como"))
    vDataEvento         = Request("data_evento")
    vDataEvento2        = Request("data_evento2")
    vDataEvento3        = Request("data_evento3")
    vDataEvento4        = Request("data_evento4")
    vDataEvento5        = Request("data_evento5")
    vDataEvento6        = Request("data_evento6")
    vHrFinal            = Request("hr_final")
    vHrFinal2           = Request("hr_final2")
    vHrFinal3           = Request("hr_final3")
    vHrFinal4           = Request("hr_final4")
    vHrFinal5           = Request("hr_final5")
    vHrFinal6           = Request("hr_final6")
    vHrInicial          = Request("hr_inicial")
    vHrInicial2         = Request("hr_inicial2")
    vHrInicial3         = Request("hr_inicial3")
    vHrInicial4         = Request("hr_inicial4")
    vHrInicial5         = Request("hr_inicial5")
    vHrInicial6         = Request("hr_inicial6")
    vImpacto            = fCorrigeTexto(Request("impacto"))
    vLocalEvento        = Request("local_evento")
    vLocalEvento2       = Request("local_evento2")
    vLocalEvento3       = Request("local_evento3")
    vLocalEvento4       = Request("local_evento4")
    vLocalEvento5       = Request("local_evento5")
    vLocalEvento6       = Request("local_evento6")
    vNomeMinistrante    = fCorrigeTexto(Request("nome_ministrante"))
    vNomeSolicitante    = Request("nome_solicitante")
    vObjetivo           = fCorrigeTexto(Request("objetivo"))
    vPrazoEficacia      = Request("prazo_eficacia")
    vQtdParticipante    = Request("qtd_participante")
    vQtdParticipante2   = Request("qtd_participante2")
    vQtdParticipante3   = Request("qtd_participante3")
    vQtdParticipante4   = Request("qtd_participante4")
    vQtdParticipante5   = Request("qtd_participante5")
    vQtdParticipante6   = Request("qtd_participante6")
    vSetor              = Request("setor")
    vSetorEnfermagem    = Request("setor_enfermagem")
    vTempoMedio         = Request("tempo_medio")
    vTituloEvento       = fCorrigeTexto(Request("titulo_evento"))
    vTpTreinamento      = Request("tp_treinamento")
    vValidarTreinamento = fCorrigeTexto(Request("validar_treinamento"))
    vPlanoAcao          = Request("plano_acao")
    vNrListaRef         = Request("nr_lista_ref")
	vresultado			= "Aprovado"
	vanalista			= "Reunião"
    
%>
    <!--#include virtual="/_funcoes/csRH.asp"-->
<%
        
    Dim objListaPresenca
    Set objListaPresenca = new clsListaPresenca
    
    Dim vNrLista, vEmail
    
    vNrLista = objListaPresenca.fGravaListaPresenca(vAvaliacao, vNomeSolicitante, vTituloEvento, vTpTreinamento, vSetor, vDataEvento, vLocalEvento, vCargaHoraria, vHrInicial, vHrFinal, vNomeMinistrante, vObjetivo, vImpacto, vValidarTreinamento, vPrazoEficacia, vComo, vQtdParticipante, vDataEvento2, vHrInicial2, vHrFinal2, vLocalEvento2, vQtdParticipante2, vCargaHoraria2, vTempoMedio, vDataEvento3, vHrInicial3, vHrFinal3, vLocalEvento3, vQtdParticipante3, vCargaHoraria3, vDataEvento4, vHrInicial4, vHrFinal4, vLocalEvento4, vQtdParticipante4, vCargaHoraria4, vDataEvento5, vHrInicial5, vHrFinal5, vLocalEvento5, vQtdParticipante5, vCargaHoraria5, vDataEvento6, vHrInicial6, vHrFinal6, vLocalEvento6, vQtdParticipante6, vCargaHoraria6, vSetorEnfermagem, vPlanoAcao, vNrListaRef)

    vEmail = "treinamento@hesap.org.br;"

    If vSetorEnfermagem = "Sim" Then
        vEmail = vEmail & "educacao.permanente@hesap.org.br;"
    End If


    If vAvaliacao = "REUNIÃO"  Then



  '' qry = "UPDATE rh_lista_presencial SET resultado = 'Aprovado' WHERE lista="&vNrLista
  '' conexao.execute(qry)

     
          response.redirect("http://intranet.hesap.org.br/_sistema/sistema_rh/lista_presenca/impressao_lista.asp?lista="&vNrLista)
                            
    end if

  ' Response.Write(sql)
  ' Response.Write(vNrLista)
  ' Response.End



    Set objListaPresenca = Nothing
%>

<!--#include virtual="/_funcoes/csEmail.asp"-->

<%
    Dim objEmail

    Set objEmail = new clsEmail

    objEmail.pTipo = "TEXT"

    objEmail.pFrom = "naoresponder@hesap.org.br"

	objEmail.pBCC = vEmail
	
	objEmail.pTitulo = "AVISO: Lista de Presença PENDENTE"

	MyBody = "Sistemas Interno HESAP - Lista de Presença"	 & vbcrlf & vbcrlf  & vbcrlf			
    MyBody = MyBody & "Há uma lista pendente para análise do RH." & vbcrlf & vbcrlf
	
	MyBody = MyBody & "Veja abaixo os detalhes da lista." & vbcrlf 
	MyBody = MyBody & "Título da Lista: "&vTituloEvento&""	& vbcrlf 
	MyBody = MyBody & "Solicitante: " &vNomeSolicitante&""	& vbcrlf
	MyBody = MyBody & "Tipo de Avaliação: "&vAvaliacao&""	& vbcrlf & vbcrlf

    MyBody = MyBody & "Clique no link abaixo para acessar essa lista de presença: " & vbcrlf 
	MyBody = MyBody & fGetUrlPage(EnumURL_ParcialUrl)&"analise_avaliacao.asp?lista="&vNrLista&"" & vbcrlf & vbcrlf 

	objEmail.pCorpo = MyBody

    objEmail.fEnviaEmail()
	
    Set objEmail = Nothing	

    'end if
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
                <p align="center" style="font-size: 16px">A solicitação foi encaminhada com sucesso para a equipe de Treinamento do HESAP</p>
                <br/>
                <p align="center" style="color: #FF0000; font-size: 18px; font-weight: bold">A lista de presença será liberada em até 24h,<br/>o prazo para devolução da lista ao RH  é de 48h.</style></p>
                <br />
		<p align="center" style="font-size: 18px;"><span style="color: #FF0000;">Observação:</span>&nbsp;Não será aceito lista de presença impressa frente e verso.</style></p>
		<br />
                <p align="center" style="font-size: 16px">Aguarde em breve entraremos em contato.</p>
                <p align="center" style="font-size: 16px">Utilize o menu lateral para fazer nova solicitação ou sair do sistema.</p>
                <br />
                <p align="center" style="font-size: 16px">Treinamento e Desenvolvimento – HESAP</p>
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
