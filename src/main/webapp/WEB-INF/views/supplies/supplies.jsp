<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Nomal Groupware Solution</title>


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
							<form>
								<div class="form-group">
									<label>예약 날짜</label> <input
										class="form-control date-picker" placeholder="Select Date"
										type="text">
								</div>
								
								<div class="form-group">
									<label>반납 날짜</label> <input
										class="form-control date-picker" placeholder="Select Date"
										type="text">
								</div>
								
							</form>
						</div>
						<div class="col-md-4 col-sm-12 text-center">
							<div class="mb-20">
								<label>Datedpicker Inline</label>
								<div class="datepicker-here" data-timepicker="true"
									data-language='en'></div>
							</div>
						</div>
						<div class="col-md-4 col-sm-12">
							<form>
								<div class="form-group">
									<label>Datedpicker Month View</label> <input
										class="form-control month-picker" placeholder="Select Month"
										type="text">
								</div>
								<div class="form-group">
									<label>Datedpicker Range View</label> <input
										class="form-control datetimepicker-range"
										placeholder="Select Month" type="text">
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- ======================================================================= -->

			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>