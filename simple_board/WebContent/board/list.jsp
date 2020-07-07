<%@page import="com.simple.dto.BoardDto"%>
<%@page import="com.simple.util.NumberUtil"%>
<%@page import="com.simple.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.dao.BoardDao"%>
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
		String position = "board";
	%>
		<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>게시글</h1>
	</div>
	<div class="body">
		<%
			int rowsPerPage = 10;
			int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);
			int beginRowNumber = (pageNo - 1)*rowsPerPage + 1;
			int endRowNumber = pageNo*rowsPerPage;

			BoardDao boardDao = new BoardDao();
			List<BoardDto> boards = boardDao.getAllBoardByRange(beginRowNumber, endRowNumber);					
		%>
		
		<div>
			<p>게시글 목록을 확인하세요</p>
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">번호</th>
						<th>제목</th>
						<th class="text-center">작성자</th>
						<th class="text-center">조회수</th>
						<th class="text-center">댓글수</th>
						<th class="text-center">등록일</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(BoardDto board : boards) {
							if("Y".equals(board.getDelYn())){
					%>
					<tr>
						<td class="text-center"><%=board.getNo() %></td>
						<td colspan="5"><del>삭제된 글입니다.</del></td>
					</tr>
					<%		
							} else {
					%>
					<tr>
						<td class="text-center"><%=board.getNo() %></td>
						<td><a href="hit.jsp?no=<%=board.getNo()%>"><%=board.getTitle() %></a></td>
						<td class="text-center"><a href="writers.jsp?userid=<%=board.getWriter()%>"><%=board.getWriterName() %></a></td>
						<td class="text-center"><%=board.getHit() %></td>
						<td class="text-center"><%=board.getCnt() %></td>
						<td class="text-center"><%=board.getCreateDate() %></td>
					</tr>
					
					
					<%
							}
						}
					%>
				</tbody>
			</table>
		</div>
		
		<div class="text-center">
		<%
			int pagesPerBlock = 5;
			int rows = boardDao.getBoardCount();
			int totalPages = (int) Math.ceil((double)rows/rowsPerPage);
			int totalBlocks = (int) Math.ceil((double)totalPages/pagesPerBlock);
			int currentBlock = (int) Math.ceil((double)pageNo/pagesPerBlock);
			
			int beginPageNo = (currentBlock - 1)*pagesPerBlock +1;
			int endPageNo = currentBlock*pagesPerBlock;
			if(currentBlock == totalBlocks){
				endPageNo = totalPages;
			}				
		%>
			<div class="pagination">
		<%
				if(pageNo > 1) {	
		%>
				<a href="list.jsp?page=<%=pageNo -1%>">이전</a>				
		<%
				}
		%>
		
		<%
				for (int num=beginPageNo; num<=endPageNo; num++) {
		%>
				<a href="list.jsp?page=<%=num %>" class="<%=pageNo==num ? "active" : ""%>"><%=num %></a>
		<%
				}
		%>
				
		<%
				if(pageNo < totalPages) {
		%>		
					<a href="list.jsp?page=<%=pageNo + 1%>">다음</a>
		<%
				}
		%>
			</div>
		</div>
		
		<div class="text-right">
			[<a href="form.jsp">글 쓰기</a>]
		</div>
	</div>
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
</body>
</html>



























