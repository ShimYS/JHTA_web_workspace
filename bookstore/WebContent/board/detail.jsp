<%@page import="com.bookstore.dto.BookBoardDto"%>
<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="com.bookstore.vo.Reply"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.ReplyDao"%>
<%@page import="com.bookstore.vo.Board"%>
<%@page import="com.bookstore.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore</title>
<link rel="stylesheet" type="text/css"
	href="/bookstore/css/bookstore.css">
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
			<h1>게시글 정보</h1>
		</div>
		<div class="body">
			<%		
				int boardNo = Integer.parseInt(request.getParameter("boardno"));
				BoardDao boardDao = new BoardDao();
				BookBoardDto board = boardDao.getBoardByNo(boardNo);
				ReplyDao replyDao = new ReplyDao();
				List<Reply> replys = replyDao.getReplyByNo(Integer.parseInt(request.getParameter("boardno")));
			%>
			<div>
				<p>게시글의 내용을 확인하세요.</p>
				<table class="table bordered">
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="10%">
						<col width="40%">
					</colgroup>

					<tr>
						<th>작성자</th>
						<td><%=board.getWriter()%></td>
						<th>등록일</th>
						<td><%=board.getRegistered_date()%></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><%=board.getHit()%></td>
						<th>댓글개수</th>
						<td><%=board.getReplyCount() %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><%=board.getContent()%></td>
					</tr>

				</table>
				<hr>
				<div class="text-right">
					<a href="modifyform.jsp?boardno=<%=boardNo%>"><strong>[수정]</strong></a> 
					<a href="delete.jsp?boardno=<%=boardNo%>"><strong>[삭제]</strong></a>
					<a href="list.jsp"><strong>[목록으로 가기]</strong></a>
				</div>
			</div>
			<div>
				<div>
					<p>댓글을 확인하세요</p>
					<%
						for(Reply reply : replys) {
					%>
					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="40%">
							<col width="10%">
							<col width="40%">
						</colgroup>
						<tr>
							<th>작성자</th>
							<td><%=reply.getWriter() %></td>
							<th>등록일</th>
							<td><%=reply.getRegisteredDate() %></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><%=StringUtil.textWithBr(reply.getContent())%></td>
						</tr>
					</table>
					<%
						}
					%>
				</div>
				
				<div class="well">
					<form method="post" action="registerreply.jsp">
						<input type="hidden" name="boardno" value="<%=boardNo%>">
						<div class="form-group">
							<label>작성자</label>
							<div>
								<input type="text" name="writer" />
							</div>
						</div>
						<div class="form-group">
							<label>내용</label>
							<div>
								<textarea rows="4" name="content"></textarea>
							</div>
						</div>
						<div class="text-right">
							<button type="submit">등록</button>
						</div>
					</form>
				</div>
			</div>

		</div>
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>