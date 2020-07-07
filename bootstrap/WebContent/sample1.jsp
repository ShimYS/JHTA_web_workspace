<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"> <!-- 이 페이지의 주된 언어 -->
<head>
	<title></title>
	<meta charset="utf-8"> <!-- 유니코드 기반 utf-8 인코딩을 사용하겠다. -->
	<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- 화면에 보이는 영역을 '뷰포트'라고 한다. -->
																		 <!-- 뷰포트의 너비는 디바이스의 너비로 하고, 그때를 1배율로 설정한다. -->
																		 <!-- 1배율설정은 모바일에서 사용시 필수적인 옵션이다. -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"> <!-- 해당 경로에 있는 css파일을 가져온다. -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- 부트스트랩에서 제공하는 동작을 설정하기위한 js가 jquery기반으로 만들어져 있기 때문에 jquery파일을 가져온다. -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> <!-- 부트스트랩 제공하는 동작과 관련된 js파일을 가져온다. -->
	<style type="text/css">
		div.row > div {
			background-color: lightgreen;
			border: 1px solid black;
		}
	</style>
</head>
<body>
	<div class="container">
  		<div class="row">
  			<div class="col-md-12">헤더</div>
  		</div>
  		<div class="row">
  			<div class="col-md-4">내용</div>
  			<div class="col-md-4">내용</div>
  			<div class="col-md-4">내용</div>
  		</div>
  		<div class="row">
  			<div class="col-md-12">푸터</div>
  		</div>
  		
  		<hr>
  		
  		<div class="row">
  			<div class="col-md-12">헤더</div>
  		</div>
  		<div class="row">
  			<div class="col-md-3">내용</div>
  			<div class="col-md-9">내용</div>
  		</div>
  		<div class="row">
  			<div class="col-md-12">푸터</div>
  		</div>
  		  		
  		<hr>
  		
  		<div class="row">
  			<div class="col-md-12">헤더</div>
  		</div>
  		<div class="row">
  			<div class="col-md-9">내용</div>
  			<div class="col-md-3">내용</div>
  		</div>
  		<div class="row">
  			<div class="col-md-12">푸터</div>
  		</div>
  		  		  		
  		<hr>
  		
  		<div class="row">
  			<div class="col-md-12">헤더</div>
  		</div>
  		<div class="row">
  			<div class="col-md-3">메뉴</div>
  			<div class="col-md-7">컨텐츠</div>
  			<div class="col-md-2">배너</div>
  		</div>
  		<div class="row">
  			<div class="col-md-12">푸터</div>
  		</div>
  		  		  		  		
  		<hr>
  		
  		<div class="row">
  			<div class="col-md-12">헤더</div>
  		</div>
  		<div class="row">
  			<div class="col-md-3">메뉴</div>
  			<div class="col-md-7">컨텐츠</div>
  			<div class="col-md-2">배너</div>
  		</div>
  		<div class="row">
  			<div class="col-md-12">푸터</div>
  		</div>
<!-- 
	부트스트랩의 그리드시스템
	* 모든 <div class="row"></row>는 적절한 정렬과 패딩을 위해서 <div class="container">안에 위치해야한다.
	* 하나의 행은 하나 이상의 열(<div class="col-*-n"">)로 수평그룹을 만들 수 있다.
	* 모든 컨텐츠(제목, 내용, 테이블, 버튼, 리스트, 폼 ...)는 열안에 위치해야한다.
	* 열(<div class="col-*-n"">)만이 행(<div class="row">) 바로 아래에 올 수 있다.
	* 하나의 행(<div class="row">)은 12개의 열을 가지고 있으며, 원하는 만큼 크기를 명시해서 나눌 수 있다.
	* 하나의 행에 12개보다 많은 열이 배치되면, 남은 열들은 새로운 행으로 감싸진다.
	* 그리드의 클래스는 분기점 크기보다 크거나 같은 너비의 화면을 가진 기기에 적용된다.
-->
  		
	</div>
</body>
</html>























