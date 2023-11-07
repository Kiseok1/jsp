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
		<title>db연결</title>
	</head>
	<body>
	<%
		Connection conn=null; //연결
		Statement stmt=null;  //문장
		ResultSet rs=null;    //결과
		
		int stuNum=0;
		String name="";
		int grade = 0;
		String email = "",phone="",gender="",address="";
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "ora_user";
		String upw = "1111";
		
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,uid,upw);
			stmt = conn.createStatement();
			String query = "select * from stuinfo";
			rs = stmt.executeQuery(query); //100개
			
			while(rs.next()){ //rs에 데이터가 있으면
				stuNum=rs.getInt("stunum");
				name = rs.getString("name");
				grade = rs.getInt("grade");
				email = rs.getString("email");
				phone = rs.getString("phone");
				gender = rs.getString("gender");
				address = rs.getString("address");
				out.println("학번 : "+stuNum+",이름 : "+name+",학년 : "+grade+",이메일 : "
				+email+",전화번호 : "+phone+",성별 : "+gender+",주소 : "+address+"<br>");
			}
			
		}catch(Exception e){
			e.printStackTrace();			
		}finally{
			try{
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		
	%>
		
	</body>
</html>