<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>X-Normal GroupWare Solution</title>
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
.selectReceiver{
	overflow: auto;
	min-height:500px;
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
									<li class="breadcrumb-item active" aria-current="page">메일 작성</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<!-- 메일 폼 시작 -->
				<div class="pd-20 card-box mb-30">
					
					<form action="" method="post" enctype="multipart/form-data" id="insertMail">
						<input type="hidden" readonly class="form-control-plaintext" name="empId" value="${ sessionScope.loginUser.empId }">
						
						<div class="form-group">
							<div class="mailReceiver">
								<div class="form-group">
									<input class="form-control" type="text" data-toggle="tooltip" title="주소록에서 선택해 주세요."
										name="receiverName" readonly="readonly" required="required" placeholder="받는 사람">
									<input type="hidden" name="receiver">
								</div>
								<div class="form-group">
									<button type="button" class="btn btn-primary" data-backdrop="static" data-toggle="modal" data-target="#bd-example-modal-lg"><i class="icon-copy dw dw-agenda"></i> 주소록</button>
								</div>
								<div class="">
									<div class="custom-control custom-checkbox mb-5">
										<input type="checkbox" class="custom-control-input" id="customCheck1" name="importantFlag" value="1"> 
										<label class="custom-control-label" for="customCheck1">중요 메일</label>
									</div>
								</div>
								<br>
								<input class="form-control" type="text" name="title" required="required" placeholder="메일 제목을 입력해주세요.">
								<br>
								<br>
							</div>
						</div>
						<div class="form-group">
							<input type="file" class="form-control-file form-control height-auto" name="uploadFile">
						</div>

						<div class="form-group">
							<textarea class="textarea_editor form-control border-radius-0" name="content" required="required" placeholder="메일 내용을 입력해주세요."></textarea>
						</div>
						
						<div class="clearfix">
							<div class="pull-right">
								<button type="button" class="btn btn-primary" onclick="sendMail();">메일 전송</button>
							</div>
						</div>
					</form>
				</div>
				<!-- 메일 폼 끝 -->
			</div>
			<jsp:include page="../common/footer.jsp" />
		</div>
		
	</div>
	
			<div class="modal fade bs-example-modal-lg" id="bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myLargeModalLabel">받는 사람 선택</h4>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						</div>
										
						<div class="modal-body">
							<div class="selectReceiver">
								<div class="form-group" id="deptList">
									
									<select id="selectDept" class="custom-select col-6">
										<option>부서 선택</option>
										<option value="D1">인사관리부</option>
										<option value="D2">회계관리부</option>
										<option value="D3">마케팅부</option>
										<option value="D4">국내영업부</option>
										<option value="D5">해외영업부</option>
										<option value="D6">기술지원부</option>
										<option value="D7">총무부</option>
									</select>
									
						            <button class="btn btn-primary" id="searchEmp">조회</button>
								
								</div>
								
								<div id="empList">
									<table border="1" class="table table-bordered border-primary" id="eList">
										<thead class="table-primary">
											<tr>
												<th></th>
												<th>이름</th>
												<th>사번</th>
												<th>직급</th>
												<th>권한</th>
											</tr>
										</thead>
										<tbody>
											
										</tbody>
									</table>
								</div>
							</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" onclick="selectReceiver();">선텍</button>
						</div>
					</div>
					
				</div>
			</div>

<script>
$(function(){
	$("#searchEmp").click(function(){
		
		var deptCode = $("option:selected").val();
		
		if(deptCode == "부서 선택"){
				
			swal({
                  type: 'error',
                  title: 'Oops...',
                  text: '부서를 선택해 주세요',
	            })
			return false;
		}
		
		$.ajax({
			url:"empList.ml",
			data:{deptCode:deptCode},
			type:"get",
			success:function(map){
				
				var $tableBody = $("#eList tbody");
				$tableBody.html("");
				
				$.each(map["jrr"], function(i, emp){
					
					var $tr = $("<tr>");
					var $ckTd = $("<td><input type='checkBox' class='checkEmp' name='checkEmp'></td>");
					var $nameTd = $("<td>").text(emp.userName);
					var $idTd = $("<td>").text(emp.empId);
					var $jobTd = $("<td>").text(emp.jobName);
					var $rightTd = $("<td>").text(emp.rightName);
					
					$tr.append($ckTd);
					$tr.append($nameTd);
					$tr.append($idTd);
					$tr.append($jobTd);
					$tr.append($rightTd);
					
					$tableBody.append($tr);
					
				})
			},
			error:function(e){
				console.log("사원 리스트 조회 ajax 통신 실패");
			}
		
		})
	
	})
	
})

function selectReceiver(){
	var tr = $("input[class=checkEmp]:checked").parent().parent().eq(0);
	var td = tr.children();
	var userName = td.eq(1).text();
	var empId = td.eq(2).text();
	
	var deptCode = $("option:selected").val();
	
	if(deptCode == "부서 선택"){
			
		swal(
               {
                   type: 'error',
                   title: 'Oops...',
                   text: '부서를 선택해 주세요',
               }
           )
		return false;
		
	}else if(tr.val() == null){
		swal(
               {
                   type: 'error',
                   title: 'Oops...',
                   text: '받는 사람을 선택해 주세요',
               }
           )
		return false;
	}
	
	$("input[name=receiverName]").val(userName);
	$("input[name=receiver]").val(empId);
	$("#bd-example-modal-lg").modal("hide");	
}

function sendMail(){
	var receiver = $("#insertMail input[name=receiverName]");
	var title = $("#insertMail input[name=title]");
	var content = $("#insertMail textarea[name=content]");
	
	if(receiver.val()=="" || receiver.val()==null){
		
	 swal(
               {
                   type: 'error',
                   title: 'Oops...',
                   text: '받는 사람을 입력해 주세요',
               }
           )
		return false;
	 
	}else if(title.val()=="" || title.val()==null){
		
		swal(
	               {
	                   type: 'error',
	                   title: 'Oops...',
	                   text: '제목을 입력해 주세요',
	               }
	           )
			return false;
		
	}else if(content.val()=="" || content.val()==null){
	
		swal(
	               {
	                   type: 'error',
	                   title: 'Oops...',
	                   text: '내용을 입력해 주세요',
	               }
	           )
			return false;
		
	
	}else{
		$("#insertMail").attr("action", "insert.ml");
		$("#insertMail").submit();
		return true;
	}
}
</script>	

<script src="${ pageContext.servletContext.contextPath }/resources/plugins/sweetalert2/sweetalert2.all.js"></script>


</body>
</html>