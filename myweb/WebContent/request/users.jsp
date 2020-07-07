<%@page import="java.util.ArrayList"%>
<%@page import="com.sample.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.sample.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>모든 유저 조회하기</h1>
	
	<%
		UserDao userDao = new UserDao();
		List<User> users = userDao.getAllUsers();
	%>
	
	<table style="border-collapse: collapse;">
		<thead>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>포인트</th>
				<th>등록날짜</th>
			</tr>
		</thead>
		<tbody>
		<%
			for (User user : users) {
		%>
			<tr>
				<td><%=user.getId() %></td>
				<td><%=user.getPassword() %></td>
				<td><%=user.getName() %></td>
				<td><%=user.getEmail() %></td>
				<td><%=user.getPoint() %></td>
				<td><%=user.getRegisteredDate() %></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
</body>
</html>