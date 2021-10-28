<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>DeskApp - Bootstrap Admin Dashboard HTML Template</title>


<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/plugins/fullcalendar/fullcalendar.css">

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="title">
								<h4>근무 일정관리</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">일정관리</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<div class="pd-20 card-box mb-30">
					<h4>Today</h4>
				</div>
				
				
				<div class="pd-20 card-box mb-30">
					<div class="calendar-wrap">
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
												class="form-control" name="ename">
										</div>
										<div class="form-group">
											<label>시작 날짜</label> <input type='text'
												class="date-picker  form-control" name="edate">
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
												class="date-picker form-control" name="edate1">
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
											<label>일정색상</label> <select class="form-control"
												name="ecolor">
												<option value="fc-bg-default">색깔없음</option>
												<option value="fc-bg-blue">파랑</option>
												<option value="fc-bg-lightgreen">연두</option>
												<option value="fc-bg-pinkred">빨강</option>
												<option value="fc-bg-deepskyblue">하늘</option>
												<option value="fc-bg-yellow">노랑</option>
											</select>
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
									<div class="custom-control custom-checkbox mb-5">
										<input type="checkbox" class="custom-control-input" id="customCheck1">
										<label class="custom-control-label" for="customCheck1">하루 전</label>
									</div>
									<div class="custom-control custom-checkbox mb-5">
										<input type="checkbox" class="custom-control-input" id="customCheck2">
										<label class="custom-control-label" for="customCheck2">한 시간 전</label>
									</div>
									
								</div>
											<div class="form-group">
											<label>알림 여부</label> <input type="text"
												class="form-control" name="eplace">
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
	<!-- js -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/core.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/script.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/process.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/layout-settings.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/plugins/fullcalendar/fullcalendar.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/calendar-setting.js"></script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>