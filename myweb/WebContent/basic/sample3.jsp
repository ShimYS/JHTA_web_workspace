<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>스크립틀리 사용하기</h1>
	
	<%
		//수험생 시험 성적
		int studNo = 19;
		String studName = "김유신";
		int score = 49;
		boolean passed = false;
	%>
	
	<h3>시험결과</h3>
	<table style="width: 100%; border:1px solid black; border-collapse: collapse;">
		<thead>
			<tr>
				<th>수험번호</th>
				<th>이름</th>
				<th>점수</th>
				<th>합격여부</th>
			</tr>
		</thead>
		<tbody>
		<%
			if (passed) {
		%>
			<tr>
				<td><%=studNo %></td>
				<td><%=studName %></td>
				<td><%=score %></td>
				<td><%=passed ? "합격" : "불합격" %></td>
			</tr>
		<%
			} else {
		%>		
			<tr>
				<td><%=studNo %></td>
				<td><%=studName %></td>
				<td colspan="2"><%=passed ? "합격" : "불합격" %></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
</body>
</html>