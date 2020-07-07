<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>텅빈, 공허한</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<!-- Grey with black text -->
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
	  <ul class="navbar-nav">
	    <li class="nav-item">
	      <a class="nav-link" href="#">홈</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#">책</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#">로그인</a>
	    </li>
	  </ul>
	</nav>
	<div class="row">
		<div class="col-12">
			<h1>Empty</h1>
			<p>${message }</p>
		</div>
	</div>
	
	<div class="row">
		<div class="col-12">
			
		</div>
	</div>
</div>
</body>
</html>