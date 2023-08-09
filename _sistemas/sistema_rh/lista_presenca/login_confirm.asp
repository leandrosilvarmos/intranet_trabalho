<%@  language="VBSCRIPT" codepage="65001" %>
<%  
	response.Charset = "utf-8" 
	response.ContentType = "text/html" 
%>

<%
    Dim vChapa, vSenha, vSair

    vChapa = Request("chapa")
	vSenha = Request("senha")
    vSair  = Request("sair")

    If vSair = 1 Then
		Session.Abandon() 
		Response.Redirect("login.asp")
	End If
%>


<!--#include virtual="/_funcoes/csRH.asp"-->
<%
    Dim objListaPresenca
    Set objListaPresenca = new clsListaPresenca
    
    Dim vAtivo

    vAtivo = objListaPresenca.fVerificaLogin(vChapa,vSenha)

	If vAtivo = "" Then
        Response.Redirect("login.asp?log=1")
    Else
        If vAtivo = "S" Then
            Session("chapa") = vChapa

		    Response.Redirect("analise.asp")
	    Else
            Response.Redirect("login.asp?log=2")
	    End If
    End If

    Set objListaPresenca = Nothing
%>