<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/style.jsp" %>
<style type="text/css">
	body{
		background: #e9e9e9;
	}
	
	.container {
		position : relative;
		padding-top: 200px;
  		max-width: 460px;
  		width: 100%;
  		margin: 0 auto 100px;
	}
</style>
</head>
<body>
	
	<form action="<%=pageContext.getServletContext().getContextPath()%>/member/loginPost" method="post">
		<div class="container">
				<h2 class="form-signin" align="center">GROUPWARE</h2>
				<label><b>아이디</b></label>
				<input type="text" id="clickID" name="id" class="form-control" placeholder="아이디" required autofocus> 
				
				<label><b>비밀번호</b></label>
				<input type="password" name="pwd" class="form-control" placeholder="비밀번호" required>
				<div class="checkbox">
					<label> <input type="checkbox" value="remember-me">
						아이디,비밀번호 저장
					</label>
				</div>
				<div style="color: red" >${error}</div>
				<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
				<h5><i class="fa fa-user" aria-hidden="true"></i>
				아직 회원이 아니세요? <a href="<%=pageContext.getServletContext().getContextPath()%>/member/register">회원가입</a></h5>
				<br>
				<h5><Strong>테스트용 아이디/ 비밀번호: test/test</Strong></h5>
		</div><!-- /container -->
	</form>
</body>
</html>