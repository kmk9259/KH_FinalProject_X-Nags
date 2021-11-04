<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  
 <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/plugins/jquery-steps/jquery.steps.css">  
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<!-- ================================================================================= -->
	
	
	<div class="mobile-menu-overlay"></div> 
	
	

	<div class="main-container">
	
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
	
	
	<div class="pd-20 card-box mb-30">
	
	
	
	
	
	
					<div class="clearfix">
						<h4 class="text-blue h4">사원 등록</h4>
						<p class="mb-30">사원의 정보를 입력해 주세요</p>
					</div>
					
					
					<div class="wizard-content">
						<form class="tab-wizard wizard-circle wizard" id="enrollForm" action="insertEmp.me" method="post"  >
						<!-- onSubmit="return checkForSelection();" -->
							<h5>사원정보 입력</h5><br><br><br>
							<section>
								
								
								
			

				<!-- 사원정보 입력 -->
				
					

						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label" >직급코드(*)</label>
							<div class="col-sm-12 col-md-10">

								<select class="form-control" id="jobCode" name="jobCode" class="required">
									<option selected disabled hidden="hidden" value="">직급을 선택하세요</option>
									
									
									<%-- <c:forEach items="${jlist }" var="job" varStatus="status">
									<option>${job.jobName }</option> --%>
								    <option value="J1">대표</option>
									<option value="J2">부사장</option>
									<option value="J3">부장</option>
									<option value="J4">차장</option>
									<option value="J5">과장</option>
									<option value="J6">대리</option>
									<option value="J7">사원</option>
									<%-- </c:forEach> --%>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">권한</label>
							<div class="col-sm-12 col-md-10">
								<select class="form-control" id="rightNo" name="rightNo">
									<option value="" selected disabled hidden="hidden">권한을 선택하세요</option>
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
									<option value="" selected disabled hidden="hidden">급여 등급 선택</option>
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
						<!-- 	 <button id="enrollBtn" class="btn btn-primary"  >다음</button> -->
							
							<button type="reset" class="btn btn-danger">초기화</button>
						</div>
					
					<br> <br> <br>
					
					</section>
				
			

<!-- validation check -->

		<script>
		
		/* function chkValidation() {
			if(document.getElementById("jobCode").selectedIndex === 0){
				alert("직업 코드를 선택하세요")
				document.getElementById("jobCode").focus();
				e.preventDefault();
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
			
		} */
	
		
		
		$(document).ready(function(){
			
			
			var next = $(".actions>ul>li:nth-child(2n)").text();
			console.log(next);
		})
		
		
		

		
		
		</script> 
								
								
								
							
							
							
							
							<!-- Step 2 -->
							<h5>개인 정보 입력</h5>
							
							
							<section>
							
								
								<div class="text-center">
							<label class="title">사원 프로필 사진</label>
							<div>
								<a class="fileRemove" id="close"> X </a> <img name="uploadFile"
									id="uploadFile" width="200px" height="180">

							</div>
							<br>

							<div id="fileArea">

								<input type="file" style="color: black;" name="uploadFile" id="file"
									onchange="loadImg(this, 1);" required>

							</div>

							<script>
								$(function() {
									$("#fileArea").hide();

									$("#uploadFile").click(function() {
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
												$("#uploadFile").attr("src",
														e.target.result);
												break;// result :  읽어들이 파일 내용 data:URL 형식 

											}
										}
									}
								};

								//==================사진 지우기 함수 

								$(".fileRemove").click(function() {
									$("#uploadFile").attr("src", " ");

								})

							</script>


						</div>
						
						

						

						<div class="form-group">
							<label>직원 이름</label> <input class="form-control" type="text"
								placeholder="직원 이름" id="userName" name="userName">
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
								id="post" name="post" class="form-control mr-2 postcodify_postcode5"
								size="6">
							<button type="button" class="btn btn-primary"
								id="postcodify_search_button">검색</button>
						</div>
						<br> <label> &nbsp; 도로명주소 : </label> <input type="text" id="address1"
							name="address1" class="form-control postcodify_address" size="30">
						<br> <label> &nbsp; 상세주소 : </label> <input type="text" id="address2"
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
						<br>
						<br> <label for=""> &nbsp; Gender : </label>&nbsp;&nbsp; <input
							type="radio" name="gender" id="Male" value="M"> <label
							for="Male">남자</label> &nbsp;&nbsp; <input type="radio"
							name="gender" id="Female" value="F"> <label for="Female">여자</label><br>

						<!-- 성별 입력 끝 -->
								
								
								
								
								
							</section>
							
							
						</form>
						
					</div>
					</div>
				</div>

	
	
	
	<!-- ==================================================== -->

	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/jquery-steps/jquery.steps.js"></script> 
	<script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/steps-setting.js"></script>
	


	<jsp:include page="../common/footer.jsp" />
</body>
</html>