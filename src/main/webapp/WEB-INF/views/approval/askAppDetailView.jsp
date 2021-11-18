<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>X-Nomal Groupware Solution</title>
<style type="text/css">
.appMid {
	display: flex;
	flex-flow: row wrap;
	align-items: center;
	width: 100%;
	margin-bottom: 0;
}
table{
	margin-bottom: 10;
}
#appBtn{
display: flex;
}
#ok{
color: green;
}
#no{
color: red;
}
</style>
</head>
<body>

<jsp:include page="../common/menubar.jsp" />

<c:if test="${ !empty msg }">
	<script>
		alert("${msg}");
	</script>
	<c:remove var="msg" scope="session"/>
</c:if>

<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>결재 요청 문서함</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item">결재 요청 문서함</li>
									<li class="breadcrumb-item active" aria-current="page">요청 문서 확인</li>
									
								</ol>
							</nav>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-lg-6 col-md-12 col-sm-12 mb-30">
						<!-- 왼쪽 -->
						<div class="card-box mb-30">
							<div class="clearfix pd-20">
								<div class="pull-left">
									<h4 class="h4">기안자 정보</h4>
								</div>
								<div class="col-md-12 col-sm-12 pull-right">
									<table class="table table-bordered border-primary">
										<thead class="table-primary">
											<tr>
												<th></th>
												<th>기안자</th>
											</tr>
										</thead>
										<tr>
											<td>사원명</td>
											<td>${writer.userName }</td>
										</tr>
										<tr>
											<td>사번</td>
											<td>${writer.empId }</td>
										</tr>
										<tr>
											<td>직급</td>
											<td>${writer.jobName }</td>
										</tr>
										<tr>
											<td>부서</td>
											<td>${writer.deptName }</td>
										</tr>
										<tr>
											<td>작성일</td>
											<td><fmt:formatDate type="date" dateStyle="long" value="${app.writeDate }"/></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 오른쪽 -->
					<div class="col-lg-6 col-md-12 col-sm-12 mb-30">
						<div class="card-box mb-30">
							<div class="clearfix pd-20">
								<div class="pull-left">
									<h4 class="h4">결재자 정보 및 현황</h4>
								</div>
								<div class="col-md-12 col-sm-12 pull-right">
								<table class="table table-bordered border-primary">
									<thead class="table-primary">
										<tr>
											<th></th>
											<th>중간 결재자</th>
											<th>최종 결재자</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>사원명</td>
											<td>${mid.userName }</td>
											<td>${fin.userName }</td>
										</tr>
										<tr>
											<td>사번</td>
											<td>${mid.empId }</td>
											<td>${fin.empId }</td>
										</tr>
										<tr>
											<td>직급</td>
											<td>${mid.jobName }</td>
											<td>${fin.jobName }</td>
										</tr>
										<tr>
											<td>부서</td>
											<td>${mid.deptName }</td>
											<td>${fin.deptName }</td>
										</tr>
										<tr>
											<td>결재상태</td>
											<c:choose>
												<c:when test="${ app.midStatus eq 1}">
													<td><i class="icon-copy ion-ios-circle-outline"></i></td>
												</c:when>
												<c:when test="${ app.midStatus eq 2}">
													<td><i class="icon-copy ion-ios-checkmark" id="ok"></i></td>
												</c:when>
												<c:when test="${ app.midStatus eq 3}">
													<td><i class="icon-copy ion-ios-close" id="no"></i></td>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${ app.finStatus eq 1}">
													<td><i class="icon-copy ion-ios-circle-outline"></i></td>
												</c:when>
												<c:when test="${ app.finStatus eq 2}">
													<td><i class="icon-copy ion-ios-checkmark" id="ok"></i></td>
												</c:when>
												<c:when test="${ app.finStatus eq 3}">
													<td><i class="icon-copy ion-ios-close" id="no"></i></td>
												</c:when>
											</c:choose>
										</tr>
									</tbody>
								</table>
							</div>
							</div>
						</div>
					</div>
					</div>
				
				
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
					
					<div class="card-header">
						<h3 class="mailbox-read-info">결재 문서</h3>
					</div>
					<div class="card-body p-10">
						<table class="table table-bordered border-secondary">
					        <thead class="table-Default">
					            <tr>
					            	<td colspan="4" align="center">
						            	<c:choose>
							              	<c:when test="${app.category eq 1 }">
							              		<h3 class="mailbox-read-info">연차 신청서</h3>
							              	</c:when>
							              	<c:when test="${app.category eq 2 }">
							              		<h3 class="mailbox-read-info">반차 신청서</h3>
							              	</c:when>
							              	<c:when test="${app.category eq 3 }">
							              		<h3 class="mailbox-read-info">외근 신청서</h3>
							              	</c:when>
							              	<c:when test="${app.category eq 4 }">
							              		<h3 class="mailbox-read-info">증명서 신청서(재직증명서)</h3>
							              	</c:when>
							              	<c:when test="${app.category eq 5 }">
							              		<h3 class="mailbox-read-info">증명서 신청서(급여명세서)</h3>
							              	</c:when>
							              	<c:when test="${app.category eq 6 }">
							              		<h3 class="mailbox-read-info">증명서 신청서(기타)</h3>
							              	</c:when>
						              	</c:choose>
					                </td>
					            </tr>
					        </thead>
					        <tbody>
					            <tr>
					                <td width="300px">문서번호</td>
					                <td width="300px">${app.appNo }</td>
					                <td width="300px">중간 결재자</td>
					                <td width="300px">최종 결재자</td>
					            </tr>
					            <tr>
					                <td>기안자</td>
					                <td>${writer.userName}</td>
					                <td>${mid.userName }</td>
					                <td>${fin.userName }</td>
					            </tr>
					            <tr>
					                <td>기안일</td>
					                <td><fmt:formatDate type="date" dateStyle="long" value="${app.endDate }"/></td>
					                <c:choose>
										<c:when test="${ app.midStatus eq 1}">
											<td><i class="icon-copy ion-ios-circle-outline"></i></td>
										</c:when>
										<c:when test="${ app.midStatus eq 2}">
											<td><i class="icon-copy ion-ios-checkmark" id="ok"></i></td>
										</c:when>
										<c:when test="${ app.midStatus eq 3}">
											<td><i class="icon-copy ion-ios-close" id="no"></i></td>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${ app.finStatus eq 1}">
											<td><i class="icon-copy ion-ios-circle-outline"></i></td>
										</c:when>
										<c:when test="${ app.finStatus eq 2}">
											<td><i class="icon-copy ion-ios-checkmark" id="ok"></i></td>
										</c:when>
										<c:when test="${ app.finStatus eq 3}">
											<td><i class="icon-copy ion-ios-close" id="no"></i></td>
										</c:when>
									</c:choose>
					            </tr>
					            
					            <c:if test="${app.category eq 1 || app.category eq 2}">
					            <tr>
					                <td>휴가시작</td>
					                <td><fmt:formatDate type="date" dateStyle="long" value="${app.stayDate }"/></td>
					                <td>휴가종료</td>
					                <td><fmt:formatDate type="date" dateStyle="long" value="${app.endDate }"/></td>
					            </tr>
					            </c:if>
					            <c:if test="${app.category eq 3}">
					            <tr>
					                <td>외근일</td>
					                <td><fmt:formatDate type="date" dateStyle="long" value="${app.endDate }"/></td>
					                <td colspan="1"></td>
					            </tr>
					            </c:if>
					            
					            
					            <tr height="400px">
					                <td colspan="4">${app.content }</td>
					            </tr>
					
					        </tbody>
					        <tfoot>
					            <tr>
					                <td colspan="3"></td>
					                <td align="right"><fmt:formatDate type="date" dateStyle="short" value="${app.writeDate }"/></td>
					            </tr>
					            <tr>
					                <td colspan="3"></td>
					                <td align="right">x-nags</td>
					            </tr>
					        </tfoot>
					    </table>
					   </div>
				</div>
				</div>
			
				
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>중간 결재자 의견</h4>
							</div>
							<div>
								<c:choose>
									<c:when test="${app.midReply != null }">
										<p>${app.midReply}</p>
									</c:when>
									<c:when test="${ sessionScope.loginUser.empId == app.appMid}">
										<div class="appMid">
											<form id="midReply" action="" method="post">
								            	<input type="hidden" name="ano" value="${app.appNo }">
												<div id="appBtn">
													<div class="form-group">
														<input class="form-control" type="text" name="midReply" placeholder="의견을 입력해 주세요" required="required"/>
													</div>
													<div class="form-group">
														<button class="btn btn-default" type="button" onclick="midConfirm();"><i class="icon-copy ion-checkmark-circled"></i></button>
														<button class="btn btn-default" type="button" onclick="midReject();"><i class="icon-copy ion-close-circled"></i></button>
													</div>
												</div>
											</form>
										</div>
									</c:when>
									<c:otherwise>
										<p>결재 권한이 없습니다.</p>
									</c:otherwise>
								
								</c:choose>
								
							</div>
						</div>
					</div>
				</div>
				
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>최종 결재자 의견</h4>
							</div>
							<c:choose>
								<c:when test="${ sessionScope.loginUser.empId != app.appFin}">
									<p>결재 권한이 없습니다.</p>
								</c:when>
								<c:when test="${app.midStatus eq 1}">
									<p>중간 결재가 처리되지 않았습니다.</p>
								</c:when>
								<c:when test="${app.finReply != null }">
									<p>${app.finReply}</p>
								</c:when>
								<c:otherwise>
									<div class="appMid">
										<form id="finReply" action="" method="post">
							            	<input type="hidden" name="ano" value="${app.appNo }">
											<input type="hidden" name="category" value="${app.category }">	
											<input type="hidden" name="empId" value="${writer.empId }">	
											<div id="appBtn">
												<div class="form-group">
													<input class="form-control" type="text" name="finReply" placeholder="의견을 입력해 주세요" required="required"/>
												</div>
												<div class="form-group">
													<button class="btn btn-default" type="button" onclick="finConfirm();"><i class="icon-copy ion-checkmark-circled"></i></button>
													<button class="btn btn-default" type="button" onclick="finReject();"><i class="icon-copy ion-close-circled"></i></button>
												</div>
											</div>
										</form>
									</div>	
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				
				</div>
				</div>
				</div>
				
				
				
				<script>
					function midConfirm(){
						
						var confirmVal = confirm("결재를 승인하시겠습니까?");
						
						if(confirmVal){
							$("#midReply").attr("action", "midConfirm.ap");
							$("#midReply").submit();
							return true;
						}
					}
					
					function midReject(){
						var confirmVal = confirm("결재를 반려하시겠습니까?");
						
						if(confirmVal){
							$("#midReply").attr("action", "midReject.ap");
							$("#midReply").submit();
							return true;
						}
					}
					
					function finConfirm(){
						
						var confirmVal = confirm("결재를 승인하시겠습니까?");
						
						if(confirmVal){
							$("#finReply").attr("action", "finConfirm.ap");
							$("#finReply").submit();
							return true;
						}
					}
					
					function finReject(){
						var confirmVal = confirm("결재를 반려하시겠습니까?");
						
						if(confirmVal){
							$("#finReply").attr("action", "finReject.ap");
							$("#finReply").submit();
							return true;
						}
					}
					
				
				</script>
				
<jsp:include page="../common/footer.jsp" />
</body>
</html>