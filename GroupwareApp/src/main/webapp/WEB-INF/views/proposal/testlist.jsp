<%@page import="com.donkunny.proposal.ProposalVO"%>
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
		
		#proposal_list {
			position: relative;
			width: 60%;	
			margin: 0 auto;
		}
		
		#proposalBar {
			position: absolute;
			width: 180px;
			margin-left: 10px;
			padding-top: 50px;
		}
	
		#proposalBar2 {
			position: absolute;
			width: 180px;
			margin-left: 10px;
			margin-top: 270px;
		}
		
		#proposalBar3 {
			position: absolute;
			width: 180px;
			margin-left: 10px;
			margin-top: 370px;
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
						<li><a href="/member/memberInfo">회원정보 보기</a></li>
						<li><a href="#">회원정보 수정</a>
						<li><a href="#">회원 탈퇴하기</a></li>
					</ul>
				</li>
				<li><a href="/nboard/listPage">공지 게시판</a></li>
				<li><a href="/schedule/scheduleCalendar">업무 일정</a></li>
				<li><a href="/proposal/main">결재 관리</a></li>
				<li><a href="#">문의하기</a></li>
			</ul>
		</div>
	</nav>
	<br>
	
	<!-- Sidebar -->
	<div class="list-group" id="proposalBar" align="center">
 		<a class="list-group-item active">결재</a>
 		<a href="/proposal/main" class="list-group-item list-group-item-action" >전체결재목록</a>
  		<a href="/proposal/waitinglist" class="list-group-item list-group-item-action" >결재대기목록</a>
  		<a href="/proposal/completedlist" class="list-group-item list-group-item-action">결재완료목록</a>
  		<a href="/proposal/pendinglist" class="list-group-item list-group-item-action">결재보류목록</a>
  	</div>
  	<div class="list-group" id="proposalBar2" align="center">
  		<a class="list-group-item active">개인/공람</a>
  		<a href="/proposal/publicProposal" class="list-group-item list-group-item-action" >공람목록</a>
  	</div>
  	
  	<div class="list-group" id="proposalBar3" align="center">
  		<a class="list-group-item active">승인</a>
  		<a href="/proposal/entireApprovalList" class="list-group-item list-group-item-action" >승인전체목록</a>
  		<a href="/proposal/waitingApprovalList" class="list-group-item list-group-item-action" >승인대기목록</a>
  		<a href="/proposal/acceptedApprovalList" class="list-group-item list-group-item-action">승인완료목록</a>
  		<a href="/proposal/acceptedPendingList" class="list-group-item list-group-item-action">승인보류목록</a>
  	</div>

	<!-- 결재 목록 -->	
	<div id="proposal_list" >
	<!-- Search function -->
	<% MemberVO obj = (MemberVO)session.getAttribute("memberVO"); %>
	<br><h3 align="center"><strong>전체 결재 목록</strong></h3>
	<table class="table table-hover">
		<br><div class="box-body">
		<i class="fa fa-search" aria-hidden="true"></i>
		<div class="col-xs-2" >
			<select name="searchType" class="form-control" >
				<option value="n"
					<c:out value="${cri.searchType == null?'selected':''}" />>
					---</option>

				<option value="t"
					<c:out value="${cri.searchType eq 't'?'selected':''}" />>
					제목</option>

				<option value="c"
					<c:out value="${cri.searchType eq 'c'?'selected':''}" />>
					내용</option>

				<option value="w"
					<c:out value="${cri.searchType eq 'w'?'selected':''}" />>
					작성자</option>

				<option value="tc"
					<c:out value="${cri.searchType eq 'tc'?'selected':''}" />>
					제목 또는 내용</option>

				<option value="cw"
					<c:out value="${cri.searchType eq 'cw'?'selected':''}" />>
					내용 또는 작성자</option>

				<option value="tcw"
					<c:out value="${cri.searchType eq 'tcw'?'selected':''}" />>
					모두</option>
			</select>
		</div>
		<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
		<button type="button" class="btn btn-default" id="searchBtn" >조회</button>
		<button type="button" class="btn btn-default" id="newBtn" >기안문 작성하기</button>
	</div>
	<br>
		<thread>
			<tr>
				<th>순번</th>
				<th>ID</th>
				<th>기안자</th>
				<th>제목</th>
				<th>승인자</th>
				<th>기안상태</th>
				<th>승인일시</th>
			</tr>
		</thread>
		<tbody>
			<c:forEach items="${list}" var="proposalVO">
				<tr>
				<td>${proposalVO.pno}</td>
				<td>${proposalVO.p_id}</td>
				<td>${proposalVO.p_writer}</td>
				<td><a href="/proposal/readProposal?page=${cri.page}&perPageNum=${cri.perPageNum}&pno=${proposalVO.pno}">${proposalVO.p_title}</a></td>
				<td>${proposalVO.p_acceptor}</td>
				<c:choose>
					<c:when test="${proposalVO.p_status eq '기안' || proposalVO.p_status eq '재기안'}">
						<td><strong>${proposalVO.p_status}</strong></td>
					</c:when>
					<c:when test="${proposalVO.p_status eq '결재대기' }">
						<td><strong>${proposalVO.p_status}</strong></td>
					</c:when>
					<c:when test="${proposalVO.p_status eq '결재보류' }">
						<td style="color: blue"><strong>${proposalVO.p_status}</strong></td>
					</c:when>
					<c:otherwise>
						<td style="color: red"><strong>${proposalVO.p_status}</strong></td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${proposalVO.p_status eq '기안' || proposalVO.p_status eq '재기안'}">
						<td>-</td>
					</c:when>
					<c:when test="${proposalVO.p_status eq '결재대기' }">
						<td>-</td>
					</c:when>
					<c:when test="${proposalVO.p_status eq '결재보류' }">
						<td>-</td>
					</c:when>
					<c:otherwise>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${proposalVO.p_acceptDate}" /></td>
					</c:otherwise>
				</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<div id="paging" align="center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="testlist?page=${pageMaker.startPage -1}&perPageNum=${cri.getPerPageNum()}"> &laquo;</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li class="page-item"
						<c:out value="${pageMaker.cri.page == idx?'class =active':'' }" />>
						<a class="page-link" href="testlist?page=${idx}&perPageNum=${cri.getPerPageNum()}">${idx}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="testlist?page=${pageMaker.endPage+1}&perPageNum=${cri.getPerPageNum()}">&raquo;</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/script.jsp" %>
	<script type="text/javascript">
		$(".logout").on("click", function(){
			alert("로그아웃 되었습니다.");
			self.location = "/member/logout";
		});
		
		$('#newBtn').on("click",function() {
			self.location = "/proposal/registerProposal";				
		});
		
		$("#searchBtn").on("click", function(event){
			self.location = "testlist?p_id=admin" + "&p_status=기안"  + "&page=1&perPageNum=10&searchType=" + $("select option:selected").val() + "&keyword=" + $('#keywordInput').val();
		});
		
	</script>
</body>
</html>