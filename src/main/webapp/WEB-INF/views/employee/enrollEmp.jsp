<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Nomal Groupware Solution</title>


<style type="text/css">
#close {
	position: absolute;
	float: right;
	background: red;
	color: white;
	width: 30px;
	z-index: 1;
}
</style>
   
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<!-- ================================================================================= -->


	 <div class="mobile-menu-overlay"></div> 

	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">

				<!-- 사원정보 입력 -->
				<form id="enrollForm" action="insertEmp.me" method="post">
					<div class="pd-20 card-box mb-30">

						<div class="clearfix">
							<div class="pull-left">
								<h4 class="text-blue h4">사원 등록</h4>
								<p class="mb-30">사원의 정보를 입력해 주세요</p>
							</div>

						</div>


						


						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">직급코드</label>
							<div class="col-sm-12 col-md-10">

								<select class="form-control" id="jobCode" name="jobCode">
									<option></option>
									<option>J2</option>
									<option>J3</option>
									<option>J4</option>
									<option>J5</J1option>
									<option>J6</option>
									<option>J7</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">권한</label>
							<div class="col-sm-12 col-md-10">
								<select class="form-control" id="rightNo" name="rightNo">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">부서코드</label>
							<div class="col-sm-12 col-md-10">
								<select class="form-control" id="deptCode" name="deptCode">
									<option>D1</option>
									<option>D2</option>
									<option>D3</option>
									<option>D4</option>
									<option>D5</option>
									<option>D6</option>
									<option>D7</option>
								</select>
							</div>

						</div>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">급여 등급</label>
							<div class="col-sm-12 col-md-10">

								<select class="form-control" id="salLevel" name="salLevel">
									<option >S1</option>
									<option>S2</option>
									<option>S3</option>
									<option>S4</option>
									<option>S5</option>
									<option>S6</option>

								</select>
							</div>
						</div>


						<div class="btns" align="center">
							<button type="submit" id="enrollBtn" class="btn btn-primary" >다음</button>
							<!-- disabled  중복처리하고나서-->
							<button type="reset" class="btn btn-danger">초기화</button>
						</div>
					</div>
					<br> <br> <br>
				</form>
			</div>
		</div>
	</div>


	
	
	<!-- ==================================================== -->


	<jsp:include page="../common/footer.jsp" />
</body>
</html>