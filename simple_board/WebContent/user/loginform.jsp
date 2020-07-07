<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple Board</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
</head>
<body>
<div class="wrapper">
	<div class="navi">
	<%
		String position = "login";
	%>
		<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>심플한 커뮤티니 게시판</h1>
	</div>
	<div class="body">
		<%
			String error = request.getParameter("error");
		
			if("fail".equals(error)){
		%>
		<p>아이디 혹은 비밀번호가 올바르지 않습니다.</p>
		<p>로그인 후 사용할 수 있는 서비스입니다.</p>
		<%
			} 
		%>
		<%
			if("deny".equals(error)){
		%>
		<p>아이디와 비밀번호를 입력하세요</p>
		<%
			}
		%>
		<p>로그인 정보를 입력하세요.</p>
        <div class="well">
            <form method="post" action="login.jsp">
                <div class="form-group">
                    <label for="">아이디</label>
                    <div><input type="text" name="userid"></div>
                </div>
                <div class="form-group">
                    <label for="">비밀번호</label>
                    <div><input type="password" name="userpassword"></div>
                </div>
                <div class="text-right">
                    <button type="submit">로그인</button>
                </div>
            </form>
        </div>
	</div>
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
</body>
</html>