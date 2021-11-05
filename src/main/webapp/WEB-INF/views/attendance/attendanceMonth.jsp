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
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/plugins/jquery-asColorPicker/dist/css/asColorPicker.css">

	
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
                            <h4 class="text-blue h4">월별 근태 현황</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5 col-sm-12">
                            <form>
                                <div class="form-group"> 
                                	<label>날짜</label>
                                    <input class="form-control month-picker" name="date" placeholder="Click" type="text">                                
                                </div>
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
                            </form>
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
                        	<table id="attMonthList" class="table table-striped table-bordered" style="text-align: center;">
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
							</table>
                    	</div>
                	</div>
            	</div>
            	<script>
            	$(function(){
                	var attMonthDate ="";
                	$( ".month-picker" ).datepicker({
                    		dateFormat: "yyyy-mm",
                    		language:"ko",
                    		onSelect: function(dateText) {
                    			attMonthDate = dateText;
                    			console.log(attMonthDate);
                    	    }
                    		
                    });  
            		$("#btn").click(function(){
            			var orderBy = $('input[name="item"]:checked').val();
            			var attStatusNo = $('input[name="attList"]:checked').val();
            			
            			 $.ajax({
        					url:"selectAttMonth.att",
        					type:"post",
        					data:{
        						attMonthDate : attMonthDate,
        						orderBy : orderBy,
        						attStatusNo : attStatusNo
        					},
        					dataType:"json",
        					success:function(list){
        						$tableBody = $('#attMonthList tbody');
        						$tableBody.html('');
        						
        						$.each(list, function(i, obj){
        							var $tr = $('<tr>');
        							var $deptName = $('<td>').text(obj.deptName);
        							var $jobName = $('<td>').text(obj.jobName);
        							var $userName = $('<td>').text(obj.userName);
        							var $attDate = $('<td>').text(obj.attDate.substring(0,13));
        							var $attInTime = $('<td>').text(obj.attInTime.substring(14,25));
        							var $attOutTime = $('<td>').text(obj.attOutTime.substring(14,25));
        							
        							
        							$tr.append($deptName);
        							$tr.append($jobName);
        							$tr.append($userName);
        							$tr.append($attDate);
        							$tr.append($attInTime);
        							$tr.append($attOutTime);
        							$tableBody.append($tr);
        						}); 
        						
        					},error:function(){
        						console.log("일별 근태 현황 ajax 통신 실패");
        					}
        				}); 
            		});   			 
        		});
            	</script>
            	<jsp:include page="../common/footer.jsp"/>
        	</div>
    	</div>    	
	</div>  

</body>
</html>