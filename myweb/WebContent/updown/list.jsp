<%@page import="java.util.List"%>
<%@page import="com.sample.dao.SampleFileDao"%>
<%@page import="com.sample.vo.SampleFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첨부파일 리스트</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="wrapper">
        <div class="header">
            <h1>첨부파일 리스트</h1>
        </div>
        <div class="body">
        <%
        	SampleFileDao sampleFileDao = new SampleFileDao();
        	List<SampleFile> files = sampleFileDao.getAllFiles();
        %>
            <div>
                <p>첨부파일을 확인해보세요</p>
                <table class="table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>파일명</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    <%
                    	for(SampleFile file : files) {
                    %>
                        <tr>
                            <td><%=file.getNo() %></td>
                            <td><%=file.getTitle() %></td>
                            <td><a href="../download?no=<%=file.getNo() %>"><%=file.getName() %></a></td>
                            <td><%=file.getCreateDate() %></td>
                        </tr>
                    <%
                    	}
                    %>
                    </tbody>
                </table>
            </div>
            <div class="text-right">
                [<a href="uploadform.jsp">첨부파일 등록</a>]
            </div>
        </div>
    </div>
</body>
</html>