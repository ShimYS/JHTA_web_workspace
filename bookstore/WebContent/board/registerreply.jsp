<%@page import="com.bookstore.dao.ReplyDao"%>
<%@page import="com.bookstore.vo.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int boardNo = Integer.parseInt(request.getParameter("boardno"));
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	Reply reply = new Reply();
	reply.setBoardNo(boardNo);
	reply.setWriter(writer);
	reply.setContent(content);
	
	ReplyDao replyDao = new ReplyDao();
	replyDao.insertReply(reply);
	
	response.sendRedirect("detail.jsp?boardno="+boardNo);
%>
