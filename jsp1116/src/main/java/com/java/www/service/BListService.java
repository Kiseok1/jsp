package com.java.www.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.dao.BoardDao;
import com.java.www.dto.BoardDto;

public class BListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDao bdao = new BoardDao();
		//게시글 전체 가져오기
		ArrayList<BoardDto> list = bdao.bListSelectAll();
		
		System.out.println("BListService bno : "+list.get(0).getBno());
		
		//request 담기
		if(list!=null) {
			System.out.println("list성공");
			request.setAttribute("list", list);
		} else {
			System.out.println("list실패");
		}

	}

}
