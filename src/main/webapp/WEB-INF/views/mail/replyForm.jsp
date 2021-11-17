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
.mailReceiver {
	display: flex;
	flex-flow: row wrap;
	align-items: center;
	width: 100%;
	margin-bottom: 0;
}

label {
	font-weight: bold;
}

#title {
	font-weight: bold;
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
								<h4>전자 메일</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">메일 답장</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>


				<!-- 메일 폼 시작 -->
				<div class="pd-20 card-box mb-30">
					
					<form action="insertReply.ml" method="post"
						enctype="multipart/form-data">
						
								<input type="hidden" readonly
								class="form-control-plaintext" name="empId"
								value="${ sessionScope.loginUser.empId }">
						

						<div class="form-group">
							<div class="mailReceiver">
								<div class="form-group">
									<input class="form-control" type="text"
										name="receiver" required="required" placeholder="받는 사람">
								</div>
								<div class="form-group">
									<button type="button" class="btn btn-primary" data-backdrop="static" data-toggle="modal" data-target="#member-modal">주소록</button>
								</div>
								<div class="">
									<div class="custom-control custom-checkbox mb-5">
										
										<input type="checkbox" class="custom-control-input" id="customCheck1" name="importantFlag"> 
										<label class="custom-control-label" for="customCheck1">중요 메일</label>
										
									</div>
								</div>
								<br>
									<input class="form-control" value="RE: ${receiveMail.title }" type="text" name="title" required="required" placeholder="메일 제목을 입력해주세요.">
								<br>
								<br>
								
								
							</div>
							
						</div>
						<div class="form-group">
							<input type="file" class="form-control-file form-control height-auto" name="reUploadFile">
							<c:if test="${!empty receiveMail.originName }">
								현재 첨부된 파일 : ${receiveMail.originName } <br>
	                            <input type="hidden" name="changeName" value="${ receiveMail.changeName }">
	                            <input type="hidden" name="originName" value="${ receiveMail.originName }">
							</c:if>
							</div>

						
						<div class="form-group">
							<textarea class="textarea_editor form-control border-radius-0" name="content" required="required">
								-----Original Message-----<br>
								From : ${ receiveMail.empId }<br>
								To : ${receiveMail.receiver }<br>
								Sent : ${receiveMail.date}<br>
								Title : ${receiveMail.title }<br>
								<br>
								${receiveMail.content }
							
							</textarea>
						</div>
						
					
						<div class="clearfix">
							<div class="pull-right">
								<button type="button" class="btn btn-outline-danger" onclick="history.go(-1)">취소</button>
								<button type="submit" class="btn btn-primary">메일 전달</button>
							</div>
						</div>
					</form>
				</div>
				<!-- 메일 폼 끝 -->
			</div>
		</div>
	</div>
	
			
			
			<div class="modal fade" id="member-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="login-box bg-white box-shadow border-radius-10">
							<div class="login-title">
								<h2 class="text-center text-primary">받는 사람 선택</h2>
							</div>
							<form>
								
								<div class="input-group custom">
									
									<select class="form-control form-control-lg">
										<option>부서선택</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
									</select>
									
								</div>
								<div class="input-group custom">
								
									<select class="form-control form-control-lg">
										<option>이름선택</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
									</select>
								
								</div>
								
								<div class="row">
									<div class="col-sm-12">
										<div class="input-group mb-0">
											
											<input class="btn btn-primary btn-lg btn-block" type="submit" value="선택">
											
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
	


	<jsp:include page="../common/footer.jsp" />



</body>
</html>