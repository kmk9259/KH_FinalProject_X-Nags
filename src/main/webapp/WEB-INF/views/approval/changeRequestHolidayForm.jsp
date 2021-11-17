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
<title>X-Nomal Groupware Solution</title>
<style type="text/css">
div.box{display: none;}
label {
	font-weight: bold;
}

#title {
	font-weight: bold;
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
				<form action="update.ap" method="post" enctype="multipart/form-data">
				
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4 class="text-blue h4">결재선 지정</h4>
								<input type="hidden" name="empId" value="${ sessionScope.loginUser.empId }">
								<input type="hidden" name="appNo" value="${app.appNo}">
							</div>
							<div class="form-group">
								<input class="form-control" type="text" required="required" name="appMid" value="${mid.userName }">
								<input class="form-control" type="hidden" required="required" value="${mid.empId }">
							</div>
								<input class="form-control" type="text" required="required" name="appFin" value="${fin.userName }">
								<input class="form-control" type="hidden"  required="required" value="${fin.empId }">
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
									<option value="1" selected="selected">휴가</option>
									<option value="2">반차</option>
								</c:if>
								<c:if test="${app.category eq 2 }">
									<option value="1" >휴가</option>
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
								<!-- <button type="reset" class="btn btn-outline-danger">취소</button> -->
								<button type="submit" class="btn btn-primary">결재 전송</button>
							</div>
						</div>
						</div>
					</form>
					
				</div>
				
				
				<!-- 결재 폼 끝 -->
			</div>
		</div>
		
	
			
			<div class="modal fade" id="member-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="login-box bg-white box-shadow border-radius-10">
							<div class="login-title">
								<h2 class="text-center text-primary">받는 사람 선택</h2>
							</div>
							<form>
								
								<div class="input-group custom">
									
									<select class="form-control form-control-lg">
										<option>부서선택</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
									</select>
									
								</div>
								<div class="input-group custom">
								
									<select class="form-control form-control-lg">
										<option>이름선택</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
									</select>
								
								</div>
								
								<div class="row">
									<div class="col-sm-12">
										<div class="input-group mb-0">
											
											<input class="btn btn-primary btn-lg btn-block" type="submit" value="선택">
											
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
                	var appDate ="";
                	$( ".datetimepicker-range" ).datepicker({
                    		dateFormat: "yyyy/mm/dd",
                    		language:"ko",
                    		onSelect: function(dateText) {
                    			appDate = dateText
                    	    }
                    });  	 
            	});
                
                function selectBox(){
                	
                	
                }
             
                </script>
                
                
		

	<jsp:include page="../common/footer.jsp" />



</body>
</html>