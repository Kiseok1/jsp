package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;


@WebServlet("/Ser06")
public class Ser06 extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title></title>");
		writer.println("<style>");
		writer.println("div{width:600px; height:600px; background-color:yellow; font-size:70px; text-align:center;}");	
		writer.println("</style>");
		writer.println("<script>alert('당신이 입력한 이름 : " + request.getParameter("name")+ "')</script>");
		writer.println("<script>console.log('"+ request.getParameter("name") +"')</script>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<div>");
		writer.println("서블릿에서 만든 사각형");
		writer.println("</div>");
		writer.println("</body>");
		writer.println("<html>");
		
//		writer.println("<html><head><meta charset='UTF-8'><title>Insert title here</title><style>div{width: 600px; height: 600px; background-color: yellow; border: 3px solid black; text-align: center; font-size: 70px;}");
//		writer.println("</style><script>alert('당신이 입력한 이름 : "+ request.getParameter("name")+"')</script></head><body><div>서블릿에서 만든 사각형</div></body></html>");
		
		writer.close();
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
