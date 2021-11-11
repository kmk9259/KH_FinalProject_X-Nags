<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
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
				
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>기안자 정보</h4>
							</div>
							<table border="1px">
								<thead>
									<tr>
										<th>사원명</th>
										<th>사번</th>
										<th>부서</th>
										<th>직급</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${writer.userName }</td>
										<td>${writer.empId }</td>
										<td>${writer.deptName }</td>
										<td>${writer.deptName }</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>결재자 정보 및 결재 현황</h4>
							</div>
							<table border="1px">
								<thead>
									<tr>
										<th></th>
										<th>사원명</th>
										<th>사번</th>
										<th>부서</th>
										<th>직급</th>
										<th>결재 상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>중간 결재자</td>
										<td>${mid.userName }</td>
										<td>${mid.empId }</td>
										<td>${mid.deptName }</td>
										<td>${mid.deptName }</td>
										<c:choose>
											<c:when test="${ app.midStatus eq 1}">
												<td><i class="icon-copy ion-ios-checkmark-outline"></i></td>
											</c:when>
											<c:when test="${ app.midStatus eq 2}">
												<td><i class="icon-copy ion-ios-checkmark"></i></td>
											</c:when>
											<c:when test="${ app.midStatus eq 3}">
												<td><i class="icon-copy ion-ios-checkmark"></i></td>
											</c:when>
										</c:choose>
									</tr>
									<tr>
										<td>최종 결재자</td>
										<td>${fin.userName }</td>
										<td>${fin.empId }</td>
										<td>${fin.deptName }</td>
										<td>${fin.deptName }</td>
										<c:choose>
											<c:when test="${ app.finStatus eq 1}">
												<td><i class="icon-copy ion-ios-checkmark-outline"></i></td>
											</c:when>
											<c:when test="${ app.finStatus eq 2}">
												<td><i class="icon-copy ion-ios-checkmark-outline"></i></td>
											</c:when>
											<c:when test="${ app.finStatus eq 3}">
												<td><i class="icon-copy ion-ios-checkmark-outline"></i></td>
											</c:when>
										</c:choose>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
		            <div class="card-header">
		              <h3 class="mailbox-read-info">${app.title }</h3>
		              <br>
		              <h4 class="card-title">${app.empId }
                  		<span class="mailbox-read-time float-right">${app.writeDate }</span>
                  	  </h4>
		            </div>
				
				<div class="card-body p-0">
              
              <!-- /.mailbox-read-info -->
              
              <div class="mailbox-controls with-border text-center">
               
              </div>
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
              	<br>
                <P>${app.content }</P>
              </div>
              <!-- /.mailbox-read-message -->
            </div>
            
            <!-- 첨부파일 부분 -->
            <c:choose>
            	<c:when test="${empty app.originName}">
            		
            	</c:when>
            	<c:otherwise>
            		<div class="card-footer bg-white">
            			<a href="${ pageContext.servletContext.contextPath }/resources/approval_files/${app.changeName}" download="${ app.originName }">${ app.originName }</a>
            			
            		</div>
            	</c:otherwise>
            </c:choose>
            
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
									<c:when test="${ sessionScope.loginUser.empId == app.appMid}">
										<div class="appMid">
											<form id="midReply" action="" method="post">
								            	<input type="hidden" name="ano" value="${app.appNo }">
												<div class="form-group">
													<input class="form-control" type="text" name="midReply" placeholder="의견을 입력해 주세요" required="required"/>
												</div>
												<div class="form-group">
													<button class="btn btn-default" type="button" onclick="midConfirm();"><i class="icon-copy ion-checkmark-circled"></i></button>
													<button class="btn btn-default" type="button" onclick="midReject();"><i class="icon-copy ion-close-circled"></i></button>
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
											<div class="form-group">
												<input class="form-control" type="text" name="finReply" placeholder="의견을 입력해 주세요" required="required"/>
											</div>
											<div class="form-group">
												<button class="btn btn-default" type="button" onclick="finConfirm();"><i class="icon-copy ion-checkmark-circled"></i></button>
												<button class="btn btn-default" type="button" onclick="finReject();"><i class="icon-copy ion-close-circled"></i></button>
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
				
				
				<!-- <script>
					$(function() {
						selectReplyList();
						
						$("#midConfirm").click(function(){
							
							var ano = ${app.appNo};
							
							if($("#midReply").val().trim().length != 0){
								
								$.ajax({
									url:"midConfirm.ap",
									type:"post",
									date:{midReply:$("#midReply").val(),
										  ano:ano,
										  appMid:"${app.appMid}"},
								    success:function(result){
								    	if(result > 0){
								    		$("#midReply").val("");
								    		selectReplyList();
								    	}else{
								    		alert("의견등록실패")
								    	}
								    },error:function(){
								    	console.log("댓글 작성 ajax 통신 실패");
								    }
								
								})
							}
						
						})	
					
					
					})
					
				</script> -->
				
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