<%@page import="com.fasterxml.jackson.annotation.JsonTypeInfo.Id"%>
<%@page import="com.donkunny.member.MemberVO"%>
<%@page import="java.util.List"%>
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
	<form class="form-horizontal" role="form" method="POST">
	<fieldset>
	<div id="legend">
    	<legend align="center"><strong>회원가입</strong></legend>
    </div>
    <div class="panel panel-default" >
	<div class="control-group">
		<!-- Username -->
		<label class="control-label" for="username">사용자 ID*</label>
			<c:choose>
				<c:when test="${compare_id eq '사용가능한 ID 입니다.'}">
					<button type="button" id="compareId" class="btn btn-default btn-sm" disabled="disabled">중복확인</button>
					<div class="controls">
						<input type="text" id="t_id" name="id" placeholder="" value="${t_id}" class="form-control input-sm" required="required">
						<p class="help-block">5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용가능합니다.</p>
						<div style="color: blue" >${compare_id}</div>
					</div>
				</c:when>
				<c:otherwise>
					<button type="button" id="compareId" class="btn btn-default btn-sm">중복확인</button>
					<div class="controls">
						<input type="text" id="t_id" name="id" placeholder=""	class="form-control input-sm" required="required">
						<p class="help-block">5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용가능합니다.</p>
						<div style="color: red" >${compare_id}</div>
					</div>
				</c:otherwise>
			</c:choose>
		<div style="color: red" >${error_id}</div>
	</div>
	<!-- E-mail -->
	<div class="control-group">
		<label class="control-label" for="email">E-mail</label><div style="color: red" >${error_email}</div>
		<div class="controls">
			<input type="email" id="t_email" name="email" placeholder="이메일" value="${memberVO.email}"	class="form-control input-sm" required="required">
			<p class="help-block">필수 정보입니다.</p>
		</div>
	</div>
	
	<!-- Password -->
	<div class="control-group">
    	<label class="control-label" for="password">비밀번호</label><div style="color: red" >${error_pwd}</div>
    	<div class="controls">
    		<input type="password" id="t_pwd" name="pwd" placeholder="" class="form-control input-sm" required="required">
    		<p class="help-block">6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</p>
    	</div>
    </div>
    
    <!-- Password Confirm -->
    <div class="control-group">
    	<label class="control-label" for="password_confirm">비밀번호(확인)</label>
    	<div class="controls">
    		<input type="password" id="t_pwd_confirm" name="pwd_confirm" placeholder="" class="form-control input-sm" required="required">
    		<p class="help-block">비밀번호를 확인하세요.</p>
    	</div>
    </div>
    </div><!-- panel1 default -->
	
	 <div class="panel panel-default" >
	 <div class="control-group">
	 	<label class="control-label" for="name">이름</label><div style="color: red" >${error_name}</div>
	 	<input type="text" id="t_name" name="name" value="${memberVO.name}"	class="form-control input-sm" required="required">
	 	<p class="help-block">필수정보입니다.</p>
	 </div>
	 
	
    <div class="control-group">
    	<label>생일</label><div style="color: red" >${error_birth}</div>
    	<input type="date" id="t_birth" name="birth" value="${memberVO.birth}" class="form-control" placeholder="Date of Birth" required="required">
    	<p class="help-block">필수정보입니다.</p>
    </div>
    
    <div class="control-group">
    	<label>전화번호</label><div style="color: red" >${error_tel}</div>
    	<input type="text" id="t_tel" name="tel" value="${memberVO.tel}" class="form-control input-sm" required="required">
    	<p class="help-block">'-' 빼고 입력해 주세요.</p>
    </div>
    
    <div class="control-group">
    <!-- Button -->
	    <div class="controls">
    	    <button class="btn btn-success" type="submit">등록</button>
    	    <a href="/member/login" class="btn btn-warning" id="btn_previous" type="submit" >이전</a>
         </div>
     </div>
	</fieldset>
</form>

<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form[role='form']");
	//console.log(formObj);
	
	$("#compareId").on("click", function(){
		var id = $("#t_id").val().length;
		if(id > 4 && id < 20){
			formObj.attr("action", "/member/compareId");
			formObj.attr("method", "post");
			formObj.submit();	
		} else {
			alert("사용할 ID를 입력해주세요.");
		}
	});
	
	$(".btn-success").on("click", function() {
		if($("#compareId").attr('disabled')){
			formObj.attr("action", "/member/register");
			formObj.attr("method", "post");
			formObj.submit();
		} else {
			alert("ID 중복 확인을 하세요.");
		}
	});
});
</script>
</body>
</html>