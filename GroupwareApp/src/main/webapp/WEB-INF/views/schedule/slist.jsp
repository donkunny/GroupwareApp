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
		#schedulerTab, .tab-content {
			position: relative;
			width: 80%;	
			margin: 0 auto;
			margin-left: 200px;
		}
		#shedulerBar {
			position: absolute;
			width: 180px;
			margin-left: 10px;
			padding-top: 30px;
		}
		
		.table {
			position: relative;
			width: 80%;
			margin-top: 30px;
		}
		
		#publicOpt {
			margin-left: 5px;
		}
		
		#input_title, #input_place, #input_attendee {
			width: 200px;
		}
	</style>
</head>
<body>
		
	<!-- contents of tab bar -->
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="main">
		<div class="notice_board" align="center">
				<!-- Notice Board -->
				<table class="table table-hover" >
					<h4 align="center">
						<strong>나의 일정 리스트</strong>
					</h4>
					<thread>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>기간</th>
						<th>일정 유형</th>
					</tr>
					</thread>
					<tbody>
						<c:forEach items="${list}" var="scheduleVO">
							<tr>
								<td>${scheduleVO.sno}</td>
								<td><a
									href="/schedule/read?sno=${scheduleVO.sno}&page=${pageMaker.cri.page}&perPageNum=${cri.getPerPageNum()}">
										${scheduleVO.s_title} </a></td>
								<td>${scheduleVO.s_id}</td>
								<td>${scheduleVO.s_fromDate} ~ ${scheduleVO.s_toDate}</td>
								<td style="width: 100px">
									<c:choose>
										<c:when test="${scheduleVO.s_type == 0}">공유일정</c:when>
										<c:when test="${scheduleVO.s_type == 1}">개인일정</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- Pagination -->
				<div id="paging" align="center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link"
								href="slist?page=${pageMaker.startPage -1}&perPageNum=${cri.getPerPageNum()}">&laquo;</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage }" var="idx">
							<li class="page-item"
								<c:out value="${pageMaker.criSchedule.getPage == idx?'class =active':'' }" />>
								<a class="page-link" href="slist?page=${idx}&perPageNum=${cri.getPerPageNum()}">${idx}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item"><a class="page-link" href="slist?page=${pageMaker.endPage+1}&perPageNum=${cri.getPerPageNum()}">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/script.jsp" %>
	<script type="text/javascript">
		
	</script>
</body>
</html>