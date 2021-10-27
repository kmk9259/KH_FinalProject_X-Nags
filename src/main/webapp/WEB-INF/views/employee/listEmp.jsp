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



	<!-- ===================개인정보 입력=============== -->

	<div class="main-container" aria-labelledby="headingOne">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">

				<!-- 사원 정보 조회 -->

				<div class="pd-20 card-box mb-30">

					<div class="clearfix">
						<div class="pull-left">
							<h4 class="text-blue h4">사원 정보 조호</h4>
							<p class="mb-30">사원 정보 입니다.</p>
						</div>

					</div>

				</div>
			</div>
		</div>

	</div>

	<!-- ======================================================================= -->

	<jsp:include page="../common/footer.jsp" />
</body>
</html>