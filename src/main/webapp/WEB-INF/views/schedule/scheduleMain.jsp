<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
<!-- jquery CDN -->

 <script src="${ pageContext.servletContext.contextPath }/resources/plugins/schedule/jquery3.js"></script>
<!-- fullcalendar CDN -->

<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/plugins//schedule/fullcalendar2.css">
 <script src="${ pageContext.servletContext.contextPath }/resources/plugins/schedule/fullcalendar2.min.js"></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script src='"${ pageContext.servletContext.contextPath }/resources/plugins/schedule/theme-chooser.js'></script>
<style>
/* body 스타일 */
html, body {
overflow: hidden;
font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
font-size: 14px;
}
/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
padding-top: 1em;
padding-left: 1em;
padding-right: 1em;
}
</style>
</head>
<body>
    
	<jsp:include page="../common/menubar.jsp" />

	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">

				<div class="pd-20 card-box mb-30">
					<h4>Today</h4>
					
					
				</div>
			
				
				<div class="pd-20 card-box mb-30">
					<!-- calendar 태그 -->
					<div id='calendar-container'>
						<div id='calendar'></div>
					</div>
					<!-- calendar modal -->
					<div id="modal-view-event"
						class="modal modal-top fade calendar-modal">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-body">
									<h4 class="h4">
										<span class="event-icon weight-400 mr-3"></span><span
											class="event-title"></span>
									</h4>
									<div class="event-body"></div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>

					<div id="modal-view-event-add"
						class="modal modal-top fade calendar-modal">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<form id="add-event">
									<div class="modal-body">
										<h4 class="text-blue h4 mb-10">일정등록</h4>
										<div class="form-group">
											<label>일정 제목</label> <input type="text"
												class="form-control fc-event-title-container" name="ename">
										</div>
										<div class="form-group">
											<label>시작 날짜</label>   <input  class="form-control date-picker"  name="date" type="text">   
										</div>
										<div class="form-group">
											<label>시작 시간</label> <input type='text'
												class="time-picker  form-control" name="edate">
										</div>
										<div class="form-group">
											<label>종료 시간</label> <input type='text'
												class="time-picker form-control" name="edate1">
										</div>
										<div class="form-group">
											<label>종료 날짜</label> <input type='text'
												class="form-control date-picker" name="edate1">
										</div>
										
										<div class="form-group">
											<label>장소</label> <input type="text"
												class="form-control" name="eplace">
										</div>
										<div class="form-group">
											<label>일정내용</label>
											<textarea class="form-control" name="edesc"></textarea>
										</div>
										<div class="form-group">
											<label>일정색상</label>
											<div class="btn-list">
											<button type="button" class="btn btn-primary"></button>
											<button type="button" class="btn btn-success"></button>
								<button type="button" class="btn btn-danger"></button>
								<button type="button" class="btn btn-warning"></button>
								<button type="button" class="btn btn-dark"></button>
								</div>
												
										</div>
										<div class="form-group">
											<label>일정분류</label> <select class="form-control"
												name="eicon">
												
												<option value="circle">내 일정</option>
												<option value="cog">부서 일정</option>
												<option value="group">회사 전체일정</option>
											</select>
										</div>
										<div class="col-md-6 col-sm-12">
									<label>알림여부</label>
<!--   왜 안되냐고오오오오오!!!!!!!!!! 								
									<div class="mb-30">
									<p> <code>data-size="small",data-size="large"</code> </p>
									<input type="checkbox" checked="" class="switch-btn" data-size="small" data-color="#0099ff" data-switchery="true" style="display: none; color: rgb(0, 153, 255);">
									<span class="switchery switchery-small" style="background-color: rgb(0, 153, 255); border-color: rgb(0, 153, 255); box-shadow: rgb(0, 153, 255) 0px 0px 0px 11px inset; transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;">
									<small style="left: 13px; transition: background-color 0.4s ease 0s, left 0.2s ease 0s; background-color: rgb(255, 255, 255);">
									</small>
									</span>
									<input type="checkbox" checked="" class="switch-btn" data-size="small" data-color="#f56767" data-switchery="true" style="display: none; color: rgb(245, 103, 103);">
									</div>
-->									
									<div class="custom-control custom-checkbox mb-5">
										<input type="checkbox" class="custom-control-input" id="customCheck1">
										<label class="custom-control-label" for="customCheck1">하루 전</label>
									</div>
									<div class="custom-control custom-checkbox mb-5">
										<input type="checkbox" class="custom-control-input" id="customCheck2">
										<label class="custom-control-label" for="customCheck2">한 시간 전</label>
									</div>
									  <div class="custom-control custom-checkbox mb-5" >
                    <button type="submit" class="btn-primary">등록하기</button>
                    <button type="reset" class="btn-danger">취소하기</button>
                </div>
								</div>
										
									</div>

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
<script
		src="${ pageContext.servletContext.contextPath }/resources/plugins//schedule/calendar-setting2.js"></script>	
<script>
(function(){
$(function(){
// calendar element 취득
var calendarEl = $('#calendar')[0];
// full-calendar 생성하기
var calendar = new FullCalendar.Calendar(calendarEl, {
height: '700px', // calendar 높이 설정
expandRows: true, // 화면에 맞게 높이 재설정
slotMinTime: '08:00', // Day 캘린더에서 시작 시간
slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
// 해더에 표시할 툴바
headerToolbar: {
left: 'prev,next today',
center: 'title',
right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
},
initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)

navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
editable: true, // 수정 가능?
selectable: true, // 달력 일자 드래그 설정가능
nowIndicator: true, // 현재 시간 마크
dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
locale: 'ko', // 한국어 설정
eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
console.log(obj);

},
eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
console.log(obj);
},
eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
console.log(obj);
},
eventClick: function(event, jsEvent, view) {
	jQuery('.event-icon').html("<i class='fa fa-"+event.icon+"'></i>");
	jQuery('.event-title').html(event.title);
	jQuery('.event-body').html(event.description);
	jQuery('.eventUrl').attr('href',event.url);
	jQuery('#modal-view-event').modal();
},

select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.


var title =  prompt('','.calendar-modal');
if (title) {
calendar.addEvent({
title: title,
start: arg.start,
end: arg.end,
allDay: arg.allDay
})
}
calendar.unselect()


},
// 이벤트
events: [

]
});
// 캘린더 랜더링
calendar.render();
});
})();
</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>