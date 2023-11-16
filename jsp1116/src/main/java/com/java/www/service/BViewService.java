package com.java.www.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.dao.BoardDao;
import com.java.www.dto.BoardDto;

public class BViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		System.out.println("BViewService bno : "+bno);
		
		BoardDao bdao = new BoardDao();
		BoardDto bdto = bdao.bSelectOne(bno);
		
		if(bdto!=null) {
			System.out.println("bdto성공");
			request.setAttribute("bdto", bdto);
		}

	}

}
