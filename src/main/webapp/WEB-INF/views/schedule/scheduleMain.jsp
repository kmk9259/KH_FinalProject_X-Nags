<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset='utf-8' />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>>X-Normal GroupWare Solution</title>




<link rel="shortcut icon" href="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/image/favicon.ico">

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/css/bootstrap.min.css"> 
<link rel="stylesheet" href='${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/css/select2.min.css' />
 <link rel="stylesheet" href='${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/css/bootstrap-datetimepicker.min.css' />
 
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/css/main.css">
<style>
.logo> form > .light-logo{
 /*  margin-left: 60px;
 margin-bottom: 20px; */
 margin-top: 15px; 
 height: 80px;
 width: 150px;
 background-color: black; 
 text-align: center;
}
.logo{
background-color: #ffffff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0px 0px 28px rgba(0, 0, 0, .08);
	-moz-box-shadow: 0px 0px 28px rgba(0, 0, 0, .08);
	box-shadow: 0px 0px 28px rgba(0, 0, 0, .08);
text-align: center;
 background-color: black;
 height: 110px;
}
.card-box{
	background-color: #ffffff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0px 0px 28px rgba(0, 0, 0, .08);
	-moz-box-shadow: 0px 0px 28px rgba(0, 0, 0, .08);
	box-shadow: 0px 0px 28px rgba(0, 0, 0, .08);
	
}
/* .mb-20{margin-bottom: 20px;} */
.pd-20{padding: 20px;} */
body {
background: #ecf0f4;
}
#wrapper{
/* margin:10px; */
background-color: #ffffff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0px 0px 28px rgba(0, 0, 0, .08);
	-moz-box-shadow: 0px 0px 28px rgba(0, 0, 0, .08);
	box-shadow: 0px 0px 28px rgba(0, 0, 0, .08);
}
</style>
</head>
<body>
<script type="text/javascript">
var empId = '${empId}';
var username =  '${username}';
</script>

<%-- 	<jsp:include page="../common/menubar.jsp" />  --%>

<%-- <jsp:include page="../schedule/scMenubar.jsp" /> --%>
	  <div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">일정등록</a></li>
                
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>
 		 	<div class="logo" >
        
           <form action="main.xnags" method="post"> 
                <input type="image"  src="${ pageContext.servletContext.contextPath }/resources/images/logo/logowhite.png" onClick="login(e);" class="light-logo" >
				<input type="hidden" name="empId" value="${ sessionScope.loginUser.empId }">
                
           </form>
            
            <div class="close-sidebar" data-toggle="left-sidebar-close">
                <i class="ion-close-round"></i>
            </div>
			</div> 
			
	<%-- 		 <div class="left-side-bar" style="background-color: black">
        <div class="logo">
        
           <form action="main.xnags" method="post"> 
                <input type="image"  src="${ pageContext.servletContext.contextPath }/resources/images/logo/logowhite.png" onClick="login(e);" class="light-logo">
				<input type="hidden" name="empId" value="${ sessionScope.loginUser.empId }">
                
           </form>
            
            <div class="close-sidebar" data-toggle="left-sidebar-close">
                <i class="ion-close-round"></i>
            </div>
        </div><br><br>
        <div class="menu-block customscroll">
            <div class="sidebar-menu">
                <ul id="accordion-menu">
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">홈</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="datePicker">로그인 후 메인화면</a></li>
                        </ul>
                    </li>
                    
                     <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">전자 메일</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="insertForm.ml">메일 작성</a></li>
                            <li><a href="receiveList.ml">받은 메일함</a></li>
                            <li><a href="sendList.ml">보낸 메일함</a></li>
                            <li><a href="waste.ml">휴지통</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">전자 결재</span>
                        </a>
                        <ul class="submenu">
                           <li class="dropdown">
                                <a href="javascript:;" class="dropdown-toggle">
                                    <span class="micon dw dw-house-1"></span><span class="mtext">결재 서류 작성</span>
                                </a>
                                <ul class="submenu child">
                                    <li><a href="certificateForm.ap">증명서 신청</a></li>
                                    <li><a href="holidayForm.ap">휴가 신청</a></li>
                                    <li><a href="overtimeForm.ap">연장근무 신청</a></li>
                                </ul>
                            </li>
                            <li><a href="apping.ap">진행중 결재함</a></li>
                            <li><a href="askapp.ap">결재 요청함</a></li>
                            <li><a href="apped.ap">완료 결재함</a></li>
                        </ul>
                        
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">커뮤니티</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="voting.vo">투표 게시판</a></li>
                            <li><a href="list.bo">익명 게시판</a></li>
                            <li><a href="notice.bo">공지 사항</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">근태 관리</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="attendanceMy.att">내 근태 현황</a></li>
                            <li><a href="attendanceDay.att">일별 근태 현황</a></li>
                            <li><a href="attendanceMonth.att">월별 근태 현황</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">근무 일정 관리</span>
                        </a>
                        <ul class="submenu">
							   <li><a href="main.sc">근무 일정</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-apartment"></span><span class="mtext">시스템 관리</span>
                        </a>
                        <ul class="submenu">
							<li><a href="enrollEmp.me">사원 등록 </a></li>
                            <li><a href="listEmp.me">사원 조회 </a></li>
                            <li><a href="supplies.me">비품 예약 </a></li>
                            <li class="updateSup" type="button"><a>비품 기간 연장 </a></li>
                            <li><a href="return.me">비품 반납 </a></li>
                            <li><a href="meetingRoom.me">회의실 예약 </a></li>
                            
                        </ul>
                    </li>
                  </ul>
        	 </div>
      	</div>
   </div> 
   <script>
   $(function(){
	   var test = $(".updateSup a").text();
	   var empId = $(".test").text();
	   console.log("empId   " + empId);
	   console.log(" test " + test);
	   
	   $(".updateSup a").click(function(){
		   location.href="updateSupForm.su?empId=" + ${ loginUser.empId }
	   })
   })
   </script>
  --%>
			
			
			
			
			
        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
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
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
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
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc" style="resize: none;"></textarea>
                            </div>
                        </div>
                         <div class="row" style="visibility:hidden;">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type" value="카테고리1">
                                    <option value="카테고리1" selected>내일정</option>
                                    <!-- <option value="카테고리2">부서일정</option>
                                    <option value="카테고리3">회사전체일정</option> -->
                                   
                                </select>
                            </div>
                        </div>
                    </div>
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

        <!-- <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

             <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">구분</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="1">내일정</option>
                            <option value="2">부서일정</option>
                            <option value="3">회사전체일정</option>
                        </select>
                    </div>
                </div>

               <div class="col-lg-6">
                    <label for="calendar_view">등록자별</label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="정연"
                                checked>정연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="다현"
                                checked>다현</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
                                checked>사나</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="나연"
                                checked>나연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="지효"
                                checked>지효</label>
                    </div>
                </div> 

            </div>
        </div> -->
        <!-- /.filter panel -->
        <jsp:include page="../schedule/scFooter.jsp" />
    </div>
    <!-- /.container -->
    
 <script src="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/vendor/js/jquery.min.js"></script>
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
     <script src="${ pageContext.servletContext.contextPath }/resources/plugins/scResources/data.json"></script> 




 	
</body>
</html>