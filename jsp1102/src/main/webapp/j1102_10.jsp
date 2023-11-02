<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>request</title>
	</head>
	<body>
	<%
		out.println("서버이름 : "+request.getServerName()+"<br>"); //서버 ip
		out.println("포트번호 : "+request.getServerPort()+"<br>"); 
		out.println("프로젝트명 : "+request.getContextPath()+"<br>"); //★
		out.println("get,post : "+request.getMethod()+"<br>");
		out.println("프로토콜 : "+request.getProtocol()+"<br>");
		out.println("url 전체주소 : "+request.getRequestURL()+"<br>");
		out.println("uri주소 : "+request.getRequestURI()+"<br>"); //★
		out.println("접속자ip : "+request.getRemoteAddr()+"<br>"); //★ 접속한 user ip
	
		//파일명 출력
		String file_uri = request.getRequestURI(); ///jsp1102/j1102_10.jsp
		out.println("프로젝트명 길이 : "+request.getContextPath().length()+"<br>");
		String file_name = file_uri.substring(request.getContextPath().length());
		out.println("파일이름 : "+ file_name);
	
	%>
	
	</body>
</html>