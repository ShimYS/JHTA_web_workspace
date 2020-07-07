<%@page import="com.bookstore.dao.BookDao"%>
<%@page import="com.bookstore.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// 요청파라미터값 (폼 입력값 )조회
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String genre = request.getParameter("genre");
	String publisher = request.getParameter("publisher");
	int price = Integer.parseInt(request.getParameter("price"));
	int discountPrice = Integer.parseInt(request.getParameter("discountPrice"));
	int stock = Integer.parseInt(request.getParameter("stock"));
	
	// Book객체에 담기
	Book book = new Book();
	book.setTitle(title);
	book.setWriter(writer);
	book.setGenre(genre);
	book.setPublisher(publisher);
	book.setPrice(price);
	book.setDiscountPrice(discountPrice);
	book.setStock(stock);
	
	// BookDao 생성, 저장하기
	BookDao bookDao = new BookDao();
	bookDao.insertBook(book);
	
	// 클라이언트에 재요청 URL 전송
	response.sendRedirect("list.jsp");
%>
