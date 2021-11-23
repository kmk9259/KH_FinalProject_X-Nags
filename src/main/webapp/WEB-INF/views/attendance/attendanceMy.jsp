<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
        	<div class="page-header">
				<div class="row">
					<div class="col-md-6 col-sm-12">
						<div class="title">
							<h4>근태 관리</h4>
						</div>
						<nav aria-label="breadcrumb" role="navigation">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="">홈</a></li>
								<li class="breadcrumb-item">근태 관리</li>
								<li class="breadcrumb-item active" aria-current="page">내 근태 현황</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
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
                        <table class="table table-bordered " style="text-align: center; width: 100%">				
							  <thead>							    
								<tr class="table-warning">
								<th scope="col" width="120px">출근 시간</th>
								<th scope="col" width="120px">퇴근 시간</th>
								<th scope="col" width="80px">잔여 휴가</th>
								</tr>								
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row" id="inTime"></th>
							      <th scope="row" id="outTime"></th>
							      <th scope="row">${loginEmp.holCount} 회</th>
							    </tr>
							  </tbody>
							</table>
                        
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="card-box pd-20 mb-30" >
            	<h3>내 근태 현황</h3><br>
             	
                <div class="bg-white pd-20 card-box mb-30">
                    <div id="chart6"></div>
                </div>
				
				<table class="table table-bordered scrolltbody" style="text-align: center; ">
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
	                    		                    	
	                        <td>${ att.attDate }</td>
	                        <td>${ att.attInTime }</td>
	                        <td>${ att.attOutTime }</td>
	                        <td>${ att.attStatusName }</td>
	                        
	                    </tr>
                    </c:forEach>				    
				  </tbody>
				</table>
            </div>
            <script>
               	$(function () {
					$.ajax({
						url:"attTime.att",
						type:"post",
						data :{
							empId:"${sessionScope.loginUser.empId}"
						},
						success:function(att){
							$("#inTime").html(att.attInTime); 
							if(att.attOutTime !=null){
								$("#outTime").html(att.attOutTime); 
							}else{
								$("#outTime").html("아직 퇴근 전입니다."); 
							}
							
							
						}
					});
					
               		var sList =${attStatusList};
               		var cList =${attCountList};
               		var data = new Array(6);
               		console.log(sList[0]);
               		
               		for(var i in sList){
               			for(var j in cList){
               				data[i] = new Array(j);
               				
               				if(sList[i].attStatusNo == cList[j].attStatusNo){
               					console.log(cList[j].attStatusName+cList[j].count);
               					data[i] = [cList[j].attStatusName, cList[j].count];
               					console.log("ww : "+data[i]);
               				}
               			}
               		}
               
               		
					Highcharts.chart('chart6', {
					    chart: {
					        type: 'pie',
					        options3d: {
					            enabled: true,
					            alpha: 45
					        }
					    },
					    title: {
					        text: '내 근태 현황'
					    },
					    subtitle: {
					        text: ''
					    },
					    plotOptions: {
					        pie: {
					            innerSize: 100,
					            depth: 45
					        }
					    },
					    series: [{
					        name: '총 횟수',
					        data: [
					        	
					        	
					            ['정상', 20],
					            ['지각', 3],
					            ['결근', 1],
					            ['외근', 6],
					            ['반차', 8],
					            ['연차', 4]
					        ]
					    }]
					});
				})
				
           	</script>
            
            
            <jsp:include page="../common/footer.jsp"/>
        </div>
       
    </div>
	<!-- JavaScript Includes -->
		
	<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/script.js"></script>
    <!-- js -->
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/highcharts-6.0.7/code/highcharts.js"></script>
    <script src="https://code.highcharts.com/5.0.14/modules/solid-gauge.js "></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/plugins/highcharts-6.0.7/code/highcharts-more.js"></script>
    <%-- <script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/highchart-setting.js"></script> --%>
    
    
   
</body>
</html>