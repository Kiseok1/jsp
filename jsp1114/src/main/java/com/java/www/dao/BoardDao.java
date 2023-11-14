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
	BoardDto bdto =null;
	int bno,bgroup,bstep,bindent,bhit;
	String btitle,bcontent,id,bfile,query;
	Timestamp bdate;
	
	//1개게시글 가져오기 - selectOne(bno)
	public BoardDto selectOne(int bno2) {
		BoardDto bdto = null;
		try {
			conn=getConnection();
			query = "select * from board where bno=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bno2);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bno = rs.getInt("bno");
				btitle=rs.getString("btitle");
				bcontent=rs.getString("bcontent");
				bdate=rs.getTimestamp("bdate");
				id=rs.getString("id");
				bgroup=rs.getInt("bgroup");
				bstep=rs.getInt("bstep");
				bindent=rs.getInt("bindent");
				bhit=rs.getInt("bhit");
				bfile=rs.getString("bfile");
				
				bdto = new BoardDto(bno, btitle, bcontent, bdate, id, bgroup, bstep, bindent, bhit, bfile);
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
		
		return bdto;
	}
	
	
	//전체게시글 가져오기 - selectAll() 
	public ArrayList<BoardDto> selectAll(){
		ArrayList<BoardDto> list = new ArrayList();
		try {
			conn = getConnection();
			query = "select * from ( select row_number() over (order by bno desc) rnum, a.* from board a) where rnum between 1 and 10";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bno = rs.getInt("bno");
				btitle=rs.getString("btitle");
				bcontent=rs.getString("bcontent");
				bdate=rs.getTimestamp("bdate");
				id=rs.getString("id");
				bgroup=rs.getInt("bgroup");
				bstep=rs.getInt("bstep");
				bindent=rs.getInt("bindent");
				bhit=rs.getInt("bhit");
				bfile=rs.getString("bfile");
				
				list.add(new BoardDto(bno, btitle, bcontent, bdate, id, bgroup, bstep, bindent, bhit, bfile));
				
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
		
	}//selectAll
	
	//1.connection
	public Connection getConnection() {
		Connection connection = null;
		try {
			Context context = new InitialContext();
			DataSource ds= (DataSource)context.lookup("java:comp/env/jdbc/Oracle18");
			connection = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return connection;
	}//getConnection
}
