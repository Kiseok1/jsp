<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jsp-스크립트릿</title>
	</head>
	<body>
	<!-- html 주석 : 페이지 소스보기로 노출 -->
	<%-- jsp 주석 : 페이지 소스보기로 노출 X--%>
	<%
		//랜덤으로 숫자 : 0 ~ 99,999
		//자리수는 5자리가 되어야함. ex) 00001
		int num = (int)(Math.random()*100000);
		String str_num = String.format("%05d",num);
		out.println(str_num+"<br>");
			
		//5자리의 개별숫자의 합을 출력하시오
		char n1 = (str_num.charAt(0));
		char n2 = (str_num.charAt(1));
		char n3 = (str_num.charAt(2));
		char n4 = (str_num.charAt(3));
		char n5 = (str_num.charAt(4));
	
		int i1 = n1 - '0';
		int i2 = n2 - '0';
		int i3 = n3 - '0';
		int i4 = n4 - '0';
		int i5 = n5 - '0';
		
		out.println("합계 : "+(i1+i2+i3+i4+i5));
	%>
	
	</body>
</html>