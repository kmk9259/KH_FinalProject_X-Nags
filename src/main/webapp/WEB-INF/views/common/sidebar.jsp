<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>X-Nomal Groupware Solution</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<style>
.logo>a>img{
 margin-left: 60px;
 margin-bottom: 20px;
 margin-top: 50px;
 height: 80px;
 width: 150px;
}
</style>
</head>
<body>
   
    <div class="left-side-bar">
        <div class="logo">
            <a href="main">
                <img src="${ pageContext.servletContext.contextPath }/resources/images/logo/logowhite.png" alt="" class="light-logo">
            </a>
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
                            <li><a href="index.jsp">로그인 후 메인화면</a></li>
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
                     <li><a href="">결재 서류 작성</a></li>
                            <li><a href="">진행중 결재함</a></li>
                            <li><a href="">완료 결재함</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">커뮤니티</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="">투표 게시판</a></li>
                            <li><a href="list.bo">익명 게시판</a></li>
                            <li><a href="">공지 사항</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">근태 관리</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="attendanceMy.att">내 근태 현황</a></li>
                            <li><a href="index2.html">일별 근태 현황</a></li>
                            <li><a href="index2.html">월별 근태 현황</a></li>
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
                            <span class="micon dw dw-house-1"></span><span class="mtext">시스템 관리</span>
                        </a>
                        <ul class="submenu">
							<li><a href="enrollEmp.me">사원 등록</a></li>
                      		<li><a href="listEmp.me">사원 조회 </a></li>
                      		<li><a href="supplies.me">비품 반납 </a></li>
                        </ul>
                    </li>
                  </ul>
        	 </div>
      	</div>
   </div> 



</body>
</html>