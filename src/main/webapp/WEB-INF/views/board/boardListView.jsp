<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Nomal Groupware Solution</title>
<style>
#boardList {
	text-align: center;
}

#boardList>tbody>tr:hover {
	cursor: pointer;
}

#pagingArea {
	width: fit-content;
	margin: auto;
}
/* #pagingArea a{color:black} */
#searchForm {
	width: 80%;
	margin: auto;
}

#searchForm>* {
	float: left;
	margin: 5px;
}

.select {
	width: 20%;
}

.text {
	width: 53%;
}

.searchBtn {
	Width: 20%;
}
</style>
<%--
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/vendors/styles/style.css">
</head>
 --%>

<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<!-- Simple Datatable start -->
<div class="card-box mb-30">
	<div class="pd-20">
		<h4 class="text-blue h4">Data Table Simple</h4>
		<p class="mb-0">
			ㅇㅇ
		</p>
		 <c:if test="${ !empty loginUser }">
            	<a class="btn btn-secondary" style="float:right" href="enrollForm.bo">글쓰기</a>
            </c:if>
	</div>
	<div class="dataTables_length" id="DataTables_Table_0_length">
	<label>Show <select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0"
	 class="custom-select custom-select-sm form-control form-control-sm">
	 <option value="10">10</option><option value="25">25</option><option value="50">50</option>
	 <option value="-1">All</option></select> entries</label>
	 </div>
	<div class="pb-20">
		<table id="boardList" class="data-table table stripe hover nowrap">
			<thead>
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>첨부파일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach items="${ list }" var="b">
						<tr>
							<td>${ b.boardNo }</td>
							<td>${ b.boardTitle }</td>
							<td>${ b.boardDate }</td>
							 <c:if test="${ !empty b.originFile }">
	                        	<td>★</td>
	                        </c:if>
	                        <c:if test="${ empty b.originFile }">
	                        	<td>&nbsp;</td>
	                        </c:if>
							<td>
								<div class="dropdown">
									<a
										class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
										href="#" role="button" data-toggle="dropdown"> <i
										class="dw dw-more"></i>
									</a>
									<div
										class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">

										<a class="dropdown-item" href="update.bo"><i
											class="dw dw-edit2"></i> 수정하기</a> <a class="dropdown-item"
											href="#"><i class="dw dw-delete-3"></i> 삭제하기</a>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</div>

<!-- Simple Datatable End -->

<script>
	$(function() {
		$("#boardList tbody tr").click(function() {
			location.href = "detail.bo?bno=" + $(this).children().eq(0).text();
		});
	});
</script>
<%-- js 

	<script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/core.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/script.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/process.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/layout-settings.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
 --%>
<jsp:include page="../common/footer.jsp" /></body>
</html>