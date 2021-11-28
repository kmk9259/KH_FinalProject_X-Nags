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
<title>X-Normal GroupWare Solution</title>
<style type="text/css">

table{
	margin-bottom: 10;
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

	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>진행중 결재함</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item">진행중 결재함</li>
									<li class="breadcrumb-item active" aria-current="page">결재 문서 확인</li>
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
					                <td width="300px"><b>문서번호</b></td>
					                <td width="300px">${app.appNo }</td>
					                <td width="300px"><b>중간 결재자</b></td>
					                <td width="300px"><b>최종 결재자</b></td>
					            </tr>
					            <tr>
					                <td><b>기안자</b></td>
					                <td>${writer.userName}</td>
					                <td>${mid.userName }</td>
					                <td>${fin.userName }</td>
					            </tr>
					            <tr>
					                <td><b>기안일</b></td>
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
					                <td><b>휴가시작</b></td>
					                <td><fmt:formatDate type="date" dateStyle="long" value="${app.stayDate }"/></td>
					                <td><b>휴가종료</b></td>
					                <td><fmt:formatDate type="date" dateStyle="long" value="${app.endDate }"/></td>
					            </tr>
					            </c:if>
					            <c:if test="${app.category eq 3}">
					            <tr>
					                <td><b>외근일</b></td>
					                <td><fmt:formatDate type="date" dateStyle="long" value="${app.endDate }"/></td>
					                <td colspan="2"></td>
					            </tr>
					            </c:if>
					            
					            
					            <tr height="400px">
					                <td colspan="4">${app.content }</td>
					            </tr>
					
					        </tbody>
					        <tfoot>
					        	<tr>
					        		<c:choose>
						            	<c:when test="${empty app.originName}">
						            		<td colspan="4">첨부파일이 없습니다.</td>
						            	</c:when>
						            	<c:otherwise>
						            		
						            		<td colspan="4" align="left"><a href="${ pageContext.servletContext.contextPath }/resources/approval_files/${app.changeName}" download="${ app.originName }">${ app.originName }</a></td>
											
						            	</c:otherwise>
						            </c:choose>
					        	</tr>
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
            
            			
				        <form id="sendApp" action="" method="post"> 
	            			<input type="hidden" name="ano" value="${app.appNo }">
	            			<input type="hidden" name="category" value="${app.category }">
	            			<input type="hidden" name="fileName" value="${ app.changeName }"> 
		            		<div class="card-footer">
				              <div class="float-right">
				              	<c:if test="${app.midStatus eq 1 }">
				              		<button type="button" onclick="goList();" class="btn btn-default"><i class="icon-copy ion-arrow-left-c"></i> 목록으로</button>
				              		<button type="button" onclick="change();" class="btn btn-default"><i class="icon-copy ion-refresh"></i> 수정</button>
				              	</c:if>
				              </div>
				              	<c:if test="${app.finStatus eq 1 }">
				              		<button type="button" data-backdrop="static" data-toggle="modal" data-target="#deleteApp" class="btn btn-default"><i class="icon-copy ion-trash-a"></i> 삭제</button>
				              	</c:if>
				            </div>
		                </form>
				<!-- 중간내용 끝 -->
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
									<c:otherwise>
										<p>중간 결재가 처리되지 않았습니다.</p>
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
								<c:when test="${app.midStatus eq 1}">
									<p>최종 결재가 처리되지 않았습니다.</p>
								</c:when>
								<c:otherwise>
									<p>${app.finReply}</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				
				<jsp:include page="../common/footer.jsp" />
				</div>
				</div>
				</div>
				
				<div class="modal fade" id="deleteApp" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-body text-center font-18">
								<h4 class="padding-top-30 mb-30 weight-500">결재 문서를 삭제하시겠습니까?</h4>
								<div class="padding-bottom-30 row" style="max-width: 170px; margin: 0 auto;">
									<div class="col-6">
										<button type="button" class="btn btn-secondary border-radius-100 btn-block confirmation-btn" data-dismiss="modal"><i class="fa fa-times"></i></button>
										취소
									</div>
									<div class="col-6">
										<button type="button" onclick="deleteApp();" class="btn btn-primary border-radius-100 btn-block confirmation-btn" data-dismiss="modal"><i class="fa fa-check"></i></button>
										삭제
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
<script >
//수정
function change(){
	
	$("#sendApp").attr("action", "change.ap");
	$("#sendApp").submit();
	return true;

}

//삭제
function deleteApp(){

	$("#sendApp").attr("action", "deleteApping.ap");
	$("#sendApp").submit();

}
function goList() {
	$("#sendApp").attr("action", "apping.ap");
	$("#sendApp").submit();

}
</script>
			

</body>
</html>