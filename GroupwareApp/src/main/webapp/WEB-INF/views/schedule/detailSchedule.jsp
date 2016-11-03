<%@ page import="com.donkunny.schedule.ScheduleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ page session="true" %>

<!doctype html>
<html>
	<head>
		<%@ include file="/WEB-INF/views/include/style.jsp" %>
		<style type="text/css">
			#register_table {
			position: relative;
			width: 60%;
			margin-top: 30px;
			}
			
			#register_title {
				margin-top: 200px;
			}
		</style>
	</head>
	<body>
		<form role="form" id="schedule">
		<input type="hidden" id="s_id" name="s_id" value="${memberVO.id}" >
		<h3 align="center" id="register_title">자세한 일정 내용</h3>
		<table align="center" id="register_table" class="table table-bordered">
			<tbody>
				<tr>
					<th scope="row"><i class="fa fa-lightbulb-o" aria-hidden="true"></i> 제목</th>
					<td><input id="s_title" type="text" class="form-control" name="s_title" value="${scheduleVO.s_title}" readonly="readonly"></td>
				</tr>
				<tr>
					<th scope="row"><i class="fa fa-lightbulb-o" aria-hidden="true"></i>작성자</th>
					<td><input id="s_id" type="text" class="form-control" name="s_id" value="${scheduleVO.s_id}" readonly="readonly"></td>
				</tr>
				<tr>
					<th scope="row"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 내용</th>
					<td><textarea id="s_content" class="form-control" name="s_content" readonly="readonly">"${scheduleVO.s_content}"</textarea></td>
				</tr>
				<tr>
					<th scope="row"><i class="fa fa-map-marker" aria-hidden="true"></i>장소</th>
					<td><input id="s_place" type="text" class="form-control" name="s_place" value="${scheduleVO.s_place}" readonly="readonly"></td>
				</tr>
				<tr>
					<th scope="row"><i class="fa fa-users" aria-hidden="true"></i>참석자</th>
					<td><input id="s_attendee" type="text" class="form-control" name="s_attendee" value="${scheduleVO.s_attendee}" readonly="readonly"></td>
				</tr>
				<tr>
					<th scope="row"><i class="fa fa-eye" aria-hidden="true"></i>일정 구분</th>
					<td>
						<div class="radio">
							<c:if test="${scheduleVO.s_type == '0'}">
								<strong>공유일정</strong>
							</c:if>
							<c:if test="${scheduleVO.s_type == '1'}">
								<strong>개인일정</strong>
							</c:if>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row"><i class="fa fa-calendar-o" aria-hidden="true"></i>기간</th>
					<td>
						<div class="col-xs-6" id="input-fromDate">
							<input id="s_fromDate" type="text" class="form-control" name="s_fromDate" value="${scheduleVO.s_fromDate}" readonly="readonly">
						</div>
						<div class="col-xs-6" id="input-toDate">
							<input id="s_toDate" type="text" class="form-control" name="s_toDate" value="${scheduleVO.s_toDate}" readonly="readonly">
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div align="center">
		</div>
		</form>
		<%@ include file="/WEB-INF/views/include/script.jsp" %>
		<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("form[role='form']");
			
		});
		</script>
	</body>
</html>