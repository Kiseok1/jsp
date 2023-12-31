package com.java.www.service;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.dao.BoardDao;
import com.java.www.dto.BoardDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BInsertService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//dao접근
		BoardDao bdao = new BoardDao();
		
		//변수 선언
		String btitle="",bcontent="",id="",bfile="";
		int result=0;
		BoardDto bdto = null;
		
		//form에서 파일 가져오기
		String upath = "c:/upload";
		int size = 10*1024*1024; //10Mb
		
		try {
			MultipartRequest multi = new MultipartRequest(request, upath, size, "utf-8", new DefaultFileRenamePolicy());
			btitle =  multi.getParameter("btitle");
			bcontent = multi.getParameter("bcontent");
			id = multi.getParameter("id");
			
			//파일이름 가져오기
			Enumeration files = multi.getFileNames(); //type="file" 모두 읽기(name="bfile",name="bfile2",name="bfile3")
			while(files.hasMoreElements()) {
				String f = (String)files.nextElement(); //f에 name="bfile"의 "bfile"저장/name="bfile2"의 "bfile2" 저장/name="bfile3"의 "bfile3" 저장
				//System.out.println(f);
				bfile = multi.getFilesystemName(f); //bfile에 name="bfile",name="bfile2",name="bfile3"의 value저장
			}
			
			bdto = new BoardDto(btitle, bcontent, id, bfile);
			//dao호출
			result = bdao.bInsert(bdto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
