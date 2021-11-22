<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>X-Nomal Groupware Solution</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- The main CSS file -->
	<link href="${ pageContext.servletContext.contextPath }/resources/assets/css/style2.css" rel="stylesheet" />
	
	
	<style type="text/css">
	#fromDate, #toDate{
	border: none;
	}
	
	</style>
</head>
<body>

	<jsp:include page="common/menubar.jsp"/>
	
    
    <div class="mobile-menu-overlay"></div>

    <div class="main-container">
        <div class="pd-ltr-20">
            <div class="card-box pd-20 height-100-p mb-30">
                <div class="row align-items-center">
	                <div id="clock" class="light3">
	           			<div class="display3">
							<div class="ampm"></div>
							<div class="alarm"></div>
							<div class="digits"></div>
				 		</div>
					</div> <br><br>
                </div> 
                <div class="row align-items-center">
                	<div class="col-md-9">
		                <h4 class="font-20 weight-500 mb-10 text-capitalize">                    
		                    <div class="weight-600 font-30 text-blue">${ sessionScope.loginUser.userName }님</div>
		                </h4>
		                
		                <div class="table-responsive">
							<table class="table table-striped table-bordered employee" style="text-align: center;">				
							  <thead>							    
								<tr class="table-warning">
								<th scope="col" width="50px">부서</th>
								<th scope="col" width="50px">직급</th>
								<th scope="col" width="50px">권한</th>
								<th scope="col" width="100px">날짜</th>
								<th scope="col" width="100px">출근</th>
								<th scope="col" width="100px">퇴근</th>
								<th scope="col" width="60px">근무일</th>
								<th scope="col" width="50px">잔여 연차</th>
								</tr>								
							  </thead>
							  <tbody>
							    
							      <th scope="row">${loginEmp.deptName}</th>
							      <th scope="row">${loginEmp.jobName}</th>
							      <th scope="row">${loginEmp.rightName}</th>
							      <th scope="row" id="date"></th>
							      <th scope="row" id="inTime"></th>
							      <th scope="row" id="outTime"></th>
							      <th scope="row">${dDay} </th>
							      <th scope="row">${loginEmp.holCount} 회</th>
							    </tr>
							  </tbody>
							</table>							
						</div>
						
                	</div>
                	<div class="col-md-3">
                    	<img src="${ pageContext.servletContext.contextPath }/resources/vendors/images/banner-img.png" alt="" >
                	</div>
               	</div>
               	<script>
               	$(function () {
					$.ajax({
						url:"attTime.att",
						type:"post",
						data :{
							empId:"${loginEmp.empId}"
						},
						success:function(att){
							$("#date").html(att.attDate); 
							$("#inTime").html(att.attInTime); 
							if(att.attOutTime !=null){
								$("#outTime").html(att.attOutTime); 
							}else{
								$("#outTime").html("아직 퇴근 전입니다."); 
							}
						}
					});
					
				})
               	</script>
               	
                
            </div>
            <div class="row">
                <div class="col-xl-3 mb-30">
                    <div class="card-box height-100-p widget-style1">
                        <div class="d-flex flex-wrap align-items-center">
                            <div class="progress-data">
                                <div id="chart"></div>
                            </div>
                            <div class="widget-data">
                                <div class="h4 mb-0">2020</div>
                                <div class="weight-600 font-14">Contact</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 mb-30">
                    <div class="card-box height-100-p widget-style1">
                        <div class="d-flex flex-wrap align-items-center">
                            <div class="progress-data">
                                <div id="chart2"></div>
                            </div>
                            <div class="widget-data">
                                <div class="h4 mb-0">400</div>
                                <div class="weight-600 font-14">Deals</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 mb-30">
                    <div class="card-box height-100-p widget-style1">
                        <div class="d-flex flex-wrap align-items-center">
                            <div class="progress-data">
                                <div id="chart3"></div>
                            </div>
                            <div class="widget-data">
                                <div class="h4 mb-0">350</div>
                                <div class="weight-600 font-14">Campaign</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 mb-30">
                    <div class="card-box height-100-p widget-style1">
                        <div class="d-flex flex-wrap align-items-center">
                            <div class="progress-data">
                                <div id="chart4"></div>
                            </div>
                            <div class="widget-data">
                                <div class="h4 mb-0">$6060</div>
                                <div class="weight-600 font-14">Worth</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
   
                <div class="col-xl-4 mb-30">
                    <div class="card-box height-100-p pd-20" style="height: 500px; overflow: auto;">
                        
                        
                        
                        <div class="pd-30 pt-10">
						<div class="col-lg-12"> 
						   
						<div class="clearfix mb-20">
						<div class="pull-left"><h4 class="text-blue h4">비품 예약 현황</h4></div>
						</div>
						
						<c:choose>
											
						<c:when test="${empty sup}">
						<div class="alert alert-dark" role="alert" style="text-align: center;">
						비품 예약이 없습니다.
						</div>
						</c:when>  
						<c:when test="${!empty sup}">
						
						<c:forEach items="${sup}" var="su" varStatus="status">
						<table class="table table-bordered" id="myTable">
						<tbody>
						<tr>
						<th style="width: 50% ;">예약 날짜</th>
						<td colspan="" ><input id="fromDate"  name="startDate" value="${su.startDate}" readonly >												
						</tr>
						<tr>
						
						<th>반납 날짜</th>
						<td colspan="" style="width: 50% ;" ><input id="toDate"  name="endDate" readonly  value="${su.endDate}"></td>
						</tr>
						<tr>
						<th scope="col" style="width: 50% ;" >비품</th>
						<th scope="col" style="width: 50% ;">개수</th>
						</tr>
						<tr>
						<td>${su.suppliesName}</td>
						<td>${su.counts}</td>
						<tr>
						</tbody> 
						
						</table>
						</c:forEach>
						
						<button id="updateSup" class="btn btn-primary btn-lg btn-block" >기간 연장 신청</button>
						
						</c:when>
						</c:choose>
												
						<script>
							 $(function(){
								 $("#updateSup").click(function(){
										 location.href="updateSupForm.su?empId=" + ${ loginUser.empId }
								 })
														   
							})
						</script>
													
						</div>
						</div>
                        
                        
                        
                        
                    </div>
                </div>
                
                 <div class="col-xl-4 mb-30">
                    <div class="card-box height-100-p pd-20" style="height: 500px; overflow: auto;">
                        
                        
                        <div class="pd-30 pt-10">
						<div class="col-lg-12">
						<div class="clearfix mb-20">
						<div class="pull-left"><h4 class="text-blue h4">회의실 예약 현황</h4></div>
						</div>
											
						<c:choose>
											
											
						<c:when test="${empty mroom}">
						<div class="alert alert-dark" role="alert" style="text-align: center;">
						회의실 예약이 없습니다.
						</div>
						</c:when>
											
						<c:when test="${!empty mroom}">
						<c:forEach items="${mroom}" var="mr" varStatus="status">
														
						<table class="table table-bordered" id="meeting">
						<c:if test="${mr.mrNo eq '1'}" >
						<thead><tr><td style="background-color: rgba(134, 207, 218, 0.2);"> 회의실 1</td><tr></thead>
						</c:if>
															
						<c:if test="${mr.mrNo  eq '2'}">
						<thead><tr><td style="background-color: rgba(255, 223, 126, 0.2);"> 회의실 2</td><tr></thead>
						</c:if>
															
						<c:if test="${mr.mrNo  eq '3'}">
						<thead><tr><td style="background-color: rgba(143, 209, 158, 0.2);"> 회의실 3</td><tr></thead>
						</c:if>
															
						<c:if test="${mr.mrNo  eq '4'}">
						<thead><tr><td style="background-color: rgba(237, 150, 158, 0.2);"> 회의실 4</td><tr></thead>
						</c:if>
															
						<tbody><tr><td>${mr.str }</td></tr></tbody>
						</table>
													       
													       
						</c:forEach>
						<button class="btn btn-success btn-lg btn-block meetingDetail">회의실 예약 변경하러 가기</button>
						</c:when>
						</c:choose>
												
						<script>
						$(function(){
													   
							$(".meetingDetail").click(function(){
									location.href="meetingDetail.me?empId=" + ${ loginUser.empId }
							})
						})
						</script>
												
						</div>
						</div><!-- outer -->
                        
                        
                        
                    </div>
                </div>
                
                 <div class="col-xl-4 mb-30">
                    <div class="card-box height-100-p pd-20">
                        <h2 class="h4 mb-20">Lead Target</h2>
                        <div id="chart6"></div>
                    </div>
                </div>
                
            </div>
            
            <jsp:include page="common/footer.jsp"/>
        </div>
    </div>
    <script src="${ pageContext.servletContext.contextPath }/resources/plugins/apexcharts/apexcharts.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/dashboard.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/script.js"></script>
</body>
</html>