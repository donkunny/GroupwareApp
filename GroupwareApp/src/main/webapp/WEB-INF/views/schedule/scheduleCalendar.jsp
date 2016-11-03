<%@page import="com.donkunny.member.MemberVO"%>
<%@page import="java.awt.DisplayMode"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page import="com.donkunny.schedule.ScheduleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ page import="java.util.Calendar" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page session="true" %>
<%
// Global Vars
int action = 0;  // incoming request for moving calendar up(1) down(0) for month
int currYear = 0; // if it is not retrieved from incoming URL (month=) then it is set to current year
int currMonth = 0; // same as year
String boxSize = "100";  // how big to make the box for the calendar
//build 2 calendars
Calendar c = Calendar.getInstance();
Calendar cal = Calendar.getInstance();
	if (request.getParameter("action") == null) // Check to see if we should set the year and month to the current
	{
		currMonth = c.get(c.MONTH);
		currYear = c.get(c.YEAR);
		cal.set(currYear, currMonth,1);
	}
	else
	{
		if (!(request.getParameter("action") == null)) // Hove the calendar up or down in this if block
		{
			currMonth = Integer.parseInt(request.getParameter("month"));
			currYear = Integer.parseInt(request.getParameter("year"));
				if (Integer.parseInt( request.getParameter("action")) == 1 )
				{
					cal.set(currYear, currMonth, 1);
					cal.add(cal.MONTH, 1);
					currMonth = cal.get(cal.MONTH);
					currYear = cal.get(cal.YEAR);
				}
				else
				{
					cal.set(currYear, currMonth ,1);
					cal.add(cal.MONTH, -1);
					currMonth = cal.get(cal.MONTH);
					currYear = cal.get(cal.YEAR);
				}
		}
	} 
%>

<%!
    public boolean isDate(int m, int d, int y) // This method is used to check for a VALID date
    {
        m -= 1;
        Calendar c = Calendar.getInstance();
        c.setLenient(false);
        try{
                c.set(y,m,d);
                Date dt = c.getTime();
        } catch (IllegalArgumentException e){
                return false;
        }
                return true;
    }
%>
<%!
   public String getDateName (int monthNumber) // This method is used to quickly return the proper name of a month
   {
		String strReturn = "";
		switch (monthNumber)
		{ 
	case 0:
		strReturn = "1월";
		break;
	case 1:
		strReturn = "2월";
		break;
	case 2:
		strReturn = "3월";
		break;
	case 3:
		strReturn = "4월";
		break;
	case 4:
		strReturn = "5월";
		break;
	case 5:
		strReturn = "6월";
		break;
	case 6:
		strReturn = "7월";
		break;
	case 7:
		strReturn = "8월";
		break;
	case 8:
		strReturn = "9월";
		break;
	case 9:
		strReturn = "10월";
		break;
	case 10:
		strReturn = "11월";
		break;
	case 11:
		strReturn = "12월";
		break;
	}
	return strReturn;
    }
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
			padding-top: 120px;
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
	<% MemberVO obj = (MemberVO)session.getAttribute("memberVO"); %>	
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
				<li><a href="/proposal/main?p_id=<%=obj.getId()%>">결재 관리</a></li>
				<li><a href="#">문의하기</a></li>
			</ul>
		</div>
	</nav>
	
	<!-- tab bar -->
	<ul class="nav nav-tabs" id="schedulerTab" role="tablist">
		<!-- 검색 기능 넣기 -->
		<li role="presentation" class="active" ><a href="#main" aria-controls="main">메인</a></li>
		<!-- <li role="presentation"><a href="#daily" aria-controls="daily">일간</a></li> -->
		<!-- <li role="presentation"><a href="#daily" aria-controls="daily">주간</a></li> -->
	</ul>
	
	<!-- Sidebar -->
	<div class="list-group" id="shedulerBar" align="center">
 		<a class="list-group-item active">나의 일정</a>
  		<a href="#register" id="registerMySchedule" class="list-group-item list-group-item-action" >일정 등록</a>
  		<a id="myscheduleList" class="list-group-item list-group-item-action">일정 목록</a>
	</div>
	
	<!-- contents of tab bar -->
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="main" align="center"><br>
			<h3><strong>월간 업무 일정</strong></h3>
			<!-- 테이블 만들기 -->
			<!--날짜 네비게이션  -->
			<a href="scheduleCalendar?month=<%=currMonth%>&year=<%=currYear%>&action=0"><font size="3">&#60;&#60;</font></a>
			<b style="font-size: 20px"><%=getDateName (cal.get(cal.MONTH)) + " " + cal.get(cal.YEAR)%></b>
			<a href="scheduleCalendar?month=<%=currMonth%>&year=<%=currYear%>&action=1"><font size="3">&#62;&#62;</font></a>
			
			<br><br>
			<table border="0" width="520" bordercolorlight="#C0C0C0" bordercolordark="#808080" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" cellspacing="0">
  				<td width="100%">
    			<table border="2" width="519" bordercolorlight="#C0C0C0" bordercolordark="#000000" style="border-collapse: collapse" bordercolor="#000000" cellpadding="0" cellspacing="0" bgcolor="#DFDCD8">
  					<tr>
    					<td height="35" width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
    					<font color="#FFFFFF"><b>일</b></font></td>
    					<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
    					<font color="#FFFFFF"><b>월</b></font></td>
    					<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
    					<font color="#FFFFFF"><b>화</b></font></td>
    					<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
   						<font color="#FFFFFF"><b>수</b></font></td>
    					<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
    					<font color="#FFFFFF"><b>목</b></font></td>
    					<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
    					<font color="#FFFFFF"><b>금</b></font></td>
    					<td width="<%=boxSize%>" align="center" nowrap bordercolor="#666666" bgcolor="#666666">
    					<font color="#FFFFFF"><b>토</b></font></td>
  				</tr>
