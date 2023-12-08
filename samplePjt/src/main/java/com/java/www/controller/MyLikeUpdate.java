package com.java.www.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.java.www.dao.BoardDao;
import com.java.www.service.IdCheckService;

@WebServlet("/MyLikeUpdate")
public class MyLikeUpdate extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("session_id");
		
		int bno= Integer.parseInt(request.getParameter("bno"));
		int like_status= Integer.parseInt(request.getParameter("like_status"));

//		int bno=1043;
//		int like_status=0;
		
		System.out.println("MyLikeUpdate bno : "+bno);
		System.out.println("MyLikeUpdate like_status : "+like_status);
		
		//service접근
		//MyLikeUpdateService MyLikeUpdateService = new MyLikeUpdateService(); //리턴값이 필요해서 Interface Service의 execute(리턴없음) 사용안함 
		
		//dao 접근 - 좋아요 상태를 수정
		BoardDao bdao = new BoardDao();
		int all_like_count = bdao.myLikeUpdate(id,bno,like_status);
		System.out.println("controller all_like_count : "+all_like_count);
		
		//ajax로 전송
		JSONObject json = new JSONObject();
		json.put("all_like_count", all_like_count); // key,value
		
		
		response.setContentType("application/x-json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(json);
		writer.close();
		
	}//doAction
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}

}
