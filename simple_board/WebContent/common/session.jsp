<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)session.getAttribute("아이디");
	String userName = (String)session.getAttribute("이름");
	String loginedYn = (String)session.getAttribute("로그인여부");
%>