<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.dto.BookDetailDto"%>
<%@page import="com.bookstore.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/bookstore/css/bookstore.css">
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%
				String position = "order";
			%>
			<%@ include file="../common/navibar.jsp"%>
		</div>
		<div class="header">
			<h1>주문하기</h1>
		</div>
		<div class="body">
			<%
				int bookNo = Integer.parseInt(request.getParameter("bookno"));
				int amount = Integer.parseInt(request.getParameter("amount"));
				
				BookDao bookDao = new BookDao();
				BookDetailDto bookDetailDto = bookDao.getBookByNo(bookNo);
				
			%>
			<p>주문정보를 확인하세요.</p>
			<div>
			    <table class="table bordered">
			        <tbody>
			            <tr>
			                <th>제목</th>
			                <td colspan="3"><%=bookDetailDto.getTitle() %></td>
			            </tr>
			            <tr>
			                <th>저자</th>
			                <td><%=bookDetailDto.getWriter() %></td>
			                <th>출판서</th>
			                <td><%=bookDetailDto.getPublisher() %></td>
			            </tr>
			            <tr>
			                <th>가격</th>
			                <td><%=NumberUtil.numberWithComma(bookDetailDto.getPrice()) %>원</td>
			                <th>할인가격</th>
			                <td><%=NumberUtil.numberWithComma(bookDetailDto.getDiscountPrice()) %>원</td>
			            </tr>
			        </tbody>
			    </table>
			</div>
			<div class="well">
			    <form method="post" action="order.jsp">
			    	<!-- hidden, 전달할 정보 -->			 
			    	<input type="hidden" name="price" value="<%=bookDetailDto.getDiscountPrice()%>">
			    	<input type="hidden" name="amount" value="<%=amount%>">
			    	<input type="hidden" name="bookno" value="<%=bookNo%>">
			    	
			    	<!-- 사용자에게 보여주는곳 -->			      
			        <!-- disabled는 전달되지 않는다 => hidden으로 숨겨놓고 전달 -->
			        <div class="form-group">
			            <label>구매가격</label>
			            <div><input type="text" value="<%=NumberUtil.numberWithComma(bookDetailDto.getDiscountPrice())%>원" disabled readonly></div>
			        </div>
			        <div class="form-group">
			            <label>구매수량</label>
			            <div><input type="text" value="<%=amount%>개" disabled readonly></div>
			        </div>
			        <div class="text-right">
			            <button type="submit">주문하기</button>
			        </div>
			    </form>
			</div>
		</div>
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>