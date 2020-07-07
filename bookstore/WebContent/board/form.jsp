<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore</title>
<link rel="stylesheet" type="text/css" href="/bookstore/css/bookstore.css">
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%
				String position = "board";
			%>
			<%@ include file="../common/navibar.jsp"%>
		</div>
		<div class="header">
			<h1>자유게시판</h1>
		</div>
		<div class="body">
			<h3>게시판 글 작성</h3>
			<div class="well">
			    <form method="post" action="register.jsp">
			        <div class="form-group">
			            <label>제목</label>
			            <div><input type="text" name="title"></div>
			        </div>
			        <div class="form-group">
			            <label>작성자</label>
			            <div><input type="text" name="writer"></div>
			        </div>
			        
			        <div class="form-group">
			            <label>내용</label>
			            <textarea name="content" rows="6"></textarea>
			        </div>
			        <div class="form-group">
			            <label>비밀번호</label>
			            <div><input type="password" name="password" maxlength="4"></div>
			        </div>			  		    
			        <div class="text-right">
			            <button type="submit">등록</button>
			        </div>
			    </form>
			</div>
		</div>
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>