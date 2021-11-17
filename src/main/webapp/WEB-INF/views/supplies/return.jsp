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

 #employeeAll_paginate,
#employeeAll_info{
display: none;
} 
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<!-- ================================================================================= -->


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
					
						<table id="employeeAll" class=" table table-striped hover" style="text-align:center;">
							<thead>
								<tr>
									<%-- <c:out value="${returnList}"></c:out> --%>
									
					
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
								
								<td>${ rtlist.reNo} </td>
								<td>${ rtlist.suppliesNo}</td>
								<td>${ rtlist.suppliesCode}</td>
								<td>${ rtlist.empId}</td>
								<td>${ rtlist.empId}</td>
								<td>${ rtlist.suppliesName}</td>
								<td>${ rtlist.counts}</td>
								<td>${ rtlist.startDate}</td>
								<td>${ rtlist.endDate}</td>
								<td><button class="btn btn-info">반납</button></td>
								
								</tr>
								
								
								</c:forEach>
								

							
								
							</tbody>
						</table>
					</div>
			

				</div><!-- 반응형 테이블 끝 -->
		
			<script>
			$(function() {
				
				$('#employeeAll').dataTable({
					  "bPaginate": false,
					  "aaSorting": []
					 });
				
				
			    /*선택 목록이 view*/
			    var i = $("#employeeAll tbody td:eq(8) .dropdown-menu-icon-list a:eq(0)").text();
			    console.log(i); 
			    
			 
		
			    /*사원번호*/
			    var aaa = $("#employeeAll tbody td:eq(0)").text();
			    console.log(aaa)
			    
			     /*사원번호2*/
			    var bbb = $("#employeeAll tbody tr:eq(1) td:eq(0)").text();
			    console.log(bbb)
			    
			
			    

			    
			    var hh = $("#employeeAll tbody tr").children().eq(0).text();
			    console.log("hh " + hh)
			    
				/*각각 테이블 tr 별로 for 문으로 인덱스 구해서 새로운 view 클릭 */
			    
			   /*  for(var i =0; i<$("#salary tbody tr").length; i++){
			    	
			    	$("#salary tbody tr:eq("+i+") td:eq(8) .dropdown-menu-icon-list a:eq(0)").click(function(){
			    		
			    		
			    		location.href="empDetail.me?empId=" +  $(this).parent().parent().parent().parent().children().eq(0).text(); 
				    });
			    } */
			    
			    
			    
			    /*각각 테이블 tr 별로 for 문으로 인덱스 구해서*/
			    
			    for(var i =0; i<$("#employeeAll tbody tr").length; i++){
			    	
			    	$("#employeeAll tbody tr:eq("+i+") td:eq(8) .dropdown-menu-icon-list a:eq(0)").click(function(){
			    		
			    		
			    		location.href="empDetail.me?empId=" +  $(this).parent().parent().parent().parent().children().eq(0).text(); 
				    });
			    }
			    
				/*수정 폼으로 이동 하는 함수*/
			    
			    for(var i =0; i<$("#employeeAll tbody tr").length; i++){
			    	
			    	$("#employeeAll tbody tr:eq("+i+") td:eq(8) .dropdown-menu-icon-list a:eq(1)").click(function(){
			    
			    		location.href="updateEmpForm.me?empId=" +  $(this).parent().parent().parent().parent().children().eq(0).text();  
			    		
				    });
			    }
				
				
				/*삭제 하는 함수*/
			    
			     for(var i =0; i<$("#employeeAll tbody tr").length; i++){
			    	
			    	
			    	$("#employeeAll tbody tr:eq("+i+") td:eq(8) .dropdown-menu-icon-list a:eq(2)").click(function(){
			    		/* $("#postForm").attr("action","deleteEmp.me"); */
			    		location.href="deleteEmp.me?empId=" +  $(this).parent().parent().parent().parent().children().eq(0).text();  
			    		
				    });
			    } 
			    
			    
				/* 테이블 정렬 관련 함수 시작 */
				//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css
				//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js
				
				 
				/* $('#reset').click( function (e) {
				    table.colReorder.reset();
				} ); */
				
				 /* $('#employeeAll').DataTable({
				        searchPanes: {
				            viewTotal: true
				        },
				        dom: 'Plfrtip'
				    }); */
				    
				
			    
			});
			  

         </script>
				
				
				
				
	<!-- 페이징 처리  -->
	
	<div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="listEmp.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="listEmp.me?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="listEmp.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="listEmp.me?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
            
            <!-- 페이징 처리 끝 --> <br><br><br><br><br>
				
			</div>
		</div>

	</div>

	<!-- ======================================================================= -->


	
	
	<!-- js -->
	<!-- <script src="//code.jquery.com/jquery-1.12.0.min.js"></script> -->
    
	
	
	
<%-- 	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/responsive.bootstrap4.min.js"></script> --%>
	<!-- buttons for Export datatable -->
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/dataTables.buttons.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/buttons.print.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/buttons.html5.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/buttons.flash.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/pdfmake.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/vfs_fonts.js"></script>
	<!-- Datatable Setting js -->
	<script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/datatable-setting.js"></script></body>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>