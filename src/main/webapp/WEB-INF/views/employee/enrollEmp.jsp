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


* {
    margin: 0;
    padding: 0
}

html {
    height: 100%
}

p {
    color: grey
}

#heading {
    text-transform: uppercase;
    color: #673AB7;
    font-weight: normal
}

#msform {
    text-align: center;
    position: relative;
    margin-top: 20px
}

#msform fieldset {
    background: white;
    border: 0 none;
    border-radius: 0.5rem;
    box-sizing: border-box;
    width: 100%;
    margin: 0;
    padding-bottom: 20px;
    position: relative
}

.form-card {
    text-align: left
}

#msform fieldset:not(:first-of-type) {
    display: none
}

#msform input,
#msform textarea {
    padding: 8px 15px 8px 15px;
    border: 1px solid #ccc;
    border-radius: 0px;
    /* margin-bottom: 25px; */
    margin-top: 2px;
    /* width: 100%; */
    box-sizing: border-box;
    font-family: montserrat;
    color: #2C3E50;
   /*  background-color: #ECEFF1; */
    font-size: 16px;
    letter-spacing: 1px
}

#msform input:focus,
#msform textarea:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #673AB7;
    outline-width: 0
}

#msform .action-button {
    width: 100px;
    font-weight: bold;
    background: #28a745;
    color: white;
    border: 0 none;
    border-radius: 0.25rem;
    cursor: pointer;
    padding: 10px 5px;
    margin: 10px 0px 10px 5px;
    float: right
}

#msform .action-button:hover,
#msform .action-button:focus {
    background-color: #311B92
}

#msform .action-button-previous {
    width: 100px;
    background: #616161;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 0.25rem;
    cursor: pointer;
    padding: 10px 5px;
    margin: 10px 5px 10px 0px;
    float: right
}

#msform .action-button-previous:hover,
#msform .action-button-previous:focus {
    background-color: #000000
}

.card {
    z-index: 0;
    border: none;
    position: relative;
    
}

.fs-title {
    font-size: 25px;
    color: #673AB7;
    margin-bottom: 15px;
    font-weight: normal;
    text-align: left
}

.purple-text {
    color: #673AB7;
    font-weight: normal
}

.steps {
    font-size: 25px;
    color: gray;
    margin-bottom: 10px;
    font-weight: normal;
    text-align: right
}

.fieldlabels {
    color: gray;
    text-align: left
}

#progressbar {
    margin-bottom: 30px;
    overflow: hidden;
    color: lightgrey
}

#progressbar .active {
    color: #673AB7
}

#progressbar li {
    list-style-type: none;
    font-size: 15px;
    width: 25%;
    float: left;
    position: relative;
    font-weight: 400
}

#progressbar #account:before {
    font-family: FontAwesome;
    content: "\f13e"
}

#progressbar #personal:before {
    font-family: FontAwesome;
    content: "\f007"
}

#progressbar #payment:before {
    font-family: FontAwesome;
    content: "\f030"
}

#progressbar #confirm:before {
    font-family: FontAwesome;
    content: "\f00c"
}

#progressbar li:before {
    width: 50px;
    height: 50px;
    line-height: 45px;
    display: block;
    font-size: 20px;
    color: #ffffff;
    background: lightgray;
    border-radius: 50%;
    margin: 0 auto 10px auto;
    padding: 2px
}

#progressbar li:after {
    content: '';
    width: 100%;
    height: 2px;
    background: lightgray;
    position: absolute;
    left: 0;
    top: 25px;
    z-index: -1
}

#progressbar li.active:before,
#progressbar li.active:after {
    background: #673AB7
}

.progress {
    height: 20px
}

.progress-bar {
    background-color: #673AB7
}

.fit-image {
    width: 100%;
    object-fit: cover
}

