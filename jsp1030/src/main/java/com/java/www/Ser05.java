package com.java.www;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ser05")
public class Ser05 extends HttpServlet {
	
	//프로그램이 시작할 때 한번 실행
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init()메소드는 시작할때 한번 실행이 됨.");
	}

	//프로그램이 종료될 때 한번 실행
	public void destroy() {
		System.out.println("destroy()메소드는 종료될때 한번 실행이 됨");
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction 접근");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet는 url통한 접속,get방식으로 접속할때마다 계속실행");
		doAction(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost는 post방식으로 들어올때마다 계속실행");
		doAction(request, response);
	}

}
