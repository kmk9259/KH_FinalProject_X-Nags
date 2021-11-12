<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>X-Nomal Groupware Solution</title>
<style type="text/css">

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
									<li class="breadcrumb-item active" aria-current="page">증명서 신청 수정</li>
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
								<input type="hidden" readonly class="form-control-plaintext" name="empId" value="${ sessionScope.loginUser.empId }">
							</div>
							<div class="form-group">
								<input class="form-control" type="text" required="required" name="appMid" placeholder="중간 결제자를 입력해 주세요">
								<input class="form-control" type="hidden" required="required" >
							</div>
								<input class="form-control" type="text" required="required" name="appFin" placeholder="최종 결재자를 입력해 주세요">
								<input class="form-control" type="hidden"  required="required">
							</div>
						</div>
					</div>
				


				<!-- 결재 폼 시작 -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix">
						<div class="pull-left">
							<h4 class="h4">증명서 신청서</h4>
						
						</div>
					</div>
					
						<div class="form-group">
							<select class="custom-select col-6" name="category">
								<option selected>증명서 선택</option>
								<option value="4">재직증명서</option>
								<option value="5">급여명세서</option>
								<option value="6">기타</option>
							</select>
						</div>
						
						<div class="form-group">
							<input class="form-control date-picker" name="date" placeholder="기안일 지정" type="text" required="required">
						</div>
						

						<div class="form-group">
							<input class="form-control" type="text" name="title" required="required" placeholder="제목을 입력해주세요.">
						</div>
						<div class="form-group">
							<input type="file" class="form-control-file form-control height-auto" name="uploadFile">
						</div>
						
						<div class="form-group">
							<textarea class="textarea_editor form-control border-radius-0" name="content" required="required" placeholder="내용을 입력해주세요."></textarea>
						</div>
						<div class="clearfix">
							<div class="pull-right">
								<!--  <button type="reset" class="btn btn-outline-danger">취소</button> -->
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
                	$( ".date-picker" ).datepicker({
                    		dateFormat: "yyyy/mm/dd",
                    		language:"en",
                    		onSelect: function(dateText) {
                    			appDate = dateText
                    	    }
                    		
                    });  	 
            			
            	});
                </script>
		

	<jsp:include page="../common/footer.jsp" />



</body>
</html>