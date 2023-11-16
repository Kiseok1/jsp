package com.java.www.dto;

import java.sql.Timestamp;

public class MemberDto {

	public MemberDto() {}
	public MemberDto(String id, String pw, String name, String phone, String gendr, String hobby) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.gendr = gendr;
		this.hobby = hobby;
	}

	public MemberDto(String id, String pw, String name, String phone, String gendr, String hobby, Timestamp mdate) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.gendr = gendr;
		this.hobby = hobby;
		this.mdate = mdate;
	}
	
	private String id,pw,name,phone,gendr,hobby;
	private Timestamp mdate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGendr() {
		return gendr;
	}
	public void setGendr(String gendr) {
		this.gendr = gendr;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public Timestamp getMdate() {
		return mdate;
	}
	public void setMdate(Timestamp mdate) {
		this.mdate = mdate;
	}
	
}
