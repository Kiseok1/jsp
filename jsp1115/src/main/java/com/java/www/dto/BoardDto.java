package com.java.www.dto;

import java.sql.Timestamp;

public class BoardDto {
	
	public BoardDto() {}

	public BoardDto(String btitle, String bcontent, String id, String bfile) {
		
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.id = id;
		this.bfile = bfile;
	}

	public BoardDto(int bno, String btitle, String bcontent, Timestamp bdate, String id,int bgroup, int bstep, int bindent, int bhit,  
			String bfile) {
		this.bno = bno;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.bhit = bhit;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.id = id;
		this.bfile = bfile;
		this.bdate = bdate;
	}



	private int bno,bgroup,bstep,bindent,bhit;
	private String btitle,bcontent,id,bfile;
	private Timestamp bdate;
	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public int getBgroup() {
		return bgroup;
	}


	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}


	public int getBstep() {
		return bstep;
	}


	public void setBstep(int bstep) {
		this.bstep = bstep;
	}


	public int getBindent() {
		return bindent;
	}


	public void setBindent(int bindent) {
		this.bindent = bindent;
	}


	public int getBhit() {
		return bhit;
	}


	public void setBhit(int bhit) {
		this.bhit = bhit;
	}


	public String getbtitle() {
		return btitle;
	}


	public void setbtitle(String btitle) {
		this.btitle = btitle;
	}


	public String getBcontent() {
		return bcontent;
	}


	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getBfile() {
		return bfile;
	}


	public void setBfile(String bfile) {
		this.bfile = bfile;
	}


	public Timestamp getBdate() {
		return bdate;
	}


	public void setBdate(Timestamp bdate) {
		this.bdate = bdate;
	}
	
	
	
	
}
