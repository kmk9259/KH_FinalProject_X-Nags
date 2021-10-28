<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>X-Nomal Groupware Solution</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- The main CSS file -->
	<link href="${ pageContext.servletContext.contextPath }/resources/assets/css/style2.css" rel="stylesheet" />
	
</head>
<body>
    <!--<div class="pre-loader">
        <div class="pre-loader-box">
            <div class="loader-logo"><img src="resources/vendors/images/deskapp-logo.svg" alt=""></div>
            <div class='loader-progress' id="progress_div">
                <div class='bar' id='bar1'></div>
            </div>
            <div class='percent' id='percent1'>80%</div>
            <div class="loading-text">
                Loading...
            </div>
        </div>
    </div>-->
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
								<th scope="col" width="80px">부서</th>
								<th scope="col" width="80px">직급</th>
								<th scope="col" width="80px">출근</th>
								<th scope="col" width="80px">퇴근</th>
								<th scope="col" width="80px">근무일</th>
								<th scope="col" width="80px">잔여 연차</th>
								</tr>								
							  </thead>
							  <tbody>
							    
							      <th scope="row">총무과</th>
							      <th scope="row">대리</th>
							      <th scope="row">2021년 10월 26일 09:00</th>
							      <th scope="row">아직 퇴근 전입니다.</th>
							      <th scope="row">D + 100 </th>
							      <th scope="row">10회</th>
							    </tr>
							  </tbody>
							</table>							
						</div>
						
                	</div>
                	<div class="col-md-3">
                    	<img src="${ pageContext.servletContext.contextPath }/resources/vendors/images/banner-img.png" alt="" >
                	</div>
               	</div>
               	
                
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
                <div class="col-xl-8 mb-30">
                    <div class="card-box height-100-p pd-20">
                        <h2 class="h4 mb-20">Activity</h2>
                        <div id="chart5"></div>
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