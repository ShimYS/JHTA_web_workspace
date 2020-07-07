<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.vo.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>스크립틀릿 사용하기</h1>
	
	<%
		Contact c1 = new Contact("홍길동", "010-1234-5678", "hong@gmail.com", "현대자동차");
		Contact c2 = new Contact("김유신", "010-2323-5678", "kimys@gmail.com", "우리은행");
		Contact c3 = new Contact("강감찬", "010-7657-1269", "kangkc@gmail.com", "서울시청");
		Contact c4 = new Contact("이순신", "010-3590-7532", "caplee@gmail.com", "교보문고");
		Contact c5 = new Contact("을지문덕", "010-2363-8656", "ujseoul@gmail.com", "청와대");
		Contact c6 = new Contact("광개토대왕", "010-2112-6997", "bigbro@gmail.com", "육군본부");
		
		List<Contact> contacts = new ArrayList<>();
		contacts.add(c1);
		contacts.add(c2);
		contacts.add(c3);
		contacts.add(c4);
		contacts.add(c5);
		contacts.add(c6);
	%>
	
	<table border="1" style="width: 100%;">
		<thead>
			<tr>
				<th>이름</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>소속회사</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Contact contact : contacts) {
		%>
			<tr>
				<td><%=contact.getName() %></td>
				<td><%=contact.getTel() %></td>
				<td><%=contact.getEmail() %></td>
				<td><%=contact.getCompany() %></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
</body>
</html>