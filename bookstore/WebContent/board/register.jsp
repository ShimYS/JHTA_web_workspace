<%@page import="com.bookstore.vo.Board"%>
<%@page import="com.bookstore.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	int password = Integer.parseInt(request.getParameter("password"));
	
	Board board = new Board();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	board.setPassword(password);
	
	BoardDao boardDao = new BoardDao();
	boardDao.insertBoard(board);
	
	response.sendRedirect("list.jsp");
%>