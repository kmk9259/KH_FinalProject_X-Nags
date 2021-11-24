<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Nomal Groupware Solution</title>
<style>
.btn-success {
    
    margin-bottom: 0px;
}
.outer {
	border : 1px solid black;
	padding: 50px;
}

legend { width: 40%;
text-align: center;
}
.input-group .input-group-btn {
height: 30px;

}

nput[type=checkbox] + label {
  display: block;
  margin: 0.2em;
  cursor: pointer;
  padding: 0.2em;
  font-family: 'Arial'
}

input[type=checkbox] {
  display: none;
}

input[type=checkbox] + label:before {
  content: "\2714";
  border: 0.1em solid lightgray;
  border-radius: 0.2em;
  display: inline-block;
  width: 1.5em;
  height: 1.5em;
  padding-left: 0.2em;
  padding-bottom: 0.3em;
  margin-right: 0.2em;
  vertical-align: bottom;
  color: transparent;
  transition: .2s;
}

input[type=checkbox] + label:active:before {
  transform: scale(0);
}

input[type=checkbox]:checked + label:before {
  background-color: gray;
  border-color: gray;
  color: #fff;
}

input[type=checkbox]:disabled + label:before {
  transform: scale(1);
  border-color: #aaa;
}

input[type=checkbox]:checked:disabled + label:before {
  transform: scale(1);
  background-color: #F7C28F;
  border-color: #F7C28F;
}

#p1{
 border-color: #aaa;
 border : 1px solid black;
 witdh: 100%;
 height: 100px;
}
.toggle btn .btn-primary{
height: 40px;
}

#myTable{
text-align: center;
}
#btnArea{
 
 text-align: right;
}

#myTable>tbody>th{
width: 50%;
}

</style>

</head>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
<link href="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker3.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker3.standalone.css" rel="stylesheet" />


<body>
	<jsp:include page="../common/menubar.jsp" />
	<!-- ================================================================================= -->






	<div class="main-container" aria-labelledby="headingOne">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
			
			
			 <div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>회의실 예약</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">회의실 예약</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

					<div class="pd-20 card-box mb-30">
					
					<div class="pd-20">
					<div class="profile-timeline">
					
					<div class="clearfix mb-20">
							<div class="pull-left">
							<h4 class="text-blue h4">회의실 예약 확인</h4>
							</div>
					</div>
					
					
							<c:choose>			
							<c:when test="${empty mroom}">
							<div class="alert alert-dark" role="alert" style="text-align: center;">
											예약된 회의실이 없습니다.
							</div>
							</c:when>
							
							<c:otherwise>
							<c:forEach items="${mroom}" var="mr" varStatus="status">						
							<table class="table table-bordered" id="myTable">
							<tbody>
							<tr>
							<th style="width: 50%;">회의실 </th>
							<c:if test="${mr.mrNo eq '1'}" >
							<td style="background-color: rgba(134, 207, 218, 0.2);">회의실 1</td>
							</c:if>
															
							<c:if test="${mr.mrNo  eq '2'}">
							<td style="background-color: rgba(255, 223, 126, 0.2);"> 회의실 2</td>
							</c:if>
															
							<c:if test="${mr.mrNo  eq '3'}">
							<td style="background-color: rgba(143, 209, 158, 0.2);"> 회의실 3</td>
							</c:if>
															
							<c:if test="${mr.mrNo  eq '4'}">
							<td style="background-color: rgba(237, 150, 158, 0.2);"> 회의실 4</td>
							</c:if>
							
							</tr>
																
							<tr>
							<th>시간</th>
							<td>${mr.time}</td>
							</tr>
							 
							</tbody>
							</table>
							<div id="btnArea">
							<c:if test="${mr.mrNo eq '1'}" >
							<button id="cancelA" class="btn btn-danger">취소하기 </button>
							<form id="postFormA" action="" method="post">
							<input type="hidden" name="mroomNo" value="${ mr.mroomNo }">
							<input type="hidden" name="empId" value="${ mr.empId }">
							<input type="hidden" name="time" value="${ mr.time }">
							</form>
							</c:if>
							<c:if test="${mr.mrNo eq '2'}" >
							<button id="cancelB" class="btn btn-danger">취소하기 </button>
							<form id="postFormB" action="" method="post">
							<input type="hidden" name="mroomNo" value="${ mr.mroomNo }">
							<input type="hidden" name="empId" value="${ mr.empId }">
							<input type="hidden" name="time" value="${ mr.time }">
							</form>
							</c:if>
							<c:if test="${mr.mrNo eq '3'}" >
							<button id="cancelC" class="btn btn-danger">취소하기 </button>
							<form id="postFormC" action="" method="post">
							<input type="hidden" name="mroomNo" value="${ mr.mroomNo }">
							<input type="hidden" name="empId" value="${ mr.empId }">
							<input type="hidden" name="time" value="${ mr.time }">
							</form>
							</c:if>
							<c:if test="${mr.mrNo eq '4'}" >
							<button id="cancelD" class="btn btn-danger">취소하기 </button>
							<form id="postFormD" action="" method="post">
							<input type="hidden" name="mroomNo" value="${ mr.mroomNo }">
							<input type="hidden" name="empId" value="${ mr.empId }">
							<input type="hidden" name="time" value="${ mr.time }">
							</form>
							</c:if>
							
							</div>
							<br><br><br><br>
			
							</c:forEach>
							</c:otherwise>
							
							</c:choose>						
					</div>
					</div>
					
				<script>
				$("#cancelA").click(function(){
					
					var postForm = $("#postFormA");
					postForm.attr("action", "cancelMeetingA.ca");
					postForm.submit();
				});
				
				$("#cancelB").click(function(){
					var postForm = $("#postFormB");
					postForm.attr("action", "cancelMeetingB.ca");
					postForm.submit();
				});
				
				$("#cancelC").click(function(){
					var postForm = $("#postFormC");
					postForm.attr("action", "cancelMeetingC.ca");
					postForm.submit();
				});
				
				$("#cancelD").click(function(){
					var postForm = $("#postFormD");
					postForm.attr("action", "cancelMeetingD.ca");
					postForm.submit();
				}); 
				</script>
				  
				  
				</div>
					
				<jsp:include page="../common/footer.jsp" />
				</div>
				</div>
				
			
			</div>
			
			

	
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker.kr.min.js"></script>
	<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
	
	
	
</body>
</html>