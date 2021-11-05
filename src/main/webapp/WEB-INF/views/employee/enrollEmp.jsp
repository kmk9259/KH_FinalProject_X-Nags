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
			
			
			<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>사원 등록</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">사원 등록</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<!-- 사원정보 입력 -->
				<form id="enrollForm" action="insertEmp.me" method="post" onSubmit="return checkForSelection();">
					<div class="pd-20 card-box mb-30">

						<div class="clearfix">
							<div class="pull-left">
								<h4 class="text-blue h4">사원 등록</h4>
								<p class="mb-30">사원의 정보를 입력해 주세요</p>
							</div>

						</div>


						


						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">직급코드(*)</label>
							<div class="col-sm-12 col-md-10">

								<select class="form-control" id="jobCode" name="jobCode">
									<option selected disabled hidden="hidden" value="0">직급을 선택하세요</option>
									<option value="J1">대표</option>
									<option value="J2">부사장</option>
									<option value="J3">부장</option>
									<option value="J4">차장</option>
									<option value="J5">과장</option>
									<option value="J6">대리</option>
									<option value="J7">사원</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">권한</label>
							<div class="col-sm-12 col-md-10">
								<select class="form-control" id="rightNo" name="rightNo">
									<!-- <option value="" selected disabled hidden="hidden">권한을 선택하세요</option> -->
									<option value="0">권한없음</option>
									<option value="1">인사관리자</option>
									<option value="2">근태관리자</option>
									<option value="3">공지사항관리자</option>
									<option value="4">비품관리자</option>
									
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">부서코드 (*)</label>
							<div class="col-sm-12 col-md-10">
								<select class="form-control" id="deptCode" name="deptCode">
									<option hidden="hidden" value=""  selected >부서코드를 선택하세요</option>
									<option value="D1">인사관리부</option>
									<option value="D2">회계관리부</option>
									<option value="D3">마케팅부</option>
									<option value="D4">국내영업부</option>
									<option value="D5">해외영업부</option>
									<option value="D6">기술지원부</option>
									<option value="D7">총무부</option>
								</select>
							</div>

						</div>

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">급여 등급 (*)</label>
							<div class="col-sm-12 col-md-10">

								<select class="form-control" id="salLevel" name="salLevel">
									<option value="" selected disabled hidden>급여 등급 선택</option>
									<option value="S1">S1</option>
									<option value="S2">S2</option>
									<option value="S3">S3</option>
									<option value="S4">S4</option>
									<option value="S5">S5</option>
									<option value="S6">S6</option>
									

								</select>
							</div>
						</div>


						<div class="btns" align="center">
							<button id="enrollBtn" class="btn btn-primary"  >다음</button>
							<!-- disabled  중복처리하고나서-->
							<button type="reset" class="btn btn-danger">초기화</button>
						</div>
					</div>
					<br> <br> <br>
				</form>
			</div>
	</div>
</div>
<!-- validation check -->

		<script>
		
		const checkForSelection = () => {
			if(document.getElementById("jobCode").selectedIndex === 0){
				alert("직업 코드를 선택하세요")
				document.getElementById("jobCode").focus();
				return false;
			}
			if(document.getElementById("deptCode").selectedIndex === 0){
				alert("부서 코드를 선택하세요")
				document.getElementById("deptCode").focus();
				return false;
			}
			
			if(document.getElementById("salLevel").selectedIndex === 0){
				alert("급여 등급을 선택하세요")
				document.getElementById("salLevel").focus();
				return false;
			}
			
		}
	
		
		
		
		

			
		
		
		</script>
	
	
	<!-- ==================================================== -->


	<jsp:include page="../common/footer.jsp" />
</body>
</html>