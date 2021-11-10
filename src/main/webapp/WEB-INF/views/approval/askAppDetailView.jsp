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
            
            
            <!-- 버튼들 -->
            <form id="sendMail" action="" method="post">
            	<input type="hidden" name="empId" value="${ sessionScope.loginUser.empId }">
            	<input type="hidden" name="mno" value="${app.appNo }">
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
									<c:when test="${ sessionScope.loginUser.empId == app.appMid}">
										<input type="text" placeholder="의견을 입력해 주세요"/>
										<button type="button">승인</button>
										<button type="button">반려</button>
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
								<c:otherwise>
									<div class="form-group">
										<input type="text" placeholder="의견을 입력해 주세요"/>
									</div>
									<div class="form-group">
										<button type="button">승인</button>
										<button type="button">반려</button>
									</div>
									
								</c:otherwise>
							</c:choose>
							
							
						</div>
					</div>
				</div>
				
				</div>
				</div>
				</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>