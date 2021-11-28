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
								<h4>휴지통</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item">휴지통</li>
									<li class="breadcrumb-item active" aria-current="page">삭제 메일 확인</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				
				<!-- 중간내용 널어라 -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
		            <div class="card-header">
		              <h3 class="mailbox-read-info">${m.title }</h3>
		              <br>
		              <h4 class="card-title">from : ${ sendEmp.userName}
		              <br>to : ${receiveEmp.userName }
                  		<span class="mailbox-read-time float-right">${m.date }</span>
                  	  </h4>
		            </div>
				
				<div class="card-body p-10">
              
              <!-- /.mailbox-read-info -->
              
              <div class="mailbox-controls with-border text-center">
               
              </div>
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
              	<br>
                <P>${m.content }</P>
              </div>
              <!-- /.mailbox-read-message -->
            </div>
            
            <!-- 첨부파일 부분 -->
            <c:choose>
            	<c:when test="${empty m.originName}">
            		
            	</c:when>
            	<c:otherwise>
            		<div class="card-footer bg-white">
            			<a href="${ pageContext.servletContext.contextPath }/resources/mail_files/${m.changeName}" download="${ m.originName }">${ m.originName }</a>
            		</div>
            	</c:otherwise>
            </c:choose>
            
            
            <!-- 버튼들 -->
            <form id="sendMail" action="" method="post">
            	<input type="hidden" name="empId" value="${ loginUser.empId }">
            	<input type="hidden" name="mno" value="${m.mailNo }">
            	
	            <div class="card-footer">
	              <div class="float-right">
	              	<button type="button" onclick="list();" class="btn btn-default"><i class="icon-copy ion-arrow-left-c"></i> 목록으로</button>
	                <button type="button" data-backdrop="static" data-toggle="modal" data-target="#mailRecovery" class="btn btn-default"><i class="icon-copy ion-refresh"></i> 복구</button>
	                	
	              </div>
	              
	              <button type="button" data-backdrop="static" data-toggle="modal" data-target="#delete" class="btn btn-default"><i class="icon-copy ion-trash-a"></i> 영구삭제</button>
	            
	            </div>
	            
			</form>
				<!-- 중간내용 끝 -->
				
				</div>
				</div>
				
				</div>
				<jsp:include page="../common/footer.jsp" />
				</div>
				</div>
				
				<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-body text-center font-18">
								<h4 class="padding-top-30 mb-30 weight-500">메일을 영구 삭제하시겠습니까?</h4>
								<div class="padding-bottom-30 row" style="max-width: 170px; margin: 0 auto;">
									<div class="col-6">
										<button type="button" class="btn btn-secondary border-radius-100 btn-block confirmation-btn" data-dismiss="modal"><i class="fa fa-times"></i></button>
										취소
									</div>
									<div class="col-6">
										<button type="button" onclick="waste();" class="btn btn-primary border-radius-100 btn-block confirmation-btn" data-dismiss="modal"><i class="fa fa-check"></i></button>
										삭제
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="modal fade" id="mailRecovery" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-body text-center font-18">
								<h4 class="padding-top-30 mb-30 weight-500">메일을 복구하시겠습니까?</h4>
								<div class="padding-bottom-30 row" style="max-width: 170px; margin: 0 auto;">
									<div class="col-6">
										<button type="button" class="btn btn-secondary border-radius-100 btn-block confirmation-btn" data-dismiss="modal"><i class="fa fa-times"></i></button>
										취소
									</div>
									<div class="col-6">
										<button type="button" onclick="returnMail();" class="btn btn-primary border-radius-100 btn-block confirmation-btn" data-dismiss="modal"><i class="fa fa-check"></i></button>
										복구
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
<script >
//메일 다시 보내기
function returnMail(){
	$("#sendMail").attr("action", "returnMail.ml");
	$("#sendMail").submit();
	return true; 
}

//영구삭제
function waste(){
	$("#sendMail").attr("action", "wasteMail.ml");
	$("#sendMail").submit();
	return true; 
}
function list() {
	$("#sendMail").attr("action", "waste.ml");
	$("#sendMail").submit();
	return true; 
}
</script>
				
<script src="${ pageContext.servletContext.contextPath }/resources/plugins/sweetalert2/sweetalert2.all.js"></script>
				


</body>
</html>