<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset='utf-8' />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>X-Normal GroupWare Solution</title>

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/css/bootstrap.min.css"> 
<link rel="stylesheet" href='${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/css/select2.min.css' />
<link rel="stylesheet" href='${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/css/bootstrap-datetimepicker.min.css' /> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/css/main.css">
</head>
<body>
	<jsp:include page="../schedule/scMenubar.jsp" /> 
	
	<script type="text/javascript">
	var empId = '${empId}';
	var username =  '${username}';
	</script>

	<div class="main-container">
		<div class="pd-20 card-box mb-30">
	  		<div class="container">

		        <!-- 날짜 클릭시 메뉴나옴 -->
		        <div id="contextMenu" class="dropdown clearfix">
		            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
		                style="display:block;position:static;margin-bottom:5px;">
		                <li><a tabindex="-1" href="#">일정등록</a></li>
		                <li class="divider"></li>
		                <li><a tabindex="-1" href="#" data-role="close">닫기</a></li>
		            </ul>
		        </div>
		 		 	
				<!-- 달력일정 보여주기 -->
		        <div id="wrapper">
		           <div id="loading"></div>
		           <div id="calendar"></div>
		        </div>

     		   	<!-- 일정 추가시 모달창 -->
		        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
		            <div class="modal-dialog" role="document">
		                <div class="modal-content">
		                    
		                    <div class="modal-header">
		                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                        	<span aria-hidden="true">&times;</span>
		                        </button>
		                        <h4 class="modal-title"></h4>
		                    </div>
		                    
		                    <div class="modal-body">
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
		                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
		                            </div>
		                        </div>
		
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-title">일정명</label>
		                                <input class="inputModal" type="text" name="edit-title" id="edit-title" required="required" />
		                            </div>
		                        </div>
		                       
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-start">시작</label>
		                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
		                            </div>
		                        </div>
		                        
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-end">끝</label>
		                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
		                            </div>
		                        </div>
		                        
		                         <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-color">색상</label>
		                                <select class="inputModal" name="color" id="edit-color">
		                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
		                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
		                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
		                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
		                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
		                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
		                                    <option value="#ffd400" style="color:#ffd400;">노란색</option>
		                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
		                                    <option value="#495057" style="color:#495057;">검정색</option>
		                                </select>
		                            </div>
		                        </div>
		                        
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-desc">설명</label>
		                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc" id="edit-desc" style="resize: none;"></textarea>
		                            </div>
		                        </div>
		                        
		                         <div class="row" style="visibility:hidden;">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-type">구분</label>
		                                <select class="inputModal" type="text" name="edit-type" id="edit-type" value="카테고리1">
		                                    <option value="카테고리1" selected>내일정</option>                 
		                                </select>
		                            </div>
		                        </div>
		                        
		                    </div>
		                    <!-- /.modal-body -->
		                    <div class="modal-footer modalBtnContainer-addEvent">
		                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
		                    </div>
		                    <div class="modal-footer modalBtnContainer-modifyEvent">
		                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
		                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
		                    </div>
		                </div><!-- /.modal-content -->
		            </div><!-- /.modal-dialog -->
		        </div><!-- /.modal -->       
    		</div><!-- /.container -->
  		</div><!-- /.card-box -->
     	<jsp:include page="../common/footer.jsp" />
    </div><!-- /.main-container -->
   
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/js/bootstrap.min.js"></script> 
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/js/moment.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/js/fullcalendar.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/js/ko.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/js/bootstrap-datetimepicker.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/js/select2.min.js"></script>
	     
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/js/main.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/js/addEvent.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/js/editEvent.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/js/etcSetting.js"></script>
	    
</body>
</html>