<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.image_box{
  width: 350px;
  height: 350px;
}

.profile{
	width: 100%;
	height: 100%;
	margin-left: auto;
   margin-right: auto;
   display: block;

  object-fit: cover;
}
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />


	 <div class="mobile-menu-overlay"></div> 



	<div class="main-container" 
		aria-labelledby="headingOne">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">


				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>사원 정보 업데이트</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">사원 정보 업데이트</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>




		<div class="pd-20 card-box mb-30">
		

					<h5 class="h4 text-blue mb-20">${emp.jobName }  ${mem.userName } 님</h5>
							<div class="tab">
								<div class="row clearfix">
											<div class="col-md-3 col-sm-12">
												<ul class="nav flex-column nav-pills vtabs" role="tablist">
													<li class="nav-item">
														<a class="nav-link active" data-toggle="tab" href="#home7" role="tab" aria-selected="true"><i class="fa fa-vcard"></i></a>
													</li>
													
												</ul>
												
											</div>
									<div class="col-md-9 col-sm-12">
										<div class="tab-content">
											<div class="tab-pane fade active show" id="home7" role="tabpanel">
												<div class="pd-20">

												<form id="updateForm" method="post" action="updateEmp.me">
												<input type="hidden" name="empId" value="${ emp.empId }">
								
													<div class="form-group">
													<label>사원 아이디</label>
													   <input class="form-control" type="text" value="${emp.empId }" disabled>
												    </div>
													
													<div class="form-group">
														<label >직급</label>
															 <select class="form-control" id="jobCode" name="jobCode">
																   <option selected  hidden="hidden"  value="${emp.jobCode}">${emp.jobName}</option>
										
																	<c:forEach items="${jlist }" var="job" varStatus="status">
																	<option value="${job.jobCode}">${job.jobName}</option> 
																    </c:forEach>
										
															</select> 
													</div>
													 <script>
													$(function(){
														if("${job.jobName}"=="대표"){
															$("#jobCode").val('J1');
														}
														
														if("${job.jobName}"=="부사장"){
															$("#jobCode").val('J2');
														}
														
														if("${job.jobName}"=="부장"){
															$("#jobCode").val('J3');
														}
														
														if("${job.jobName}"=="차장"){
															$("#jobCode").val('J4');
														}
														
														if("${job.jobName}"=="과장"){
															$("#jobCode").val('J5');
														}
														
														if("${job.jobName}"=="대리"){
															$("#jobCode").val('J6');
														}
														
														if("${job.jobName}"=="사원"){
															$("#jobCode").val('J7');
														}
														
													})
													</script> 
						
						
												    
												   
													<div class="form-group">
														<label >부서코드</label>
															 <select class="form-control" id="deptCode" name="deptCode" >
																	<option selected  hidden="hidden"  value="${emp.deptCode }">${emp.deptName }</option>						
																	<c:forEach items="${dlist }" var="d" varStatus="status">
																	<option value="${d.deptCode }">${d.deptName }</option> 
																    </c:forEach>
										
															</select> 
													</div>
													
													 <script>
													
													$(function(){
														if("${emp.deptName }"=="인사관리부"){
															$("#deptCode").val('D1');
														}
														
														if("${emp.deptName  }"=="회계관리부"){
															$("#deptCode").val('D2');
														}
														
														if("${emp.deptName  }"=="마케팅부"){
															$("#deptCode").val('D3');
														}
														
														if("${emp.deptName  }"=="국내영업부"){
															$("#deptCode").val('D4');
														}
														
														if("${emp.deptName  }"=="해외영업부"){
															$("#deptCode").val('D5');
														}
														
														if("${emp.deptName  }"=="기술지원부"){
															$("#deptCode").val('D6');
														}
														
														if("${emp.deptName  }"=="총무부"){
															$("#deptCode").val('D7');
														}
														
													})
													
													
													
													
													
													</script> 
													
													
													<div class="form-group">
														<label>급여 등급</label>
														
															 <select class="form-control" id="salLevel" name="salLevel" onchange="salGrade();">
																	<option selected  hidden="hidden"  value="${emp.salLevel}">${emp.salLevel}</option>
																	<c:forEach items="${slist}" var="s" varStatus="status">
																	<option value="${s.salLevel}">${s.salLevel}</option> 
																    </c:forEach>
										
															</select> 
														
													</div>
													
													 <script>
													$(function(){
														if("${emp.salLevel }"=="S1"){
															$("#salLevel").val('S1');
														}
														
														if("${emp.salLevel }"=="S2"){
															$("#salLevel").val('S2');
														}
														
														if("${emp.salLevel }"=="S3"){
															$("#salLevel").val('S3');
														}
														
														if("${emp.salLevel }"=="S4"){
															$("#salLevel").val('S4');
														}
														
														if("${emp.salLevel }"=="S5"){
															$("#salLevel").val('S5');
														}
														
														if("${emp.salLevel }"=="S6"){
															$("#salLevel").val('S6');
														}
														
													})
													
													
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
													 
													
													<div class="form-group">
														<label>권한</label>
														
														 	<select class="form-control" id="rightNo" name="rightNo">
																	<option selected hidden="hidden"  value="${emp.rightNo}">${emp.rightName}</option>
																	 <c:forEach items="${rlist }" var="r" varStatus="status">
																	<option value="${r.rightNo }">${r.rightName }</option> 
																    </c:forEach> 
										
															</select> 
														
													</div>
													
													 <script>
													$(function(){
														if("${emp.rightName }"=="권한없음"){
															$("#rightNo").val('0');
														}
														
														if("${emp.rightName }"=="인사관리자"){
															$("#rightNo").val('1');
														}
														
														if("${emp.rightName }"=="근태관리자"){
															$("#rightNo").val('2');
														}
														
														if("${emp.rightName }"=="공지사항관리자"){
															$("#rightNo").val('3');
														}
														
														if("${emp.rightName }"=="비품관리자"){
															$("#rightNo").val('4');
														}
														
													})
													</script> 
													
													<div class="form-group">
													<label><strong>입사일</strong></label> &nbsp;&nbsp;&nbsp;&nbsp;
													<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${emp.hireDate }"/>
												    </div>
						
						
												    <div class="form-group">
														<label><strong>수정일</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;
														<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${emp.modifyDate }"/>
													</div>
												    <div class="form-group">
														<label><strong>퇴사일</strong></label>&nbsp;&nbsp;&nbsp;&nbsp;
														<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${emp.endDate }"/>
													</div>
											
											<hr>
											<div class="pd-20">
												
												<h4 class="text-blue h5">&nbsp;회계 정보</h4><br><br><br>
												
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
																<td><input type="text" class="form-control" id="money1"  onkeyup="inputNumberFormat(this)" value="${sal.basic }" >
																<input type="hidden" class="form-control" id="money11" name="basic">
																</td>
																
																<th>소득세</th>
																<td><input type="text" class="form-control" id="incometax"   onkeyup="inputNumberFormat(this)" value="${sal.incomeTax }" readonly>
																<input type="hidden" class="form-control" id="incometax1" name="incomeTax" value="${sal.incomeTax }" >
																</td>
																
															</tr>
															<tr>
																<th scope="row">보너스</th>
																<td><input type="text" class="form-control" id="money2"  onkeyup="inputNumberFormat(this)" value="${sal.commission }" >
																<input type="hidden" class="form-control" id="money22" name="commission" value="${sal.commission }" ></td>
																<th>고용 보험</th>
																<td><input type="text" class="form-control" id="empIn"  onkeyup="inputNumberFormat(this)" value="${sal.empInsurance }" readonly >
																<input type="hidden" class="form-control" id="empIn1" name="empInsurance" value="${sal.empInsurance }"></td>
																
															</tr>
															<tr>
																<th scope="row">식대</th>
																<td><input type="text" class="form-control" id="money3"  onkeyup="inputNumberFormat(this)" value="${sal.meal }" >
																<input type="hidden" class="form-control" id="money33" name="meal" value="${sal.meal }" ></td>
																<th>국민 연금</th>
																<td><input type="text" class="form-control" id="retirement"  onkeyup="inputNumberFormat(this)" value="${sal.retirement }" readonly >
																<input type="hidden" class="form-control" id="retirement1" name="retirement" value="${sal.retirement }"></td>
																
															</tr>
															
															<tr>
																<th scope="row"></th>
																<td></td>
																<th>건강 보험</th>
																<td><input type="text" class="form-control" id="health"  onkeyup="inputNumberFormat(this)"  value="${sal.healthInsurance }" readonly >
																<input type="hidden" class="form-control" id="health1" name="healthInsurance" value="${sal.healthInsurance }"></td>
																
															</tr>
															
															
															
															<tr>
																<th scope="row">지급 총액</th>
																<td><input type="text" class="form-control" id="sum01" onkeyup="inputNumberFormat(this)" value="${sal.total }" readonly>
																<input type="hidden" class="form-control" id="sum011" name="total" value="${sal.total }"></td>
																<th>공제 총액</th>
																<td><input type="text" class="form-control"  id="result" onkeyup="inputNumberFormat(this)" value="${sal.inTotal}" readonly>
																<input type="hidden" class="form-control" id="inSum" name="inTotal" value="${sal.inTotal}"></td> 
																
															</tr>
															
															 <tr>
															  <th colspan="2">차감 지급액</th> 
																<td colspan="2"><input type="text" class="form-control" id="sum02"  onkeyup="inputNumberFormat(this)" value="${sal.subTotal}"readonly>
																<input type="hidden" class="form-control" id="actualPay" name="subTotal" value="${sal.subTotal}" ></td>
																
																
																
																
															</tr> 
														</tbody>
													</table>
													
													
													<!--==========================숫자 패턴 함수 (회계관련)================= -->
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
														     
														     
														     
														     /*히든으로 숫자값만 가지고 있을 input*/
														     nh1.value= num1;
														     nh2.value= num2;
														     nh3.value= num3;
														     
														     
														     
														     console.log("기본 급 numh1 "+nh1.value); 
														     
														     
														     
														    /*숫자로 변화한 필드값을 합침*/
														     var total = num1 + num2 + num3; 
														     console.log("숫자로? 콤마 없이 기본 총 지급액 "+total); 
														     
														     /*4대 보험 계산*/
														     var incometax = total * 0.033;
														     var empIn = total * 0.0065;
														     var retirement = total * 0.045;
														     var health = total * 0.0306;
														     
														     var inTotal = incometax + empIn + retirement +health;
														     var subTotal = total - inTotal;
														     console.log( "보험 합계 계산한 값이 담기니? "+ subTotal )
														     console.log( "공제 총액 inTotal?? "+ inTotal)
														     
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
														     
														     console.log("여기가 중요!!! "+sumh.value)
														     console.log("여기가 중요!!! "+ actualPay.value)
														     console.log("여기가 중요!!! inSum.value "+ inSum.value)
														     
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
														     console.log("n8.value 공제 금액 총 합 아이디 값에 값? "+num4)
														     console.log("sum2.value  차감 지급 총합 아이디 값에 값? "+num5)
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
													
														
												</div>

												<div align="center">
                    								<button type="submit" class="btn btn-primary">수정하기</button>
                    								<button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
                								</div>
												</form>
												</div><!-- pd-20_END -->

														 </div>
													</div>
											   </div>
										  </div>
									  </div>
								 </div><!-- row clearfix_END -->
							</div><!-- tab_END -->


					 <jsp:include page="../common/footer.jsp" />
    				 </div><!-- pd-20 card-box mb-30_END -->
					 </div>



	
</body>
</html>