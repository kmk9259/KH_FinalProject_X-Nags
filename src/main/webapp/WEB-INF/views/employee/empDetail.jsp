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
	<!-- ================================================================================= -->


	 <div class="mobile-menu-overlay"></div> 

	

	<!-- ===================개인정보 입력=============== -->

	<div class="main-container" 
		aria-labelledby="headingOne">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">


				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>사원 상세 정보</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">사원 상세 정보</li>
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
												<a class="nav-link active" data-toggle="tab" href="#home7" role="tab" aria-selected="true"><i class="fa fa-vcard"></i>&nbsp;&nbsp;&nbsp;개인 정보</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" data-toggle="tab" href="#profile7" role="tab" aria-selected="false"><i class="fa fa-users"></i>&nbsp;&nbsp;&nbsp;사원 정보</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" data-toggle="tab" href="#contact7" role="tab" aria-selected="false"><i class="fa fa-envelope-o"></i>&nbsp;&nbsp;&nbsp;회계 정보</a>
											</li>
											
										</ul>
									</div>
									
									<div class="col-md-9 col-sm-12">
										<div class="tab-content">
										
											<!-- 1 -->
											<div class="tab-pane fade show active" id="home7" role="tabpanel">
												<div class="pd-20">
													
															 <div class="image_box">                              
                               								 <img src="${ pageContext.servletContext.contextPath }/resources/profile_files/${ mem.changeName }" class="profile" >
                               								 </div> <br><br><br><br>
		                     
		                     
		                    			 			

															<div class="form-group">
																<label>직원 이름(*)</label>
																<input class="form-control" type="text"  id="userName" name="userName" value="${mem.userName }" disabled>
															</div>
									
															<div class="form-group">
																<label>주민등록번호(*)</label>
																<input class="form-control" type="text" id="userSsn" name="userSsn" onkeyup="setSSn(this)" value="${mem.userSsn }"maxlength='14' disabled>
																
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
																<label>이메일(*)</label> <input class="form-control" value="${mem.email }" type="email" id="email" name="email" disabled>
															</div>
															
															<div class="form-group">
																<label>전화번호(*)</label> <input class="form-control" value="${mem.phone }" type="tel" id="phone" name="phone" oninput="autoHyphen(this)" maxlength='13' disabled>
															</div><br><br><br>
															<script>
															const autoHyphen = (target) => {
																 target.value = target.value
																   .replace(/[^0-9]/, '')
																   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
																}
															
															</script>
									
															<!-- 주소입력  -->
									
															<label for="address"> &nbsp; <Strong>주소  :</Strong></label><br>
															
															
															<c:forTokens var="addr" items="${ loginUser.address }" delims="/" varStatus="status">
																		<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
																		<c:set var="post" value="${ addr }"/>
																		</c:if>
																		
																		<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
																		<c:set var="address1" value="${ addr }"/>
																		</c:if>
																		
																		<c:if test="${ status.index eq 1 }">
																		<c:set var="address1" value="${ addr }"/>
																		</c:if>
																	<c:if test="${ status.index eq 2 }">
																		<c:set var="address2" value="${ addr }"/>
																	</c:if>
															</c:forTokens>
															
									
															<div class="form-inline">
																<label> &nbsp; 우편번호 : &nbsp;</label> <input type="text"
																	id="post" name="post"  class="form-control mr-2 postcodify_postcode5"
																	size="6" value="${ post }" disabled>
																<button type="button" class="btn btn-primary" id="postcodify_search_button" disabled>검색</button>
															</div>
															<br>
															<label> &nbsp; 도로명주소 : </label> <input type="text" id="address1"
																name="address1" class="form-control postcodify_address" size="30" value="${ address1 }" disabled>
															<br>
															<label> &nbsp; 상세주소 : </label>
															<input type="text" id="address2" name="address2" class="form-control postcodify_extra_info" size="30" value="${ address2 }" disabled> <br>
									

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
																<input type="radio" name="gender" id="Male" value="M" disabled>
																<label	for="Male">남자</label> &nbsp;&nbsp;
																<input type="radio" name="gender" id="Female" value="F" disabled>
																<label for="Female">여자</label><br>
										
																<!-- 성별 입력 끝 -->
																
																<script>
																$(function(){
																		if("${ mem.gender }" == "M"){
																		$("#Male").attr("checked", true); 
																		
																		}else if("${ mem.gender }" == "F"){
																		
																		$("#Female").attr("checked", true);
																		}
																					                    		
																});
											                    </script>

						

						 					<br><br><br><p style="color: red;">개인 정보는 본인이 마이페이지에서 수정 가능합니다.</p>
															


												</div>
											</div>
											
											<!-- 2 -->
											<div class="tab-pane fade" id="profile7" role="tabpanel">
												<div class="pd-20">
													<div class="form-group">
													<label>사원 아이디</label>
													   <input class="form-control" type="text" id="empId" name="empId" value="${emp.empId }" disabled>
												    </div>
												    
												    <div class="form-group">
												    <label>직급</label>
													   <input class="form-control" type="text" id="jobCode" name="jobCode" value="${emp.jobName }" disabled>
												    </div>
													
													
													<div class="form-group">
													<label>부서</label>
													   <input class="form-control" type="text" id="deptName" name="deptName" value="${emp.deptName }" disabled>
												    </div>
						
													<div class="form-group">
												    <label>급여 등급</label>
													   <input class="form-control" type="text" id="salLevel" name="salLevel" value="${emp.salLevel}" disabled>
												    </div>
												   
													<div class="form-group">
													<label>권한</label>
													   <input class="form-control" type="text" id="rightName2" name="rightNo" value="${emp.rightName}" disabled>
												    </div>
													
													
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

												
												<br><br><br>
												 <c:if test="${ loginUser.rightNo eq 1 }">
												<div style="float: right;">
												<button type="button"  class="btn btn-outline-success" onclick="update()">수정페이지로 이동</button>	
												</div>
												</c:if>
												</div>
												
												
											</div>
											
											<!-- 3 -->
											<div class="tab-pane fade" id="contact7" role="tabpanel">
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
																<td><input type="text" class="form-control" id="money1"  onkeyup="inputNumberFormat(this)" value="${sal.basic }" readOnly>
																<input type="hidden" class="form-control" id="money11" >
																</td>
																
																<th>소득세</th>
																<td><input type="text" class="form-control" id="incometax"   onkeyup="inputNumberFormat(this)" value="${sal.incomeTax }" disabled>
																<input type="hidden" class="form-control" id="incometax1" name="incomeTax" >
																</td>
																
															</tr>
															<tr>
																<th scope="row">보너스</th>
																<td><input type="text" class="form-control" id="money2"  onkeyup="inputNumberFormat(this)" value="${sal.commission }"readOnly >
																<input type="hidden" class="form-control" id="money22" name="commission"></td>
																<th>고용 보험</th>
																<td><input type="text" class="form-control" id="empIn"  onkeyup="inputNumberFormat(this)" value="${sal.empInsurance }" disabled >
																<input type="hidden" class="form-control" id="empIn1" name="empInsurance"></td>
																
															</tr>
															<tr>
																<th scope="row">식대</th>
																<td><input type="text" class="form-control" id="money3"  onkeyup="inputNumberFormat(this)" value="${sal.meal }" readOnly>
																<input type="hidden" class="form-control" id="money33" name="meal"></td>
																<th>국민 연금</th>
																<td><input type="text" class="form-control" id="retirement"  onkeyup="inputNumberFormat(this)" value="${sal.retirement }" disabled >
																<input type="hidden" class="form-control" id="retirement1" name="retirement"></td>
																
															</tr>
															
															<tr>
																<th scope="row"></th>
																<td></td>
																<th>건강 보험</th>
																<td><input type="text" class="form-control" id="health"  onkeyup="inputNumberFormat(this)"  value="${sal.healthInsurance }" disabled >
																<input type="hidden" class="form-control" id="health1" name="healthInsurance"></td>
																
															</tr>
															
															
															
															<tr>
																<th scope="row">지급 총액</th>
																<td><input type="text" class="form-control" id="sum01" onkeyup="inputNumberFormat(this)" value="${sal.total }" disabled>
																<input type="hidden" class="form-control" id="sum011" name="total"></td>
																<th>공제 총액</th>
																<td><input type="text" class="form-control"  id="result" onkeyup="inputNumberFormat(this)" value="${sal.inTotal}" disabled>
																<!-- <input type="hidden" class="form-control" id="result1" ></td> -->
																
															</tr>
															
															 <tr>
															  <th colspan="2">차감 지급액</th> 
																<td colspan="2"><input type="text" class="form-control" id="sum02"  onkeyup="inputNumberFormat(this)" value="${sal.subTotal}" disabled>
																</td>
																
																
																
																
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
														     
														     var n8 = document.getElementById('result');
														     
														   
														     /*필드에 담긴(스트링 숫자 ) 값을 int 로 변환(콤마 제거) */
														     var num1 = parseInt((n1.value).replace(/,/g,""));
														     var num2 = parseInt((n2.value).replace(/,/g,""));
														     var num3 = parseInt((n3.value).replace(/,/g,""));
														     
														     /*히든으로 숫자값만 가지고 있을 input*/
														     nh1.value= num1;
														     nh2.value= num2;
														     nh3.value= num3;
														     
														     console.log("numh1 "+nh1.value); 
														     
														     
														    /*숫자로 변화한 필드값을 합침*/
														     var total = num1 + num2 + num3; 
														     /* console.log("숫자로? 콤마 없이 기본 총 지급액 "+total); */
														     
														     /*4대 보험 계산*/
														     var incometax = total * 0.033;
														     var empIn = total * 0.0065;
														     var retirement = total * 0.045;
														     var health = total * 0.0306;
														     
														     /*히든으로 숫자값만 가지고 있을 input*/
														     nh4.value= incometax;
														     nh5.value= empIn;
														     nh6.value= retirement;
														     nh7.value= health; 
														     sumh.value=total;
														     
														     
														     
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
												
												<br><br><br>
												
												<c:if test="${ loginUser.rightNo eq 1 }">
												<div style="float: right;">
												<button type="button"  class="btn btn-outline-success" onclick="update()">수정페이지로 이동</button>	
												</div>
												</c:if>
												
												</div>
												
												
											</div>
											
											
											
										</div>
									</div>
								</div>
							</div>
							
							
							<script>
							/*수정 폼으로 이동 하는 함수*/
						    
						   function update(){
								var id =  document.getElementById('empId');
								location.href="updateEmpForm.me?empId=" +  id.value;
								console.log(id.value)
							}
						    	
						    	
						    
							</script>
							
							
						</div>
					</div>



			<jsp:include page="../common/footer.jsp" />
		
			</div>
		</div>
			


	
</body>
</html>