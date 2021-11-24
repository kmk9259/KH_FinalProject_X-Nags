<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Nomal Groupware Solution</title>


<style type="text/css">
 #pagingArea{width:fit-content;margin:auto;}

#close {
	position: absolute;
	float: right;
	background: red;
	color: white;
	width: 30px;
	z-index: 1;
}


</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	


	<div class="mobile-menu-overlay"></div>



	<!-- ===================개인정보 입력=============== -->

	<div class="main-container" aria-labelledby="headingOne">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
			
			<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>비품 목록</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">비품 목록</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>




				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">비품 예약 정보</h4>
							<p>비품 예약 목록 입니다</p>
						</div>
				</div>
					

				<div class="table-responsive">
					
						<table id="suppliesAll" class=" table table-striped hover" style="text-align:center;">
							<thead>
								<tr>
									<th class="table-plus datatable-nosort">번호</th>
									<th>비품번호</th>
									<th>비품코드</th>
									<th>사원아이디</th>
									<th>사원 이름</th>
									<th>비품이름</th>
									<th>갯수</th>
									<th>예약 일</th>
									<th>반납 일</th>
									<th class="datatable-nosort"  >반납여부</th>
								</tr>
							</thead>
							
							<tbody>
							
							<c:forEach items="${returnList}" var="rtlist" varStatus="status">
							
								<tr> 
								
								<td class="reNo" value="${ rtlist.reNo}">${ rtlist.reNo} </td>
								<td>${ rtlist.suppliesNo}</td>
								<td>${ rtlist.suppliesCode}</td>
								<td>${ rtlist.empId}</td>
								<td>${ rtlist.userName}</td>
								<td>${ rtlist.suppliesName}</td>
								<td>${ rtlist.counts}</td>
								<td>${ rtlist.startDate}</td>
								<td>${ rtlist.endDate}</td>
								<td>
								
								<c:choose>
								<c:when test="${rtlist.status eq 'Y'}">
								<button class="btn btn-info" id="submit${status.index }">반납</button>
								</c:when>
								<c:otherwise>
								<button class="btn btn-secondary" disable>반납 됨</button>
								</c:otherwise>
								</c:choose>
								</td>
								
								</tr>

								</c:forEach>
								
							
							
							 
							</tbody>
							
						</table>
						
						<br><br>
					</div>
			

				</div><!-- 반응형 테이블 끝 -->
		
			<script>
			
			for(var i =0; i< $("#suppliesAll tbody tr").length; i++){
				$("#submit" + i).click(function(){
					 console.log($(this).text())
					 console.log($(this).parent().parent().children(".reNo").text())
					 //console.log($("#suppliesAll tbody tr:eq(i) td:eq(0)").text())
					
					
					 location.href="returnSup.su?reNo="+$(this).parent().parent().children(".reNo").text();  
				})
			}
			
			
			$(function() {
				
				
			
				
				$('#suppliesAll').dataTable({
					  "bPaginate": true,
					  "aaSorting": []
					 });
				

			    
			}); 
			  

         </script>
				
				
				<jsp:include page="../common/footer.jsp" />
				
	
			</div>
		</div>

	</div>

	<!-- ======================================================================= -->


	
	
	<!-- js -->

	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/dataTables.buttons.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/buttons.print.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/buttons.html5.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/buttons.flash.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/pdfmake.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/vfs_fonts.js"></script>
	<!-- Datatable Setting js -->
	<script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/datatable-setting.js"></script></body>
	
	
</body>
</html>