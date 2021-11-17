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
		              <h4 class="card-title">${m.receiver }
                  		<span class="mailbox-read-time float-right">${m.date }</span>
                  	  </h4>
		            </div>
				
				<div class="card-body p-0">
              
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
            	<input type="hidden" name="empId" value="${ sessionScope.loginUser.empId }">
            	<input type="hidden" name="mno" value="${m.mailNo }">
            
	            <div class="card-footer">
	              <div class="float-right">
	                <button type="button" onclick="returnMail();" class="btn btn-default"><i class="icon-copy ion-refresh"></i> 복구</button>
	              </div>
	              <button type="button" onclick="waste();" class="btn btn-default"><i class="icon-copy ion-trash-a"></i> 영구삭제</button>
	              <button type="button" class="btn btn-default"><i class="icon-copy ion-printer"></i> 인쇄</button>
	            </div>
			</form>
				<!-- 중간내용 끝 -->
				</div>
				</div>
				</div>
				</div>
				</div>
				
				
<script >
//메일 다시 보내기
function returnMail(){
	var confirmVal = confirm("메일을 복구하시겠습니까?");
	
	if(confirmVal){
		$("#sendMail").attr("action", "returnMail.ml");
		$("#sendMail").submit();
		return true;
	}
}

//영구삭제
function waste(){
	var confirmVal = confirm("메일을 영구적으로 삭제하시겠습니까?");
	
	if(confirmVal){
		$("#sendMail").attr("action", "wasteMail.ml");
		$("#sendMail").submit();
		return true;
	}
}
</script>
				
				
<jsp:include page="../common/footer.jsp" />

</body>
</html>