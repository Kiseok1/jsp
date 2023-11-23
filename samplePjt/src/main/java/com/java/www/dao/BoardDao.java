package com.java.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.java.www.dto.BoardDto;
import com.java.www.dto.MemberDto;

public class BoardDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	BoardDto bdto = null;
	ArrayList<BoardDto> list = new ArrayList<BoardDto>();
	int bno,bgroup,bstep,bindent,bhit;
	String btitle,bcontent,id,bfile,query="";
	Timestamp bdate;
	int result;
	
	//getConnection
	public Connection getConnection() {
		Connection connection = null;
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle18");
			connection = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}//getConnection

	//게시글 가져오기 - select
	public ArrayList<BoardDto> n_listSelect() {
		try {
			conn=getConnection();
			query="select * from (select row_number() over(order by bgroup desc, bstep asc) rnum, a.* from board a) where rnum between 1 and 10";
			pstmt=conn.prepareStatement(query);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bno=rs.getInt("bno");
				bgroup=rs.getInt("bgroup");
				bindent=rs.getInt("bindent");
				bstep=rs.getInt("bstep");
				bhit=rs.getInt("bhit");
				btitle=rs.getString("btitle");
				bcontent=rs.getString("bcontent");
				id=rs.getString("id");
				bfile=rs.getString("bfile");
				bdate=rs.getTimestamp("bdate");
				
				list.add(new BoardDto(bno, btitle, bcontent, bdate, id, bgroup, bindent, bstep, bhit, bfile));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}//n_listSelect
}
