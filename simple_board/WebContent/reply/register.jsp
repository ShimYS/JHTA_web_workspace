<%@page import="com.simple.vo.Reply"%>
<%@page import="com.simple.dao.ReplyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int boardNo = Integer.parseInt(request.getParameter("boardno"));
	String ReplyContent = request.getParameter("content");
	String ReplyWriter = (String) session.getAttribute("아이디");
	
	Reply reply = new Reply();
	reply.setBoardNo(boardNo);
	reply.setContent(ReplyContent);
	reply.setWriter(ReplyWriter);
	
	ReplyDao replyDao = new ReplyDao();
	replyDao.insertReply(reply);
	
	response.sendRedirect("../board/detail.jsp?no="+boardNo);
%>