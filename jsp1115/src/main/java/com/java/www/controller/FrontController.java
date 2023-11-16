package com.java.www.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.service.BoardService;
import com.java.www.service.DoLoginMemberService;
import com.java.www.service.MemberService;
import com.java.www.service.listBoardService;





@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		
		String url = null;
		String uri = request.getRequestURI();
		System.out.println("uri : "+uri);
		String conPath = request.getContextPath();
		System.out.println("conPath : "+conPath);
		
		String fileName = uri.substring(conPath.length());
		System.out.println("fileName : "+fileName);
		
		if (fileName.equals("/index.do")) {
			System.out.println("메인 페이지로 이동");
			response.sendRedirect("index.jsp"); // request,response 리셋
		}   else if (fileName.equals("/login.do")) {
			System.out.println("로그인 페이지로 이동");
			response.sendRedirect("login.jsp"); // request,response 리셋
		}   else if(fileName.equals("/doLogin.do")) {
			System.out.println("로그인여부 페이지 이동");
			//객체선언후 참조변수명.메소드명 - 부모의 참조변수로 자손의 객체 : 다형성
			MemberService memberServie = new DoLoginMemberService(); 
			memberServie.execute(request, response);
			url = "doLogin.jsp";
		}else if (fileName.equals("/write.do")) {
			System.out.println("회원가입 페이지로 이동");
			response.sendRedirect("mwrite.jsp"); // request,response 리셋
		} else if (fileName.equals("/list.do")) {
			System.out.println("게시판 페이지 이동");
			BoardService boardService = new listBoardService();
			boardService.execute(request, response);
			
			//db정보필요-dispatcher
			url = "list.jsp";
		} else if (fileName.equals("/logout.do")) {
			System.out.println("로그아웃 페이지로 이동");
			response.sendRedirect("logout.jsp"); // request,response 리셋
		} else if (fileName.equals("/update.do")) {
			System.out.println("회원정보수정 페이지로 이동");
			//db정보필요-dispatcher
			url = "update.jsp";
		} 
		
		//url이동
		if(url!=null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		
		
		
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
