<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	if(!"Yes".equals(loginedYn)){
		response.sendRedirect("/simple_board/user/loginform.jsp?error=deny");
		return;
	}
%>