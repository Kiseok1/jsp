package com.java.www.service;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.www.dao.BoardDao;
import com.java.www.dto.BoardDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class N_UpdateService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//dao접근
		BoardDao bdao = new BoardDao();
		
		//변수선언
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("session_id");
		String btitle="",bcontent="",bfile="",category="",sword="";
		int bno=0,page=1;
		
		//form 데이터 처리 multipart
		String upload = "c:/upload";
		int size = 10*1024*1024;
		
		try {
			MultipartRequest multi = new MultipartRequest(request, upload, size, "utf-8", new DefaultFileRenamePolicy());
			bno = Integer.parseInt(multi.getParameter("bno"));
			page = Integer.parseInt(multi.getParameter("page"));
			btitle = multi.getParameter("btitle");
			category = multi.getParameter("category");
			sword = multi.getParameter("sword");
			bcontent = multi.getParameter("bcontent");
			//파일첨부가 되지 않았을때 이전파일을 그대로 사용
			bfile = multi.getParameter("oldfile");
			//input type=file 인 것 이름 모두를 가져옴.
			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements()) {
				String f = (String) files.nextElement(); //형변환
				String tempfile = multi.getFilesystemName(f); //똑같은 파일이 있을경우 이름을 변경해서 저장
				if(tempfile!=null) bfile =tempfile;
			}

			BoardDto bdto = new BoardDto(bno, btitle, bcontent, id, bfile);
			//dao접근 - 게시글 저장메소드 호출
			int result = bdao.update(bdto);
			
			//request추가
			request.setAttribute("result", result);
			request.setAttribute("page", page);
			request.setAttribute("category", category);
			request.setAttribute("sword", sword);
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
