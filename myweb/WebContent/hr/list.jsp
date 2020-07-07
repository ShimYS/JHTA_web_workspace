<%@page import="com.sample.util.NumberUtil"%>
<%@page import="com.sample.dao.EmployeeDao"%>
<%@page import="com.sample.vo.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>사원 리스트</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<h1>사원 리스트</h1>
		</div>
		<div class="body">
		<%
			// 1. 한 화면에 표시할 행의 갯수
			int rowsPerPage = 15;
			
			// 2. 클라이언트가 요청한 페이지 번호 조회하기
			int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);
			
			// 3. 조회할 목록의 시작번호와 끝번호를 조회한다.
			int beginRowNumber = (pageNo - 1)*rowsPerPage + 1;
			int endRowNumber = pageNo*rowsPerPage;
			
			// 4. 화면에 표시할 목록 조회하기
			EmployeeDao employeeDao = new EmployeeDao();
			List<Employee> employees = employeeDao.getEmployeesByRange(beginRowNumber, endRowNumber);
			
			
		%>	
			<div>
                <p>사원 목록을 확인하세요.</p>
			    <table class="table">
                    <thead>
                        <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>직종</th>
                            <th>소속부서명</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                         for(Employee emp : employees) {
                    %>
                        <tr>
                            <td><a href="detail.jsp?empid=<%=emp.getId()%>&page=<%=pageNo%>"><%=emp.getId() %></a></td>
                            <td><a href="detail.jsp?empid=<%=emp.getId()%>&page=<%=pageNo%>"><%=emp.getFirstName() %> <%=emp.getLastName() %></a></td>
                            <td><%=emp.getJobId() %></td>
                            <td><%=emp.getDepartmentName() %></td>
                        </tr>
                    <%
                         }   	
                    %>
                    </tbody>
			    </table>
			</div>
			<div class="text-center">
			<%
				// 0. 한 화면당 표시할 페이지번호 갯수
				int pagesPerBlock = 5; 
				
				// 1. 전체 행의 갯수를 조회한다.
				int rows = employeeDao.gerEmployeesCount(); 
			
				// 2. 전체 페이지수를 계산한다.
				int totalPages = (int) Math.ceil((double)rows/rowsPerPage);
				
				// 3. 전체 페이지블록 갯수 계산하기
				int totalBlocks = (int) Math.ceil((double)totalPages/pagesPerBlock);
				
				// 4. 요청한 페이지가 어느 페이지 블록에 속하는지 계산하기
				int currentBlock = (int) Math.ceil((double) pageNo/pagesPerBlock);
				
				// 5. 요청한 페에지가 속한 블록의 시작페이지번호와 끝페이지번호 계산하기
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
			    	 <a href="list.jsp?page=<%=pageNo - 1%>">이전</a>
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
		</div>
	</div>
</body>
</html>


























