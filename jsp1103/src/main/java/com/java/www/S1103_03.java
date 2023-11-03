package com.java.www;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/S03")
public class S1103_03 extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int page = Integer.parseInt(request.getParameter("page"));
		String searchword = request.getParameter("searchword");
		
		int startrow = (10*(page-1)+1);
		int endrow = page*10;
		
		System.out.println("호출한 페이지 : "+ page);
		System.out.println("시작번호 : "+ startrow);
		System.out.println("끝번호 : " + endrow);
		System.out.println("검색어 : " + searchword );
		
		String query = "select bno,btitle,bcontent,bdate from"
				+ "(select row_number() over(order by bno) as rnum, bno, btitle, bcontent, bdate from board)"
				+ "where rnum>="+startrow+" and rnum<="+endrow+";";
		
		System.out.println("query구문 : "+query);
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}

}
