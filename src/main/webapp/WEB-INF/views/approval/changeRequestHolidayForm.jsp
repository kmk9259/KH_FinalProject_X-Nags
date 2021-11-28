<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>X-Normal GroupWare Solution</title>
<style type="text/css">
div.box{display: none;}
label {
	font-weight: bold;
}

#title {
	font-weight: bold;
}
.selectReceiver{
	overflow: auto;
	min-height:500px;
}
</style>

</head>
<body>

	<jsp:include page="../common/menubar.jsp" />

	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>전자 결재</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item">전자 결재</li>
									<li class="breadcrumb-item active" aria-current="page">휴가 신청 수정</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				<form action="" method="post" enctype="multipart/form-data" id="changeApp">
				
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4 class="text-blue h4">결재선 지정</h4>
								<input type="hidden" name="empId" value="${ loginUser.empId }">
								<input type="hidden" name="appNo" value="${app.appNo}">
							</div>
							<div class="form-group">
								<input class="form-control" type="text" readonly="readonly" name="appMidName" value="${mid.userName }" data-toggle="tooltip" title="주소록에서 선택해 주세요.">
								<input class="form-control" type="hidden" name="appMid" readonly="readonly" value="${mid.empId }">
							</div>
								<input class="form-control" type="text" readonly="readonly" name="appFinName" value="${fin.userName }" data-toggle="tooltip" title="주소록에서 선택해 주세요.">
								<input class="form-control" type="hidden" name="appFin" readonly="readonly" value="${fin.empId }">
							</div>
							<div class="form-group full-right">
								<button type="button" class="btn btn-primary" data-backdrop="static" data-toggle="modal" data-target="#bd-example-modal-lg"><i class="icon-copy dw dw-agenda"></i> 주소록</button>
							</div>
						</div>
					</div>


				<!-- 결재 폼 시작 -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix">
						<div class="pull-left">
							<h4 class="h4">휴가 신청서</h4>
						</div>
					</div>
						<div class="form-group">
							<select class="custom-select col-6" name="category">
								<option>선택</option>
								<c:if test="${app.category eq 1 }">
									<option value="1" selected="selected">연차</option>
									<option value="2">반차</option>
								</c:if>
								<c:if test="${app.category eq 2 }">
									<option value="1" >연차</option>
									<option value="2" selected="selected">반차</option>
								</c:if>
							</select>
						</div>
				
						<div class="form-group">
							<p>
							이전 휴가기간 : <fmt:formatDate type="date" dateStyle="long" value="${app.stayDate }"/> - <fmt:formatDate type="date" dateStyle="long" value="${app.endDate }"/>
							</p>
							<input class="form-control datetimepicker-range" placeholder="휴가 기간 변경" type="text" name="reDate">

						</div>
						

						<div class="form-group">
							<input class="form-control" type="text" name="title" required="required" value="${app.title }">
						</div>
						<div class="form-group">
							<input type="file" class="form-control-file form-control height-auto" name="reUploadFile">
							<c:if test="${!empty app.originName }">
								현재 첨부된 파일 : ${app.originName } <br>
	                            <input type="hidden" name="changeName" value="${ app.changeName }">
	                            <input type="hidden" name="originName" value="${ app.originName }">
							</c:if>
						</div>
						
						<div class="form-group">
							<textarea class="textarea_editor form-control border-radius-0" name="content" required="required">
								${app.content }
							</textarea>
						</div>
						<div class="clearfix">
							<div class="pull-right">
								<button type="button" onclick="changeApp();" class="btn btn-primary">결재 전송</button>
							</div>
						</div>
						</div>
					</form>
					
				</div>
				<jsp:include page="../common/footer.jsp" />
				
				<!-- 결재 폼 끝 -->
			</div>
		</div>
		
			
			<!-- 주소록 모달 -->
			<div class="modal fade bs-example-modal-lg" id="bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myLargeModalLabel">받는 사람 선택</h4>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						</div>
										
						<div class="modal-body">
							<div class="selectReceiver">
								<div class="form-group" id="deptList">
									
										<select id="selectDept" name="dept" class="custom-select col-6">
											<option>부서 선택</option>
											<option value="D1">인사관리부</option>
											<option value="D2">회계관리부</option>
											<option value="D3">마케팅부</option>
											<option value="D4">국내영업부</option>
											<option value="D5">해외영업부</option>
											<option value="D6">기술지원부</option>
											<option value="D7">총무부</option>
										</select>
							            <button class="btn btn-primary" id="searchEmp">조회</button>
									
								</div>
								
								<div id="empList">
									<table border="1" class="table table-bordered border-primary" id="eList">
										<thead class="table-primary">
											<tr>
												<th></th>
												<th>이름</th>
												<th>사번</th>
												<th>직급</th>
												<th>권한</th>
											</tr>
										</thead>
										<tbody>
											
										</tbody>
									</table>
								</div>
							
							</div>
						</div>
										
										
										
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" onclick="selectMid();">중간결재자 선텍</button>
							<button type="button" class="btn btn-primary" onclick="selectFin();">최종결재자 선텍</button>
						</div>
					</div>
				</div>
			</div>
			
			
			
			<script>
			
				$(function(){
	            	var appDate ="";
	            	$( ".datetimepicker-range" ).datepicker({
	                		dateFormat: "yyyy/mm/dd",
	                		language:"ko",
	                		minDate: new Date(),
	                		onSelect: function(dateText) {
	                			appDate = dateText
	                	    }
	                		
	                });  	 
	        			
	        	}); 
                
				$(function(){
                	$("#searchEmp").click(function(){
                		
                		var deptCode = $("select[name=dept] option:selected").val();
                		console.log(deptCode);
                		
                		if(deptCode == "부서 선택"){
                			
                			swal({
               	                   type: 'error',
               	                   title: 'Oops...',
               	                   text: '부서를 선택해 주세요',
                	             })
                			return false;
                		}
                		
                		$.ajax({
                			url:"empList.ml",
                			data:{deptCode:deptCode},
                			type:"get",
                			success:function(map){
                				console.log(map);
                				console.log(map["jrr"])
                				
                				var $tableBody = $("#eList tbody");
                				$tableBody.html("");
                				
                				$.each(map["jrr"], function(i, emp){
                					console.log("emp ~~~ "+ emp);
                					
                					var $tr = $("<tr>");
                					var $ckTd = $("<td><input type='checkBox' class='checkEmp' name='checkEmp'></td>");
                					var $nameTd = $("<td>").text(emp.userName);
                					var $idTd = $("<td>").text(emp.empId);
                					var $jobTd = $("<td>").text(emp.jobName);
                					var $rightTd = $("<td>").text(emp.rightName);
                					
                					$tr.append($ckTd);
                					$tr.append($nameTd);
                					$tr.append($idTd);
                					$tr.append($jobTd);
                					$tr.append($rightTd);
                					
                					$tableBody.append($tr);
                					
                				})

                			},
                			error:function(e){
                				console.log("사원 리스트 조회 ajax 통신 실패");
                			}
                		
                		})
                	
                	})
                	
                })
                
                function selectMid(){
					var tr = $("input[class=checkEmp]:checked").parent().parent().eq(0);
					var td = tr.children();
					var userName = td.eq(1).text();
					var empId = td.eq(2).text();
					
					var deptCode = $("select[name=dept] option:selected").val();
					console.log(deptCode);
					
					if(deptCode == "부서 선택"){
							
						swal(
				               {
				                   type: 'error',
				                   title: 'Oops...',
				                   text: '부서를 선택해 주세요',
				               }
				           )
						return false;
						
					}else if(tr.val() == null){
						swal(
				               {
				                   type: 'error',
				                   title: 'Oops...',
				                   text: '중간 결재자를 선택해 주세요',
				               }
				           )
						return false;
					}
					
					console.log("userName : " + userName);
					console.log("empId : " + empId);
					
					$("input[name=appMidName]").val(userName);
					$("input[name=appMid]").val(empId);
					$("input[class=checkEmp]").prop('checked', false); 
				}
                
                function selectFin(){
                	var mid = $("#changeApp input[name=appMidName]");
                	var tr = $("input[class=checkEmp]:checked").parent().parent().eq(0);
                	var td = tr.children();
                	var userName = td.eq(1).text();
                	var empId = td.eq(2).text();
                	var deptCode = $("select[name=dept] option:selected").val();
                	console.log(deptCode);
                	
                	if(deptCode == "부서 선택"){
                			
                		swal({
                              type: 'error',
                              title: 'Oops...',
                              text: '부서를 선택해 주세요',
                             })
                		return false;
                		
                	}else if(mid.val()=="" || mid.val()==null){
                		
                		 swal(
                	               {
                	                   type: 'error',
                	                   title: 'Oops...',
                	                   text: '중간 결재자를 입력해 주세요',
                	               }
                	           )
                			return false;
                		 
                	}else if(tr.val() == null){
                		swal(
                               {
                                   type: 'error',
                                   title: 'Oops...',
                                   text: '최종 결재자를 선택해 주세요',
                               }
                           )
                		return false;
                	}else if(userName == mid.val()){
                		swal(
                                {
                                    type: 'error',
                                    title: 'Oops...',
                                    text: '중간 결재자와 다른 최종 결재자를 선택해 주세요',
                                }
                            )
                 		return false;
                		
                	}
                	
                	console.log("userName : " + userName);
                	console.log("empId : " + empId);
                	
                	$("input[name=appFinName]").val(userName);
                	$("input[name=appFin]").val(empId);
                	$("input[class=checkEmp]").prop('checked', false); 
                	$("#bd-example-modal-lg").modal("hide");	

                }
                
                function changeApp() {
                	var mid = $("#changeApp input[name=appMidName]");
                	var fin = $("#changeApp input[name=appFinName]");
                	var category = $("#changeApp select[name=category]");
                	var date = $("#changeApp input[name=date]");
                	var title = $("#changeApp input[name=title]");
                	var content = $("#changeApp textarea[name=content]");
                	
                	console.log(date.val());
                	
                	if(mid.val()=="" || mid.val()==null){
                		
                	 swal(
                               {
                                   type: 'error',
                                   title: 'Oops...',
                                   text: '중간 결재자를 입력해 주세요',
                               }
                           )
                		return false;
                	 
                	}else if(fin.val()=="" || fin.val()==null){
                		
                		swal(
                               {
                                   type: 'error',
                                   title: 'Oops...',
                                   text: '최종 결재자를 입력해 주세요',
                               }
                           )
                		return false;
                		
                	}else if(category.val()=="선택"){
                		
                		swal(
                               {
                                   type: 'error',
                                   title: 'Oops...',
                                   text: '휴가 종류를 선택해 주세요',
                               }
                           )
                		return false;
                		
                	}else if(title.val()=="" || title.val()==null){
                		
                		swal(
                	               {
                	                   type: 'error',
                	                   title: 'Oops...',
                	                   text: '제목을 입력해 주세요',
                	               }
                	           )
                			return false;
                		
                	}else if(content.val()=="" || content.val()==null){
                	
                		swal(
                	               {
                	                   type: 'error',
                	                   title: 'Oops...',
                	                   text: '내용을 입력해 주세요',
                	               }
                	           )
                			return false;
                		
                	
                	}else{
                		$("#changeApp").attr("action", "update.ap");
                		$("#changeApp").submit();
                		return true;
                	}
                }
             
                </script>
                


</body>
</html>