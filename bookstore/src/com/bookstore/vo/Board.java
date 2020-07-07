package com.bookstore.vo;

import java.util.Date;

public class Board {
	private int no;
	private String title;
	private String writer;
	private String content;
	private int password;
	private int hit;
	private String isdel;
	private Date registered_date;
	
	public Board () {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPassword() {
		return password;
	}

	public void setPassword(int password) {
		this.password = password;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	

	public String getIsdel() {
		return isdel;
	}

	public void setIsdel(String isdel) {
		this.isdel = isdel;
	}

	public Date getRegistered_date() {
		return registered_date;
	}

	public void setRegistered_date(Date registered_date) {
		this.registered_date = registered_date;
	}
	
	
}