<%
//Calendar loop
	int currDay;
	String todayColor;
	int count = 1;
	int dispDay = 1;
	int num = -1;
	String id_schedule = null;
	List<ScheduleVO> list = (List<ScheduleVO>)request.getAttribute("scheduleList");
	String[] cal_list = new String[list.size()];
	for(int i = 0; i<list.size(); i++){
		cal_list[i] = list.get(i).getS_fromDate();
	}
	for (int w = 1; w < 7; w++) {
%>
  	<tr>
<% 
  		for (int d = 1; d < 8; d++){
			if (! (count >= cal.get(c.DAY_OF_WEEK))){ 
%>
		<td width="<%=boxSize%>" height="<%=boxSize%>" valign="top" align="left">&nbsp;</td>
<%
				count += 1;
			} 
			else{
				if (isDate ( currMonth + 1, dispDay, currYear)){  // use the isDate method
					if ( dispDay == c.get(c.DAY_OF_MONTH) && c.get(c.MONTH) == cal.get(cal.MONTH) && c.get(c.YEAR) == cal.get(cal.YEAR)){ // Here we check to see if the current day is today
						todayColor = "#FFE4E1";
					} else {
						todayColor = "#ffffff";
					}
					if(dispDay < 10 && cal.get(cal.MONTH)+1 < 10){		
						id_schedule = String.valueOf(cal.get(cal.YEAR)) + "-0" + String.valueOf(cal.get(cal.MONTH)+1) + "-0" + String.valueOf(dispDay); 
					} else if(dispDay >= 10 && cal.get(cal.MONTH)+1 < 10){
						id_schedule = String.valueOf(cal.get(cal.YEAR)) + "-0" + String.valueOf(cal.get(cal.MONTH)+1) + "-" + String.valueOf(dispDay);
					} else if(dispDay < 10 && cal.get(cal.MONTH)+1 >= 10){
						id_schedule = String.valueOf(cal.get(cal.YEAR)) + "-" + String.valueOf(cal.get(cal.MONTH)+1) + "-0" + String.valueOf(dispDay);
					} else {
						id_schedule = String.valueOf(cal.get(cal.YEAR)) + "-" + String.valueOf(cal.get(cal.MONTH)+1) + "-" + String.valueOf(dispDay);
					}
%>
		<td id=<%=id_schedule %> bgcolor ="<%=todayColor%>" width="<%=boxSize%>" align="left" height="<%=boxSize%>" valign="top"><%=dispDay%><br>
<%
					num = -1;
					for(int i=0;i<cal_list.length;i++){
						if(id_schedule.equals(cal_list[i])){
							num = i;
							if(list.get(i).getS_type() == 1 && obj.getId().equals(list.get(i).getS_id())){
%>
			<a style="color: #B22222" id="detailSchedule" href="/schedule/detailSchedule?sno=<%=list.get(num).getSno() %>" target="_blank" ><strong><%=list.get(num).getS_title() %></strong></a><br>
<%
							} else if(list.get(i).getS_type() == 1 && !(obj.getId().equals(list.get(i).getS_id()))){
								
							} else {
%>
			<a id="detailSchedule" href="/schedule/detailSchedule?sno=<%=list.get(num).getSno() %>" target="_blank" ><strong><%=list.get(num).getS_title() %></strong></a><br>
<%								
							}
						}
					}
%>
		</td>
<%
					count += 1;
					dispDay += 1;
				} else {
%>
		<td width="<%=boxSize%>" align="left" height="<%=boxSize%>" valign="top">&nbsp;</td>
<%
				} 
			}
       } 
%>
  	</tr> 
<% 
}
%>
</table>
</td>
<tr><td>
</table>
	<br>
	<p align="center">개인일정은 빨간색이고, 공유일정은 파란색입니다.</p>
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
		
		$("#detailSchedule").click(function(){
		});
		
	</script>
</body>
</html>