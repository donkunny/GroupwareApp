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
</style>
</head>
<body>
	<form class="form-horizontal" role="form">
	<fieldset>
	<div id="legend">
    	<legend class="" align="center"><strong>회원가입 확인</strong></legend>
    </div>
    <div class="panel panel-default" >
	<div class="control-group">
		<!-- Username -->
		<label class="control-label" for="username">사용자 ID</label>
		<div class="controls">
			<input type="text" id="t_id" name="t_id" placeholder=""	class="form-control input-sm" value="${memberVO.id}" readonly="readonly">
		</div>
	</div>
	<!-- E-mail -->
	<div class="control-group">
		<label class="control-label" for="email">E-mail</label>
		<div class="controls">
			<input type="email" id="t_email" name="t_email" placeholder="이메일"	class="form-control input-sm" value="${memberVO.email}" readonly="readonly">
		</div>
	</div>
	
	<!-- Password -->
	<div class="control-group">
    	<label class="control-label" for="password">비밀번호</label>
    	<div class="controls">
    		<input type="password" id="t_pwd" name="t_pwd" class="form-control input-sm" value="${memberVO.pwd}" readonly="readonly">
    	</div>
    </div>
    </div>
    
	 <div class="panel panel-default" >
	 <div class="control-group">
	 	<label class="control-label" for="name">이름</label>
	 	<input type="text" id="t_name" name="t_name" class="form-control input-sm" value="${memberVO.name}" readonly="readonly">
	 </div>
	 
	
    <div class="control-group">
    	<label>생일</label>
    	<input type="date" id="t_birth" name="t_birth" class="form-control" value="${memberVO.birth}" readonly="readonly">
    </div>
    
    <div class="control-group">
    	<label>전화번호</label>
    	<input type="text" id="t_tel" name="t_tel" class="form-control input-sm" value="${memberVO.tel}" readonly="readonly">
    </div>
    
     <div class="control-group" id="submit-button" align="center">
	    <!-- Button -->
   		<button class="btn btn-primary" type="submit">로그인 화면</button>
   	</div>
    </div>
	</fieldset>
	</form>

<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form[role='form']");
	console.log(formObj);
	$(".btn-primary").on("click", function() {
		alert("확인되었습니다."+ $('#t_id').val() +"님");
		formObj.attr("action", "/member/login");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
});
</script>
</body>
</html>