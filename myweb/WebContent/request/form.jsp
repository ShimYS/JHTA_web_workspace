<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>입력폼</h1>
	
	<h3>회원가입 정보를 입력하세요</h3>
	<form action="register.jsp" method="post">
		<div>
			<label>이름</label>
			<div><input type="text" name="username"/></div>
		</div>
		<div>
			<label>이메일</label>
			<div><input type="text" name="useremail"/></div>
		</div>
		<div>
			<label>비밀번호</label>
			<div><input type="password" name="userpassword"/></div>
		</div>
		<div>
			<label>거주지</label>
			<div>
				<select name="usercity">
					<option value="seoul">서울</option>
					<option value="gyeonggi">경기</option>
					<option value="incheon">인천</option>
				</select>
			</div>
		</div>
		<div>
			<label>성별</label>
			<div>
				<input type="radio" name="usersex" value="M">남자
				<input type="radio" name="usersex" value="F">여자
			</div>
		</div>
		<div>
			<label>자기소개</label>
			<div>
				<textarea rows="5" cols="50" name="userprofile"></textarea>
			</div>
		</div>
		<div>
			<label>개인정보 제공 동의</label>
			<div>
				<input type="checkbox" name="useragreement" value="Yes">동의합니다.
			</div>
		</div>
		<div>
			<button type="submit">회원가입</button>
		</div>
	</form>
</body>
</html>