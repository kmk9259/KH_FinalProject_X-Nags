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
		
		
					
				
							<h5 class="h4 text-blue mb-20">사원 아무개 님</h5>
							<div class="tab">
								<div class="row clearfix">
									<div class="col-md-3 col-sm-12">
										<ul class="nav flex-column nav-pills vtabs" role="tablist">
											<li class="nav-item">
												<a class="nav-link active" data-toggle="tab" href="#home7" role="tab" aria-selected="true"><i class="fa fa-vcard"></i></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" data-toggle="tab" href="#profile7" role="tab" aria-selected="false"><i class="fa fa-users"></i></a>
											</li>
											<li class="nav-item">
												<a class="nav-link" data-toggle="tab" href="#contact7" role="tab" aria-selected="false"><i class="fa fa-envelope-o"></i></a>
											</li>
										</ul>
									</div>
									<div class="col-md-9 col-sm-12">
										<div class="tab-content">
											<div class="tab-pane fade active show" id="home7" role="tabpanel">
												<div class="pd-20">
													
													
													
		                        <div class="form-card">
		                            
										
										

						
						

						<div class="form-group">
							<label>직원 이름(*)</label>
							<input class="form-control" type="text" placeholder="userName" id="userName" name="userName">
						</div>


						<div class="form-group">
							<label>비밀번호(*)</label>
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
							
							<button type="submit" class="btn btn-primary">수정하기</button>
						</div>

					</div>
										
		                        
		                        
		                       
								
								
								
								
                       
								
								
								
		                  
													
													
												</div>
											</div>
											<div class="tab-pane fade" id="profile7" role="tabpanel">
												<div class="pd-20">
								
								
													<div class="form-group">
													<label>사원 아이디</label>
													   <input class="form-control" type="text" id="empId" name="empId" value="${emp.empId }" disabled>
												    </div>
													
													<div class="form-group">
														<label >직급</label>
															<select class="form-control" id="jobCode" name="jobCode">
																   <option selected disabled hidden="hidden" value="${emp.jobCode }">${emp.jobName }</option>
										
																	<c:forEach items="${jlist }" var="job" varStatus="status">
																	<option value="${job.jobCode }">${job.jobName }</option> 
																    </c:forEach>
										
															</select>
													</div>
													<script>
													$(function(){
														if("${job.jobName }"=="대표"){
															$("#jobCode").val('J1');
														}
														
														if("${job.jobName  }"=="부사장"){
															$("#jobCode").val('J2');
														}
														
														if("${job.jobName  }"=="부장"){
															$("#jobCode").val('J3');
														}
														
														if("${job.jobName  }"=="차장"){
															$("#jobCode").val('J4');
														}
														
														if("${job.jobName  }"=="과장"){
															$("#jobCode").val('J5');
														}
														
														if("${job.jobName  }"=="대리"){
															$("#jobCode").val('J6');
														}
														
														if("${job.jobName  }"=="사원"){
															$("#jobCode").val('J7');
														}
														
													})
													</script>
						
						
												    
												   
													<div class="form-group">
														<label >부서코드</label>
															<select class="form-control" id="deptName" name="deptName" >
																	<option selected disabled hidden="hidden" value="${emp.deptName }">${emp.deptName }</option>						
																	<c:forEach items="${dlist }" var="d" varStatus="status">
																	<option value="${d.deptCode }">${d.deptName }</option> 
																    </c:forEach>
										
															</select>
													</div>
													
													<script>
													
													$(function(){
														if("${emp.deptName }"=="인사관리부"){
															$("#deptName").val('D1');
														}
														
														if("${emp.deptName  }"=="회계관리부"){
															$("#deptName").val('D2');
														}
														
														if("${emp.deptName  }"=="마케팅부"){
															$("#deptName").val('D3');
														}
														
														if("${emp.deptName  }"=="국내영업부"){
															$("#deptName").val('D4');
														}
														
														if("${emp.deptName  }"=="해외영업부"){
															$("#deptName").val('D5');
														}
														
														if("${emp.deptName  }"=="기술지원부"){
															$("#deptName").val('D6');
														}
														
														if("${emp.deptName  }"=="총무부"){
															$("#deptName").val('D7');
														}
														
													})
													
													
													
													
													
													</script>
													
													
													<div class="form-group">
														<label>급여 등급</label>
														
															<select class="form-control" id="salLevel " name="salLevel ">
																	<option selected disabled hidden="hidden"  value="${emp.salLevel  }">${emp.salLevel  }</option>
																	<c:forEach items="${slist }" var="s" varStatus="status">
																	<option value="${s.salLevel }">${s.salLevel }</option> 
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
													</script>
													
													
													<div class="form-group">
														<label>권한</label>
														
															<select class="form-control" id="rightName2" name="rightNo">
																	<option selected disabled hidden="hidden"  value="${emp.rightNo }">${emp.rightName }</option>
																	<c:forEach items="${rlist }" var="r" varStatus="status">
																	<option value="${r.rightNo }">${r.rightName }</option> 
																    </c:forEach>
										
															</select>
														
													</div>
													
													<script>
													$(function(){
														if("${emp.rightName }"=="권한없음"){
															$("#rightName2").val('0');
														}
														
														if("${emp.rightName }"=="인사관리자"){
															$("#rightName2").val('1');
														}
														
														if("${emp.rightName }"=="근태관리자"){
															$("#rightName2").val('2');
														}
														
														if("${emp.rightName }"=="공지사항관리자"){
															$("#rightName2").val('3');
														}
														
														if("${emp.rightName }"=="비품관리자"){
															$("#rightName2").val('4');
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
											
											
											   			<div class="btns" align="center">
							
															<button type="submit" class="btn btn-primary">수정하기</button>
														</div>
								
								
													
												</div>
											</div><!-- profile7 -->
											
											
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
																<td><input type="text" class="form-control" id="money1"  onkeyup="inputNumberFormat(this)">
																<input type="hidden" class="form-control" id="money11" >
																</td>
																
																<th>소득세</th>
																<td><input type="text" class="form-control" id="incometax"   onkeyup="inputNumberFormat(this)" disabled>
																<input type="hidden" class="form-control" id="incometax1" name="incomeTax">
																</td>
																
															</tr>
															<tr>
																<th scope="row">보너스</th>
																<td><input type="text" class="form-control" id="money2"  onkeyup="inputNumberFormat(this)">
																<input type="hidden" class="form-control" id="money22" name="commission"></td>
																<th>고용 보험</th>
																<td><input type="text" class="form-control" id="empIn"  onkeyup="inputNumberFormat(this)" disabled>
																<input type="hidden" class="form-control" id="empIn1" name="empInsurance"></td>
																
															</tr>
															<tr>
																<th scope="row">식대</th>
																<td><input type="text" class="form-control" id="money3"  onkeyup="inputNumberFormat(this)">
																<input type="hidden" class="form-control" id="money33" name="meal"></td>
																<th>국민 연금</th>
																<td><input type="text" class="form-control" id="retirement"  onkeyup="inputNumberFormat(this)" disabled>
																<input type="hidden" class="form-control" id="retirement1" name="retirement"></td>
																
															</tr>
															
															<tr>
																<th scope="row"></th>
																<td></td>
																<th>건강 보험</th>
																<td><input type="text" class="form-control" id="health"  onkeyup="inputNumberFormat(this)" disabled>
																<input type="hidden" class="form-control" id="health1" name="healthInsurance"></td>
																
															</tr>
															
															
															
															<tr>
																<th scope="row">지급 총액</th>
																<td><input type="text" class="form-control" id="sum01" onkeyup="inputNumberFormat(this)"  disabled>
																<input type="hidden" class="form-control" id="sum011" name="total"></td>
																<th>공제 총액</th>
																<td><input type="text" class="form-control"  id="result" onkeyup="inputNumberFormat(this)" disabled>
																<!-- <input type="hidden" class="form-control" id="result1" ></td> -->
																
															</tr>
															
															 <tr>
															  <th colspan="2">차감 지급액</th> 
																<td colspan="2"><input type="text" class="form-control" id="sum02"  onkeyup="inputNumberFormat(this)" disabled>
																</td>
																
																
																
																
															</tr> 
														</tbody>
													</table>
													
														<div class="btns" align="center">
							
															<button type="submit" class="btn btn-primary">수정하기</button>
														</div>
												</div>
											</div><!-- tab penels contact7  -->
											
										</div>
									</div>
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