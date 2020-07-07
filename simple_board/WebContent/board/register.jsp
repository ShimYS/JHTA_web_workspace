<%@page import="com.simple.dao.BoardDao"%>
<%@page import="com.simple.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String boardTitle = request.getParameter("title");
	String boardContent = request.getParameter("content");
	String boardWriter = (String) session.getAttribute("아이디");
	
	Board board = new Board();
	board.setWriter(boardWriter);
	board.setTitle(boardTitle);
	board.setContent(boardContent);
	
	BoardDao boardDao = new BoardDao();
	boardDao.insertBoard(board);
	
	response.sendRedirect("list.jsp");
%>