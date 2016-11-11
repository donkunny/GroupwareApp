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
	<img alt="theme" align="middle" src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/theme.png">
	<img alt="introduce" align="middle" src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/introduce.png">
	<img alt="environment" align="middle" src="<%=pageContext.getServletContext().getContextPath()%>/resources/images/environment.png">
	
	<%@ include file="/WEB-INF/views/include/script.jsp" %>
	<script type="text/javascript">
		$(".logout").on("click", function(){
			alert("로그아웃 되었습니다.");
			self.location = "/member/logout";
		});
	</script>
</body>
</html>