<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css">
</head>
<body>
    <div class="wrapper">
        <div class="navi">
            <%
            	String position = "login";
            %>
            <%@ include file="../common/navibar.jsp" %>
        </div>
    </div>
    <div class="header">
        <h1>로그인</h1>
    </div>
    <div class="body">
    	<%
    		String error = request.getParameter("error");
    	%>
    	<%
    		if("fail".equals(error)) {
    	%>	    	
	    	<p style="color:red; font-size:italic">아이디 혹은 비밀번호가 올바르지 않습니다.</p>		    	
    	<%
    		}
    	%>
    	<%
    		if("deny".equals(error)) {
    	%>
	    	<p style="color:red; font-size:italic">로그인이 필요한 서비스입니다.</p>	
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
    <%@ include file="../common/footer.jsp"%>
</body>
</html>