<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String loginedYn = (String) session.getAttribute("로그인여부");
	String loginedUserId = (String) session.getAttribute("아이디");
	String loginedUserName = (String) session.getAttribute("이름");
	
	if(loginedYn == null){
		response.sendRedirect("/bookstore/user/loginform.jsp?error=deny");
		return;
	}
	
%>