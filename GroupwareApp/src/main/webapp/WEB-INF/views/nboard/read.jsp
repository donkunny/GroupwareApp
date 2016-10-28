<%@page import="com.donkunny.member.MemberVO"%>
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
				<li><a href="#">출퇴근 관리</a></li>
			</ul>
		</div>
	</nav>
	
	<% String session_id = request.getSession().getAttribute("memberVO").toString(); %>
	<input type="hidden" id="session_id" value=<%= session_id %> >

	<form role="form">
		<input type="hidden" name="nno" value="${noticeBoardVO.nno}">
		<input type="hidden" name="page" value="${cri.page}">
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
	</form>
	
	<div class="card">
		<div class="card-block">
			<h4 class="card-title">${noticeBoardVO.nno}번 게시물</h4>
		</div>
		<ul class="list-group list-group-flush">
    		<li class="list-group-item"><strong>제목:</strong> ${noticeBoardVO.n_title}</li>
    		<li class="list-group-item"><strong>내용</strong>
    			 <p class="card-text">${noticeBoardVO.n_content}</p>
    		</li>
    		<li class="list-group-item"><strong>작성자: </strong>${noticeBoardVO.n_id}</li>
  		</ul>
  		<div class="card-block" align="left">
    		<a href="listPage?page=${cri.page}&perPageNum=${cri.perPageNum}" class="btn btn-default" id="btn_previous">이전</a>
   			<button class="btn btn-default" id="btn_modify" type="submit">수정</button>
   			<button class="btn btn-default" id="btn_delete" type="submit">삭제</button>
  		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/script.jsp" %>
	<script type="text/javascript">
	
	<% 
		// Session 추출
		MemberVO obj = (MemberVO)session.getAttribute("memberVO");
	%>
	var session = "<%=obj.getId() %>";
	
	$(document).ready(function() {
		
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$(".logout").on("click", function(){
			alert("로그아웃 되었습니다.");
			self.location = "/member/logout";
		});
		
		$("#btn_modify").on("click", function(){
			console.log("수정");
			if(session != "${noticeBoardVO.n_id}"){
				console.log(session);
				console.log("${noticeBoardVO.n_id}");
				alert("작성자가 다릅니다.");
			} else {
				formObj.attr("action", "/nboard/modify");
				formObj.attr("method", "get");
				formObj.submit();
			}
		});
		
		$("#btn_delete").on("click", function(){
			console.log("삭제");
			if(session != "${noticeBoardVO.n_id}"){
				console.log(session);
				console.log("${noticeBoardVO.n_id}");
				alert("작성자가 다릅니다.");
			} else {
				alert("${noticeBoardVO.nno}번 게시물이"+" 삭제되었습니다.");
				formObj.attr("action", "/nboard/delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
		});
	});
	</script>
</body>
</html>