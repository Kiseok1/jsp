package com.java.www.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.service.DoLoginService;
import com.java.www.service.N_listSelectService;
import com.java.www.service.Service;


@WebServlet("*.do")
public class FController extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		String url = null;
		Service service = null;
		
		//파일이름 추출
		String uri = request.getRequestURI();
		String cPath = request.getContextPath();
		String fileName = uri.substring(cPath.length());
		//파일호출 이름
		System.out.println("FController 파일호출 이름: "+fileName);
		
		//switch
		switch (fileName) {
		case "/main.do": 
			response.sendRedirect("main.jsp");
			break;
		case "/login.do": 
			response.sendRedirect("login.jsp");
			break;
		case "/logout.do": 
			response.sendRedirect("logout.jsp");
			break;
		case "/doLogin.do": 
			//service호출
			service = new DoLoginService();
			service.execute(request, response);
			url="doLogin.jsp";
			break;
		case "/n_list.do": 
			//service호출
			service = new N_listSelectService();
			service.execute(request, response);
			url="n_list.jsp";
			break;
			
		}//switch
		
		if(url!=null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		
	}//doAction
	
	//----------
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}

}
