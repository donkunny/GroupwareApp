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
							<label id="privateOpt"><input type="radio" name="optradio" value="1">개인 일정</label> <label id="publicOpt">
							<input type="radio" name="optradio" value="0">공유 일정</label>
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
	</body>
</html>