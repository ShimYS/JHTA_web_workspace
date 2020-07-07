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
				String position = "book";
			%>
			<%@ include file="../common/navibar.jsp"%>
		</div>
		<div class="header">
			<h1>책 등록</h1>
		</div>
		<div class="body">
			<p>책 정보를 입력하세요.</p>
			<div class="well">
			    <form method="post" action="register.jsp">
			        <div class="form-group">
			            <label>제목</label>
			            <div><input type="text" name="title"></div>
			        </div>
			        <div class="form-group">
			            <label>저자</label>
			            <div><input type="text" name="writer"></div>
			        </div>
			        <div class="form-group">
			            <label>장르</label>
			            <div>
			                <select name="genre">
			                    <option disabled selected>-- 선택하세요 --</option>
			                    <option value="에세이">에세이</option>
			                    <option value="한국소설">한국소설</option>
			                    <option value="외국소설">외국소설</option>
			                    <option value="자기계발">자기계발</option>
			                    <option value="경제/경영">경제/경영</option>
			                    <option value="재테크">재테크</option>
			                    <option value="경제">경제</option>
			                    <option value="인문">인문</option>
			                    <option value="역사/문화">역사/문화</option>
			                    <option value="사회">사회</option>
			                    <option value="예술/대중문화">예술/대중문화</option>
			                    <option value="종교">종교</option>
			                    <option value="가정/생활/요리">가정/생활/요리</option>
			                    <option value="건강">건강</option>
			                    <option value="취미/레저">취미/레저</option>
			                    <option value="여행/지도">여행/지도</option>
			                    <option value="외국어">외국어</option>
			                    <option value="사전">사전</option>
			                    <option value="IT">IT</option>
			                    <option value="자연과학/공학">자연과학/공학</option>
                                <option value="교재/수험서">교재/수험서</option>
                                <option value="학습/참고서">학습/참고서</option>
                                <option value="청소년">청소년</option>
                                <option value="만화">만화</option>
                                <option value="잡지">잡지</option>
			                </select>
			            </div>
			        </div>
			        <div class="form-group">
			            <label>출판사</label>
			            <div><input type="text" name="publisher"></div>
			        </div>
			        <div class="form-group">
			            <label>가격</label>
			            <div><input type="number" name="price"></div>
			        </div>
			        <div class="form-group">
			            <label>할인가격</label>
			            <div><input type="number" name="discountPrice"></div>
			        </div>
			        <div class="form-group">
			            <label>입고량</label>
			            <div>
                            <select name="stock">
                                <option disabled selected>-- 선택하세요 --</option>
                                <option value="10">10개</option>
                                <option value="20">20개</option>
                                <option value="30">30개</option>
                                <option value="50">50개</option>
                                <option value="100">100개</option>
                                <option value="200">200개</option>
                                <option value="500">500개</option>
                                <option value="1000">1000개</option>
                            </select>
                        </div>
			        </div>
			        <div class="text-right">
			            <button type="submit">등록</button>
			        </div>
			    </form>
			</div>
		</div>
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>