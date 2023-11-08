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
		<title>employees</title>
		<style>
			*{margin:0; padding:0;}
			div{width:1400px; margin:30px auto;}
			h1{text-align: center; margin-bottom:20px; }
			table,th,td{border:1px solid black; border-collapse: collapse; font-size:16px;
			text-align: center;}
			th,td{width:200px; height:40px;}
		</style>
	</head>
	<body>
		<div>
			<h1>직원정보</h1>
			<table>
				<tr>
					<th>사원번호</th>
					<th>사원명</th>
					<th>월급</th>
					<th>연봉</th>
					<th>부서번호</th>
					<th>부서명</th>
					<th>입사일</th>
				</tr>
				<!-- 반복 시작 -->
				<%
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				
				int emp_id,salary,salary2;
				String emp_name,dep_id,dep_name,hire_date,salary_str1,salary_str2;
				
				try{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ora_user","1111");
					stmt = conn.createStatement();
					String query = "select employee_id, emp_name, to_char(salary,'$999,999') salary1,"+
					" to_char(salary*12+(salary*12*nvl(commission_pct,0)),'$999,999')"+
					" salary2, nvl(to_char(a.department_id),'CEO') dep_id,"+
					" nvl(department_name,'CEO') dep_name, hire_date "+
					"from employees a, departments b "+
					"where a.department_id = b.department_id";
					rs = stmt.executeQuery(query);
					
					while(rs.next()){
						emp_id=rs.getInt("employee_id");
						
						//salary=rs.getInt("salary1");
						//String salary_str=String.format("%,d",salary);
						salary_str1 =rs.getString("salary1");
						
						//salary2=rs.getInt("salary2");
						//String salary2_str=String.format("%,d",salary2);
						salary_str2 = rs.getString("salary2");
						
						emp_name=rs.getString("emp_name");
						dep_id=rs.getString("dep_id");
						dep_name=rs.getString("dep_name");
						hire_date=rs.getDate("hire_date")+"";
					%>
				<tr>
					<td><%= emp_id %></td>
					<td><%= emp_name %></td>
					<td><%= salary_str1 %></td>
					<td><%= salary_str2 %></td>
					<td><%= dep_id %></td>
					<td><%= dep_name %></td>
					<td><%= hire_date %></td>
				</tr>
				<!-- 반복 끝 -->
					<%}
					
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
				
			</table>
		</div>
	</body>
</html>