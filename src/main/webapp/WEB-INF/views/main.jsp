<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	response.setHeader("Cache-Control","no-store"); 
	response.setHeader("Pragma","no-cache"); 
	response.setDateHeader("Expires",0); 
	if (request.getProtocol().equals("HTTP/1.1")) 
		response.setHeader("Cache-Control", "no-cache"); 
%>

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
	tbody>tr:hover {
	cursor: pointer;
	}
	
	</style>

</head>
<body>

	<jsp:include page="common/menubar.jsp"/>
	
    
    <div class="mobile-menu-overlay"></div>

    <div class="main-container">
    	<div class="pd-ltr-20 ">
    		<div class="row">
    			<div class="col-xl-6 mb-30">
                    <div class="card-box height-100-p pd-20 ">
	                    <div>
	                    	<div id="clock" class="light3">
		                        <div class="ampm"></div>									
								<div class="digits"></div>		           			
							</div>   	
	                    </div>
	                    <div id="chart5"></div>
	                    <div>	                    
							<table class="data-table table stripe hover nowrap" style="text-align: center;">				
							  <thead class="bg-dark text-white">							    
								<tr >
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
							  <tbody class="bg-light text-dark">
							    <tr class ="table-warning">
							      <td scope="row">${loginEmp.deptName}</td>
							      <td scope="row">${loginEmp.jobName}</td>
							      <td scope="row">${loginEmp.rightName}</td>
							      <td scope="row" id="date"></td>
							      <td scope="row" id="inTime"></td>
							      <td scope="row" id="outTime"></td>
							      <td scope="row">${dDay} </td>
							      <td scope="row">${loginEmp.holCount} 회</td>
							    </tr>
							  </tbody>
							</table>                        
						</div>
						
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
						Highcharts.chart('chart5', {
						    title: {
						        text: '내 근태 현황'
						    },
						    xAxis: {
						        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
						    },
						    series: [{
						        type: 'pie',
						        allowPointSelect: true,
						        keys: ['name', 'y', 'selected', 'sliced'],
						        data: [
						            
						            <c:forEach items="${ attCountList }" var="c" varStatus="i">            	
					        			
					        			 <c:if test = "${c.count > 0}">
					        			 ['${ c.attStatusName }', ${ c.count },false],
					        	      	</c:if>



		                   		 	</c:forEach>	
						        ],
						        showInLegend: true
						    }]
						});
						
					})
               	</script> 
                <!-- 근태 끝ㅌㅌㅌㅌㅌㅌ -->
                <div class="col-xl-6 mb-30">
                    <div class="card-box height-100-p pd-20">
	                  <h2 class="h4 mb-20 text-blue">오늘일정</h2>
	                  <div id="chart6">
	                     <c:choose>
	                        <c:when test="${!empty scheduleList}">
	                           <table id="scheduleList"
	                              class="data-table table stripe hover nowrap">
	                              <thead class="bg-dark text-white">
	                                 <tr>
	                                    <th>제목</th>
	                                    <th>시작일</th>
	                                    <th>종료일</th>
	                                 </tr>
	                              </thead>
	                              <tbody class="bg-light text-dark">
	                                 <tr>
	                                    <c:forEach items="${ scheduleList }" var="s">
	                                       <tr class="table-warning">
	                                          <td>${ s.scheduleTitle }</td>
	                                          <td>${ s.scheduleStart }</td>
	                                          <td>${ s.scheduleEnd }</td>                                          
	                                       </tr>
	                                    </c:forEach>
	                                 </tr>
	                              </tbody>
	                           </table>
	                        </c:when>
	                        <c:otherwise>
	                           <div class="alert alert-dark" role="alert"
	                              style="text-align: center;">일정이 없습니다</div>
	                        </c:otherwise>
	                     </c:choose>
						</div>
               		</div>
            	</div>
	                 
    			<div class="col-xl-6 mb-30">
                    <div class="card-box height-100-p pd-20">
                        <h2 class="h4 mb-20 text-blue">공지사항 최신 top3</h2>
                        <div id="chart6">
                        	<c:choose>               
                  			<c:when test="${!empty noticeToplist}">
                  			<table id="noticeList" class="data-table table stripe hover nowrap">
				               	<thead class="bg-dark text-white">
				               		<tr >
				               			<th>글 번호</th>     
				               			<th>제목</th>
					                    <th>부서명</th>
					                    <th>작성일</th>
					                    <th>조회수</th>
					                    <th>첨부파일</th>
				                  	</tr>
				               </thead>
				               <tbody class="bg-light text-dark">			               		               	
				                  <tr>
				                     <c:forEach items="${ noticeToplist }" var="b">
				                        <tr class ="table-warning">
				                           <td>${ b.noticeNo }</td>                           
				                           <td>${ b.noticeTitle }</td>
				                           <td>${b.deptName}</td>
				                           <td>${ b.uploadDate }</td>
				                           <td>${b.count }</td>
				                           <c:if test="${ !empty b.originFile }">
				                              <td>★</td>
				                           </c:if>
				                           <c:if test="${ empty b.originFile }">
				                              <td>&nbsp;</td>
				                           </c:if>			
				                        </tr>
				                     </c:forEach>			
				                  </tr>
				               </tbody>				               
			            	</table>
                  			</c:when>   
                  			<c:otherwise>
                  			<div class="alert alert-dark" role="alert" style="text-align: center;">게시글이 없습니다</div>
               				</c:otherwise>
                  			</c:choose>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-xl-6 mb-30">
                    <div class="card-box height-100-p pd-20">
                        <h2 class="h4 mb-20 text-blue">익명게시판 조회수 top3</h2>
                        <div id="chart6">
                        
                        <c:choose>               
                  <c:when test="${!empty boardToplist}">
                                                               
               <table id="boardList" class="data-table table stripe hover nowrap">
               <thead class="bg-dark text-white">
                  <tr >
                     <th>글 번호</th>                     
                     <th>제목</th>   
                     <th>작성일</th>
                     <th>조회수</th>
                     <th>첨부파일</th>
                  </tr>
               </thead>
               <tbody class="bg-light text-dark">
                  <tr>
                     <c:forEach items="${ boardToplist }" var="b">
                        <tr class ="table-warning">
                           <td>${ b.boardNo }</td>                           
                           <td>${ b.boardTitle }</td>
                           <td>${ b.uploadDate }</td>
                           <td>${b.count }</td>
                           <c:if test="${ !empty b.originFile }">
                              <td>★</td>
                           </c:if>
                           <c:if test="${ empty b.originFile }">
                              <td>&nbsp;</td>
                           </c:if>

                        </tr>
                     </c:forEach>

                  </tr>
               </tbody>
            </table>
                  </c:when>   
                  <c:otherwise>               
                                                            
               <div class="alert alert-dark" role="alert" style="text-align: center;">
                 		 게시글이 없습니다
                  </div>
               
                  
               </c:otherwise>
                  </c:choose>
                        
                        
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 mb-30">
                    <div class="card-box height-100-p pd-20" style="height: 500px; overflow: auto;">
                         
                        
                        
                        <div class="pd-30 pt-10">
						<div class="col-lg-12"> 
						   
						<div class="clearfix mb-20">
						<div class="pull-left"><h4 class="text-blue h4">비품 예약 현황</h4></div>
						</div>
						
						<c:choose>
											
						<c:when test="${empty returnList}">
						<div class="alert alert-dark" role="alert" style="text-align: center;">
						예약된 비품이 없습니다.
						</div>
						</c:when>  
						<c:when test="${!empty returnList}">
						
						<c:forEach items="${returnList}" var="su" varStatus="status">
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
                
                <div class="col-xl-6 mb-30">
                    <div class="card-box height-100-p pd-20" style="height: 500px; overflow: auto;">
                        
                        
                        <div class="pd-30 pt-10">
						<div class="col-lg-12">
						<div class="clearfix mb-20">
						<div class="pull-left"><h4 class="text-blue h4">회의실 예약 현황</h4></div>
						</div>
											
						<c:choose>
											
											
						<c:when test="${empty mroom}">
						<div class="alert alert-dark" role="alert" style="text-align: center;">
						예약된 회의실이 없습니다.
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
                
           
                
                <!-- 메일시작 -->
				<div class="col-xl-6 mb-30">
						<!-- 왼쪽 -->
						<div class="card-box mb-30" style="height: 450px; overflow: auto;">
							<div class="clearfix pd-20">
								<div class="pull-left">
									
								</div>
								<div class="col-md-12 col-sm-12 pull-right">
									<div class="tab">
								<ul class="nav nav-tabs" role="tablist">
									<li class="nav-item">
										<a class="nav-link active text-blue" data-toggle="tab" href="#receive" role="tab" aria-selected="true">받은메일함</a>
									</li>
									<li class="nav-item">
										<a class="nav-link text-blue" data-toggle="tab" href="#send" role="tab" aria-selected="false">보낸메일함</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane fade show active" id="receive" role="tabpanel">
										<div class="pd-20">
											<c:choose>
												<c:when test="${empty receiveList }">
													<div class="alert alert-dark" role="alert" style="text-align: center;">
													받은 메일이 없습니다.
													</div>
												</c:when>
												<c:otherwise>
													<table class="table table-hover reMailList">
														<thead class="bg-dark text-white">
															<tr>
																<td></td>
																<th scope="col">발신자</th>
																<th scope="col">제목</th>
															</tr>
														</thead>
														<tbody class="bg-light text-dark">
															
															<c:forEach items="${ receiveList }" var="s">
															<tr class ="table-warning">
																<td>${ s.mailNo }</td>
																<td>${ s.empId }</td>
																<c:choose>
																	<c:when test="${s.readCount eq 0 }">
																		<td><span class="badge badge-pill badge-primary">new</span> ${ s.title }</td>
																	</c:when>
																	<c:otherwise>
																		<td>${ s.title }</td>
																	</c:otherwise>
																</c:choose>
																
															</tr>
															</c:forEach>
														</tbody>
													</table>
												</c:otherwise>
												</c:choose>	
												</div>
											</div>
											<div class="tab-pane fade" id="send" role="tabpanel">
												<div class="pd-20">
												<c:choose>
												<c:when test="${empty sendList }">
													<div class="alert alert-dark" role="alert" style="text-align: center;">
													보낸 메일이 없습니다.
													</div>
												</c:when>
												<c:otherwise>
													<table class="table table-hover seMailList">
														<thead class="bg-dark text-white">
															<tr>
																<th></th>
																<th scope="col">수신자</th>
																<th scope="col">제목</th>
															</tr>
														</thead>
														<tbody class="bg-light text-dark">
															<c:forEach items="${ sendList }" var="s">
															<tr class ="table-warning">
																<td>${ s.mailNo }</td>
																<td>${ s.receiver }</td>
																<td>${ s.title }</td>
															</tr>
															</c:forEach>
														</tbody>
													</table>
												</c:otherwise>
												</c:choose>
										</div>
									</div>
									
								</div>
							</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 메일 끝 -->
					
					<!-- 결재시작 -->
				<div class="col-lg-6 col-md-12 col-sm-12 mb-30">
					<div class="card-box mb-30" style="height: 450px; overflow: auto;">
						<div class="clearfix pd-20">
							<div class="pull-left">
							
							</div>
						<div class="col-md-12 col-sm-12 pull-right">
							<div class="tab">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item">
									<a class="nav-link active text-blue" data-toggle="tab" href="#home" role="tab" aria-selected="true">진행중 결재함</a>
								</li>
								<li class="nav-item">
									<a class="nav-link text-blue" data-toggle="tab" href="#profile" role="tab" aria-selected="false">결재 요청함</a>
								</li>
								<li class="nav-item">
									<a class="nav-link text-blue" data-toggle="tab" href="#contact" role="tab" aria-selected="false">결재 완료함</a>
								</li>
							</ul>
							<div class="tab-content">
								<!-- 진행중결재함 -->
								<div class="tab-pane fade show active" id="home" role="tabpanel">
									<div class="pd-20">
										<c:choose>
										<c:when test="${empty appingList }">
											<div class="alert alert-dark" role="alert" style="text-align: center;">
												결재 진행중인 문서가 없습니다.
											</div>
										</c:when>
										<c:otherwise>
										<table class="table table-hover apping">
											<thead class="bg-dark text-white">
												<tr>
													<th></th>
													<th scope="col">종류</th>
													<th scope="col">상태</th>
												</tr>
											</thead>
											<tbody class="bg-light text-dark">
												<c:forEach items="${ appingList }" var="app">
												<tr class ="table-warning">
													<td>${ app.appNo }</td>
													<c:choose>
						              					<c:when test="${app.category eq 1 }">
															<td scope="row">휴가 신청서</td>
														</c:when>
							              				<c:when test="${app.category eq 2 }">
															<td scope="row">반차 신청서</td>
														</c:when>
							              				<c:when test="${app.category eq 3 }">
															<td scope="row">외근 신청서</td>
														</c:when>
							              				<c:when test="${app.category eq 4 }">
															<td scope="row">증명서 신청서(재직증명서)</td>
														</c:when>
							              				<c:when test="${app.category eq 5 }">
															<td scope="row">증명서 신청서(급여명세서)</td>
														</c:when>
							              				<c:when test="${app.category eq 6 }">
															<td scope="row">증명서 신청서(기타)</td>
														</c:when>
						             			 	</c:choose>
													<c:choose>
														<c:when test="${app.midStatus eq 1 }">
															<td>결재 대기</td>
														</c:when>
														<c:when test="${app.midStatus eq 2 }">
															<td>중간 승인</td>
														</c:when>
													</c:choose>
												</tr>
												</c:forEach>
											</tbody>
										</table>
										</c:otherwise>
										</c:choose>
									</div>
								</div>
								<!-- 요청결재함 -->
								<div class="tab-pane fade" id="profile" role="tabpanel">
									<div class="pd-20">
										<c:choose>
										<c:when test="${empty appAskList }">
											<div class="alert alert-dark" role="alert" style="text-align: center;">
												결재 요청 문서가 없습니다.
											</div>
										</c:when>
										<c:otherwise>
										<table class="table table-hover askApp">
											<thead class="bg-dark text-white">
												<tr>
													<th></th>
													<th scope="col">종류</th>
													<th scope="col">기안자</th>
												</tr>
											</thead>
											<tbody class="bg-light text-dark">
												<c:forEach items="${ appAskList }" var="app">
												<tr class ="table-warning">
													<td>${ app.appNo }</td>
													<c:choose>
						              					<c:when test="${app.category eq 1 }">
															<td scope="row">휴가 신청서</td>
														</c:when>
							              				<c:when test="${app.category eq 2 }">
															<td scope="row">반차 신청서</td>
														</c:when>
							              				<c:when test="${app.category eq 3 }">
															<td scope="row">외근 신청서</td>
														</c:when>
							              				<c:when test="${app.category eq 4 }">
															<td scope="row">증명서 신청서(재직증명서)</td>
														</c:when>
							              				<c:when test="${app.category eq 5 }">
															<td scope="row">증명서 신청서(급여명세서)</td>
														</c:when>
							              				<c:when test="${app.category eq 6 }">
															<td scope="row">증명서 신청서(기타)</td>
														</c:when>
						             			 	</c:choose>
													
													<td>${app.empId }</td>
														
												</tr>
												</c:forEach>
											</tbody>
										</table>
										</c:otherwise>
										</c:choose>
									</div>
								</div>
								<!-- 완료결재함 -->
								<div class="tab-pane fade" id="contact" role="tabpanel">
									<div class="pd-20">
									<c:choose>
										<c:when test="${empty appedList }">
											<div class="alert alert-dark" role="alert" style="text-align: center;">
												결재가 완료된 문서가 없습니다.
											</div>
										</c:when>
										<c:otherwise>
										<table class="table table-hover apped">
											<thead class="bg-dark text-white">
												<tr>
													<th></th>
													<th scope="col">종류</th>
													<th scope="col">상태</th>
												</tr>
											</thead>
											<tbody  class="bg-light text-dark">
												<c:forEach items="${ appedList }" var="app">
												<tr class ="table-warning">
													<td>${ app.appNo }</td>
													<c:choose>
						              					<c:when test="${app.category eq 1 }">
															<td scope="row">휴가 신청서</td>
														</c:when>
							              				<c:when test="${app.category eq 2 }">
															<td scope="row">반차 신청서</td>
														</c:when>
							              				<c:when test="${app.category eq 3 }">
															<td scope="row">외근 신청서</td>
														</c:when>
							              				<c:when test="${app.category eq 4 }">
															<td scope="row">증명서 신청서(재직증명서)</td>
														</c:when>
							              				<c:when test="${app.category eq 5 }">
															<td scope="row">증명서 신청서(급여명세서)</td>
														</c:when>
							              				<c:when test="${app.category eq 6 }">
															<td scope="row">증명서 신청서(기타)</td>
														</c:when>
						             			 	</c:choose>
													
													<c:choose>
														<c:when test="${app.midStatus eq 3 }">
															<td>중간 반려</td>
														</c:when>
														<c:when test="${app.finStatus eq 2 }">
															<td>최종 승인</td>
														</c:when>
														<c:when test="${app.finStatus eq 3 }">
															<td>최종 반려</td>
														</c:when>
													</c:choose>
												</tr>
												</c:forEach>
											</tbody>
										</table>
										</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>	
						</div>
						</div>
					</div>
				</div><!-- 결재끝 -->
				<jsp:include page="common/footer.jsp"/>
			</div><!--  <div class="row">  -->
       </div>
   </div>
    <script>
      $(function() {
         $("#boardList tbody tr").click(
               function() {
                  location.href = "detail.bo?bno="
                        + $(this).children().eq(0).text();
         });
         $("#noticeList tbody tr").click(
                 function() {
                    location.href = "noticedetail.bo?bno="
                          + $(this).children().eq(0).text();
           });
         $(".apping tbody tr").click(function(){
 			location.href="appingDetail.ap?ano=" + $(this).children().eq(0).text();
 		});
         $(".askApp tbody tr").click(function(){
 			location.href="askDetail.ap?ano=" + $(this).children().eq(0).text();
 		});
         $(".apped tbody tr").click(function(){
 			location.href="appedDetail.ap?ano=" + $(this).children().eq(0).text();
 		});
         $(".reMailList tbody tr").click(function(){
 			location.href="receiveDetail.ml?mno=" + $(this).children().eq(0).text();
 		});
         $(".seMailList tbody tr").click(function(){
 			location.href="sendDetail.ml?mno=" + $(this).children().eq(0).text();
 		});
      });
      
    </script>

	   
	   <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/script.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/highcharts-6.0.7/code/highcharts.js"></script>
    <script src="https://code.highcharts.com/5.0.14/modules/solid-gauge.js "></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/plugins/highcharts-6.0.7/code/highcharts-more.js"></script>
</body>
</html>