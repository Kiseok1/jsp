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
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "ora_user";
	String upw = "1111";
	
	int bno = 0;
	String btitle="";
	String bcontent="";
	String bdate="";
	String id = "";
	int bgroup=0, bstep=0, bindent=0, bhit=0;
	String bfile="", u_id="";
	
	
	try{
		Class.forName(driver);
		conn= DriverManager.getConnection(url,uid,upw);
		stmt= conn.createStatement();
		String query = "select * from board";
		rs = stmt.executeQuery(query);
		
		while(rs.next()){
			bno=rs.getInt("bno");
			btitle=rs.getString("btitle");
			bcontent=rs.getString("bcontent");
			bdate = rs.getString("bdate");
			//bdate = rs.getDate("bdate")+"";
			//Timestamp e = rs.getTimestamp("bdate"); //Timestamp 객체로 받음.
			id = rs.getString("id");
			bgroup = rs.getInt("bgroup");
			bstep= rs.getInt("bstep");
			bindent= rs.getInt("bindent");
			bhit = rs.getInt("bhit");
			bfile=rs.getString("bfile");
			u_id=rs.getString("u_id");
			out.println("bno : "+bno+", 제목 : "+btitle+"<br>내용 : "+bcontent+"<br>작성일 : "+bdate+
					", 작성자 : "+id+", bgroup : "+bgroup+", bstep : "+bstep+", bindent : "+
					bindent+", 조회수 : "+bhit+", 첨부파일 : "+bfile+", u_id : "+u_id+"<br><br>");
		}
		
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch(Exception e2){
			e2.printStackTrace();
		}
	}
	
	
	
	
	%>
	
	</body>
</html>