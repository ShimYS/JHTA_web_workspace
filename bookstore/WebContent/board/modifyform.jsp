<%@page import="com.bookstore.dto.BookBoardDto"%>
<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.dao.BoardDao"%>
<%@page import="com.bookstore.vo.Board"%>
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
			<h1>게시글 수정</h1>
		</div>
		<div class="body">
			<%
				int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
				BoardDao boardDao = new BoardDao();
				BookBoardDto oldBoard = boardDao.getBoardByNo(boardNo);
				String error = StringUtil.nullToBlank(request.getParameter("error"));
			%>
			<h3>게시글을 수정하세요</h3>
			<%
				if("pwd".equals(error)) {
			%>
				<p style="color:red;">비밀번호가 일치하지 않습니다.</p>
			<%
				}
			%>
			<div class="well">
			    <form method="post" action="update.jsp">
			    	<input type="hidden" name="boardisdel" value="N">
			    	<input type="hidden" name="boardno" value="<%=boardNo%>">
			        <div class="form-group">
			            <label>제목</label>
			            <div><input type="text" name="title" value="<%=oldBoard.getTitle() %>"></div>
			        </div>
			        <div class="form-group">
			            <label>작성자</label>
			            <div><input type="text" name="writer" value="<%=oldBoard.getWriter() %>" disabled></div>
			        </div>
			        
			        <div class="form-group">
			            <label>내용</label>
			            <textarea name="content" rows="6"><%=oldBoard.getContent() %></textarea>
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