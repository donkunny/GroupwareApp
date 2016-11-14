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
			width: 50%;	
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
	<% MemberVO obj = (MemberVO)session.getAttribute("memberVO"); %>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=pageContext.getServletContext().getContextPath()%>/main/mainPage">Groupware</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="<%=pageContext.getServletContext().getContextPath()%>/main/introduce">소개</a></li>
				<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원정보</a>
					<ul class="dropdown-menu">
						<li><a href="<%=pageContext.getServletContext().getContextPath()%>/member/memberInfo">회원정보 보기</a></li>
						<li><a href="<%=pageContext.getServletContext().getContextPath()%>/member/modify">회원정보 수정</a>
					</ul>
				</li>
				<li><a href="<%=pageContext.getServletContext().getContextPath()%>/nboard/listPage">공지 게시판</a></li>
				<li><a href="<%=pageContext.getServletContext().getContextPath()%>/schedule/scheduleCalendar">업무 일정</a></li>
				<li><a href="<%=pageContext.getServletContext().getContextPath()%>/proposal/main?p_id=<%=obj.getId()%>">결재 관리</a></li>
				<li><a href="<%=pageContext.getServletContext().getContextPath()%>/email/emailsender">문의하기</a></li>
			</ul>
		</div>
	</nav>
	<form role="form">
	<input type="hidden" name="n_id" value="<%=obj.getId() %>" >
	<div class="card">
		<div class="card-block">
			<h4 class="card-title"><strong>게시물 등록</strong></h4>
		</div>
		<ul class="list-group list-group-flush">
    		<li class="list-group-item">
    			<strong>제목</strong> 
    			<input type="text" id="register-title" name="n_title" class="form-control" value="" required="required">
    		</li>
    		
    		<li class="list-group-item"><strong>내용</strong>
    			<textarea rows="20" class="form-control" name="n_content" id="register-content" required="required"></textarea>
    			<!-- <input type="text" id="modify-content" class="form-control" value="${noticeBoardVO.n_content}"> -->
    		</li>
    		<li class="list-group-item"><strong>작성자: </strong><%=obj.getId() %></li>
  		</ul>
  		<div class="card-block" align="left">
    		<a href="<%=pageContext.getServletContext().getContextPath()%>/nboard/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}" class="btn btn-default" id="btn_previous" type="submit" >이전</a>
   			<button class="btn btn-default" id="btn_registerConfirm" type="submit">확인</button>
  		</div>
	</div>
	</form>
	
	<%@ include file="/WEB-INF/views/include/script.jsp" %>
	<script type="text/javascript">
	
	$(document).ready(function(){
		
		var formObj = $("form[role='form']");

		$(".logout").on("click", function(){
			alert("로그아웃 되었습니다.");
			self.location = "/member/logout";
		});
		
		$("#btn_registerConfirm").on("click", function(){
			var title = $('#register-title').val();
			var contents = $('#register-content').val();
			//alert(title.length + ": " + contents.length);
			if(title.length == 0 || contents.length == 0){
				alert("제목 또는 내용을 입력해주세요.");
			} else {
				alert("등록되었습니다.");
				formObj.attr("action", "<%=pageContext.getServletContext().getContextPath()%>/nboard/register");
				formObj.attr("method", "post");
				formObj.submit();
			}
		});
	});	
	</script>
</body>
</html>