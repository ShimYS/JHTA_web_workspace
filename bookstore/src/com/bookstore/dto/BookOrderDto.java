package com.bookstore.dto;

import java.sql.Date;

public class BookOrderDto {
	private int no;
	private String userId;
	private int bookNo;
	private int price;
	private int amount;
	private Date registeredDate;
	private String bookName;
	private boolean checkReview;
	
	public BookOrderDto () {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public boolean isCheckReview() {
		return checkReview;
	}

	public void setCheckReview(boolean checkReview) {
		this.checkReview = checkReview;
	}
		
}
