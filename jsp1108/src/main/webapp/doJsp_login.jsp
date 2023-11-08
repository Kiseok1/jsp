<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
			String uid = request.getParameter("id");
			String upw = request.getParameter("pw");
		
			Connection conn=null;
			Statement stmt =null;
			ResultSet rs = null;
			
			String id,pw;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ora_user","1111");
			stmt = conn.createStatement();
			String query = "select * from member where id = '"+uid+"' and pw = '"+upw+"'";
			String query2 = "select count(*) as lcheck from member where id='"+uid+"' and pw='"+upw+"'";
			rs = stmt.executeQuery(query);
			
			
			if(rs.next()){
				session.setAttribute("session_id", uid);
				session.setAttribute("session_nickName", rs.getString("name"));
		%>		
			<script>
				alert("로그인 되었습니다.");
				location.href="jsp_main.jsp";
			</script>		
		<%} else {%>
			<script>
				alert("아이디 또는 패스워드가 일치하지 않습니다.");
				location.href="jsp_login.jsp";
			</script>			
		<%}%>
		<%
					
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
						if(rs!=null) rs.close();
						if(stmt!=null) stmt.close();
						if(conn!=null) conn.close();
					}catch(Exception e2){
						e2.printStackTrace();
					}
				}
				
				%>
	
	</body>
</html>