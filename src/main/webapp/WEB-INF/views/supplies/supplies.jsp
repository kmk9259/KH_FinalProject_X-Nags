<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Nomal Groupware Solution</title>
<style>
.btn-success {
    
    margin-bottom: 50px;
}

</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<!-- ================================================================================= -->




	<div class="main-container" aria-labelledby="headingOne">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">



				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">비품 예약하기</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 col-sm-12">
							
								<div class="form-group ">
									<label>예약 날짜</label> <input class="form-control date-picker"
										placeholder="Select Date" type="text">
								</div>

								<div class="form-group">
									<label>반납 날짜</label> <input class="form-control date-picker"
										placeholder="Select Date" type="text">
								</div>
								<button type="button" class="btn btn-success btn-lg btn-block">대여 기간 등록</button>
						</div>

 						<div class="col-md-4 col-sm-12">
								<div class="custom-control custom-radio mb-4 ">
									<input type="radio" name="status" id="status2" value="status2" class="custom-control-input">
									<label class="custom-control-label " for="status2">모니터</label>
									&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" style="width : 80px; "/>
								</div>
								
								<div class="custom-control custom-radio mb-4 ">
									<input type="radio" name="status" id="status2" value="status2" class="custom-control-input">
									<label class="custom-control-label " for="status2">프린터</label>
									&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" style="width : 80px;"/>
								</div>
									
								<div class="custom-control custom-radio mb-4 ">
									<input type="radio" name="status" id="status2" value="status2" class="custom-control-input">
									<label class="custom-control-label " for="status2">책상</label>
									&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" style="width : 80px;"/>
								</div>
								
								<div class="custom-control custom-radio mb-4 ">
									<input type="radio" name="status" id="status2" value="status2" class="custom-control-input">
									<label class="custom-control-label " for="status2">케비넷</label>
									&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" style="width : 80px;"/>
								</div>
								
								
								<div class="custom-control custom-radio mb-4 ">
									<input type="radio" name="status" id="status2" value="status2" class="custom-control-input">
									<label class="custom-control-label " for="status2">책 수납장</label>
									&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" style="width : 80px;"/>
								</div>
								
								
								<div class="custom-control custom-radio mb-4 ">
									<input type="radio" name="status" id="status2" value="status2" class="custom-control-input">
									<label class="custom-control-label " for="status2">카메라</label>
									&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" style="width : 80px;"/>
								</div>
								
								
								<div class="custom-control custom-radio mb-4 ">
									<input type="radio" name="status" id="status2" value="status2" class="custom-control-input">
									<label class="custom-control-label " for="status2">조명</label>
									&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" style="width : 80px;"/>
								</div>
								
								
								<div class="custom-control custom-radio mb-4 ">
									<input type="radio" name="status" id="status2" value="status2" class="custom-control-input">
									<label class="custom-control-label " for="status2">사다라</label>
									&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" style="width : 80px;"/>
								</div>
								


							</div>
							
							
										
							</div>


					</div>
				</div>
				<!-- ======================================================================= -->

			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
</body>
</html>