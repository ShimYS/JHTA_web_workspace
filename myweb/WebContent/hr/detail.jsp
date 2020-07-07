<%@page import="com.sample.vo.Employee"%>
<%@page import="com.sample.dao.EmployeeDao"%>
<%@page import="com.sample.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="wrapper">
		<div class="header">
			<h1>사원 정보</h1>			
		</div>
		
		<div class="body">
			<div>
			<%
				int employeeId = NumberUtil.stringToInt(request.getParameter("empid"));
				int pageNo = NumberUtil.stringToInt(request.getParameter("page"));	
				
				EmployeeDao employeeDao = new EmployeeDao();
				Employee employee = employeeDao.getEmployeeById(employeeId);
				
			%>
				<p>사원정보를 확인하세요</p>
			    <table class="table bodered">
                    <tbody>
                        <tr>
                            <th>이름</th>
                            <td><%=employee.getFirstName() %><%=employee.getLastName() %></td>
                            <th>아이디</th>
                            <td><%=employee.getId() %></td>
                        </tr>
                        <tr>
                            <th>입사일</th>
                            <td><%=employee.getHireDate() %></td>
                            <th>직종</th>
                            <td><%=employee.getJobId() %></td>
                        </tr>
                        <tr>
                            <th>급여</th>
                            <td><%=NumberUtil.numberWithComma((long)employee.getSalary())%></td>
                            <th>커미션</th>
                            <td><%=employee.getCommissionPct() %></td>
                        </tr>
                        <tr>
                            <th>매니저</th>
                            <td><%=employee.getManagerFirstName() %><%=employee.getManagerLastName() %></td>
                            <th>소속부서</th>
                            <td><%=employee.getDepartmentName() %></td>
                        </tr>
                    </tbody>
			    </table>
			</div>
			<div class="text-right">
			    <a href="modifyform.jsp">수정</a>
			    <a href="list.jsp?page=<%=pageNo%>">목록</a>
			</div>
		</div>
	</div>
</body>
</html>