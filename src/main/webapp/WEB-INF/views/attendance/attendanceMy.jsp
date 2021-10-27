<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                    <div class="col-md-3">
                    	<div id="clock" class="light3">
                    		<div class="display3">
                    			<div class="weekdays"></div>
								<div class="ampm"></div>
								<div class="alarm"></div>
								<div class="digits"></div>
					 		</div>
						</div>
                    </div>
                    
                    <div class="col-md-6">
                        <h4 class="font-20 weight-500 mb-10 text-capitalize info">                            
                            <div class="weight-600 font-30 text-blue">${ sessionScope.loginUser.userName }님</div>
                        </h4>
                        <div class="info">
                        <label>출근 시간</label><br>
                        <label>퇴근 시간</label><br>
                        <label>주간 누적 근무시간</label><br>
                        <label>남은 연차</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-box pd-20 height-100-p mb-30">
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
				<table class="table table-bordered" style="text-align: center; ">
				  <thead>
				    <tr class="table-danger">
				      <th scope="col" width="430px">날짜</th>
				      <th scope="col" width="430px">출근</th>
				      <th scope="col" width="430px">퇴근</th>
				      <th scope="col" width="430px">현황 상태</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr >
				      <th scope="row">2021.10.26</th>
				      <th scope="row">09:00</th>
				      <th scope="row">18:00</th>
				      <th scope="row">정상</th>
				    </tr>
				  </tbody>
				</table>
                
            </div>
            <div class="card-box pd-20 height-100-p mb-30">
            	<h3>내 근로 시간</h3><p style="margin-left: 180px; margin-top: -25px;">주 25시간 30분 / 52시간</p><br>
            	<h4 class="h4 text-blue">Week</h4>
                     <div id="chart8"></div>
            </div>
            <div class="card-box pd-20 height-100-p mb-30">
            	
            	<div class="bg-white pd-20 card-box mb-30">
                    <h4 class="h4 text-blue">Month</h4>
                    <div id="chart3"></div>
                </div>
            </div>
            
            
            
            
            <jsp:include page="../common/footer.jsp"/>
        </div>
    </div>
	<!-- JavaScript Includes -->
		
	<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/script.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/plugins/apexcharts/apexcharts.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/apexcharts-setting.js"></script>
</body>
</html>