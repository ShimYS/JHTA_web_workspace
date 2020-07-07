<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="navibar">
    <ul>
        <li class="<%="home".equals(position) ? "active" : ""%>"><a href="/simple_board/home.jsp">홈</a></li>
        <li class="<%="board".equals(position) ? "active" : ""%>"><a href="/simple_board/board/list.jsp">게시판</a></li>
        <li class="<%="my".equals(position) ? "active" : ""%>"><a href="/simple_board/user/my.jsp">내정보</a></li>
      	
      	<%
      		
      	
      		if("Yes".equals(loginedYn)){
      	%>
        <li class="right"><a href="/simple_board/user/logout.jsp">로그아웃</a></li>
      	<%
      		} else {
      	%>
        <li class="right <%="login".equals(position) ? "active" : ""%>" ><a href="/simple_board/user/loginform.jsp">로그인</a></li>
        <li class="right <%="user".equals(position) ? "active" : ""%>" ><a href="/simple_board/user/form.jsp">회원가입</a></li>
       	<%
      		}
       	%>
    </ul>
   	<%
   		if("Yes".equals(loginedYn)) {
   			String name = (String)session.getAttribute("이름"); 		
   	%>
    <p><%=name %>님 환영합니다.</p>
   	<%
   		}
   	%>
</div>