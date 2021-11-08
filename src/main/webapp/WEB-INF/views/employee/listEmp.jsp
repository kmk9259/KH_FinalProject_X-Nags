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
	<!-- ================================================================================= -->


	<div class="mobile-menu-overlay"></div>



	<!-- ===================개인정보 입력=============== -->

	<div class="main-container" aria-labelledby="headingOne">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">




				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">사원 정보 목록</h4>
							<p>사원 정보 입니다</p>
						</div>
					
					</div>
					
					<div id="DataTables_Table_2_filter" class="dataTables_filter">
					<label>검색
					<input type="search" class="form-control form-control-sm" placeholder="Search" aria-controls="DataTables_Table_2">
					</label>
					</div><br>
					
					
					
					<!-- 목적별 선택 -->
					
					<div class="d-flex">	                                	
	                                												
											<div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="attList" id="0" value="1" class="custom-control-input">
	                                        <label class="custom-control-label " for="0">직급별&nbsp;&nbsp;</label>
	                                    </div>
																					
											<div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="attList" id="1" value="2" class="custom-control-input">
	                                        <label class="custom-control-label " for="1">권한 순&nbsp;&nbsp;</label>
	                                    </div>
																					
											<div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="attList" id="2" value="3" class="custom-control-input">
	                                        <label class="custom-control-label " for="2">부서별&nbsp;&nbsp;</label>
	                                    </div>
																					
											<div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="attList" id="3" value="4" class="custom-control-input">
	                                        <label class="custom-control-label " for="3">입사일 기준&nbsp;&nbsp;</label>
	                                    </div>
																					
											<div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="attList" id="4" value="5" class="custom-control-input">
	                                        <label class="custom-control-label " for="4">퇴사일 기준&nbsp;&nbsp;</label>
	                                    </div>
																					
											
																				
	                                </div>
					
					
					
					
					
					
					
	
					
					
					
					<div class="table-responsive">
						<table class="table table-striped" style="text-align:center;">
							<thead>
								<tr>
									<!-- <th scope="col">#</th> -->
									<th scope="col">사원아이디</th>
									<th scope="col">사원 이름</th>
									<th scope="col">직급코드</th>
									<th scope="col">권한</th>
									<th scope="col">부서</th>
									<th scope="col">급여등급</th>
									<th scope="col">입사일</th>
									<th scope="col">퇴사일</th>
									<th scope="col">수정하기</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${list }" var="emp">
								<tr>
								
								<td>${emp.empId }</td>
								<td>${emp.empId }</td>
								<td>${emp.jobName }</td>
								<td>${emp.rightName }</td>
								<td>${emp.deptName }</td>
								<td>${emp.salLevel }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${emp.hireDate }"/></td>
								<%-- <td>${emp.modifyDate }</td> --%>
								<td>${emp.endDate }</td>
								<td>
								
								<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list" style="">
												<a class="dropdown-item" href="empDetail.me"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="update.me"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="delete.me"><i class="dw dw-delete-3"></i> Delete</a>
											</div>
										</div>
								
								</td>
								</tr>
							
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="collapse collapse-box" id="responsive-table">
						<div class="code-box">
							<div class="clearfix">
								<a href="javascript:;"
									class="btn btn-primary btn-sm code-copy pull-left"
									data-clipboard-target="#responsive-table-code"><i
									class="fa fa-clipboard"></i> Copy Code</a> <a
									href="#responsive-table"
									class="btn btn-primary btn-sm pull-right" rel="content-y"
									data-toggle="collapse" role="button"><i
									class="fa fa-eye-slash"></i> Hide Code</a>
							</div>

						</div>
					</div>
				</div><!-- 반응형 테이블 끝 -->
				<script>
				$(function(){
                	var attendanceDate ="";
                	$( ".date-picker" ).datepicker({
                    		dateFormat: "yyyy-mm-dd",
                    		language:"ko",
                    		onSelect: function(dateText) {
                    			attendanceDate = dateText;
                    	    }
                    		
                    });
                	
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
	
	<div class="main-container" aria-labelledby="headingOne">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
	
	
	
	
			
				
				</div>
				</div>
				</div>

	
	
	<!-- js -->
	
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
	
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
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