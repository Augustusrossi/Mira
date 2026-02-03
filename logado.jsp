<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% 
	
	boolean status = (boolean) request.getAttribute("status");
	String mensagem;
	
	if(status){
		
		mensagem = "Pessoa logada com sucesso";
		
	} else{
		
		mensagem = "Pessoa não logada";
		
	}

%>

<p> <%= mensagem %></p>
<a href="index.jsp">voltar</a>
<a href="MiraController?operacao=sair">Sair</a>


</body>
</html>