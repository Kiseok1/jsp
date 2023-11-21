<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<c:if test="${result==1}">
			<script>
				alert("회원가입 되셨습니다.");
				location.href="index.do";
			</script>
		</c:if>
		<c:if test="${result!=1}">
			<script>
				alert("회원가입을 실패하였습니다.");
				location.href="mInsert.do";
			</script>
		</c:if>
	
	</body>
</html>