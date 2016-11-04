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
		
		#sendEmail {
			position: relative;
			width: 40%;	
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
	<% MemberVO obj = (MemberVO)session.getAttribute("memberVO"); %>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/main/mainPage">Groupware</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="#">소개</a></li>
				<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원정보</a>
					<ul class="dropdown-menu">
						<li><a href="/member/memberInfo">회원정보 보기</a></li>
						<li><a href="#">회원정보 수정</a>
						<li><a href="#">회원 탈퇴하기</a></li>
					</ul>
				</li>
				<li><a href="/nboard/listPage">공지 게시판</a></li>
				<li><a href="/schedule/scheduleCalendar">업무 일정</a></li>
				<li><a href="/proposal/main?p_id=<%=obj.getId()%>">결재 관리</a></li>
				<li><a href="/email/emailsender">문의하기</a></li>
			</ul>
		</div>
	</nav>
	<br><br>
	<h3 align="center"><strong>관리자에게 문의하기</strong></h3>
	<br>
	<form role="form" id="sendEmail">
		<input type="hidden" name="e_id" value="<%=obj.getId() %>">
		<input type="hidden" name="e_mail" value="<%=obj.getEmail() %>">
		<div class="form-group">
			<strong>제목</strong>
    		<input type="text" id="register-title" name="e_title" class="form-control" value="" required="required">
		</div>
		<div class="form-group">
			<strong>작성자: </strong><%=obj.getId() %>
		</div>
		<div class="form-group">
			<strong>내용</strong>
    		<textarea rows="10" class="form-control" name="e_content" id="register-content" required="required"></textarea>
		</div>
		<button type="submit" id="send_email" class="btn btn-default">보내기</button>
	</form>

	<%@ include file="/WEB-INF/views/include/script.jsp" %>
	<script type="text/javascript">
		var formObj = $("form[role='form']");	
		$(".logout").on("click", function(){
			alert("로그아웃 되었습니다.");
			self.location = "/member/logout";
		});
		
		$("#send_email").on("click", function(){
		    formObj.attr("action", "/email/emailsender");
			formObj.attr("method", "post");
			formObj.submit();
			alert("문의가 관리자에게 전송되었습니다.");
		});
	</script>
</body>
</html>