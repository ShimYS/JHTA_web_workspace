<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>요청 메시지 조회하기</h1>
	
	<%
		// 요청방식 조회
		String method = request.getMethod(); 
		// 요청URL 조회
		String requestURL = request.getRequestURI(); 
		
		//요청헤더정보 조회
		String host = request.getHeader("host");
		String userAgent = request.getHeader("user-agent");
		String accept = request.getHeader("accept");
		String acceptEncoding = request.getHeader("accept-encoding");
		String acceptLanguage = request.getHeader("accept-language");
		
		//클라이언트 정보
		String clientIpAddress = request.getRemoteAddr();
		Locale locale = request.getLocale();
		
		//컨텍스트패스 조회
		String contextPath = request.getContextPath();
	%>
	
	<table border="1" style="width:100%;">
		<thead>
			<tr>
				<th>구분</th>
				<th>이름</th>
				<th>값</th>
				<th>메소드명</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>요청방식</td>
				<td>-</td>
				<td><%=method %></td>
				<td>String request.getMethod()</td>
			</tr>
			
			<tr>
				<td>컨텍스트 패스</td>
				<td>-</td>
				<td><%=contextPath %></td>
				<td>String request.getContextPath()</td>
			</tr>
			
			<tr>
				<td>요청URL</td>
				<td>-</td>
				<td><%=requestURL %></td>
				<td>String request.getRequestURI()</td>
			</tr>
			
			<tr>
				<td>요청헤더 정보</td>
				<td>host</td>
				<td><%=host %></td>
				<td>String request.getHeader(String name)</td>
			</tr>
			<tr>
				<td>요청헤더 정보</td>
				<td>user-agent</td>
				<td><%=userAgent %></td>
				<td>String request.getHeader(String name)</td>
			</tr>
			<tr>
				<td>요청헤더 정보</td>
				<td>accept</td>
				<td><%=accept %></td>
				<td>String request.getHeader(String name)</td>
			</tr>
			<tr>
				<td>요청헤더 정보</td>
				<td>accept-encoding</td>
				<td><%=acceptEncoding %></td>
				<td>String request.getHeader(String name)</td>
			</tr>
			<tr>
				<td>요청헤더 정보</td>
				<td>accept-language</td>
				<td><%=acceptLanguage %></td>
				<td>String request.getHeader(String name)</td>
			</tr>
			
			<tr>
				<td>클라이언트 정보</td>
				<td>-</td>
				<td><%=clientIpAddress %></td>
				<td>String request.getRemoteAddr()</td>
			</tr>
			
			<tr>
				<td>접속자 나라</td>
				<td>-</td>
				<td><%=locale.getCountry()%></td>
				<td>Locale getLocale()<td>
			</tr>
			
			<tr>
				<td>접속자 언어</td>
				<td>-</td>
				<td><%=locale.getLanguage()%></td>
				<td>Locale getLocale()</td>
			</tr>
			
			
		</tbody>
	</table>
	
</body>
</html>