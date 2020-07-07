<%@page import="com.bookstore.vo.Board"%>
<%@page import="com.bookstore.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int boardNo = Integer.parseInt(request.getParameter("boardno"));
	
	BoardDao boardDao = new BoardDao();
	Board oldBoard = boardDao.getBoardByNo(boardNo);
	Board newBoard = new Board();
	
	newBoard.setNo(oldBoard.getNo());
	newBoard.setTitle(oldBoard.getTitle());
	newBoard.setContent(oldBoard.getContent());
	newBoard.setIsdel("Y");
	
	boardDao.updateBoard(newBoard);
	
	response.sendRedirect("list.jsp?bookno="+boardNo);
%>