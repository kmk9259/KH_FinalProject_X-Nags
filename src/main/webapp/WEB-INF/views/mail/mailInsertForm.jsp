<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
									<li class="breadcrumb-item active" aria-current="page">메일
										작성</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>


				<!-- 메일 폼 시작 -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix">
						<div class="pull-left">
							<h4 class="text-blue h4">사내 메일 작성</h4>
							<p class="mb-30">메일 작성에 대한 안내사항 적기</p>
						</div>
					</div>
					<form action="insert.ml" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label id="title">보내는 사람</label> <input type="text" readonly
								class="form-control-plaintext" name="empId"
								value="${ sessionScope.loginUser.userName }">
						</div>



						<div class="form-group">
							<label id="title">받는 사람</label>
							<div class="mailReceiver">
								<div class="form-group">
									<input class="form-control" value="" type="text"
										name="receiver" required="required">
								</div>

								<div class="form-group">
									<button type="button" class="btn btn-primary">주소록</button>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label id="title">제목</label> <input class="form-control" value=""
								type="text" name="title" required="required">
						</div>
						<div class="form-group">
							<label id="title">파일 첨부</label> <input type="file"
								class="form-control-file form-control height-auto"
								name="uploadFile">
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-md-6 col-sm-12">
									<label class="weight-600"></label>
									<div class="custom-control custom-checkbox mb-5">
										<input type="checkbox" class="custom-control-input"
											id="customCheck1" name="importantFlag" value="1"> <label
											class="custom-control-label" for="customCheck1">중요 메일</label>
									</div>

								</div>

							</div>
						</div>


						<div class="form-group">
							<label id="title">내용</label>
							<textarea class="form-control" name="content" required="required"></textarea>
						</div>
						<div class="clearfix">
							<div class="pull-right">
								<button type="reset" class="btn btn-outline-danger">취소</button>
								<button type="submit" class="btn btn-primary">메일 전송</button>
							</div>
						</div>
					</form>
				</div>
				<!-- 메일 폼 끝 -->


			</div>
		</div>
	</div>



	<jsp:include page="../common/footer.jsp" />



</body>
</html>