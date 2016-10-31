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
				<li><a href="#">결재 관리</a></li>
			</ul>
		</div>
	</nav>
	<form role="form">
	<% MemberVO obj = (MemberVO)session.getAttribute("memberVO"); %>
	<input type="hidden" name="p_id" value="<%=obj.getId() %>" >
	<input type="hidden" name="p_writer" value="<%=obj.getId() %>">
	<input type="hidden" id="register-acceptor" name="p_acceptor" value="">
	<div class="card">
		<div class="card-block">
			<h4 class="card-title"><strong>기안문 등록</strong></h4>
		</div>
		<ul class="list-group list-group-flush">
    		<li class="list-group-item"> <strong>기안자: <%=obj.getName() %></strong> </li>
    		<li class="list-group-item"><strong>기안자ID: <%=obj.getId() %></strong></li>
    		<li class="list-group-item">
    			<strong>제목</strong> 
    			<input type="text" id="register-title" name="p_title" class="form-control" value="" required="required">
    		</li>
    		<li class="list-group-item"><strong>내용</strong>
    			<textarea rows="5" class="form-control" name="p_content" id="register-content" required="required"></textarea>
    		</li>
    		<li class="list-group-item">
    			<strong>상태: 기안</strong> 
    		</li>

    		<li class="list-group-item">
    			<strong>기안의견</strong> 
    			<textarea rows="5" class="form-control" name="p_opinion" id="register-opinion" required="required"></textarea>
    		</li>
    		
    		<li class="list-group-item">
				<strong>승인자</strong> (승인자는 기안자와 달라야 합니다.)
				 <select class="form-control" id="sel1">
				 	<c:forEach items="${acceptors}" var="acceptor">
			 			<option>${acceptor.name}</option>
				 	</c:forEach>
				 </select>
				 <div style="color: red" >${error}</div>   			
    		</li>
  		</ul>
  		<div class="card-block" align="left">
    		<a href="/proposal/main?page=${cri.page}&perPageNum=${cri.perPageNum}" class="btn btn-default" id="btn_previous" type="submit" >이전</a>
   			<button class="btn btn-default" id="btn_registerConfirm" type="submit">제출</button>
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
			var writer = '<%=obj.getName() %>';
			var opinion = $('#register-opinion').val();
			var option = $("#sel1 option:selected").text();
			
			$("register-acceptor").html("<input type='hidden' id='register-acceptor' name='p_acceptor' value='" + option + "'>");
			//alert(title.length + ": " + contents.length);
			if(option === writer){
				alert("기안자와 승인자가 같습니다.");
			} else if (title.length == 0 || contents.length == 0 || writer.length == 0 || opinion.length == 0){
				alert("내용을 입력해주세요.");
			} else {
				alert("기안문이 전송되었습니다.");
				formObj.attr("action", "/proposal/registerProposal");
				formObj.attr("method", "post");
				formObj.submit();
			}
		});
	});	
	</script>
</body>
</html>