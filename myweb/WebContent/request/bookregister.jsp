<%@page import="com.sample.dao.BookDao"%>
<%@page import="com.sample.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>책 등록 조회하기</h1>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String title = request.getParameter("bookname");
		String writer = request.getParameter("bookwriter");
		String genre = request.getParameter("bookgenre");
		String publisher = request.getParameter("bookpublisher");
		int price = Integer.parseInt(request.getParameter("bookprice"));
		int discountprice = Integer.parseInt(request.getParameter("bookdiscountprice"));
		int stock = Integer.parseInt(request.getParameter("bookstock"));
		
		Book book = new Book();
		book.setTitle(title);
		book.setWriter(writer);
		book.setGenre(genre);
		book.setPublisher(publisher);
		book.setPrice(price);
		book.setDiscountPrice(discountprice);
		book.setStock(stock);
		
		BookDao bookDao = new BookDao();
		bookDao.insertBook(book);
	%>
	
	<h1>책 등록 완료</h1>
	
	<p>새로운 책이 등록되었습니다.</p>
</body>
</html>





