<%@page import="com.simple.vo.User"%>
<%@page import="com.simple.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String Id = request.getParameter("userid");
	String userPassword = request.getParameter("userpassword");
	
	UserDao userDao = new UserDao();
	User user = userDao.getUserById(Id);
	
	if(user == null){
		response.sendRedirect("/simple_board/user/loginform.jsp?error=deny");
		return;
	}
	
	if(!userPassword.equals(user.getPassword())){
		response.sendRedirect("/simple_board/user/loginform.jsp?error=fail");
		return;
	}
	
	session.setAttribute("아이디", user.getId());
	session.setAttribute("이름", user.getName());
	session.setAttribute("로그인여부", "Yes");
	
	response.sendRedirect("/simple_board/home.jsp");
%>