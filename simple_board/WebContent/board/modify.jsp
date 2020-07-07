  
<%@page import="com.simple.dto.BoardDto"%>
<%@page import="com.simple.vo.Board"%>
<%@page import="com.simple.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	int boardNo = Integer.parseInt(request.getParameter("no"));
	String boardTitle = request.getParameter("title");
	String boardContent = request.getParameter("content");
	
	BoardDao boardDao = new BoardDao();
	BoardDto board = boardDao.getBoardByNo(boardNo);
	if(!userId.equals(board.getWriter())){
		response.sendRedirect("detail.jsp?no="+boardNo);
		return;
	}
	
	board.setTitle(boardTitle);
	board.setContent(boardContent);
	
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?no="+boardNo);
%>