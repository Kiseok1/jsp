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
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			String dbid, dbpw, dbname;
			
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ora_user", "1111");
				stmt = conn.createStatement();
				String query = "select * from member";
				rs = stmt.executeQuery(query);
				
				while(rs.next()){
					dbid = rs.getString("id");
					dbpw = rs.getString("pw");
					dbname = rs.getString("name");
					if (id.equals(dbid) && pw.equals(dbpw)){
						session.setAttribute("session_id", id);
						session.setAttribute("session_name", dbname);
			%>			
					<script>
						alert("로그인 되었습니다.");
						location.href="jsp_main.jsp";
					</script>		
				<%	} else {%>
						<script>
							alert("아이디 또는 패스워드가 일치하지 않습니다.");
							location.href="jsp_login.jsp";
						</script>			
					
			<%		} 
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					
				}catch(Exception e2){
					e2.printStackTrace();
				}
			}%>
			
			
	
	</body>
</html>