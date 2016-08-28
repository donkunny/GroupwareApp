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
</style>
</head>
<body>
	<form class="form-horizontal" form="role" method="POST">
	<fieldset>
	<div id="legend">
    	<legend class="" align="center"><strong>회원가입</strong></legend>
    </div>
    <div class="panel panel-default" >
	<div class="control-group">
		<!-- Username -->
		<label class="control-label" for="username">사용자 ID*</label>
		<div class="controls">
			<input type="text" id="t_id" name="t_id" placeholder=""	class="form-control input-sm">
			<p class="help-block">5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용가능합니다.</p>
		</div>
	</div>
	<!-- E-mail -->
	<div class="control-group">
		<label class="control-label" for="email">E-mail</label>
		<div class="controls">
			<input type="email" id="t_email" name="t_email" placeholder="이메일"	class="form-control input-sm">
			<p class="help-block">필수 정보입니다.</p>
		</div>
	</div>
	
	<!-- Password -->
	<div class="control-group">
    	<label class="control-label" for="password">비밀번호</label>
    	<div class="controls">
    		<input type="password" id="t_pwd" name="t_pwd" placeholder="" class="form-control input-sm">
    		<p class="help-block">6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</p>
    	</div>
    </div>
    
    <!-- Password Confirm -->
    <div class="control-group">
    	<label class="control-label" for="password_confirm">비밀번호(확인)</label>
    	<div class="controls">
    		<input type="password" id="t_pwd_confirm" name="t_pwd_confirm" placeholder="" class="form-control input-sm">
    		<p class="help-block">비밀번호를 확인하세요.</p>
    	</div>
    </div>
    </div><!-- panel1 default -->
	
	 <div class="panel panel-default" >
	 <div class="control-group">
	 	<label class="control-label" for="name">이름</label>
	 	<input type="text" id="t_name" name="t_name" placeholder=""	class="form-control input-sm">
	 	<p class="help-block">필수정보입니다.</p>
	 </div>
	 
	
    <div class="control-group">
    	<label>생일</label>
    	<input type="date" id="t_birth" name="t_birth" class="form-control" placeholder="Date of Birth">
    	<p class="help-block">필수정보입니다.</p>
    </div>
    
    <div class="control-group">
    	<label>전화번호</label>
    	<input type="text" id="t_tel" name="t_tel" placeholder="" class="form-control input-sm">
    	<p class="help-block">'-' 빼고 입력해 주세요.</p>
    </div>
    
    <div class="control-group">
    <!-- Button -->
	    <div class="controls">
    	    <button class="btn btn-success" type="submit">등록</button>
         </div>
     </div>
	</fieldset>
</form>


<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form[role='form']");
	console.log(formObj);
	$(".btn-success").on("click", function() {
		if($('#t_pwd').val() != $('#t_pwd_confirm').val()){
			
		}
		formObj.attr("action", "/member/registerPost");
		formObj.attr("method", "post");
		formObj.submit();
	});
});
</script>
</body>
</html>