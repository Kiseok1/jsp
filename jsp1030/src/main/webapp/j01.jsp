<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP - HTML 태그</title>
	</head>
	<body>
		<h1>jsp 페이지입니다.</h1>
		<%
			int a = 1;
			int b = 100;
			int sum = 0;
			for (a=1;a<=b;a++){
				sum += a;
			}
			out.println(sum);
		%>
	
	</body>
</html>