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
			width: 60%;	
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
				<li><a href="/nboard/listAll">공지 게시판</a></li>
				<li><a href="/schedule/scheduleCalendar">업무 일정</a></li>
				<li><a href="/proposal/main">결재 관리</a></li>
				<li><a href="#">문의하기</a></li>
			</ul>
		</div>
	</nav>
	<form role="form">
	<% MemberVO obj = (MemberVO)session.getAttribute("memberVO"); %>
	<div class="card">
		<div class="card-block">
			<h3 class="card-title" align="center"><strong>결재 상세</strong></h3>
		</div>
		<br>
		<ul class="list-group list-group-flush">
    		<li class="list-group-item"> <strong>기안자: ${proposalVO.p_writer}</strong> </li>
    		<li class="list-group-item"><strong>기안자ID: ${proposalVO.p_id}</strong></li>
    		<li class="list-group-item">
    			<strong>제목</strong> 
    			<input type="text" id="register-title" name="p_title" class="form-control" value="${proposalVO.p_title}" readonly="readonly">
    		</li>
    		<li class="list-group-item"><strong>내용</strong>
    			<textarea rows="5" class="form-control" name="p_content" id="register-content" readonly="readonly">${proposalVO.p_content}</textarea>
    		</li>
    		
    		<li class="list-group-item">
    			<strong>상태: </strong>
    			<c:choose>
    			<c:when test="${proposalVO.p_status eq '기안' }">
					<strong><i>${proposalVO.p_status}</i></strong>
				</c:when>
				<c:when test="${proposalVO.p_status eq '결재대기' }">
					<strong><i>${proposalVO.p_status}</i></strong>
				</c:when>
				<c:when test="${proposalVO.p_status eq '결재보류' }">
					<strong><i style="color: blue">${proposalVO.p_status}</i></strong>
				</c:when>
				<c:otherwise>
					<strong><i style="color: red">${proposalVO.p_status}</i></strong>
				</c:otherwise>
				</c:choose>
    		</li>
    		
    		<li class="list-group-item"><strong>기안 날짜: </strong>
    			<fmt:formatDate pattern="yyyy-MM-dd" value="${proposalVO.p_reportDate}" />
    		</li>

    		<li class="list-group-item"><strong>기안 의견</strong>
				<textarea rows="5" class="form-control" name="p_reportOpinion" id="register-content" readonly="readonly">${proposalVO.p_reportOpinion}</textarea>
			</li>
			<br><br>
			<li class="list-group-item">
				<strong>승인자: ${proposalVO.p_acceptor}</strong>
    		</li>
    		<li class="list-group-item"><strong>승인/반려 의견</strong>
    			<c:choose>
					<c:when test="${proposalVO.p_status eq '결재대기' }">
						<textarea rows="5" class="form-control" name="p_acceptOpinion" id="register-content"></textarea>
					</c:when>
					<c:when test="${proposalVO.p_status eq '결재완료' || proposalVO.p_status eq '결재보류'}">
						<textarea rows="5" class="form-control" name="p_acceptOpinion" id="register-content" readonly="readonly">${proposalVO.p_acceptOpinion}</textarea>
					</c:when>
				</c:choose>
			</li>
  		</ul>
  		<input type="hidden" name="pno" value="${proposalVO.pno}">
  		<input type="hidden" name="p_status" id="p_status">
  		<div class="card-block" align="left">
  			<a href="/proposal/entireApprovalList?page=${cri.page}&perPageNum=${cri.perPageNum}" class="btn btn-default" id="btn_previous" type="submit" >목록</a>
  			<c:choose>
				<c:when test="${proposalVO.p_status eq '결재대기' }">
					<button class="btn btn-default" id="btn_submit_reject" type="submit">반려</button>
					<button class="btn btn-default" id="btn_submit_accept" type="submit">승인</button>
				</c:when>
				<c:when test="${proposalVO.p_status eq '결재완료'}">
					<button class="btn btn-default" id="btn_accept_cancel" type="submit">승인취소</button>
				</c:when>
				<c:when test="${proposalVO.p_status eq '결재보류'}">
					<button class="btn btn-default" id="btn_pending_cancel" type="submit">보류취소</button>
				</c:when>
			</c:choose>
  		</div>
	</div>
	</form>
	<%@ include file="/WEB-INF/views/include/script.jsp" %>
	<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		$("#btn_submit_reject").on("click", function(){
			$("#p_status").val("결재보류");
			alert("기안문을 보류합니다");
			formObj.attr("action", "/proposal/acceptOrRejectProposal");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		$("#btn_submit_accept").on("click", function(){
			$("#p_status").val("결재완료");
			alert("기안문을 승인합니다.");
			formObj.attr("action", "/proposal/acceptOrRejectProposal");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		$("#btn_accept_cancel").on("click", function(){
			$("#p_status").val("결재대기");
			alert("승인을 취소합니다.");
			formObj.attr("action", "/proposal/acceptOrRejectProposal");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		$("#btn_pending_cancel").on("click", function(){
			$("#p_status").val("결재대기");
			alert("보류를 취소합니다.");
			formObj.attr("action", "/proposal/acceptOrRejectProposal");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		$(".logout").on("click", function(){
			alert("로그아웃 되었습니다.");
			self.location = "/member/logout";
		});
	});	
	</script>
</body>
</html>