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
		
	.panel {
		position : relative;
		padding : 10px;
  		max-width: 460px;
  		width: 100%;
  		margin: 0 auto 10px;
	}
	
	#legend {
		padding-top: 20px;
	}
	
	#submit-button {
		padding-top: 20px;
	}
	
	.control-group {
		padding-top: 20px;
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

	<form class="form-horizontal" role="form">
	<fieldset>
	<div id="legend">
    	<h4 align="center"><strong>회원가입 정보</strong></h4>
    </div>
    <div class="panel panel-default" >
	<div class="control-group">
		<!-- Username -->
		<i class="fa fa-lightbulb-o" aria-hidden="true"></i>
		<label class="control-label" for="username">사용자 ID</label>
		<div class="controls">
			<input type="text" id="t_id" name="t_id" placeholder=""	class="form-control input-sm" value="${memberVO.id}" readonly="readonly">
		</div>
	</div>
	<!-- E-mail -->
	<div class="control-group">
		<i class="fa fa-envelope-o" aria-hidden="true"></i>
		<label class="control-label" for="email">E-mail</label>
		<div class="controls">
			<input type="email" id="t_email" name="t_email" placeholder="이메일"	class="form-control input-sm" value="${memberVO.email}" readonly="readonly">
		</div>
	</div>
	
	<!-- Password -->
	<div class="control-group">
		<i class="fa fa-key" aria-hidden="true"></i>
    	<label class="control-label" for="password">비밀번호</label>
    	<div class="controls">
    		<input type="password" id="t_pwd" name="t_pwd" class="form-control input-sm" value="${memberVO.pwd}" readonly="readonly">
    	</div>
    </div>
    </div>
    
	 <div class="panel panel-default" >
	 <div class="control-group">
	 	<i class="fa fa-users" aria-hidden="true"></i>
	 	<label class="control-label" for="name">이름</label>
	 	<input type="text" id="t_name" name="t_name" class="form-control input-sm" value="${memberVO.name}" readonly="readonly">
	 </div>
	 
	
    <div class="control-group">
    	<i class="fa fa-birthday-cake" aria-hidden="true"></i>
    	<label>생일</label>
    	<input type="date" id="t_birth" name="t_birth" class="form-control" value="${memberVO.birth}" readonly="readonly">
    </div>
    
    <div class="control-group">
    	<i class="fa fa-mobile" aria-hidden="true"></i>
    	<label>전화번호</label>
    	<input type="text" id="t_tel" name="t_tel" class="form-control input-sm" value="${memberVO.tel}" readonly="readonly">
    </div>
    
     <div class="control-group" id="submit-button" align="center">
	    <!-- Button -->
   		<button class="btn btn-default" type="submit">수정</button>
   	</div>
    </div>
	</fieldset>
	</form>


	<%@ include file="/WEB-INF/views/include/script.jsp" %>
	<script type="text/javascript">
		$(".logout").on("click", function(){
			alert("로그아웃 되었습니다.");
			self.location = "/member/logout";
		});
	</script>
</body>
</html>