</style>
  

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
					
					
					
					
		<div class="container-fluid">
		    <div class="row justify-content-center">
		        <div class="col-11">
		            <div class="card px-0 pt-4 pb-0 mt-3 mb-3" style="border: none;">
		                <h2 id="heading">사원을 등록하세요</h2>
		                <p>다음 순서대로 진행하세요</p>
		                <form id="msform" action="insertEmp.me" method="post" enctype="multipart/form-data">
		                    
		                    <ul id="progressbar">
		                        <li class="active" id="account"><strong>개인정보 등록</strong></li>
		                        <li id="personal"><strong>사원정보 등록 + 회계정보</strong></li>
		                        <li id="payment"><strong>사진등록</strong></li>
		                        <li id="confirm"><strong>등록 성공</strong></li>
		                    </ul>
		                    <div class="progress">
		                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
		                    </div> <br>
							
							
		                    

	            <!--============================= step 1 =====================================-->
				<fieldset>
		   		<div class="form-card">
		                   <div class="row">
		                   <div class="col-7"><h2 class="fs-title">사원 개인 정보 등록:</h2></div>
		                   <div class="col-5"><h2 class="steps">Step 1 - 4</h2></div>
		                   </div>
										


						<div class="form-group">
							<label>직원 이름(*)</label>
							<input class="form-control" type="text" placeholder="userName" id="userName" name="userName">
						</div>


						<div class="form-group">
							<label>비밀번호(*)</label> <div class="form-control-feedback"  style="font-size: 0.9rem;">숫자 영문 특수문자 조합 6자리 이상 15자 이하로 입력하세요</div>
							<input class="form-control" type="password" placeholder="password" id="userPwd" name="userPwd">
							
						</div>
						<div class="form-group">
							<label>주민등록번호(*)</label>
							<input class="form-control" type="text" id="userSsn" name="userSsn" onkeyup="setSSn(this)" maxlength='14'>
							
							<script>
							function setSSn(obj)
							{
								var ssn = obj.value;
								var ssn = ssn.replace("-","");
								if(ssn.length < 7) {
									var ssn1 = ssn.substring(0,7);
									var ssn2 = ssn.substring(7,8);
															
									obj.value = ssn1+"-"+ssn2;
								}
							}
							
							</script>
						</div>
						
						<div class="form-group">
							<label>이메일(*)</label> <input class="form-control" placeholder="email" type="email" id="email" name="email">
						</div>
						
						<div class="form-group">
							<label>전화번호(*)</label> <input class="form-control" placeholder="000-0000-0000" type="tel" id="phone" name="phone" oninput="autoHyphen(this)" maxlength='13'>
						</div><br><br><br>
						<script>
						const autoHyphen = (target) => {
							 target.value = target.value
							   .replace(/[^0-9]/, '')
							   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
							}
						
						</script>

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
						<br>
						<label for=""> &nbsp; Gender : </label>&nbsp;&nbsp;
						<input type="radio" name="gender" id="Male" value="M">
						<label	for="Male">남자</label> &nbsp;&nbsp;
						<input type="radio" name="gender" id="Female" value="F">
						<label for="Female">여자</label><br>

						<!-- 성별 입력 끝 -->



						<div class="btns" align="center">
						<button type="reset" class="btn btn-outline-danger">초기화</button>
						</div>

					    </div>
					    
						<input type="button" data-toggle="modal" id="hoho" name="next" class="next1 action-button" value="다음" > 
                  </fieldset>
		                    
		          
		          <!--========================= step 2 =====================================-->
		          <fieldset>
		          <div class="form-group row">
				  <label class="col-sm-12 col-md-2 col-form-label" >직급코드(*)</label>
							<div class="col-sm-12 col-md-10">
 							<select class="form-control" id="jobCode" name="jobCode" required>
							<option selected disabled hidden="hidden" value="">직급을 선택하세요</option>
							
							<c:forEach items="${jlist }" var="job" varStatus="status">
									<option value="${job.jobCode }">${job.jobName }</option> 
							</c:forEach> 
							</select>
							</div>
				  </div>
				  
				  <div class="form-group row">
				  <label class="col-sm-12 col-md-2 col-form-label">권한</label>
				  <div class="col-sm-12 col-md-10">
				  
				  <select class="form-control" id="rightNo" name="rightNo">
							<c:forEach items="${rlist }" var="r" varStatus="status">
							<option value="${r.rightNo }">${r.rightName }</option> 
							</c:forEach> 
				  </select>
				  </div>
				  </div>
				  
				  <div class="form-group row">
				  <label class="col-sm-12 col-md-2 col-form-label">부서코드 (*)</label>
				  <div class="col-sm-12 col-md-10">
				  <select class="form-control" id="deptCode" name="deptCode">
				  <option hidden="hidden" value=""  selected >부서코드를 선택하세요</option>
				  
				  <c:forEach items="${dlist }" var="d" varStatus="status">
				  <option value="${d.deptCode }">${d.deptName }</option> 
				  </c:forEach> 
				  </select>
				  </div>
				  </div>

				  <div class="form-group row">
				  <label class="col-sm-12 col-md-2 col-form-label">급여 등급 (*)</label>
				  <div class="col-sm-12 col-md-10">
				  <select class="form-control" id="salLevel" data-toggle="modal" name="salLevel" onchange="salGrade()">
				  <option value="" selected disabled hidden="hidden">급여 등급 선택</option>
				  
				  <c:forEach items="${slist }" var="s" varStatus="status">
				  <option value="${s.salLevel }">${s.salLevel }</option> 
				  </c:forEach> 
				  
				  </select>
				  </div>
				  </div>
				  
				 
				  
				  <script>
				  function salGrade() {
					  var salGrade =$("#salLevel").val();
					  var i = parseInt(($("#money1").val()).replace(/,/g,""));
					  console.log(salGrade);
					  if(salGrade == 'S1' ){
						 
						 alert("S1 은 기본 6000000 부터 시작입니다.");
						 $("#money1").val('6,000,000');
						 $("#money11").val('6000000');
						 
					  }
					  if(salGrade == 'S2'){
						  alert("S2 은 기본 5000000 부터 시작입니다.");
						  $("#money1").val('5,000,000');
						  $("#money11").val('5000000');
					  }
					  if(salGrade == 'S3'){
						  alert("S3 은 기본 4000000 부터 시작입니다.");
						  $("#money1").val('4,000,000');
						  $("#money11").val('4000000');
					  }
					  if(salGrade == 'S4'){
						  alert("S4 은 기본 3000000 부터 시작입니다.");
						  $("#money1").val('3,000,000');
						  $("#money11").val('3000000');
					  }
					  if(salGrade == 'S5'){
						  alert("S5 은 기본 2000000 부터 시작입니다.");
						  $("#money1").val('2,000,000');
						  $("#money11").val('2000000');
					  }
					  if(salGrade == 'S6'){
						  alert("S6 은 기본 1000000 부터 시작입니다.");
						  $("#money1").val('1,000,000');
						  $("#money11").val('1000000');
					  }
					
				  }
				  </script>

				  <br><br><br>


 <!--=================================== 회계정보 입력 창 시작 =================================== -->
		                  
		          <h4 class="text-blue h5">&nbsp;회계 입력</h4><br><br><br>
		          
		          <table class="table table-bordered salary">
						<thead>
							<tr>
								<th scope="col">목록</th>
								<th scope="col">금액</th>
								<th scope="col">공제목록</th>
								<th scope="col">금액</th>
								
							</tr>
				  </thead>
				  <tbody>
							<tr>
								<th scope="row">기본급</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								₩</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="money1"  onchange="inputNumberFormat(this)">
								<input style="display: block; float: right; width: 82%;" type="hidden" class="form-control" id="money11" name="basic">
								</td>
								
								<th>소득세</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								₩</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="incometax"   onInput="inputNumberFormat(this)" readonly>
								<input style="display: block; float: right; width: 82%;" type="hidden" class="form-control" id="incometax1" name="incomeTax">
								</td>
								
							</tr>
							<tr>
								<th scope="row">보너스</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								₩</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="money2"  onInput="inputNumberFormat(this)">
								<input type="hidden" class="form-control" id="money22" name="commission"></td>
								<th>고용 보험</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								₩</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="empIn"  onInput="inputNumberFormat(this)" readonly>
								<input type="hidden" class="form-control" id="empIn1" name="empInsurance"></td>
								
							</tr>
							<tr>
								<th scope="row">식대</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								₩</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="money3"  onInput="inputNumberFormat(this)">
								<input type="hidden" class="form-control" id="money33" name="meal"></td>
								<th>국민 연금</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								₩</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="retirement"  onInput="inputNumberFormat(this)" readonly>
								<input type="hidden" class="form-control" id="retirement1" name="retirement"></td>
								
							</tr>
							
							<tr>
								<th scope="row"></th>
								<td></td>
								<th>건강 보험</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								₩</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="health"  onInput="inputNumberFormat(this)" readonly>
								<input type="hidden" class="form-control" id="health1" name="healthInsurance"></td>
								
							</tr>
							
							
							
							<tr>
								<th scope="row">지급 총액</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								₩</label>
								</div>
								
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="sum01" onInput="inputNumberFormat(this)"  readonly>
								
								<input type="hidden" class="form-control" id="sum011" name="total" ></td>
								<th>공제 총액</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								₩</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control"  id="result" onInput="inputNumberFormat(this)" readonly>
								<input type="hidden" class="form-control" id="inSum" name="inTotal"></td>
								
							</tr>
							
							 <tr>
							  <th colspan="2">차감 지급액</th> 
							  <td colspan="2">
							  <div class="col-sm-2" style="float: left;">
							  <label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
							  ₩</label>
							  </div>
							  <input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="sum02"  onInput="inputNumberFormat(this)" readonly>
							  <input type="hidden" class="form-control" id="actualPay" name="subTotal"></td>
								
							</tr> 
						</tbody>
					</table>
					
					
					<!--==========================숫자 패턴 함수 (회계관련)====================== -->
								<script>
								
								function inputNumberFormat(obj) {
								     obj.value = comma(uncomma(obj.value));
								     
								     var sum =document.getElementById('sum01');
								     var sumh =document.getElementById('sum011');
								     
								     var sum2 =document.getElementById('sum02');
								     var n1 = document.getElementById('money1');
								     var n2 = document.getElementById('money2');
								     var n3 = document.getElementById('money3');
								     
								     var nh1 = document.getElementById('money11');
								     var nh2 = document.getElementById('money22');
								     var nh3 = document.getElementById('money33'); 
								     
								     var n4 = document.getElementById('incometax');
								     var n5 = document.getElementById('empIn');
								     var n6 = document.getElementById('retirement');
								     var n7 = document.getElementById('health');
								     
								     
								     
								     var nh4 = document.getElementById('incometax1');
								     var nh5 = document.getElementById('empIn1');
								     var nh6 = document.getElementById('retirement1');
								     var nh7 = document.getElementById('health1');
								     
								     var inSum = document.getElementById('inSum');
								     var actualPay =document.getElementById('actualPay');
								     
								     var n8 = document.getElementById('result');
								     
								   
								     /*필드에 담긴(스트링 숫자 ) 값을 int 로 변환(콤마 제거) */
								     var num1 = parseInt((n1.value).replace(/,/g,""));
								     var num2 = parseInt((n2.value).replace(/,/g,""));
								     var num3 = parseInt((n3.value).replace(/,/g,""));
								     
								     var jobCode = $("#jobCode").val();
								     

								     
								     /*히든으로 숫자값만 가지고 있을 input*/
								     nh1.value= num1;
								     nh2.value= num2;
								     nh3.value= num3;
								     
								     
								     
								    // console.log("기본 급 numh1 "+nh1.value); 
								     
								     
								     
								    /*숫자로 변화한 필드값을 합침*/
								     var total = num1 + num2 + num3; 
								    // console.log("숫자로? 콤마 없이 기본 총 지급액 "+total); 
								     
								     /*4대 보험 계산*/
								     var incometax = total * 0.033;
								     var empIn = total * 0.0065;
								     var retirement = total * 0.045;
								     var health = total * 0.0306;
								     
								     var inTotal = incometax + empIn + retirement +health;
								     var subTotal = total - inTotal;
								     //console.log( "보험 합계 계산한 값이 담기니? "+ subTotal )
								    // console.log( "공제 총액 inTotal?? "+ inTotal)
								     
								     inSum.value = num4;
								     actualPay.value =num5;
								     
								     /*히든으로 숫자값만 가지고 있을 input*/
								     nh4.value= incometax;
								     nh5.value= empIn;
								     nh6.value= retirement;
								     nh7.value= health;
								     inSum.value= inTotal;
								     
								     sumh.value=total;
								     actualPay.value=subTotal;
								     
								     //console.log("여기가 중요!!! "+sumh.value)
								     //console.log("여기가 중요!!! "+ actualPay.value)
								     //console.log("여기가 중요!!! inSum.value "+ inSum.value)
								     
								     /*4대 보험 합산*/
								     var total2 = incometax + empIn + retirement + health; 
								     
								     /* 지급액 - 공제액 */
								     var finalresult = total - total2 ;
								    
								     /* 4대 보험 칸 자동 완성 (콤마 포함)*/
								     n4.value = incometax.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								     n5.value = empIn.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								     n6.value = retirement.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								     n7.value = health.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								     
								     /*공제 금액 총합(콤마 찍기)*/
								   	 n8.value = total2.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								      
								     
								   	/*지급 총합(콤마 찍기)*/
								     sum.value  = total.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								     
								     /*차감 지급 총합(콤마 찍기)*/
								     sum2.value = finalresult.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								     
								     
								     var num4 = parseInt((n8.value).replace(/,/g,""));
								     var num5 = parseInt((sum2.value).replace(/,/g,""));
								     
								     //console.log("resut1 아이디 값에 값? "+num4)
								     //console.log("n8.value 공제 금액 총 합 아이디 값에 값? "+num4)
								     //console.log("sum2.value  차감 지급 총합 아이디 값에 값? "+num5)
								 }

								 function comma(str) {
								     str = String(str);
								     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								 }

								 function uncomma(str) {
								     str = String(str);
								     return str.replace(/[^\d]+/g, '');
								 } 
								 
								
								
								</script>



						<div class="btns" align="center"><button type="reset" class="btn btn-outline-danger">초기화</button>
						</div>
		                  
		                <input type="button" name="next" class="next2 action-button" value="다음"  /> 
		                <input type="button" name="previous" class="previous action-button-previous" value="이전" />
		                
		                </fieldset>
		                    
		                <!-- ============================ 사진 올리기 ================================ -->
		                <fieldset><div class="text-center">
						<label class="title">사원 프로필 사진</label>
						<div>
						<a class="fileRemove" id="close"> X </a>
						<img name="uploadFile" id="uploadFile" width="200px" height="180">
						</div>
							
							<br>

						<div id="fileArea">
						<input type="file" style="color: black;" name="uploadFile" id="file" onchange="loadImg(this, 1);" required>
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

										reader.readAsDataURL(inputFile.files[0]);//파일을 읽어주는 메소드  --> 해당 파일을 읽어서 url을 부여 (문자열로 저장 )
										registerFace(inputFile.files[0]);

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
								
								
								
								//=====================================얼굴인식 할 때 비교 기준 사진 등록하기 (Profile Img)============================================
		                        function registerFace(image){
		                           var nextEmp=${nextEmp};
		                           console.log(nextEmp);
		                           const form = new FormData();
		                           form.append("image", image);
		                           const settings = {
		                              "async": true,
		                              "crossDomain": true,
		                              "url": "https://alchera-face-authentication.p.rapidapi.com/v1/face",
		                              "method": "POST",
		                              "headers": {
		                                 "uid": nextEmp,
		                                 "x-rapidapi-host": "alchera-face-authentication.p.rapidapi.com",
		                                 "x-rapidapi-key": "c2f7322849msh59b980548a487b0p18c3a3jsn2a28749fcc50"
		                              },
		                              "processData": false,
		                              "contentType": false,
		                              "mimeType": "multipart/form-data",
		                              "data": form
		                           };
		                           $.ajax(settings).done(function (response) {
		                              console.log("등록 성공 : "+response);
		                           });
		                        }
								

								//==================사진 지우기 함수 

								$(".fileRemove").click(function() {
									$("#uploadFile").attr("src", " ");

								})

							</script>


						</div>
								<input type="button" name="next" class="next3 action-button" value="등록"  />
								<input type="button" name="previous" class="previous action-button-previous" value="이전" />
		                </fieldset>
		                    
		                 <fieldset>
		                        <div class="form-card">
		                            <div class="row">
		                            <div class="col-7"> <h2 class="fs-title">등록 성공:</h2></div>
		                            <div class="col-5"> <h2 class="steps">Step 4 - 4</h2></div>
		                            </div> 
		                            
		                            <br><br>
		                            
		                            <h2 class="purple-text text-center"><strong>SUCCESS !</strong></h2> <br>
		                            <div class="row justify-content-center">
		                            <div class="col-3"> <img src="https://i.imgur.com/GwStPmg.png" class="fit-image"> </div>
		                            </div> <br><br>
		                            
		                            <div class="row justify-content-center">
		                                <div class="col-7 text-center">
		                                    <h5 class="purple-text text-center">성공적으로 등록 되었습니다!</h5>
		                                </div>
		                            </div>
		                            
		                        </div>
		                   </fieldset> 
		                    
		                </form>
		            </div>
		        </div>
		    </div>
		</div>
		
		
					

			<script>
	
			$(document).ready(function(){
				
				var current_fs, next_fs, previous_fs; //fieldsets
				var opacity;
				var current = 1;
				var steps = $("fieldset").length;

				setProgressBar(current);

				$(".next1").click(function(){
					
				/*=====================유효성 검사 =====================*/
					var userName = $("#msform input[name=userName]");

					if(userName.val() == ''){
						
						alert("이름을 입력하세요")
						userName.focus();
						 return false;
					} 
			         
					
					var pwd = $("#msform input[name=userPwd]");
					var pw = $("#msform input[name=userPwd]").val();
					var num = pw.search(/[0-9]/g);
					var eng = pw.search(/[a-z]/ig);
					var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 
					
					if(pwd.val() == ''){
						
							alert("비밀번호를 입력하세요")
							pwd.focus();
							return false;

					} 
					
					
				 	if(pw.length < 6 )
				 	{

						  alert("6자리 ~ 15자리 이내로 입력해주세요.");
						  return false;
						 }else if(pw.search(/\s/) != -1){
						  alert("비밀번호는 공백 없이 입력해주세요.");
						  return false;
						 }else if(num < 0 || eng < 0 || spe < 0 ){
						  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
						  return false;
						 }else {
							console.log("통과"); 
						    
					}
				 
				 	if(pw.length > 15 ){
				 		
				 		 alert("15자리 이내로 입력해주세요.");
						  return false;
					
				 	}
					
					var ssn = $("#msform input[name=userSsn]");
					//console.log(ssn.val());
					if(ssn.val() == ''){
						//alert("주민번호를 확인하세요")
						
						ssn.focus();
						return false;
					} 
					
					var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

					var email = $("#msform input[name=email]").val();
					if (email == '' || !re.test(email)) {
					alert("올바른 이메일 주소를 입력하세요")
					return false;
					}


					var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;

					
					var phone = $("#msform input[name=phone]");
					//console.log(phone.val());
					if(phone.val() == ''){
						alert("전화번호를 입력하세요")
						phone.focus();
						 return false;
					} 
					
					  if(!patternPhone.test(phone.val()))
					    {
					        alert('핸드폰 번호를 확인 해주세요');
					        return;
					    }  


					var post = $("#msform input[name=post]");
					//console.log(post.val());
					if(post.val() == ''){
						alert("우편번호를 입력하세요")
						post.focus();
						 return false;
					} 
					
					var address1 = $("#msform input[name=address1]");
					//console.log(address1.val());
					if(address1.val() == ''){
						alert("주소를 입력하세요")
						address1.focus();
						 return false;
					} 
					
					
					var address2 = $("#msform input[name=address2]");
					//console.log(address2.val());
					if(address2.val() == ''){
						alert("상세 주소를 입력하세요")
						address2.focus();
						 return false;
					} 
					
					
					if($("input[name=gender]:radio:checked").length < 1){
						alert("성별을 선택하세요")
						$("input[name=gender]:radio:checked").focus();
						 return false;
					} 
					
					var add1 = $("#address1").val();
					
					//console.log(add1);
					  
					
					current_fs = $(this).parent();
					next_fs = $(this).parent().next(); 
					 
					
					/*=====================유효성 검사 끝 =====================*/
				

				//Add Class Active
				$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

				//show the next fieldset
				next_fs.show();
				
				
				//hide the current fieldset with style
				current_fs.animate({opacity: 0}, {
				step: function(now) {
				// for making fielset appear animation
				opacity = 1 - now;

				current_fs.css({
				'display': 'none',
				'position': 'relative'
				});
				next_fs.css({'opacity': opacity});
				},
				duration: 500
				});
				setProgressBar(++current);
				});

				$(".previous").click(function(){

				current_fs = $(this).parent();
				previous_fs = $(this).parent().prev();

				//Remove class active
				$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

				//show the previous fieldset
				previous_fs.show();

				//hide the current fieldset with style
				current_fs.animate({opacity: 0}, {
				step: function(now) {
				// for making fielset appear animation
				opacity = 1 - now;

				current_fs.css({
				'display': 'none',
				'position': 'relative'
				});
				previous_fs.css({'opacity': opacity});
				},
				duration: 500
				});
				setProgressBar(--current);
				});

				function setProgressBar(curStep){
				var percent = parseFloat(100 / steps) * curStep;
				percent = percent.toFixed();
				$(".progress-bar")
				.css("width",percent+"%")
				}
				
				
				
				/* =============== step 2=============  */
				
				
				$(".next2").click(function(){
					
				
				 /*=====================유효성 검사 =====================*/
					
					 
					 var jobCode = document.getElementById("jobCode").selectedIndex;
					 //console.log(jobCode);
					  if(jobCode === 0)
					  {
							alert("직업 코드를 선택하세요")
							document.getElementById("jobCode").focus();
							e.preventDefault();
							return false;
					  } 
					  
					  
					  var deptCode = document.getElementById("deptCode").selectedIndex;
						 console.log(deptCode);
						  if(deptCode === 0)
						  {
								alert("부서를 선택하세요")
								document.getElementById("deptCode").focus();
								e.preventDefault();
								return false;
						  } 
						  
						  
					  var salLevel = document.getElementById("salLevel").selectedIndex;
							 console.log(salLevel);
							  if(salLevel === 0)
							{
									alert("급여등급을 선택하세요")
									document.getElementById("salLevel").focus();
									e.preventDefault();
									return false;
							} 
					
					
					
					/* var money1 = $("#money1").val();
					var valiAmount = parseInt(($("#money1").val()).replace(/,/g,""));
					 */
					if(money1 == ""){
						alert("기본급을 입력하세요")
						document.getElementById("money1").focus();
						return false;
					
					}
					
					/* if(jobCode === 1 && valiAmount < 6000000){
						alert("6000000 이상 입력하세요")
						document.getElementById("money1").focus();
						return false;
					} */
					
					
					var money2 = $("#money2").val();
					
					
					if(money2 == ""){
						alert("보너스를 입력하세요")
						document.getElementById("money2").focus();
						
						return false;
					}
					
					
					var money3 = $("#money3").val();
					
					
					if(money3 == ""){
						alert("식대를 입력하세요")
						document.getElementById("money3").focus();
						
						return false;
					}
					
					
					
					 
					/*=====================유효성 검사 끝 =====================*/
				
				
					current_fs = $(this).parent();
					next_fs = $(this).parent().next(); 



				//Add Class Active
				$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

				//show the next fieldset
				next_fs.show();
				
	
				
				//hide the current fieldset with style
				current_fs.animate({opacity: 0}, {
				step: function(now) {
				// for making fielset appear animation
				opacity = 1 - now;

				current_fs.css({
				'display': 'none',
				'position': 'relative'
				});
				next_fs.css({'opacity': opacity});
				},
				duration: 500
				});
				setProgressBar(++current);
				});

				$(".previous").click(function(){

				current_fs = $(this).parent();
				previous_fs = $(this).parent().prev();

				//Remove class active
				$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

				//show the previous fieldset
				previous_fs.show();

				//hide the current fieldset with style
				current_fs.animate({opacity: 0}, {
				step: function(now) {
				// for making fielset appear animation
				opacity = 1 - now;

				current_fs.css({
				'display': 'none',
				'position': 'relative'
				});
				previous_fs.css({'opacity': opacity});
				},
				duration: 500
				});
				setProgressBar(--current);
				});

				function setProgressBar(curStep){
				var percent = parseFloat(100 / steps) * curStep;
				percent = percent.toFixed();
				$(".progress-bar")
				.css("width",percent+"%")
				}
				
				
				
				
				/* =============== step 3=============  */
				
				
				$(".next3").click(function(){
				
				/*=====================유효성 검사 =====================*/
					
					var file = $("#file").val();
					 console.log(file);
					 
					 if(file == ""){
						 alert("사진을 등록하세요")
						 document.getElementById("file").focus();
						 return false;
						 
					 } else{
						 $("#msform").submit();
						 return true;
					 }
				/*=====================유효성 검사 끝 =====================*/
				
				
					current_fs = $(this).parent();
					next_fs = $(this).parent().next(); 



				//Add Class Active
				$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

				//show the next fieldset
				next_fs.show();
				
	
				
				//hide the current fieldset with style
				current_fs.animate({opacity: 0}, {
				step: function(now) {
				// for making fielset appear animation
				opacity = 1 - now;

				current_fs.css({
				'display': 'none',
				'position': 'relative'
				});
				next_fs.css({'opacity': opacity});
				},
				duration: 500
				});
				setProgressBar(++current);
				});

				$(".previous").click(function(){

				current_fs = $(this).parent();
				previous_fs = $(this).parent().prev();

				//Remove class active
				$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

				//show the previous fieldset
				previous_fs.show();

				//hide the current fieldset with style
				current_fs.animate({opacity: 0}, {
				step: function(now) {
				// for making fielset appear animation
				opacity = 1 - now;

				current_fs.css({
				'display': 'none',
				'position': 'relative'
				});
				previous_fs.css({'opacity': opacity});
				},
				duration: 500
				});
				setProgressBar(--current);
				});

				function setProgressBar(curStep){
				var percent = parseFloat(100 / steps) * curStep;
				percent = percent.toFixed();
				$(".progress-bar")
				.css("width",percent+"%")
				}
				


				$(".submit").click(function(){
					
					var file = $("#file").val();
					 console.log(file);
					 
					 if(file == ""){
						 alert("사진을 등록하세요")
						 document.getElementById("file").focus();
						 return false;
						 
					 } else{
						 return true;
					 }
					

					
				
				})

				});
			

			
			</script>	
			
			
					
			</div>
			
			<jsp:include page="../common/footer.jsp" />
			</div>


	
</body>
</html>