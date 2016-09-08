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
				<li><a href="/schedule/main">업무 일정</a></li>
				<li><a href="#">출퇴근 관리</a></li>
			</ul>
		</div>
	</nav>
	
	<!-- tab bar -->
	<ul class="nav nav-tabs" id="schedulerTab" role="tablist">
		<li role="presentation" class="active" ><a href="#main" aria-controls="main">메인</a></li>
		<li role="presentation"><a href="#daily" aria-controls="daily">일간</a></li>
		<li role="presentation"><a href="#weekly" aria-controls="weekly">주간</a></li>
		<li role="presentation"><a href="#search" aria-controls="search">검색</a></li>
	</ul>
	
	<!-- Sidebar -->
	<div class="list-group" id="shedulerBar" align="center">
 		<a class="list-group-item active">나의 일정</a>
  		<a href="#register" id="registerMySchedule" class="list-group-item list-group-item-action" >일정 등록</a>
  		<a href="#modify" class="list-group-item list-group-item-action">일정 수정</a>
  		<a href="#searchList" id="scheduleList" class="list-group-item list-group-item-action">일정 목록</a>
	</div>
	
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
    	<div role="tabpanel" class="tab-pane" id="daily">2</div>
    	<div role="tabpanel" class="tab-pane" id="weekly">3</div>
    	<div role="tabpanel" class="tab-pane" id="search">4</div>
	</div>

	<%@ include file="/WEB-INF/views/include/script.jsp" %>
	<script type="text/javascript">
		$(".logout").on("click", function(){
			alert("로그아웃 되었습니다.");
			self.location = "/member/logout";
		});
		
		$('#schedulerTab a').click(function (e) {
			e.preventDefault();
			$(this).tab('show');
		});
		
		$("#scheduleList").click(function(e){
			e.preventDefault();
			$("#main").hide();
			self.location ="/schedule/slist";
		});
		
		$("#registerMySchedule").bind("click", function(){
		$("#main").hide();
		$("#register_table").remove();
		$("#register_title").remove();
		$("#btn_registerConfirm").remove();
		var html = '';
		html += '<form role="form" id="schedule">';
		html += '<input type="hidden" id="s_id" name="s_id" value="${memberVO.id}" >';
		html += '<table align="center" id="register_table" class="table table-bordered">';
		html += '<h3 align="center" id="register_title">일정 등록하기</h3>';
		html += '<tbody>';
		html += '<tr>';
		html += '<th scope="row"><i class="fa fa-lightbulb-o" aria-hidden="true"></i> 제목</th>';
		html += '<td><input id="s_title" type ="text" class="form-control" name="s_title" value="" ></td>';
		html += '</tr>';
		html += '<tr>';
		html += '<th scope="row"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 내용</th>';
		html += '<td><textarea id="s_content" row="10" class="form-control" name="s_content" value="" ></textarea></td>';
		html += '</tr>';
		html += '<tr>';
		html += '<th scope="row"><i class="fa fa-map-marker" aria-hidden="true"></i> 장소</th>';
		html += '<td><input id="s_place" type ="text" class="form-control" name="s_place" value="" ></td>';
		html += '</tr>';
		html += '<tr>';
		html += '<th scope="row"><i class="fa fa-users" aria-hidden="true"></i> 참석자</th>';
		html += '<td><input id="s_attendee" type ="text" class="form-control" name="s_attendee" value="" ></td>';
		html += '</tr>';
		html += '<tr>';
		html += '<th scope="row"><i class="fa fa-eye" aria-hidden="true"></i> 일정 구분</th>';
		html += '<td>';
		html += '<div class="radio">';
		html += '<label id="privateOpt"><input type="radio" name="optradio" value="1">개인 일정</label>';
		html += '<label id="publicOpt"><input type="radio" name="optradio" value="0">공유 일정</label>';
		html += '</div>';
		html += '</td>';
		html += '</tr>';
		html += '<tr>';
		html += '<th scope="row"><i class="fa fa-calendar-o" aria-hidden="true"></i> 기간</th>'
		html += '<td>';
		html += '<div class="col-xs-6" id="input-fromDate">';
		html += '<input id="s_fromDate" type ="text" class="form-control" name="s_fromDate" value="" placeholder="시작일자: yyyy-mm-dd" >';
		html += '</div>';
		html += '<div class="col-xs-6" id="input-toDate">';
		html += '<input id="s_toDate" type ="text" class="form-control" name="s_toDate" value="" placeholder="마감일자: yyyy-mm-dd" >';
		html += '</div>';
		html += '</td>';
		html += '</tr>';
		html += '</tbody>';
		html += '</table>';
		html += '<div align="center">';
		html += '<button class="btn btn-default" id="btn_registerConfirm" type="submit">등록</button>';
		html += '</div>';
		html += '</form>';
		$("#main").after(html);
		$(document).ready(function() {
			var formObj = $("form[role='form']");
			$("#btn_registerConfirm").on("click", function(e){
				var id = $("#s_id").val();
				var title = $("#s_title").val();
				var content = $("#s_content").val();
				var place = $("#s_place").val();
				var attendee = $("#s_attendee").val();
				var checked = $(':radio[name="optradio"]:checked').val();
				var fromDate = $("#s_fromDate").val();
				var toDate = $("#s_toDate").val();
				e.preventDefault();
				if(title.length == 0){
					alert("제목을 입력하세요");
				} else if(content.length == 0){
					alert("내용을 입력하세요.");
				} else if(place.length==0){
					alert("장소를 입력하세요.");
				} else if(attendee.length == 0){
					alert("참석자를 입력하세요.");
				} else if(checked != "0" && checked != "1"){
					alert("일정 구분을 체크하세요.");
				} else if(!isValidDate(fromDate) || !isValidDate(toDate)){
					alert("일정 날짜를 yyyy-mm-dd로 입력하세요");
				} else {
					alert(id +"님 등록되었습니다.");
					formObj.attr("action", "/schedule/register");
					formObj.attr("method", "post");
					formObj.submit();
				}
			});
		});
	});
	
	function isValidDate(dateString)
	{
	    // First check for the pattern
	    var regex_date = /^\d{4}\-\d{1,2}\-\d{1,2}$/;

	    if(!regex_date.test(dateString))
	    {
	        return false;
	    }

	    // Parse the date parts to integers
	    var parts   = dateString.split("-");
	    var day     = parseInt(parts[2], 10);
	    var month   = parseInt(parts[1], 10);
	    var year    = parseInt(parts[0], 10);

	    // Check the ranges of month and year
	    if(year < 1000 || year > 3000 || month == 0 || month > 12)
	    {
	        return false;
	    }

	    var monthLength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

	    // Adjust for leap years
	    if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
	    {
	        monthLength[1] = 29;
	    }

	    // Check the range of the day
	    return day > 0 && day <= monthLength[month - 1];
	}
		
	</script>
</body>
</html>