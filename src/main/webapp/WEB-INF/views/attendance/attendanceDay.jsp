<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>X-Normal GroupWare Solution</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<style>
	.info{
	margin-left: 300px;
	}
	.scrolltbody {
     display: block; 
    margin-left:20px;
    
    border-collapse: collapse;
    border: 2px solid #000;
    position:relative;
	}
	.scrolltbody > thead > tr>th{
	font-size: 15px;
	height: 47.33px;
	
	}
	.scrolltbody tbody {
	    display: block;
	    height: 280px;
	    overflow: auto;
	}
	.scrolltbody > tbody > tr>td{
	font-size: 15px;
	height: 47.33px;
	
	}
	#updateBtn{
	width: 180px;
	margin: 5px 5px 5px 5px;		/* 상우하좌 */
	}
	
	
	/* .scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 428px; }
	.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 428px; }
	.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { width: 428px; }
	.scrolltbody th:last-child { width: 428px; }
	 .scrolltbody td:last-child { width: calc( 420px - 19px );  }   */
	</style>
	
	

	
</head>
<body >
	<jsp:include page="../common/menubar.jsp"/>
	
    
    <div class="mobile-menu-overlay"></div>
    <div class="main-container">
        <div class="pd-ltr-20 xs-pd-20-10">
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
							<li class="breadcrumb-item active" aria-current="page">일별 근태 현황</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
            <div class="min-height-200px">                
                <div class="pd-20 card-box mb-30">
                    <div class="clearfix mb-20">
                        <div class="pull-left">
                            <h4 class="text-blue h4">일별 근태 현황</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 col-sm-12">                            
                                <div class="form-group"> 
                                	<label>날짜</label>
                                    <input  class="form-control date-picker"  name="date" placeholder="Click" type="text">                                
                                <div class="form-group">
	                                <label>항목</label>
	                                <div class="d-flex">
	                                    <div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="item" id="dept" value="dept_code" class="custom-control-input">
	                                        <label class="custom-control-label weight-400" for="dept">부서&nbsp&nbsp</label>
	                                    </div>
	                                    <div class="custom-control custom-radio mb-5">
	                                        <input type="radio" name="item" id="job" value="job_code" class="custom-control-input">
	                                        <label class="custom-control-label weight-400" for="job">직급</label>
	                                    </div>
	                                </div>	                                
                               	</div>
                               	<div class="form-group">
	                                <label>상태</label>
	                                <div class="d-flex">	                                	
	                                	<c:forEach var="attList" items="${ attList }" varStatus="at">											
											<div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="attList" id="${ at.index }" value="${ attList.attStatusNo }" class="custom-control-input">
	                                        <label class="custom-control-label " for="${ at.index }">${ attList.attStatusName }&nbsp&nbsp</label>
	                                    </div>
										</c:forEach>										
	                                </div>	                                
                               	</div>
                                <div class="form-group mb-0">
                                    <input type="button" class="btn btn-primary" id="btn" value="&nbsp&nbsp&nbsp&nbsp조회&nbsp&nbsp&nbsp&nbsp">
                                </div>
                        		</div>
                    	</div>
                	</div>	                
            	</div>
            	<div class="pd-20 card-box mb-30">
                    <div class="clearfix mb-20">
                        <div class="pull-left">
                            <h4 class="text-blue h4">조회 결과</h4>
                        </div>
                    </div>
                    <div class="row">
                        <!-- <div class="col-md-12 col-sm-12">      -->                       
                        	<table id="attDayList" class="table scrolltbody"  style="text-align: center; width: 1700px;">
                        	<c:if test="${loginEmp.rightName eq '근태관리자'}">
								<thead>
									<tr class="table-danger">
										<th scope="col" width="250px">부서명</th>
										<th scope="col" width="250px">직급명</th>
										<th scope="col" width="250px">사원명</th>
										<th scope="col" width="250px">날짜</th>
										<th scope="col" width="250px">출근 시간</th>
										<th scope="col" width="250px">퇴근 시간</th>
										<th scope="col" width="250px">관리</th>
									</tr>
								</thead>
								<tbody></tbody>	    
							
							</c:if>
							<c:if test="${loginEmp.rightName ne '근태관리자'}">
								<thead>
									<tr tr class="table-danger">
										<th scope="col" width="300px">부서명</th>
										<th scope="col" width="300px">직급명</th>
										<th scope="col" width="300px">사원명</th>
										<th scope="col" width="300px">날짜</th>
										<th scope="col" width="300px">출근 시간</th>
										<th scope="col" width="300px">퇴근 시간</th>
									</tr>
								</thead>
								<tbody></tbody>						
							</c:if>


								
							</table>
                    	<!-- </div> -->
                	</div>
            	</div>
            	<div class="modal fade" id="warning-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-sm modal-dialog-centered">
                        <div class="modal-content bg-warning">
                            <div class="modal-body text-center">
                                <h3 class="mb-15"><i class="fa fa-exclamation-triangle"></i> Warning</h3>
                                <h6 class="mb-15">빈 값입니다. 다시 선택해주세요 !</h6>
                                <button type="button" class="btn btn-dark" data-dismiss="modal">Ok</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	                <div class="modal-dialog modal-dialog-centered">
	                    <div class="modal-content">
	                        <div class="login-box bg-white box-shadow border-radius-10">
	                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                            <div class="login-title">
	                                <h2 class="text-center text-primary">Update to Employee</h2>
	                            </div>
	                            <form action="updateDay.att" method="post">
	                            	<input type="hidden" name="empId">
	                            	<input type="hidden" name="attNo">
	                                <div class="input-group custom">
	                                    <input type="text" class="form-control form-control-lg" name="userName" readonly>
	                                    <div class="input-group-append custom">
	                                        <span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
	                                    </div>
	                                </div>
	                                <div class="input-group custom">
	                                    <input type="text" class="form-control form-control-lg" name="attDate" readonly>
	                                    <div class="input-group-append custom">
	                                        <span class="input-group-text"><i class="ion-calendar"></i></span>
	                                    </div>
	                                </div>
	                                <div class="input-group custom">
	                                    <input type="time" step="1" class="form-control form-control-lg" maxlength="8" name="attInTime">	
	                                </div>
	                                <div class="input-group custom">
	                                    <input type="time" step="1" class="form-control form-control-lg" maxlength="8" name="attOutTime">
	                                </div>
	
	                                <div class="row">
	                                    <div class="col-sm-6">
	                                        <div class="input-group mb-0">	                                        	
	                                        	<input class="btn btn-outline-danger btn-lg btn-block" type="button" id="delBtn" value="Delete">
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="input-group mb-0">
	                                        	<input class="btn btn-outline-primary btn-lg btn-block" type="submit" value="Update">
	                                        </div>
	                                    </div>
	                                </div>
	                            </form>
	
	                        </div>
	                    </div>
	                </div>
                </div>
                
            	<script>
            	$(function(){
            		var attlist="";
                	var attDate ="";
                	$( ".date-picker" ).datepicker({
                    		dateFormat: "yyyy-mm-dd",
                    		language:"ko",
                    		onSelect: function(dateText) {
                    			attDate = dateText;
                    	    }                    		
                    });  
            		$("#btn").click(function(){            			
            			var right = '${loginEmp.rightName}';
            			var orderBy = $('input[name="item"]:checked').val();
            			var attStatusNo = $('input[name="attList"]:checked').val();
            			if(orderBy == null || attStatusNo == null || attDate == '')
            			{
            				$('#warning-modal').modal('show');
            			}
            			else
            			{
            				$.ajax({
            					url:"selectAttDay.att",
            					type:"post",
            					data:{
            						attDate : attDate,
            						orderBy : orderBy,
            						attStatusNo : attStatusNo
            					},
            					success:function(list)
            					{
            						attlist=list;
            						$tableBody = $('#attDayList tbody');
            						$tableBody.html('');
            						
            						if(right == '근태관리자')
            						{
        								$.each(list, function(i, obj){
	            							
                							var $tr = $('<tr>');
                							var $deptName = $('<td width="245px">').text(obj.deptName);
                							var $jobName = $('<td width="240px">').text(obj.jobName);
                							var $userName = $('<td width="245px">').text(obj.userName);
                							var $attDate = $('<td width="240px">').text(obj.attDate);
                							var $attInTime = $('<td width="240px">').text(obj.attInTime);
                							var $attOutTime = $('<td width="240px">').text(obj.attOutTime);
                							var $rigthName =$('<td width="205px">').html('<button id="updateBtn'+i+'" class="btn btn-primary"">관리하기</button>'); 
                																			
               								$tr.append($deptName);
                   							$tr.append($jobName);
                   							$tr.append($userName);
                   							$tr.append($attDate);
                   							$tr.append($attInTime);
                   							$tr.append($attOutTime);
                   							$tr.append($rigthName);
                   							$tableBody.append($tr);
                   							
                   							document.getElementById("updateBtn"+i).addEventListener("click", updateDay);
            								function updateDay(){            									
            									$("#updateModal").modal('show');
            									$('input[name=userName]').attr('value',obj.userName);
            									$('input[name=attDate]').attr('value',obj.attDate);
            									$('input[name=empId]').attr('value',obj.empId);
            									$('input[name=attNo]').attr('value',obj.attNo); 
            									$("#delBtn").click(function(){                			            			
                			            			$.ajax({
                			            				url:"deleteDay.att",
                		            					type:"post",
                		            					data:{
                		            						attNo : obj.attNo,
                		            						
                		            					},
                		            					success:function(){
                		            						location.replace("attendanceDay.att");
                		            					}
                			            				
                			            			});
                			            		});
            								}
            								
               							});         								
        							}else{
										$.each(list, function(i, obj){
	            							
                							var $tr = $('<tr>');
                							var $deptName = $('<td width="285px">').text(obj.deptName);
                							var $jobName = $('<td width="280px">').text(obj.jobName);
                							var $userName = $('<td width="285px">').text(obj.userName);
                							var $attDate = $('<td width="285px">').text(obj.attDate);
                							var $attInTime = $('<td width="285px">').text(obj.attInTime);
                							var $attOutTime = $('<td width="265px">').text(obj.attOutTime);
                							 
               								$tr.append($deptName);
                   							$tr.append($jobName);
                   							$tr.append($userName);
                   							$tr.append($attDate);
                   							$tr.append($attInTime);
                   							$tr.append($attOutTime);
                   							
                   							$tableBody.append($tr);
                						});         								
        							}
            						
            					}
            				});  	//ajax            				
            			} 			//else        			
            		});   			//btn function
            		
            		
            		
        		});
            	</script>
            	<jsp:include page="../common/footer.jsp"/>
        	</div>
    	</div>    	
	</div>  
	
	
  
</body>
</html>