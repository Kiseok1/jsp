package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.multi.MultiMenuItemUI;

import com.java.www.dao.BoardDao;
import com.java.www.dao.MemberDao;
import com.java.www.dto.BoardDto;
import com.java.www.dto.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/Do_bwrite")
public class Do_bwrite extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8"); //한글처리
		//파일첨부선언
		//String uPath = request.getRealPath("fupload"); //경로
		String uPath = "c:/upload"; //절대경로
		int size=10*1024*1024; // 10Mb = 1024b * 1024kb * 10mb //파일크기
		//request, 파일저장경로, 크기, 인코딩, 같은이름변경정책(1.jpg 중복존재시 -> 1(0).jpg)
		
		//객체선언할때 파일을 업로드 시킴
		MultipartRequest multi = new MultipartRequest(request, uPath, size, "utf-8", new DefaultFileRenamePolicy());
		String btitle=multi.getParameter("btitle");
		String id=multi.getParameter("id");
		String bcontent=multi.getParameter("bcontent");
		Enumeration files = multi.getFileNames();
		
		//파일1개 업로드
		String file1 = (String)files.nextElement(); //input name
		String ofile = multi.getOriginalFileName(file1); //원본 파일이름
		String bfile = multi.getFilesystemName(file1); //업로드된 파일이름
		
		BoardDto bdto = new BoardDto(btitle,bcontent,id,bfile);
		BoardDao bdao = new BoardDao();
		int result = bdao.insertOne(bdto);
		
		//페이지 이동
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html>");
		writer.println("<head><title>게시글 저장</title></head>");
		writer.println("<body>");
		writer.println("<script>");
		writer.println("alert('게시글을 저장했습니다.')");
		writer.println("location.href='blist.jsp'");
		writer.println("</script>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
		
		//파일 3개 업로드
//		String[] file_arr = new String[3]; //input name
//		String[] ofile = new String[3]; //원본 파일이름
//		String[] bfile = new String[3];	//업로드된 파일이름
//		int i=0;
//		while(files.hasMoreElements()) {
//			file_arr[i] = (String) files.nextElement(); //bfile,bfile2,bfile3
//			ofile[i] = multi.getOriginalFileName(file_arr[i]);
//			bfile[i] = multi.getFilesystemName(file_arr[i]); // 1.jpg,2.jpg,3.jpg
//			i++;
//		}
		
		System.out.println(btitle);
		System.out.println(id);
		System.out.println(bcontent);

		//1개일때
		System.out.println("input name : "+file1); 
		System.out.println("원본 파일이름 : "+ofile); 
		System.out.println("저장된 파일이름 : "+bfile);
		
		//3개일때
//		for(int j=0;j<file_arr.length;j++) {
//			System.out.println("input name : "+file_arr[j]); 
//			System.out.println("원본 파일이름 : "+ofile[j]); 
//			System.out.println("저장된 파일이름 : "+bfile[j]);
//		}
		
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
