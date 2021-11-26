<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="utf-8">
<title>X-Nomal Groupware Solution</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<style>
.logo> form > .light-logo{
 margin-left: 60px;
 margin-bottom: 20px;
 margin-top: 50px;
 height: 80px;
 width: 150px;
}


/* 
.sidebar-menu .dropdown-toggle:hover, .sidebar-menu .show>.dropdown-toggle {
    background: rgba(0,100,0,.4);
    color: #fff;
} */
.sidebar-menu .submenu li a.active, .sidebar-menu .submenu li a:hover{
background: rgba(255, 255, 255, 1);;
    color: #000;
}
.badge{
font-size: 8px;
margin-left: 10px;
}
</style>
</head>
<body>
   
    <div class="left-side-bar">
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
                             <span class="micon dw dw-email-1"></span><span class="mtext">전자 메일<span class="badge badge-pill badge-danger" id="count1"></span></span>
                        </a>
                        <ul class="submenu">
                            <li><a href="insertForm.ml">메일 작성</a></li>
                            <li><a href="receiveList.ml">받은 메일함<span class="badge badge-pill badge-danger" id="count2"></span></a></li>
                            <li><a href="sendList.ml">보낸 메일함</a></li>
                            <li><a href="waste.ml">휴지통</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-inbox-3"></span><span class="mtext">전자 결재<span class="badge badge-pill badge-success" id="count3"></span> </span>
                        </a>
                        <ul class="submenu">
                           <li class="dropdown">
                                <a href="javascript:;" class="dropdown-toggle">
                                    <span class="micon dw dw-edit2"></span><span class="mtext">결재 서류 작성</span>
                                </a>
                                <ul class="submenu child">
                                    <li><a href="certificateForm.ap">증명서 신청</a></li>
                                    <li><a href="holidayForm.ap">휴가 신청</a></li>
                                    <li><a href="overtimeForm.ap">외근 신청</a></li>
                                </ul>
                            </li>
                            <li><a href="apping.ap">진행중 결재함</a></li>
                            <li><a href="askapp.ap">결재 요청함<span class="badge badge-pill badge-success" id="count4"></span></a></li>
                            <li><a href="apped.ap">완료 결재함</a></li>
                        </ul>
                        
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-chat-11"></span><span class="mtext">커뮤니티</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="voting.vo">투표 게시판</a></li>
                            <li><a href="list.bo">익명 게시판</a></li>
                            <li><a href="notice.bo">공지 사항</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-wall-clock1"></span><span class="mtext">근태 관리</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="attendanceMy.att">내 근태 현황</a></li>
                            <li><a href="attendanceDay.att">일별 근태 현황</a></li>
                            <li><a href="attendanceMonth.att">월별 근태 현황</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-calendar1"></span><span class="mtext">근무 일정 관리</span>
                        </a>
                        <ul class="submenu">
							   <li><a href="main.sc">근무 일정</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-computer"></span><span class="mtext">시스템 관리</span>
                        </a>
                        <ul class="submenu">
                        
                        
	                        <c:if test="${ loginUser.rightNo eq 1 }">
							<li><a href="enrollEmp.me">사원 등록 </a></li>
							</c:if>
							
                            <li><a href="listEmp.me">사원 조회 </a></li>
                            
                           
                            <li><a href="supplies.me">비품 예약 </a></li>
                            
                            
                            <li class="updateSup"><a type="button">비품 기간 연장 </a></li>
                            
                            <c:if test="${ loginUser.rightNo eq 4 }">
                            <li><a href="return.me">비품 반납 </a></li>
							</c:if>
							
                            <li><a href="meetingRoom.me">회의실 예약 </a></li>
                            <li class="meetingDetail"><a type="button">회의실 예약 취소 </a></li>
                            
                        </ul>
                    </li>
                  </ul>
        	 </div>
      	</div>
   </div> 
   <script>
   $(function(){
	   $(".updateSup a").click(function(){
		   location.href="updateSupForm.su?empId=" + ${ loginUser.empId }
	   })
	   
	   $(".meetingDetail a").click(function(){
		   location.href="meetingDetail.me?empId=" + ${ loginUser.empId }
	   })
   })
   
   $.ajax({
	 url:"count.ml",
	 type:"get",
	 success:function(count){
		 
		 if(count>0){
			 $("#count1").text(count);
			 $("#count2").text(count);
		 }
		 
	 },
	 error:function(e){
			console.log("ajax 통신 실패");
	 }
	 
   })
      $.ajax({
	 url:"count.ap",
	 type:"get",
	 success:function(count){
		 
		 if(count>0){
			 $("#count3").text(count);
			 $("#count4").text(count);
		 }
		 
	 },
	 error:function(e){
			console.log(" ajax 통신 실패");
	 }
	 
   })
   </script>
 


</body>
</html>