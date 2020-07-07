<%@page import="com.bookstore.vo.Board"%>
<%@page import="com.bookstore.dao.BoardDao"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	int password = NumberUtil.stringToInt(request.getParameter("password"));
	String isdel = request.getParameter("boardisdel");
	
	BoardDao boardDao = new BoardDao();
	Board oldBoard = boardDao.getBoardByNo(boardNo);
	
	if(password != oldBoard.getPassword()){
		response.sendRedirect("modifyform.jsp?boardno="+boardNo+"&error=pwd");
	} else {
		oldBoard.setTitle(title);
		oldBoard.setContent(content);
		
		boardDao.updateBoard(oldBoard);
		
		response.sendRedirect("detail.jsp?boardno="+boardNo);
	}
%>
