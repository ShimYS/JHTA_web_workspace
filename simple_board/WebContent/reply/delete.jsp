<%@page import="com.simple.vo.Reply"%>
<%@page import="com.simple.dao.ReplyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int replyNo = Integer.parseInt(request.getParameter("no"));
	
	ReplyDao replyDao = new ReplyDao();
	Reply reply = replyDao.getReplyByNo(replyNo);
	
	reply.setDelYn("Y");
	replyDao.updateReply(reply);
	
	response.sendRedirect("/simple_board/user/my.jsp");
%>