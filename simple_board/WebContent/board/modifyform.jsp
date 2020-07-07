<%@page import="com.simple.dto.BoardDto"%>
<%@page import="com.simple.vo.Board"%>
<%@page import="com.simple.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp"%>
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
			String position = "board";
		%>
			<%@ include file="../common/navibar.jsp"%>
		</div>
		<div class="header">
			<h1>게시글 수정</h1>
		</div>
		<div class="body">
			<p>게시글 정보를 확인하고 수정하세요</p>
			<div class="well">
				<form method="post" action="modify.jsp">
					<!-- value에는 실제 글번호, 제목 내용이 들어가게 하세요 -->
					<%
						int boardNo = Integer.parseInt(request.getParameter("no"));
						BoardDao boardDao = new BoardDao();
						BoardDto board = boardDao.getBoardByNo(boardNo);
					%>
					<input type="hidden" name="no" value="<%=board.getNo()%>">
					<div class="form-group">
						<label>제목</label>
						<div>
							<input type="text" name="title" value="<%=board.getTitle() %>" />
						</div>
					</div>
					<div class="form-group">
						<label>내용</label>
						<div>
							<textarea rows="12" name="content"><%=board.getContent() %></textarea>
						</div>
					</div>
					<div class="text-right">
						<button type="submit">수정</button>
					</div>
				</form>
			</div>
		</div>
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>
	</div>
</body>
</html>