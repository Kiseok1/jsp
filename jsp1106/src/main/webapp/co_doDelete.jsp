<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠키 삭제</title>
		
	</head>
	<body>
		<%
		String cname = request.getParameter("co_name");
		Cookie[] cks = request.getCookies();
		int check=0;
		if(cks != null) {
			for(int i=0;i<cks.length;i++){
				if(cks[i].getName().equals(cname)){
					cks[i].setMaxAge(0);
					response.addCookie(cks[i]);
					check=1;
				}
			}
		}
		if(check==0){
		%>
		<script>alert("입력하신 쿠키를 찾을 수 없습니다.");
				location.href="co_list.jsp";
		</script>
		<%}else{%>
		<script>alert("쿠키를 삭제했습니다.");
				location.href="co_list.jsp";
		</script>
		<%} %>
	</body>
</html>