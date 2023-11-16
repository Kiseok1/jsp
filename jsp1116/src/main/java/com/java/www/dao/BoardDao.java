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

public class BoardDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	BoardDto bdto = null;
	ArrayList<BoardDto> list = new ArrayList<BoardDto>();
	int bno,bgroup,bstep,bindent,bhit;
	String btitle,bcontent,id,bfile,query;
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
	
	//게시글 저장 bInsert
	public int bInsert(BoardDto bdto2) {
		try {
			btitle=bdto2.getBtitle();
			System.out.println("bInsert title :"+btitle);
			bcontent=bdto2.getBcontent();
			id=bdto2.getId();
			bfile=bdto2.getBfile();
			
			conn = getConnection();
			query = "insert into board values(board_seq.nextval,?,?,sysdate,?,board_seq.currval,0,0,1,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, btitle);
			pstmt.setString(2, bcontent);
			pstmt.setString(3, id);
			pstmt.setString(4, bfile);
			result = pstmt.executeUpdate();

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
		return result;
	}//bInsert
	
	//bListSelectAll - 게시글 전체 가져오기
	public ArrayList<BoardDto> bListSelectAll() {
		try {
			conn = getConnection();
			query = "select * from (select row_number() over(order by bgroup desc) rnum, a.* from board a) where rnum between 1 and 10";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bno=rs.getInt("bno");
				//System.out.println("bListSelectAll bno : "+bno);
				bgroup=rs.getInt("bgroup");
				bstep=rs.getInt("bstep");
				bindent=rs.getInt("bindent");
				bhit=rs.getInt("bhit");
				btitle=rs.getString("btitle");
				bcontent=rs.getString("bcontent");
				id=rs.getString("id");
				bfile=rs.getString("bfile");
				bdate=rs.getTimestamp("bdate");
				
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
	}//bListSelectAll
	
	//bSelectOne
	public BoardDto bSelectOne(int bno2) {
		try {
			conn = getConnection();
			query = "select * from board where bno=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bno2);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bno=rs.getInt("bno");
				//System.out.println("bSelectOne bno : "+bno);
				bgroup=rs.getInt("bgroup");
				bstep=rs.getInt("bstep");
				bindent=rs.getInt("bindent");
				bhit=rs.getInt("bhit");
				btitle=rs.getString("btitle");
				bcontent=rs.getString("bcontent");
				id=rs.getString("id");
				bfile=rs.getString("bfile");
				bdate=rs.getTimestamp("bdate");
				
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
	}//bSelectOne

	
	//게시글 수정 - doBUpdate
	public int doBUpdate(BoardDto bdto2) {
		try {
			conn = getConnection();
			query="update board set btitle=?,bcontent=?,bdate=sysdate,bfile=? where bno=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bdto2.getBtitle());
			System.out.println("doBUpdate btitle : "+bdto2.getBtitle());
			pstmt.setString(2, bdto2.getBcontent());
			pstmt.setString(3, bdto2.getBfile());
			pstmt.setInt(4, bdto2.getBno());
			result = pstmt.executeUpdate();

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
		return result;
	}//doBUpdate
	

}
