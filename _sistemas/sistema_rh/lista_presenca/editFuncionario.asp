<%@  language="VBSCRIPT" codepage="65001" %>
<%  
	response.Charset = "utf-8" 
	response.ContentType = "text/html" 
%>

<!--#include virtual="/_funcoes/csRH.asp"-->
<%
    Dim objListaPresenca
    Set objListaPresenca = new clsListaPresenca

    Dim vChapa
	vChapa = Request("localizarChapa")
	
    If vChapa <> "" Then
        objListaPresenca.fRetornaFuncionario vChapa
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

    <link href="/_css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

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
                                <img src="/_images/_sistemas/sistema_rh/lista_presenca/avalicao_eficacia.jpg" width="112" height="146" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- Fim do menu esquerdo -->
            </div>
        </aside>
        <section>

            <div id="conteudo">

                <fieldset style="margin: 10px;">
                    <legend style="color: #f7772c;">EDIÇÃO DO CADASTRO DE FUNCIONÁRIO</legend>

                    <p>Busque o funcionário por CHAPA</p>


                    <form name="form" id="form" method="post" action="editFuncionario.asp" class="formulario">

                        <div class="elements">
                            <label for="localizar" style="float: left;">Busca por chapa:&nbsp;&nbsp;</label>
                            <input type="text" id="localizarChapa" name="localizarChapa" class="input form-control" style="width: 20%; float: left;" />
                            <input type="submit" class="submit btn btn-success" style="margin-left: 10px; padding-top: 0px; padding-bottom: 0px;" value="Procurar" />
                        </div>
                        <br />
                    </form>

                    <div id="hidden">
                        <% If objListaPresenca.UsrChapa = "" Then
			                    Response.Write("<p>NENHUM FUNCIONÁRIO CADASTRADO COM ESSA CHAPA / DRT</p>")
	 	                   Else
                        %>

                        <form name="form_altera" id="form_altera" method="post" action="update_funcionario.asp" class="formulario">
                            <br />
                            <legend style="color: #f7772c;">ALTERAÇÃO FUNCIONÁRIO</legend>


                            <div class="elements">
                                <label for="chapa" style="width: 80px; text-align: right; float: left; margin-right: 5px;">Chapa / DRT:</label>
                                <input name="chapa2" type="text" class="input form-control" id="chapa2" style="width: 20%;" value="<%=objListaPresenca.UsrChapa%>" readonly="readonly" />
                            </div>
                            <br />
                            <div class="elements">
                                <label for="nome" style="width: 80px; text-align: right; float: left; margin-right: 5px;">Nome:</label>
                                <input name="nome" type="text" class="input form-control" id="nome" style="width: 50%;" value="<%=objListaPresenca.UsrNome%>" readonly="readonly" />
                            </div>
                            <br />
                            <div class="elements">
                                <label for="dtAdmissao" style="width: 80px; text-align: right; float: left; margin-right: 5px;">Função:</label>
                                <input name="funcao" type="text" class="input form-control" id="funcao" style="width: 50%;" value="<%=objListaPresenca.UsrDsFuncao%>" maxlength="10" readonly="readonly" />
                            </div>
                            <br />
                            <div class="elements">
                                <label for="email" style="width: 80px; text-align: right; float: left; margin-right: 5px;">Email:</label>
                                <input name="email" type="text" class="input form-control" id="email" style="width: 50%;" value="<%=objListaPresenca.UsrEmail%>" />
                            </div>

                            <br />
                            <p style="text-align: center; width: 500px;">
                                <input type="submit" class="submit btn btn-primary" style="padding-top: 0px; padding-bottom: 0px;" value="Gravar Informações" />
                            </p>
                        </form>

                        <%End If%>
                    </div>
                </fieldset>
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

    <script src="/_js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="/_js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="/_js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <!--[if IE]><script src="/_js/excanvas.compiled.js" type="text/javascript"></script><![endif]-->
</body>
</html>

<%
    Set objListaPresenca = Nothing
%>