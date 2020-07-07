<%@page import="com.bookstore.dao.LikeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int bookNo = Integer.parseInt(request.getParameter("bookno"));
	String userId = request.getParameter("userid");

	LikeDao likeDao = new LikeDao();
	likeDao.insertLike(bookNo, userId);
	
	response.sendRedirect("../book/detail.jsp?bookno="+bookNo);
%>