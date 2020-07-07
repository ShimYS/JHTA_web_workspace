<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="navibar">
	<ul>
		<li class="<%="home".equals(position) ? "active" : ""%>"><a href="/bookstore/home.jsp">홈</a></li>
		<li class="<%="book".equals(position) ? "active" : ""%>"><a href="/bookstore/book/list.jsp">도서</a></li>
		<li class="<%="user".equals(position) ? "active" : ""%>"><a href="/bookstore/user/list.jsp">사용자</a></li>
		<li class="<%="order".equals(position) ? "active" : ""%>"><a href="/bookstore/order/all.jsp">주문</a></li>
		<li class="<%="board".equals(position) ? "active" : ""%>"><a href="/bookstore/board/list.jsp">자유게시판</a></li>
		
		<%
			String isLogined = (String)session.getAttribute("로그인여부");
		%>
		
		<%
			if("Yes".equals(isLogined)){
				String userName = (String) session.getAttribute("이름");
				String userId = (String) session.getAttribute("아이디");
		%>
			<li class="right"><a href="/bookstore/user/logout.jsp">로그아웃</a></li>
		<% 		
			} else {
		%>
			<li class="right"><a href="/bookstore/user/form.jsp">회원가입</a></li>
			<li class="right"><a href="/bookstore/user/loginform.jsp">로그인</a></li>
		<%
			}
		%>
		
		
	</ul>
	<%
		if("Yes".equals(isLogined)) {
			String userName = (String) session.getAttribute("이름");
		
	%>
	<p><%=userName %>님 환영합니다.</p>
	<%
		}
	%>
</div>