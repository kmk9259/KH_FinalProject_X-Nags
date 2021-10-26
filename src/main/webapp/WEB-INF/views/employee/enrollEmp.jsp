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


	<!-- <div class="mobile-menu-overlay"></div> -->

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


						<div class="text-center">
							<label class="title">사원 프로필 사진</label>
							<div>
								<a class="fileRemove1" id="close"> X </a> <img name="file"
									id="titleImg" width="200px" height="180">

							</div>
							<br>

							<div id="fileArea">

								<input type="file" style="color: black;" name="file" id="file"
									onchange="loadImg(this, 1);" required>

							</div>

							<script>
								$(function() {
									$("#fileArea").hide();

									$("#titleImg").click(function() {
										$("#file").click();
									});

								});

								function loadImg(inputFile, num) {// 이미지 미리보기 
									//inputFile : 현재 변화가 생긴 input type = "file"
									//num : 조건문을 활용 하기 위해 전달받은 매개변수

									//console.dir(inputFile);

									if (inputFile.files.length == 1) {//file이 존재 할경우 
										var reader = new FileReader();// 파일을 읽어들이 FileReader객체를 생성 

										reader
												.readAsDataURL(inputFile.files[0]);//파일을 읽어주는 메소드  --> 해당 파일을 읽어서 url을 부여 (문자열로 저장 )

										reader.onload = function(e) {//파일 읽기가 다완료 되면 실행할 메소드 
											console.log(e);
											switch (num) {
											case 1:
												$("#titleImg").attr("src",
														e.target.result);
												break;// result :  읽어들이 파일 내용 data:URL 형식 

											}
										}
									}
								};

								//==================사진 지우기 함수 

								$("#removefile").click(function() {
									$("#titleImg").attr("src", " ");

								})

								$(".fileRemove1").click(function() {

									$("#titleImg").attr("src", " ");
									$('#file1').val('');

								})
							</script>


						</div>


						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">직급코드</label>
							<div class="col-sm-12 col-md-10">

								<select class="form-control" id="jobCode" name="jobCode">
									<option>J1</option>
									<option>J2</option>
									<option>J3</option>
									<option>J4</option>
									<option>J5</option>
									<option>J6</option>
									<option>J7</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">권한</label>
							<div class="col-sm-12 col-md-10">
								<!-- 	<input class="form-control" placeholder="권한" type="text"> -->
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
								<!-- <input class="form-control" placeholder="부서코드" type="text"> -->
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
									<option>S1</option>
									<option>S2</option>
									<option>S3</option>
									<option>S4</option>
									<option>S5</option>
									<option>S6</option>

								</select>
							</div>
						</div>
						
					

						<div class="btns" align="center">
							<button type="submit" id="enrollBtn" class="btn btn-primary collapsed" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">사원등록</button>
							<!-- disabled  중복처리하고나서-->
							<button type="reset" class="btn btn-danger">초기화</button>
						</div>
					</div>
					<br> <br> <br>
				</form>
			</div>
		</div>
</div>

		
<!-- ===================개인정보 입력=============== -->

<div class="main-container collapse" id="collapseOne"  aria-labelledby="headingOne" >
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">

				<!-- 개인정보 입력 -->
				<form id="enrollForm" action="insertMember.me" method="post">
					<div class="pd-20 card-box mb-30">

						<div class="clearfix">
							<div class="pull-left">
								<h4 class="text-blue h4">개인정보 입력</h4>
								<p class="mb-30">개인 정보입력해 주세요.</p>
							</div>

						</div>
						
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">직원 이름</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" placeholder="직원 이름" type="text"
									id="userName" name="userName">
							</div>
						</div>


						 <div class="form-group">
							<label>비밀번호</label> <input class="form-control" type="password"
								placeholder="password" id="userPwd" name="userPwd">
						</div>
						<div class="form-group">
							<label>주민등록번호</label> <input class="form-control" type="text"
								id="userSsn" name="userSsn">
						</div>
						<div class="form-group">
							<label>이메일</label> <input class="form-control"
								placeholder="email" type="email" id="email" name="email">
						</div>
						<div class="form-group">
							<label>전화번호</label> <input class="form-control"
								placeholder="000-0000-0000" type="tel" id="phone" name="phone">
						</div>


						<!-- 주소입력  -->

						<label for="address"> &nbsp; 주소 입력 :</label><br>

						<div class="form-inline">
							<label> &nbsp; 우편번호 : &nbsp;</label> <input type="text"
								name="post" class="form-control mr-2 postcodify_postcode5"
								size="6">
							<button type="button" class="btn btn-primary"
								id="postcodify_search_button">검색</button>
						</div>
						<br> <label> &nbsp; 도로명주소 : </label> <input type="text"
							name="address1" class="form-control postcodify_address" size="30">
						<br> <label> &nbsp; 상세주소 : </label> <input type="text"
							name="address2" class="form-control postcodify_extra_info"
							size="30"> <br>


						<!-- jQuery와 Postcodify를 로딩한다. -->
						<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
						<script>
							// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
							$(function() {
								$("#postcodify_search_button")
										.postcodifyPopUp();
							});
						</script>

						<!-- 주소입력   끝-->

						<!-- 성별 입력 -->
						<br><br>
						<label for=""> &nbsp; Gender : </label>&nbsp;&nbsp;
						<input type="radio" name="gender" id="Male" value="M">
						<label for="Male">남자</label> &nbsp;&nbsp; <input type="radio"
							name="gender" id="Female" value="F"> <label for="Female">여자</label><br>

						<!-- 성별 입력 끝 -->



						<div class="btns" align="center">
							<button type="submit" id="enrollBtn" class="btn btn-primary">사원등록</button>
							<!-- disabled  중복처리하고나서-->
							<button type="reset" class="btn btn-danger">초기화</button>
						</div>

                    </div>


					<br> <br> <br>
				</form>
			</div>
		</div>

</div>

	<!-- ======================================================================= -->

	<jsp:include page="../common/footer.jsp" />
</body>
</html>