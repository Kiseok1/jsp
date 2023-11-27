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

public class N_ReplyInsertService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//dao접근
		BoardDao bdao = new BoardDao();
		
		//변수선언
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("session_id");
		String btitle="",bcontent="",bfile="";
		int bgroup=0,bstep=0,bindent=0;
		
		//form 데이터 처리 multipart
		String upload = "c:/upload";
		int size = 10*1024*1024;
		
		try {
			MultipartRequest multi = new MultipartRequest(request, upload, size, "utf-8", new DefaultFileRenamePolicy());
			btitle = multi.getParameter("btitle");
			bcontent = multi.getParameter("bcontent");
			bgroup = Integer.parseInt(multi.getParameter("bgroup"));
			bstep = Integer.parseInt(multi.getParameter("bstep"));
			bindent = Integer.parseInt(multi.getParameter("bindent"));
			//input type=file 인 것 이름 모두를 가져옴.
			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements()) {
				String f = (String) files.nextElement(); //형변환
				bfile = multi.getFilesystemName(f); //똑같은 파일이 있을경우 이름을 변경해서 저장
			}
			
			BoardDto bdto = new BoardDto(btitle, bcontent, id,bgroup,bstep,bindent, bfile);
			//dao접근 - 게시글 저장메소드 호출
			//1. bstep bstep 큰수들을 1씩 증가
			bdao.stepUp(bgroup,bstep);
			//2. 답글달기 저장
			int result = bdao.replyInsert(bdto);
			
			//request추가
			request.setAttribute("result", result);
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
