<%@ page import="com.donkunny.schedule.ScheduleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ page session="true" %>

<!doctype html>
<html>
	<head>
		<%@ include file="/WEB-INF/views/include/style.jsp" %>
		<style type="text/css">
			.table {
			position: relative;
			width: 80%;
			margin-top: 30px;
			}
		</style>
	</head>
	<body>
		<form role="form" id="schedule">
		<input type="hidden" id="s_id" name="s_id" value="${memberVO.id}" >
		<table align="center" id="register_table" class="table table-bordered">
			<h3 align="center" id="register_title">일정 등록하기</h3>
			<tbody>
				<tr>
					<th scope="row"><i class="fa fa-lightbulb-o" aria-hidden="true"></i> 제목</th>
					<td><input id="s_title" type="text" class="form-control" name="s_title" value=""></td>
				</tr>
				<tr>
					<th scope="row"><i class="fa fa-pencil-square-o"
						aria-hidden="true"></i> 내용</th>
					<td><textarea id="s_content" row="10" class="form-control" name="s_content" value=""></textarea></td>
				</tr>
				<tr>
					<th scope="row"><i class="fa fa-map-marker" aria-hidden="true"></i>장소</th>
					<td><input id="s_place" type="text" class="form-control" name="s_place" value=""></td>
				</tr>
				<tr>
					<th scope="row"><i class="fa fa-users" aria-hidden="true"></i>참석자</th>
					<td><input id="s_attendee" type="text" class="form-control" name="s_attendee" value=""></td>
				</tr>
				<tr>
					<th scope="row"><i class="fa fa-eye" aria-hidden="true"></i>일정 구분</th>
					<td>
						<div class="radio">
							<label id="privateOpt"><input type="radio" name="s_type" value="1">개인 일정</label> 
							<label id="publicOpt"><input type="radio" name="s_type" value="0">공유 일정</label>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row"><i class="fa fa-calendar-o" aria-hidden="true"></i>기간</th>
					<td>
						<div class="col-xs-6" id="input-fromDate">
							<input id="s_fromDate" type="text" class="form-control" name="s_fromDate" value="" placeholder="시작일자: yyyy-mm-dd">
						</div>
						<div class="col-xs-6" id="input-toDate">
							<input id="s_toDate" type="text" class="form-control" name="s_toDate" value="" placeholder="마감일자: yyyy-mm-dd">
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div align="center">
		<button class="btn btn-default" id="btn_registerConfirm" type="submit">등록</button>
		</div>
		</form>
		<%@ include file="/WEB-INF/views/include/script.jsp" %>
		<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("form[role='form']");
			$("#btn_registerConfirm").on("click", function(e){
				var id = $("#s_id").val();
				var title = $("#s_title").val();
				var content = $("#s_content").val();
				var place = $("#s_place").val();
				var attendee = $("#s_attendee").val();
				var checked = $(':radio[name="s_type"]:checked').val();
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
				} else if(!isValidDate(fromDate) || !isValidDate(toDate) ){
					alert("일정 날짜를 yyyy-mm-dd로 입력하세요");
				} else {
					// 나의 일정 리스트로 이동
					alert(id +"님 등록되었습니다.");
					formObj.attr("action", "/schedule/register");
					formObj.attr("method", "post");
					formObj.submit();
				}
			});
		});
		// 날짜 형식: 2009-01-04		
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