<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠키 생성</title>
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			$(function(){
				$("#fbtn").click(function(){
					alert("test");
					var co_name = $("#co_name").val()
					var co_value = $("#co_value").val()
					alert("name : "+co_name);
					alert("value : "+co_value);
					co_frm.submit(); 
				});//click
			});//jquery
		</script>
	</head>
	<body>
		<h1>쿠키 생성</h1>
		<form name="co_frm" method="post" action="co_doWrite.jsp">
			<label>쿠키 이름</label>
			<input type="text" name="co_name" id="co_name">
			<br>
			<label>쿠키 값</label>
			<input type="text" name="co_value" id="co_value">
			<br>
			<input type="button" id="fbtn" value="저장">			 
		</form>
	
	</body>
</html>