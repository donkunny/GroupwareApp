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
	<% MemberVO obj = (MemberVO)session.getAttribute("memberVO"); %>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=pageContext.getServletContext().getContextPath()%>/main/mainPage">Groupware</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="#">소개</a></li>
				<li><a class="dropdown-toggle" data-toggle="dropdown" href="<%=pageContext.getServletContext().getContextPath()%>/main/introduce">회원정보</a>
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
	
	<div class="card">
		<div class="card-block">
			<h3 class="card-title" align="center"><strong>결재 상세</strong></h3>
		</div>
		<br>
		<ul class="list-group list-group-flush">
    		<li class="list-group-item"> <strong>기안자: ${proposalVO.p_writer}</strong> </li>
    		<li class="list-group-item"><strong>기안자ID: ${proposalVO.p_id}</strong></li>
    		<li class="list-group-item">
    			<strong>제목</strong> 
    			<input type="text" id="register-title" name="p_title" class="form-control" value="${proposalVO.p_title}" readonly="readonly">
    		</li>
    		<li class="list-group-item"><strong>내용</strong>
    			<textarea rows="5" class="form-control" name="p_content" id="register-content" readonly="readonly">${proposalVO.p_content}</textarea>
    		</li>
    		
    		<li class="list-group-item">
    			<strong>상태: </strong>
    			<c:choose>
    			<c:when test="${proposalVO.p_status eq '기안' }">
					<strong><i>${proposalVO.p_status}</i></strong>
				</c:when>
				<c:when test="${proposalVO.p_status eq '결재대기' }">
					<strong><i>${proposalVO.p_status}</i></strong>
				</c:when>
				<c:when test="${proposalVO.p_status eq '결재보류' }">
					<strong><i style="color: blue">${proposalVO.p_status}</i></strong>
				</c:when>
				<c:otherwise>
					<strong><i style="color: red">${proposalVO.p_status}</i></strong>
				</c:otherwise>
				</c:choose>
    		</li>
    		
    		<li class="list-group-item"><strong>기안 날짜: </strong>
    			<fmt:formatDate pattern="yyyy-MM-dd" value="${proposalVO.p_reportDate}" />
    		</li>

    		<li class="list-group-item"><strong>기안 의견</strong>
				<textarea rows="5" class="form-control" name="p_reportOpinion" id="register-content" readonly="readonly">${proposalVO.p_reportOpinion}</textarea>
			</li>
			<br><br>
			<li class="list-group-item">
				<strong>승인자: ${proposalVO.p_acceptor}</strong>
    		</li>
    		<li class="list-group-item"><strong>승인/반려 의견</strong>
				<textarea rows="5" class="form-control" name="p_content" id="register-content" readonly="readonly">${proposalVO.p_acceptOpinion}</textarea>
			</li>
			<li class="list-group-item">
				<strong>승인 날짜: </strong>
				<c:choose>
					<c:when test="${proposalVO.p_status eq '기안' }">
						<strong><i>제출 대기 중입니다.</i></strong>
					</c:when>
					<c:when test="${proposalVO.p_status eq '결재대기' }">
						<strong><i>결재 대기 중입니다.</i></strong>
					</c:when>
					<c:when test="${proposalVO.p_status eq '결재보류' }">
						<strong><i style="color: blue">결재 보류 중입니다.</i></strong>
					</c:when>
					<c:otherwise>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${proposalVO.p_acceptDate}" />
					</c:otherwise>
				</c:choose>			
			</li>
  		</ul>
  		<form role="form">
  		<input type="hidden" name="pno" value="${proposalVO.pno}">
  		<div class="card-block" align="left">
    		<a href="<%=pageContext.getServletContext().getContextPath()%>/proposal/main?page=${cri.page}&perPageNum=${cri.perPageNum}&p_id=<%=obj.getId() %>" class="btn btn-default" id="btn_previous" type="submit" >목록</a>
  			<c:set var="id" value="<%=obj.getId() %>" />
  			<c:set var="name" value="<%=obj.getName() %>" />
  			<c:choose>
				<c:when test="${proposalVO.p_status eq '기안'}">
					<input type="hidden" name="p_status" value="결재대기">
					<input type="hidden" name="p_id" value="<%=obj.getId() %>" >
					<button class="btn btn-default" id="btn_modify" type="submit">수정</button>
					<button class="btn btn-default" id="btn_submit" type="submit">제출</button>
				</c:when>
				<c:when test="${proposalVO.p_status eq '결재대기' && proposalVO.p_writer eq name}">
					<input type="hidden" name="p_status" value="기안">
					<input type="hidden" name="p_id" value="<%=obj.getId() %>" >
					<button class="btn btn-default" id="btn_submit_cancel" type="submit">제출취소</button>
				</c:when>
				<c:when test="${proposalVO.p_status eq '결재대기' && proposalVO.p_acceptor eq name}">
					<button class="btn btn-default" id="btn_submit_reject" type="submit">반려</button>
					<button class="btn btn-default" id="btn_submit_accept" type="submit">승인</button>
				</c:when>
				<c:when test="${proposalVO.p_status eq '결재보류'}">
					<button class="btn btn-default" id="btn_resubmit" type="submit">재기안</button>
				</c:when>
				<c:when test="${proposalVO.p_status eq '결재완료'}">
					<input type="hidden" name="p_status" value="결재완료_공람">
					<input type="hidden" name="p_id" value="<%=obj.getId() %>" >
					<button class="btn btn-default" id="btn_public_submit" type="submit">공람제출</button>
				</c:when>
				<c:when test="${proposalVO.p_status eq '결재완료_공람' && proposalVO.p_id eq id}">
					<input type="hidden" name="p_status" value="결재완료">
					<input type="hidden" name="p_id" value="<%=obj.getId() %>" >
					<button class="btn btn-default" id="btn_public_submit_cancel" type="submit">공람제출취소</button>
				</c:when>
  			</c:choose>
  		</div>
  		</form>
	</div>
	
	<%@ include file="/WEB-INF/views/include/script.jsp" %>
	<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		$("#btn_submit").on("click", function(){
			alert("기안문을 승인자에게 제출합니다.");
			formObj.attr("action", "<%=pageContext.getServletContext().getContextPath()%>/proposal/readProposalPOST");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		$("#btn_submit_cancel").on("click", function(){
			alert("기안문 제출을 취소합니다.");
			formObj.attr("action", "<%=pageContext.getServletContext().getContextPath()%>/proposal/readProposalPOST");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		$("#btn_resubmit").on("click", function(){
			alert("기안문을 수정합니다");
			formObj.attr("action", "<%=pageContext.getServletContext().getContextPath()%>/proposal/resubmit");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$("#btn_public_submit").on("click", function(){
			alert("기안문을 공람 목록에 저장합니다");
			formObj.attr("action", "<%=pageContext.getServletContext().getContextPath()%>/proposal/readProposalPOST");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		$("#btn_public_submit_cancel").on("click", function(){
			alert("기안문 공람을 취소합니다");
			formObj.attr("action", "<%=pageContext.getServletContext().getContextPath()%>/proposal/readProposalPOST");
			formObj.attr("method", "post");
			formObj.submit();
		});
		
		$("#btn_modify").on("click", function(){
			alert("기안문을 수정합니다.");
			formObj.attr("action", "<%=pageContext.getServletContext().getContextPath()%>/proposal/resubmit");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$(".logout").on("click", function(){
			alert("로그아웃 되었습니다.");
			self.location = "<%=pageContext.getServletContext().getContextPath()%>/member/logout";
		});
	});	
	</script>
</body>
</html>