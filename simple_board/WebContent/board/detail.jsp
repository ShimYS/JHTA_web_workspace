<%@page import="com.simple.dto.ReplyDto"%>
<%@page import="com.simple.dto.BoardDto"%>
<%@page import="com.simple.vo.Reply"%>
<%@page import="com.simple.dao.ReplyDao"%>
<%@page import="com.simple.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple Board</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<style>
	.bold-bordered {
		border-bottom: 1px double black;
	}
</style>
</head>
<body>
<div class="wrapper">
	<div class="navi">
	<%
		String position = "board";
	%>
		<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>게시글 상세정보</h1>
	</div>
	<div class="body">
		<p>게시글의 내용을 확인하고, 댓글도 달아보세요.</p>
		<div>
			<table class="table bordered">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<%
					int boardNo = Integer.parseInt(request.getParameter("no"));
					BoardDao boardDao = new BoardDao();
					BoardDto board = boardDao.getBoardByNo(boardNo);
					
				%>
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="3"><%=board.getTitle() %></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><a href="writers.jsp?userid=hong"><%=board.getWriterName() %></a></td>
						<th>등록일</th>
						<td><%=board.getCreateDate() %></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><%=board.getHit() %></td>
						<th>댓글갯수</th>
						<td><%=board.getCnt() %></td>
					</tr>
					<tr>
						<th style="vertical-align: top;">내용</th>
						<td colspan="3" style="vertical-align:top; height:150px; min-height: 150px;"><%=board.getContent() %></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="text-right">
		<%
			if("Yes".equals(loginedYn) && userId.equals(board.getWriter())) {
		%>
			[<a href="modifyform.jsp?no=<%=boardNo%>">수정하기</a>]
			[<a href="delete.jsp?no=<%=boardNo%>">삭제하기</a>]			
		<%
			}
		%>
			[<a href="list.jsp">목록가기</a>]
		</div>
		
		<div>
			<p>댓글을 확인하세요.</p>
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<%
					ReplyDao replyDao = new ReplyDao();
					List<ReplyDto> replies = replyDao.getReplyByBoardno(boardNo);
				%>
				<tbody>
				<%
					for (ReplyDto reply : replies) {
						if("Y".equals(reply.getDelYn())) {
				%>
					<tr>
						<td class="text-center" colspan="4"><del>삭제된 댓글입니다.</del></td>
					</tr>
				<%
						} else {
				%>
					<tr>
						<th>작성자</th>
						<td><%=reply.getWriterName() %></td>
						<th>등록일</th>
						<td><%=reply.getCreateDate() %></td>
					</tr>
					<tr class="bold-bordered">
						<th>내용</th>
						<td colspan="3"><%=reply.getContent() %></td>
					</tr>
				<%
						}
					}
				%>
				</tbody>
			</table>
			<br/>
			<div class="well">
				<form method="post" action="../reply/register.jsp">
					<input type="hidden" name="boardno" value="<%=boardNo%>"/>
					<div class="form-group">
						<textarea rows="3" name="content"></textarea>
					</div>
					<div class="text-right">
						<button type="submit">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
</body>
</html>