<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>X-Nomal Groupware Solution</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<style>
	.info{
	margin-left: 300px;
	}
	.scrolltbody {
    display: block;
    width: 1715px;
    border-collapse: collapse;
    border: 1px solid #000;
    position:relative;
	}
	.scrolltbody th { border: 1px solid #000; background: white; }
	.scrolltbody td { border: 1px solid #000; border-top: 0; }
	.scrolltbody tbody {
	    display: block;
	    height: 280px;
	    overflow: auto;
	}
	.scrolltbody > thead > tr>th{
	font-size: 15px;
	height: 47.33px;
	}
	.scrolltbody > tbody > tr>th{
	font-size: 15px;
	height: 47.33px;
	width: 500px;
	}
	.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 428px; }
	.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 428px; }
	.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { width: 428px; }
	.scrolltbody th:last-child { width: 428px; }
	 .scrolltbody td:last-child { width: calc( 420px - 19px );  } 
	</style>
	<!-- The main CSS file -->
	<link href="${ pageContext.servletContext.contextPath }/resources/assets/css/style.css" rel="stylesheet" />

	
</head>
<body >
	<jsp:include page="../common/menubar.jsp"/>
	
    
    <div class="mobile-menu-overlay"></div>
    
    <div class="main-container">
        <div class="pd-ltr-20">
            <div class="card-box pd-20 height-100-p mb-30">
                <div class="row align-items-center">
                    <div class="col-md-2">
                    	<div id="clock" class="light3">
                    		<div class="display3">
                    			<div class="weekdays"></div>
								<div class="ampm"></div>
								<div class="alarm"></div>
								<div class="digits"></div>
					 		</div>
						</div>
                    </div>
                    
                    <div class="col-md-9">
                        <h4 class="font-20 weight-500 mb-10 text-capitalize info">                            
                            <div class="weight-600 font-30 text-blue">${ sessionScope.loginUser.userName }님</div>
                        </h4>
                        <div class="info">
                        <table class="table table-striped table-bordered " style="text-align: center; width: 100%">				
							  <thead>							    
								<tr class="table-warning">
								<th scope="col" width="120px">출근 시간</th>
								<th scope="col" width="120px">퇴근 시간</th>
								<th scope="col" width="80px">주간 누적 근무시간</th>
								<th scope="col" width="80px">남은 연차</th>
								</tr>								
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row" id="inTime"></th>
							      <th scope="row" id="outTime">아직 퇴근 전입니다.</th>
							      <th scope="row">25 </th>
							      <th scope="row">10회</th>
							    </tr>
							  </tbody>
							</table>
                        
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="card-box pd-20 mb-30" >
            	<h3>내 근태 현황</h3><br>
             	
                <table class="table table-bordered" style="text-align: center; ">
				  <thead >
				    <tr class="table-info">
				      <th scope="col">지각</th>
				      <th scope="col">조퇴</th>
				      <th scope="col">결근</th>
				      <th scope="col">휴가</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <th scope="row">1</th>
				      <th scope="row">1</th>
				      <th scope="row">1</th>
				    </tr>
				  </tbody>
				</table>
				
				<table class="table scrolltbody" style="text-align: center; ">
				  <thead>
				    <tr class="table-danger">
				      <th scope="col" >날짜</th>
				      <th scope="col" >출근</th>
				      <th scope="col" >퇴근</th>
				      <th scope="col" >현황 상태</th>
				    </tr>
				  </thead>
				  
				  <tbody>				    
				    <c:forEach items="${ attMyList }" var="att">
	                    <tr>
	                        <td>${ att.attendanceDate }</td>
	                        <td>${ att.attendanceInTime }</td>
	                        <td>${ att.attendanceOutTime }</td>
	                        <td>${ att.attStatusNo }</td>
	                        
	                    </tr>
                    </c:forEach>				    
				  </tbody>
				</table>
            </div>
            <script>
               	$(function () {
					$.ajax({
						url:"attInTime.att",
						type:"post",
						data :{
							empId:"${sessionScope.loginUser.empId}"
						},
						success:function(att){
							console.log("성공");
							console.log(att);
							$("#inTime").html(att.attendanceInTime); 
						}
					});
				})
				/* $(function () {
					$.ajax({
						url:"selectAllMy.att",
						type:"post",
						data :{
							empId:"${sessionScope.loginUser.empId}"
						},
						success:function(att){
							console.log("성공");
							console.log(att);
							$("#inTime").html(att.attendanceInTime); 
						}
					});
				}) */
           	</script>
            
            
            <jsp:include page="../common/footer.jsp"/>
        </div>
       
    </div>
	<!-- JavaScript Includes -->
		
	<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/script.js"></script>
    
</body>
</html>