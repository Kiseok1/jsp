package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/S02")
public class S1031_02 extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head><title></title><style>*{margin:0 auto;} table,tr,td{border:1px solid black; border-collapse: collapse; text-align:center;}</style></head>");
		writer.println("<body>");
		
//		writer.println("학번 : " + request.getParameter("no")+"</br>");
//		writer.println("이름 : " + request.getParameter("name")+"<br>");
//		writer.println("국어 : " + request.getParameter("kor")+"<br>");
//		writer.println("영어 : " + request.getParameter("eng")+"<br>");
//		writer.println("수학 : " + request.getParameter("math")+"<br>");
//		int total = Integer.parseInt(request.getParameter("kor"))+Integer.parseInt(request.getParameter("eng"))+Integer.parseInt(request.getParameter("math"));
//		double avg = total/3.0;
//		writer.println("총점 : " + total +"<br>");
//		writer.println("평균 : " + Math.round(avg*100)/100.0 +"<br>");
//		writer.println("계열선택 : " + request.getParameter("major")+"<br>");
//		String[] subjects = request.getParameterValues("subject");
//		String subject ="";
//		for (int i=0; i<subjects.length;i++) {
//			if (i==0) subject += subjects[i];
//			else subject += ","+subjects[i];
//		}
//		writer.println("좋아하는 과목[배열] : " + Arrays.toString( request.getParameterValues("subject") )+"<br>");
//		writer.println("좋아하는 과목[1개 문자열] : " + subject +"<br>");
//		writer.println("주소 : " + request.getParameter("address") +"<br>");
		
		//테이블 시작
		writer.println("<table>");
		writer.println("<tr><td>학번</td><td> " + request.getParameter("no")+"</td></tr>");
		writer.println("<tr><td>이름</td><td>" + request.getParameter("name")+"</td></tr>");
		writer.println("<tr><td>국어</td><td>" + request.getParameter("kor")+"</td></tr>");
		writer.println("<tr><td>영어</td><td>" + request.getParameter("eng")+"</td></tr>");
		writer.println("<tr><td>수학</td><td>" + request.getParameter("math")+"</td></tr>");
		int total = Integer.parseInt(request.getParameter("kor"))+Integer.parseInt(request.getParameter("eng"))+Integer.parseInt(request.getParameter("math"));
		double avg = total/3.0;
		writer.println("<tr><td>총점</td><td>" + total +"</td></tr>");
		writer.println("<tr><td>평균</td><td>" + Math.round(avg*100)/100.0 +"</td></tr>");
		writer.println("<tr><td>계열선택</td><td>" + request.getParameter("major")+"</td></tr>");
		String[] subjects = request.getParameterValues("subject");
		String subject ="";
		for (int i=0; i<subjects.length;i++) {
			if (i==0) subject += subjects[i];
			else subject += ","+subjects[i];
		}
		writer.println("<tr><td>좋아하는 과목[배열]</td><td>" + Arrays.toString( request.getParameterValues("subject") )+"</td></tr>");
		writer.println("<tr><td>좋아하는 과목[1개 문자열]</td><td>" + subject +"</td></tr>");
		writer.println("<tr><td>주소</td><td>" + request.getParameter("address") +"</td></tr>");
		writer.println("</table>");
		//테이블 끝
		
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}

}
