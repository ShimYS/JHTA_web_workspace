<%@page import="com.simple.dto.BoardDto"%>
<%@page import="com.simple.vo.Reply"%>
<%@page import="com.simple.dao.ReplyDao"%>
<%@page import="com.simple.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.dao.BoardDao"%>
<%@page import="com.simple.dao.UserDao"%>
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
				String position = "my";
			%>
			<%@ include file="../common/navibar.jsp"%>

		</div>
		<div class="header">
			<h1>나의 정보</h1>
		</div>
		<div class="body">
			<p>
				<strong><%=userName%></strong>님의 정보를 확인하세요
			</p>

			<div>
				<h3>내가 작성한 글</h3>
				<table class="table" id="board-table">
					<colgroup>
						<col width="5%">
						<col width="10%">
						<col width="*">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th class="text-center">번호</th>
							<th>제목</th>
							<th class="text-center">조회수</th>
							<th class="text-center">댓글수</th>
							<th class="text-center">삭제여부</th>
							<th class="text-center">등록일</th>
						</tr>
					</thead>
					<%
						BoardDao boardDao = new BoardDao();
						List<BoardDto> boards = boardDao.getBoardById(userId);
					%>
					<tbody>
						<%
							for (BoardDto board : boards) {
						%>
						<tr id="board-<%=board.getNo() %>">
							<td><input type="checkbox"></td>
							<td class="text-center"><%=board.getNo()%></td>
							<td><a href="../board/hit.jsp?no=<%=board.getNo()%>"><%=board.getTitle()%></a></td>
							<td class="text-center"><%=board.getHit()%></td>
							<td class="text-center"><%=board.getCnt()%></td>
							<td class="text-center"><%=board.getDelYn()%></td>
							<td class="text-center"><%=board.getCreateDate()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>

			<div>
				<button onclick="checkedBoardRm()">선택삭제</button>
				<button onclick="AllBoardRm()">전체삭제</button>
			</div>

			<div>
				<h3>내가 작성한 댓글</h3>
				<table class="table" id="reply-table">
					<colgroup>
						<col width="5%">
						<col width="10%">
						<col width="*">
						<col width="10%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th class="text-center">번호</th>
							<th>내용</th>
							<th class="text-center">삭제여부</th>
							<th class="text-center">등록일</th>
							<th class="text-center">삭제</th>
						</tr>
					</thead>
					<%
						ReplyDao replyDao = new ReplyDao();
						List<Reply> replies = replyDao.getReplyByWriter(userId);
					%>
					<tbody>
						<%
							for (Reply reply : replies) {
								if ("Y".equals(reply.getDelYn())) {
						%>
						<tr>
							<td class="text-center" colspan="5"><del>삭제된 댓글입니다.</del></td>
						</tr>
						<%
							} else {
						%>
						<tr id="reply-<%=reply.getNo() %>">
							<td><input type="checkbox"></td>
							<td class="text-center"><%=reply.getNo()%></td>
							<td><%=reply.getContent()%></td>
							<td class="text-center"><%=reply.getDelYn()%></td>
							<td class="text-center"><%=reply.getCreateDate()%></td>
							<td class="text-center"><a
								href="/simple_board/reply/delete.jsp?no=<%=reply.getNo()%>">삭제</a>
							</td>
						</tr>
						<%
							}
							}
						%>
					</tbody>
					<tbody>
					</tbody>
				</table>

				<div>
					<button onclick="checkedReplyRm()">선택삭제</button>
				    <button onclick="AllReplyRm()">전체삭제</button>
				</div>
			</div>
		</div>
		<div class="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>
	</div>


	<script type="text/javascript">
		var boardBody = document.querySelector("#board-table tbody");
		var replyBody = document.querySelector("#reply-table tbody");
		
		function checkedBoardRm() {
            
        }
        
        function AllBoardRm() {
			// 사용자의 모든 board 조회
        	
        	//  board del여부 y로 바꾸기
        	
        	// 업데이트 및 재조회 후 HTML뿌려주기
        	boardBody.innerHTML = ""; // @@@@@@@@@@@@@@@@@@@데이터베이스에 반영되도록 해야할듯?@@@@@@@@@@@@@@@@@@@@@
        }
        
        function checkedReplyRm() {
            
        }
        
        function AllReplyRm(){
        	// 사용자의 모든 reply 조회
        	
        	// reply del여부 y로 바꾸기
        	
        	// 업데이트 및 재조회 후 HTML뿌려주기
        	
        	replyBody.innerHTML = "";
        }
	</script>
</body>
</html>
































