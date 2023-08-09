<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
    <style type="text/css">
        body {
            background-color: #FFF;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
    
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <table>
	<tr>
      <td colspan="2"><span class="style1">ATENÇÃO:</span> o arquivo deverá ser renomeado para<strong> NroLista_NomeDoTreinamento </strong><br /></td>   
    </tr>
	<tr>
      <td>Clique no botão ao lado para selecionar o <br />
      anexo em PDF e após clique em Enviar PDF</td>   
      <td style="padding-left: 5px;"><asp:FileUpload class="form-control" ID="fileUpload1" runat="server"/></td>
    </tr>
    </table> 
    <br />
    <p style="text-align: center;">
        <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="Enviar PDF" OnClick="btnEnviar_Click"/>
    </p>

    </form>

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