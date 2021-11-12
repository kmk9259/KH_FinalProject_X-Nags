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
	.scrolltbody > thead > tr>th{
	font-size: 15px;
	height: 47.33px;
	width: 300px;
	}
	.scrolltbody tbody {
	    display: block;
	    height: 280px;
	    overflow: auto;
	}
	.scrolltbody > tbody > tr>td{
	font-size: 15px;
	height: 47.33px;
	width: 300px;
	}
	
	
	.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 428px; }
	.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 428px; }
	.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { width: 428px; }
	.scrolltbody th:last-child { width: 428px; }
	 .scrolltbody td:last-child { width: calc( 420px - 19px );  }  
	</style>
	
	

	
</head>
<body >
	<jsp:include page="../common/menubar.jsp"/>
	
    
    <div class="mobile-menu-overlay"></div>
    <div class="main-container">
        <div class="pd-ltr-20 xs-pd-20-10">
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
                        <div class="col-md-12 col-sm-12">                            
                        	<table id="attDayList" class="table table-striped  scrolltbody"  style="text-align: center;">
                        	<c:if test="${loginEmp.rightName eq '근태관리자'}">
								<thead>
									<tr>
										<th>부서명</th>
										<th>직급명</th>
										<th>사원명</th>
										<th>날짜</th>
										<th>출근 시간</th>
										<th>퇴근 시간</th>
										<th>수정</th>
									</tr>
								</thead>
								<tbody></tbody>	    
							
							</c:if>
							<c:if test="${loginEmp.rightName ne '근태관리자'}">
								<thead>
									<tr>
										<th>부서명</th>
										<th>직급명</th>
										<th>사원명</th>
										<th>날짜</th>
										<th>출근 시간</th>
										<th>퇴근 시간</th>
									</tr>
								</thead>
								<tbody></tbody>	    
							
							</c:if>


								
							</table>
                    	</div>
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
            	<script>
            	$(function(){
                	var attendanceDate ="";
                	$( ".date-picker" ).datepicker({
                    		dateFormat: "yyyy-mm-dd",
                    		language:"ko",
                    		onSelect: function(dateText) {
                    			attendanceDate = dateText;
                    	    }
                    		
                    });  
            		$("#btn").click(function(){
            			var orderBy = $('input[name="item"]:checked').val();
            			var attStatusNo = $('input[name="attList"]:checked').val();
            			if(orderBy == null || attStatusNo == null || attendanceDate == ''){
            				$('#warning-modal').modal('show');
            			}else{
            				$.ajax({
            					url:"selectAttDay.att",
            					type:"post",
            					data:{
            						attendanceDate : attendanceDate,
            						orderBy : orderBy,
            						attStatusNo : attStatusNo
            					},
            					dataType:"json",
            					success:function(list){
            						$tableBody = $('#attDayList tbody');
            						$tableBody.html('');
            						
            						
            						$.each(list, function(i, obj){
            						            							
            							var $tr = $('<tr>');
            							var $deptName = $('<td>').text(obj.deptName);
            							var $jobName = $('<td>').text(obj.jobName);
            							var $userName = $('<td>').text(obj.userName);
            							var $attDate = $('<td>').text(obj.attDate.substring(0,13));
            							var $attInTime = $('<td>').text(obj.attInTime.substring(14,25));
            							var $attOutTime = $('<td>').text(obj.attOutTime.substring(14,25));
            							var $rigthName = '<input type="button" class="btn btn-primary" id="button" value="&nbsp&nbsp&nbsp&nbsp조회&nbsp&nbsp&nbsp&nbsp">'
            							
            							if(obj.rigthName == '근태관리자'){
            								$tr.append($deptName);
                							$tr.append($jobName);
                							$tr.append($userName);
                							$tr.append($attDate);
                							$tr.append($attInTime);
                							$tr.append($attOutTime);
                							$tr.append($rigthName);
                							$tableBody.append($tr);
            							}else{
            								$tr.append($deptName);
                							$tr.append($jobName);
                							$tr.append($userName);
                							$tr.append($attDate);
                							$tr.append($attInTime);
                							$tr.append($attOutTime);
                							$tableBody.append($tr);
            							}
            							
            						}); 
            						
            					}
            				});
            				
            			}
            			
            			
            		});   			 
        		});
            	</script>
            	<jsp:include page="../common/footer.jsp"/>
        	</div>
    	</div>    	
	</div>  
	
	
  
</body>
</html>