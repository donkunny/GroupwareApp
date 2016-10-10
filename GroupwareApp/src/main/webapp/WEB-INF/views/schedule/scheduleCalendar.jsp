<%@ page import="com.donkunny.schedule.ScheduleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ page import="java.util.Calendar" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page session="true" %>
<%
	// Calendar 클래스를 이용한 달력 만들기 JSP, 자바킹님의 네이버 블로그 참조
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	
	cal.set(year, month, 1);
	
	//년도/월 셋팅
	cal.set(year, month, 1);
	 
	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0;
	 
	//오늘 날짜 저장
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
%>

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
  		<a id="myscheduleList" class="list-group-item list-group-item-action">일정 목록</a>
	</div>
	
	<!-- contents of tab bar -->
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="main">
			<!-- 테이블 만들기 -->
			
			
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
	
		$("#registerMySchedule").bind("click", function(){
			window.open('/schedule/myRegister', '나의 일정 등록', 'width=800, height=700');
		});
		
		$("#myscheduleList").click(function(){
			window.open('/schedule/slist', '나의 일정 보기', 'width=800, height=700');
		});
	</script>
</body>
</html>