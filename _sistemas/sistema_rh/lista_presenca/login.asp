<%@  language="VBSCRIPT" codepage="65001" %>
<%  
	response.Charset = "utf-8" 
	response.ContentType = "text/html" 
%>

<%
    Dim vLog

	vLog = Request("log")	
%>
<!DOCTYPE html>
<html lang="pt-br" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="cache-control" content="no-cache"/>

    <title>Login e senha - RH Lista de Presença</title>

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

    <style type="text/css">
        body {
            background-color: #FFF;
        }

        #main {
            border: 1px solid #1c92ab;
            background-color: #fdfdfd;
            width: 500px;
            height: 410px;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: 10px auto auto auto;
        }

        #topo {
            height: 80px;
            width: 100%;
            border-bottom: 1px solid #1c92ab;
            margin-bottom: 15px;
            text-align: center;
            background-color: #1c92ab;
            background-image: url(/_images/sistemas_topo.png);
        }

            #topo .image {
                float: left;
                height: 79px;
                width: 105px;
                background-color: #fff;
                padding: 10px;
            }

                #topo .image img {
                    width: 80px;
                }

            #topo label {
                position: relative;
                top: 25px;
                bottom: 0;
                left: 80px;
                right: 0;
                margin: auto;
                float: left;
                color: #fff !important;
                font-size: 20px;
            }

        #conteudo {
            padding: 10px;
        }

        .sm-alert {
            width: 232px;
        }

        #chapa, #senha {
            width: 186px;
        }

        label[for='chapa'], label[for='senha'] {
            margin-top: 4px;
        }
    </style>
</head>
<body>
    <div id="main">
        <div id="topo">
            <div class="image">
                <img src="/_images/logo_135x100.png" alt="HESAP"/>
            </div>

            <label>RH - Lista de Presença</label>
        </div>
        <div id="conteudo">
            <div class="alert alert-info">
                <p>
                    Obs: Esse aplicativo  é de uso exclusivo do RH.
                <br />
                    Caso você queira solicitar uma lista de presença, <a href="solicitacoes.asp">clique aqui!</a>
                </p>
            </div>
            <form name="form" id="form" action="login_confirm.asp" onsubmit="return valida()">
                <div class="row mg-bt10px">
                    <div class="col-xs-12 center">
                        <label>Digite sua chapa e senha:</label>
                    </div>
                </div>
                <%If vLog = "1" Then%>
                <div class="alert alert-danger sm-alert" role="alert">
                    <i class="fa fa-exclamation"></i>&nbsp;Login e/ou senha incorreto(s)!
                </div>
                <%End If%>
                <%If vLog = "2" Then%>
                <div class="alert alert-danger sm-alert" role="alert">
                    <i class="fa fa-exclamation"></i>&nbsp;Usuário Inativo!
                </div>
                <%End If%>
                <div class="row mg-bt10px">
                    <div class="col-xs-4 right">
                        <label for="chapa">Chapa:</label>
                    </div>
                    <div class="col-xs-7">
                        <input id="chapa" name="chapa" class="form-control" type="text" size="20" maxlength="8"/>
                    </div>
                </div>
                <div class="row mg-bt10px">
                    <div class="col-xs-4 right">
                        <label for="senha">Senha:</label>
                    </div>
                    <div class="col-xs-8">
                        <input id="senha" name="senha" class="form-control" type="password" size="20" maxlength="8"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 center">
                        <button id="bt_envia" name="bt_envia" type="submit" class="btn btn-primary">
                            <i class="fa fa-sign-in"></i>&nbsp;Login
                        </button>
                    </div>
                </div>
            </form>
        </div>
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

    <!-- Functions javascript -->
    <script type="text/jscript">
        function valida() {
	        //-- VALIDA Campos --
	        if (document.form.chapa.value=="") {
	            alert("O campo CHAPA deve ser preenchida!");
		        document.form.chapa.focus();
		        return false;
	        }
	        if (document.form.senha.value=="") {
	            alert("O campo SENHA deve ser preenchida!");
		        document.form.senha.focus();
		        return false;
	        }	
        }
    </script>
</body>
</html>
