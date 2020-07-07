<%@page import="com.simple.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int boardNo = Integer.parseInt(request.getParameter("no"));
	
	BoardDao boardDao = new BoardDao();
	boardDao.increaseHit(boardNo);
	
	response.sendRedirect("detail.jsp?no="+boardNo);
%>