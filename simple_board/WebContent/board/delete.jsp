<%@page import="com.simple.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<%
	int boardNo = Integer.parseInt(request.getParameter("no"));

	BoardDao boardDao = new BoardDao();
	boardDao.deleteBoard(boardNo);
	
	response.sendRedirect("list.jsp");
%>