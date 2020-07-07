<%@page import="com.bookstore.vo.Like"%>
<%@page import="com.bookstore.dao.LikeDao"%>
<%@page import="com.bookstore.dao.ReviewDao"%>
<%@page import="com.bookstore.vo.User"%>
<%@page import="com.bookstore.dto.BookOrderDto"%>
<%@page import="com.bookstore.vo.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.OrderDao"%>
<%@page import="com.bookstore.dao.UserDao"%>
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
				String position = "order";
			%>
			<%@ include file="../common/navibar.jsp"%>
		</div>
		<div class="header">
			<%
				String userId = request.getParameter("userid");
				OrderDao orderDao = new OrderDao(); 
				List<BookOrderDto> bookOrderDtos = orderDao.getOrderByUserId(userId);
				
				UserDao userDao = new UserDao();
				User user = userDao.getUserById(userId);
			%>
			<div>
			    <h3><%=user.getName() %>님의 주문내역입니다.</h3>
			    <p>누적포인트:<%=user.getPoint() %>점</p>
			    <table class="table bordered">			    	
			        <thead>
			            <tr>
			                <th>주문번호</th>
			                <th>제목</th>
			                <th>가격</th>
			                <th>수량</th>
			                <th>결재금액</th>
			                <th>구매날짜</th>
			                <th>리뷰</th>
			                <th>추천</th>
			            </tr>
			        </thead>
			        <%
			        	
			        	if(!bookOrderDtos.isEmpty()){
			        				   
			        		for(BookOrderDto orders : bookOrderDtos) {
			        %>
			        <tbody>			   
			            <tr>
			                <td><%=orders.getNo() %></td>
			                <td><a href="../book/detail.jsp?bookno=<%=orders.getBookNo()%>"><%=orders.getBookName() %></a></td>
			                <td><%=orders.getPrice() %></td>
			                <td><%=orders.getAmount() %></td>
			                <td><%=orders.getPrice()*orders.getAmount() %></td>
			                <td><%=orders.getRegisteredDate() %></td>
			                <td>
			                	<%			              
			                		if(orders.isCheckReview()){
			                	%>
			                			<a href="../review/form.jsp?userid=<%=userId%>&bookno=<%=orders.getBookNo()%>">리뷰작성</a>
			                	<% 
			                		} else {		                					          
			                	%>
			                		작성완료
			                	<%
			        				}
			                	%>
			                </td>
			                <td>
			                	<%
			                		LikeDao likeDao = new LikeDao();
			                		List<Like> likes = likeDao.getLikes(orders.getBookNo(), orders.getUserId());
			                		
			                		if(likes.isEmpty()) {
			                	%>
			                			<a href="../book/like.jsp?bookno=<%=orders.getBookNo()%>&userid=<%=orders.getUserId()%>">추천하기</a>
			                	<%
			                		} else {
			                	%>
			                			추천완료
			                	<%
			                		}
			                	%>
			                </td>
			            </tr>
			        <%
			        		}
			        		
			        	} else {
			        		
			        	
			        %>
			        <tr>
						<td colspan="8" style="text-align: center">주문내역이 존재하지 않습니다.</td>
					</tr>
					<%
						}
					%>
			        </tbody>			        	   
			    </table>
			    <div class="text-right">
				    <a href="../user/list.jsp"><strong>사용자 리스트</strong></a>
			    </div>	
			    
			</div>
			
			
		</div>
		<div class="body">
			
		</div>
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>