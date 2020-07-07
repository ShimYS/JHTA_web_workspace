<%@page import="com.simple.vo.User"%>
<%@page import="com.simple.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userName = request.getParameter("name");
	String userEmail = request.getParameter("email");
	String userId = request.getParameter("id");
	String userPassword = request.getParameter("pwd");
	
	UserDao userDao = new UserDao();
	if(userDao.getUserById(userId) != null) {
		response.sendRedirect("/simple_board/user/form.jsp?error=dup");
		return;
	}
	
	
	User user = new User();
	user.setName(userName);
	user.setEmail(userEmail);
	user.setId(userId);
	user.setPassword(userPassword);
	
	
	
	userDao.insertUser(user);
	
	response.sendRedirect("/simple_board/home.jsp?status=success");
%>