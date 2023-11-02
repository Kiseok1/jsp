<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jsp-선언식<%! %></title>
	</head>
	<body>
		<%! //선언식 - 서블릿에서 계산이 되어진 결과값 리턴해가져와서 자주 사용하지는 않음.
		//선언식에 사용 - 전역변수 선언, 메소드 선언 가능
		int a=0;
		int b=0;
		public int sum(int a, int b){
			return a+b;
		}
		
		%>
		<%
			a= 10;
			b= 2;
			out.println(a+b);
		
		%>
		<% out.println(sum(10,2)+"<br>"); %>
		<% out.println(sum(20,10)+"<br>"); %>
	</body>
</html>