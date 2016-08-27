<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/style.jsp" %>
</head>
<body>
<form class="form-horizontal" action="<%=pageContext.getServletContext().getContextPath()%>/member/registerPost" method="POST">
	<div class="control-group">
		<!-- Username -->
		<label class="control-label" for="username">사용자 ID</label>
		<div class="controls">
			<input type="text" id="username" name="username" placeholder=""	class="input-xlarge">
			<p class="help-block">필수정보입니다.</p>
		</div>
	</div>
</form>
</body>
</html>