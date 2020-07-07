<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.vo.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore</title>
<link rel="stylesheet" type="text/css" href="/bookstore/css/bookstore.css">
<style type="text/css">
label {
	font-weight: bold;
}

select {
	display: inline-block;
	width: 200px;
	height: 37px;
}

button {
	height: 37px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%
				String position = "book";
			%>
			<%@ include file="../common/navibar.jsp"%>
		</div>
		<div class="header">
			<h1>책</h1>
		</div>
		<div class="body">
			<%
					BookDao bookDao = new BookDao();
					String genre = StringUtil.nullToBlank(request.getParameter("genre"));
					List<Book> books = null;
					if(genre.isEmpty()){
						books = bookDao.getAllBooks();
					} else {
						books = bookDao.getBooksByGenre(genre);
					}
			%>
			<div>
				<form method="get" action="list.jsp">
					<label>구분</label> 
					<select name="genre">
						<option value="">전체</option>
						<option value="에세이" <%="에세이".equals(genre) ? "selected" : ""%>>에세이</option>
						<option value="한국소설" <%="한국소설".equals(genre) ? "selected" : ""%>>한국소설</option>
						<option value="외국소설" <%="외국소설".equals(genre) ? "selected" : ""%>>외국소설</option>
						<option value="자기계발" <%="자기계발".equals(genre) ? "selected" : ""%>>자기계발</option>
						<option value="경제/경영" <%="경제/경영".equals(genre) ? "selected" : ""%>>경제/경영</option>
						<option value="재테크" <%="재테크".equals(genre) ? "selected" : ""%>>재테크</option>
						<option value="경제" <%="경제".equals(genre) ? "selected" : ""%>>경제</option>
						<option value="인문" <%="인문".equals(genre) ? "selected" : ""%>>인문</option>
						<option value="역사/문화" <%="역사/문화".equals(genre) ? "selected" : ""%>>역사/문화</option>
						<option value="사회" <%="사회".equals(genre) ? "selected" : ""%>>사회</option>
						<option value="예술/대중문화" <%="예술/대중문화".equals(genre) ? "selected" : ""%>>예술/대중문화</option>
						<option value="종교" <%="종교".equals(genre) ? "selected" : ""%>>종교</option>
						<option value="가정/생활/요리" <%="가정/생활/요리".equals(genre) ? "selected" : ""%>>가정/생활/요리</option>
						<option value="건강" <%="건강".equals(genre) ? "selected" : ""%>>건강</option>
						<option value="취미/레저" <%="취미/레저".equals(genre) ? "selected" : ""%>>취미/레저</option>
						<option value="여행/지도" <%="여행/지도".equals(genre) ? "selected" : ""%>>여행/지도</option>
						<option value="외국어" <%="외국어".equals(genre) ? "selected" : ""%>>외국어</option>
						<option value="사전" <%="사전".equals(genre) ? "selected" : ""%>>사전</option>
						<option value="IT" <%="IT".equals(genre) ? "selected" : ""%>>IT</option>
						<option value="자연과학/공학" <%="자연과학/공학".equals(genre) ? "selected" : ""%>>자연과학/공학</option>
						<option value="교재/수험서" <%="교재/수험서".equals(genre) ? "selected" : ""%>>교재/수험서</option>
						<option value="학습/참고서" <%="학습/참고서".equals(genre) ? "selected" : ""%>>학습/참고서</option>
						<option value="청소년" <%="청소년".equals(genre) ? "selected" : ""%>>청소년</option>
						<option value="만화" <%="만화".equals(genre) ? "selected" : ""%>>만화</option>
						<option value="잡지" <%="잡지".equals(genre) ? "selected" : ""%>>잡지</option>
					</select>
					<button type="submit">검색</button>
				</form>
			</div>
			<div>
				<h3>도서 리스트</h3>
				
				<table class="table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>저자</th>
						<th>가격</th>
						<th>평점</th>
						<th></th>
					</tr>
					<%
						for (Book book : books) {
					%>
					<tr>
						<td><%=book.getNo()%></td>
						<td><a href="detail.jsp?bookno=<%=book.getNo()%>"><%=book.getTitle()%></a></td>
						<td><%=book.getWriter()%></td>
						<td><%=NumberUtil.numberWithComma(book.getPrice())%>원</td>
						<td><%=book.getPoint()%></td>
						<td><a href="../order/form.jsp?bookno=<%=book.getNo()%>&amount=1">바로구매</a></td>
					</tr>
					<%
						}
					%>
				</table>
				<hr/>
				<div class="text-right">
				    <a href="form.jsp"><strong>책 등록</strong></a>
				</div>
				
			</div>
		</div>
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>