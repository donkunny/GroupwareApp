<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ page session="true" %>

<!doctype html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/style.jsp" %>
	<style type="text/css">
		.header {
			padding-right: 10px;		
		}
	
		.card {
			position: relative;
			width: 80%;	
			margin: 0 auto;
			padding-top: 10px;
		}
		
		#modify-title {
			max-width: 400px;
			width: 100%;
			margin-top: 8px;
		}
		
		#modify-content {
			width: 100%;
			margin-top: 8px;
		}
	</style>
</head>
<body>
	<div class="header">
		<h5 align="right"><strong>${memberVO.id}</strong>님 환영합니다.</h5>
		<h5 class="logout" align="right" style="cursor:pointer">
			로그아웃하기 <i class="fa fa-sign-out" aria-hidden="true"></i> </h5>
	</div>
	
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/main/mainPage">Groupware</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="#">소개</a></li>
				<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원정보</a>
					<ul class="dropdown-menu">
						<li><a href="#">회원정보 보기</a></li>
						<li><a href="#">회원정보 수정</a>
						<li><a href="#">회원 탈퇴하기</a></li>
					</ul>
				</li>
				<li><a href="/nboard/listPage">공지 게시판</a></li>
				<li><a href="/schedule/scheduleCalendar">업무 일정</a></li>
				<li><a href="#">결재 관리</a></li>
			</ul>
		</div>
	</nav>
	<form role="form">
	<input type="hidden" name="nno" value="${noticeBoardVO.nno}">
	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
	<div class="card">
		<div class="card-block">
			<h4 class="card-title">${noticeBoardVO.nno}번 게시물</h4>
		</div>
		<ul class="list-group list-group-flush">
    		<li class="list-group-item">
    			<strong>제목</strong> 
    			<input type="text" id="modify-title" name="n_title" class="form-control" value="${noticeBoardVO.n_title}">
    		</li>
    		
    		<li class="list-group-item"><strong>내용</strong>
    			<textarea rows="5" class="form-control" name="n_content" id="modify-content" >${noticeBoardVO.n_content}</textarea>
    			<!-- <input type="text" id="modify-content" class="form-control" value="${noticeBoardVO.n_content}"> -->
    		</li>
    		<li class="list-group-item"><strong>작성자: </strong>${noticeBoardVO.n_id}</li>
  		</ul>
  		<div class="card-block" align="left">
    		<a href="/nboard/read?nno=${noticeBoardVO.nno}&page=${cri.page}&perPageNum=${cri.perPageNum}" class="btn btn-default" id="btn_previous" type="submit" >이전</a>
   			<button class="btn btn-default" id="btn_modify" type="submit">수정</button>
  		</div>
	</div>
	</form>
	

	<%@ include file="/WEB-INF/views/include/script.jsp" %>
	<script type="text/javascript">
	
	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$(".logout").on("click", function(){
			alert("로그아웃 되었습니다.");
			self.location = "/member/logout";
		});
		
		$("#btn_modify").on("click", function(){
			alert("수정되었습니다.");
			formObj.attr("action", "/nboard/modify");
			formObj.attr("method", "post");
			formObj.submit();
		});
	});	
	</script>
</body>
</html>