<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Normal Groupware Solution</title>


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
	


	<div class="mobile-menu-overlay"></div>



	<div class="main-container" aria-labelledby="headingOne">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
			
			<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>사원 목록</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">사원 목록</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>




				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">사원 정보 목록</h4>
							<p>사원 정보 입니다</p>
						</div>
				</div>
					
				<div class="table-responsive">
					
						<table id="emplist" class=" table table-striped hover" style="text-align:center;">
							<thead>
								<tr>
									<th class="table-plus datatable-nosort">사원아이디</th>
									<th>사원 이름</th>
									<th>직급명</th>
									<th>직급코드</th>
									<th>권한</th>
									<th>부서</th>
									<th>급여등급</th>
									<th>입사일</th>
									<th>퇴사일</th>
									<th class="datatable-nosort" rowspan="1" colspan="1" aria-label="수정하기" >수정하기</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${list}" var="emp">
							
								<tr> 
								<td>${emp.empId } </td>
								<td>${emp.userName }</td>
								<td>${emp.jobName }</td>
								<td>${emp.jobCode }</td>
								<td>${emp.rightName }</td>
								<td>${emp.deptName }</td>
								<td>${emp.salLevel }</td>
								<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${emp.hireDate }"/></td>
								<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${emp.endDate }"/></td>
								<td>
								
								<c:choose>
								<%-- <c:if test="${ loginUser.rightNo eq 1 }"> --%>
								<c:when test="${emp.endDate eq null &&  loginUser.rightNo eq 1}">
								<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list" style="">
											
					
												<a class="dropdown-item"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" ><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" ><i class="dw dw-delete-3"></i> Delete</a>
												
											</div>
								</div>
								</c:when>
								
								<c:otherwise>
								<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list" style="">
											
					
												<a class="dropdown-item"><i class="dw dw-eye"></i> View</a>
												
												
											</div>
								</div>
								</c:otherwise>
								
								</c:choose>
								
								</td>
								</tr>
								
								
								</c:forEach>
								

							
								
							</tbody>
						</table>
					</div>
					
					
					
			<!-- 페이징 처리  --><br><br>
	
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
            
            <!-- 페이징 처리 끝 -->
					
					
					
					
			

				</div><!-- 반응형 테이블 끝 -->
		
			<script>
			$(function() {
				
				/*API 초기 화 */
				$('#emplist').dataTable({
					  "bPaginate": false,
					  "aaSorting": []
				 });
				
				
			    /*선택 목록이 view*/
			    var i = $("#emplist tbody td:eq(9) .dropdown-menu-icon-list a:eq(0)").text();
			    console.log(i); 
			    
		
			    
			     /*사원번호2*/
			    var bbb = $("#emplist tbody tr:eq(0) td:eq(0)").text();
			    console.log(bbb)
			    
			
			    

			    
			    var hh = $("#emplist tbody tr").children().eq(0).text();
			    console.log("hh " + hh)
			   
			    
			    /*각각 테이블 tr 별로 for 문으로 인덱스 구해서*/
			    
			    for(var i =0; i<$("#emplist tbody tr").length; i++){
			    	
			    	$("#emplist tbody tr:eq("+i+") td:eq(9) .dropdown-menu-icon-list a:eq(0)").click(function(){
			    		
			    		
			    		location.href="empDetail.me?empId=" +  $(this).parent().parent().parent().parent().children().eq(0).text(); 
				    });
			    }
			    
				/*수정 폼으로 이동 하는 함수*/
			    
			    for(var i =0; i<$("#emplist tbody tr").length; i++){
			    	
			    	$("#emplist tbody tr:eq("+i+") td:eq(9) .dropdown-menu-icon-list a:eq(1)").click(function(){
			    
			    		location.href="updateEmpForm.me?empId=" +  $(this).parent().parent().parent().parent().children().eq(0).text();  
			    		
				    });
			    }
				
				
				/*삭제 하는 함수*/
			    
			     for(var i =0; i<$("#emplist tbody tr").length; i++){
			    	
			    	
			    	$("#emplist tbody tr:eq("+i+") td:eq(9) .dropdown-menu-icon-list a:eq(2)").click(function(){
			    		/* $("#postForm").attr("action","deleteEmp.me"); */
			    		location.href="deleteEmp.me?empId=" +  $(this).parent().parent().parent().parent().children().eq(0).text();  
			    		
				    });
			    } 
			    
			    
			});
			  

         </script>
				

	
			
			
			<jsp:include page="../common/footer.jsp" />
			</div>
		</div>

	</div>


	
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