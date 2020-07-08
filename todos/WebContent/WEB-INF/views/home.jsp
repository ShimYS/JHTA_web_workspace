<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>To Do</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<fmt:bundle basename="com.simple.resources.message">
<div class="container">
	<!-- 해당 페이지에서 사용할 포지션 값 설정 -->
	<c:set var="position" value="home"/>
	<!-- 네비바  -->
	<%@ include file="nav.jsp" %>
	
	<!-- Content -->
	<div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header"><fmt:message key="home.title" /></div>
				<div class="card-body">
					<div class="row">
						
						<c:forEach var="todo" items="${todos }">
							<div class="col-4 mb-2">
								<div class="card">
									<div class="card-header d-flex justify-content-between">
										<div>${todo.title }</div> 
										<div id="card-todo-status-${todo.no }"><span class="badge ${todo.statusClass }">${todo.status }</span></div>
									</div>
									<div class="card-body">
										<div class="row mb-3">
											<div class="col-9">
												<small>${todo.content }</small>
											</div>
											<div class="col-3">
												<button type="button" class="btn btn-outline-secondary btn-sm" onclick="openTodoDetailModal(${todo.no})">
													<fmt:message key="button.label.detail" />
												</button>
											</div>
										</div>
										<div class="d-flex justify-content-between">
											<span class="text-secondary font-weight-bold">${todo.userName }</span>											
											<strong><fmt:formatDate value="${todo.day }"/></strong>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						
					</div>
					<div class="row">
						<div class="col-12 text-center">
							<button class="btn btn-outline-dark btn" onclick="showMoreTodo(${param.pagenum })" id="show-more-todo">
								<fmt:message key="button.label.more" />
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상세정보 모달창 -->
	<div class="modal" id="modal-todo-detail">
		<div class="modal-dialog modal-lg">
 			<div class="modal-content">
   				<div class="modal-header">
     				<h4 class="modal-title">상세 정보</h4>
     				<button type="button" class="close" data-dismiss="modal">&times;</button>
   				</div>
   				<div class="modal-body">
     				<div class="row">
     					<div class="col-12">
     						<table class="table table-bordered table-sm">
     							<colgroup>
     								<col width="15%">
     								<col width="35%">
     								<col width="15%">
     								<col width="35%">
     							</colgroup>
     							<tbody>
     								<tr>
     									<th>제목</th>
     									<td id="detail-title" colspan="3"></td>
     								</tr>
     								<tr>
     									<th>작성자</th>
     									<td id="detail-username"></td>
     									<th>등록일</th>
     									<td id="detail-createdate"></td>
     								</tr>
     								<tr>
     									<th>상태</th>
     									<td id="detail-status"></td>
     									<th>예정일</th>
     									<td id="detail-tododay"></td>
     								</tr>
     								<tr>
     									<th style="vertical-align: middle;">내용</th>
     									<td id="detail-content" colspan="3"><small></small></td>
     								</tr>
     							</tbody>
     						</table>
     					</div>
     				</div>
   				</div>
   				<div class="modal-footer">
   					<span id="status-button" style="display:none;">
   						<button style="display:none;" id="detail-no"></button>
	     				<button type="button" class="btn btn-success btn-sm" onclick="changeStatus('처리완료')" id="처리완료">처리완료</button>
	     				<button type="button" class="btn btn-info btn-sm" onclick="changeStatus('처리중')" id="처리중">처리중</button>
	     				<button type="button" class="btn btn-secondary btn-sm" onclick="changeStatus('보류')" id="보류">보류</button>
	     				<button type="button" class="btn btn-danger btn-sm" onclick="changeStatus('취소')" id="취소">취소</button>
     				</span>
     				<button type="button" class="btn btn-outline-dark btn-sm" data-dismiss="modal" id="닫기">닫기</button>
   				</div>
 			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
</div>
</fmt:bundle>
<script type="text/javascript">
	// 상세보기를 누르면 상세보기정보가 있는 모달창을 실행시켜주는 함수
	function openTodoDetailModal(todoNo) {
		// 상세보기를 누르면 모달창 
		$("#modal-todo-detail").modal('show');	
		detailModal(todoNo);
	}
	
	// todoNo 에 해당하는 일정의 상세정보를 보여주는 함수
	function detailModal(todoNo) {
		var data = todoNo;
		document.querySelector("#status-button").style.display = 'none';
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var text = xhr.responseText;
				// JSON데이터를 자바스크립트 데이터로 변환
				var resData = JSON.parse(text);
				
				// 상세정보 데이터 값 넣기
				document.querySelector("#detail-title").textContent = resData.title;
				document.querySelector("#detail-username").textContent = resData.userName;
				document.querySelector("#detail-createdate").textContent = resData.createdDate;
				document.querySelector("#detail-status").textContent = resData.status;
				document.querySelector("#detail-tododay").textContent = resData.day;
				document.querySelector("#detail-content").textContent = resData.content;
				document.querySelector("#detail-no").textContent = resData.no;
				
				// 각 일정의 상태에 따라 버튼 활성/비활성 조정
				btnColorChange(resData.status);
				if(resData.canModify){
					document.querySelector("#status-button").style.display = '';
				}
			}
		};
		
		xhr.open('get','detail.hta?todono='+data);
		xhr.send();
	}
	
	// 일정의 상태를 변경하는 함수
	function changeStatus(status) {
		var no = document.querySelector("#detail-no").textContent;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var text = xhr.responseText;
				// JSON데이터를 자바스크립트 데이터로 변환
				var resData = JSON.parse(text);
				var statusClass = resData.statusClass;
				
				// 상태정보가 변경되면 모달창, 백그라운드 상태 모두 변경되도록 데이터 넣기
				document.querySelector("#detail-status").textContent = status;
				document.querySelector("#card-todo-status-"+no).innerHTML = "<span class='badge "+statusClass+"'>"+status+" </span>";
				// 버튼 활성/비활성 적용
				btnColorChange(status);
			}
		};
		
		xhr.open('get','status.hta?status='+status+'&no='+no);
		xhr.send();
	}
	
	// 상태에 따라서 버튼 활성/비활성 적용하는 함수
	function btnColorChange(status){
		// 모든 버튼 엘리먼트 가져오기
		var el = document.querySelectorAll('#status-button button');	
		// 각 버튼엘리먼트값과 상태를 비교해서 활성/비활성 적용
		for(var i=0; i<el.length; i++){		
			if(status === el[i].id){
				el[i].disabled = true;				
			} else {
				el[i].disabled = false;
			}			
		}	
	}
	
	function showMoreTodo(pagenum) {
		if(!pagenum){
			pagenum = 2;
		} else {
			pagenum = pagenum + 1;
		}
		location.href="home.hta?pagenum="+pagenum;
	}
</script>
</body>
</html>






















