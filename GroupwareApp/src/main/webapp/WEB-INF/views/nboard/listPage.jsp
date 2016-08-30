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
		
		.notice_board {
			position: relative;
			width: 80%;	
			margin: 0 auto;
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
				<li><a href="#">업무 일정</a></li>
				<li><a href="#">출퇴근 관리</a></li>
			</ul>
		</div>
	</nav>
	<div class="notice_board">
	<!-- Notice Board -->
	<table class="table table-hover">
	<h4 align="center"><strong>공지 게시판</strong></h4>
	<thread>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	</thread>
	<tbody>
		<c:forEach items="${list}" var="noticeBoardVO">
			<tr>
				<td>${noticeBoardVO.nno}</td>
				<td><a href="/nboard/read?nno=${noticeBoardVO.nno}&page=${pageMaker.cri.page}&perPageNum=${cri.getPerPageNum()}">
						${noticeBoardVO.n_title}
					</a>
				</td>
				<td>${noticeBoardVO.n_id}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${noticeBoardVO.n_regdate}" /></td>
				<td style="width: 60px">${noticeBoardVO.n_cnt}</td>
			</tr>
		</c:forEach>
	</tbody>
	</table>
		<div id="paging" align="center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="listPage?page=${pageMaker.startPage -1}&perPageNum=${cri.getPerPageNum()}"> &laquo;</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li class="page-item"
						<c:out value="${pageMaker.cri.page == idx?'class =active':'' }" />>
						<a class="page-link" href="listPage?page=${idx}&perPageNum=${cri.getPerPageNum()}">${idx}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="listPage?page=${pageMaker.endPage+1}&perPageNum=${cri.getPerPageNum()}">&raquo;</a>
					</li>
				</c:if>
			</ul>
		</div>
		<div id="btn_register">
			<a href="/nboard/register?page=${cri.page}" class="btn btn-default"  type="submit">글쓰기</a>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/include/script.jsp" %>
	<script type="text/javascript">
		$(".logout").on("click", function(){
			alert("로그아웃 되었습니다.");
			self.location = "/member/logout";
		});
	</script>
</body>
</html>