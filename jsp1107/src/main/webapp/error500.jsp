<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>    
<%
//에러가났을때 이페이지가 정상적으로 동작하도록 인위적으로 상태코드를 조작한다.
response.setStatus(200); 
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>error500</title>
		<style>
			*{margin:0; padding:0;}
			div{width:100%; margin:0px auto;}
			img{width:100%;}
		</style>
	</head>
	<body>
		<div>
			<a href="/jsp1107/layout/main.jsp"><img src="error500.jpg"></a>
		</div>
		
		<div>
			<%= exception.getMessage() %>
		</div>
	</body>
</html>