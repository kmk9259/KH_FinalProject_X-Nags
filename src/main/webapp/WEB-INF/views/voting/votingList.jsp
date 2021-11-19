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
<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/vendors/styles/core.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="${ pageContext.servletContext.contextPath }/resources/vendors/styles/style.css">
	--%>
</head>


<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<!-- Simple Datatable start -->
		<div class="card-box mb-30">
			<div class="pd-20">
				<h4 class="text-dark">투표 게시판</h4>
				
				<c:if test="${ !empty loginUser }">
					<a class="btn btn-dark" style="float: right"
						href="enrollVoting.vo">투표함 만들기</a>
				</c:if>
			</div>

			<div class="pb-20">
				<table id="boardList" class="data-table table stripe hover nowrap">
					<thead class="bg-dark text-white">
						<tr>
							<th>글 번호</th>
							<th>투표 주제</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>투표 여부</th>
						</tr>
					</thead>
					<tbody  class="bg-light text-dark">
						<tr >
							<c:forEach items="${ list }" var="v">
								<tr class ="table-warning">
									<td>${v.votingNo }</td>
									<td>${v.votingTitle}</td>
									<td>${ v.userName}</td>
									<td>${v.votingDate }</td>
									 <c:choose>	
	 		 							  <c:when test="${v.result == 1}">
	  										  <td>이미 투표 하셨습니다</td>
	   									 </c:when>	
	  									<c:otherwise>
							    		<td>투표 가능</td>
							  			 </c:otherwise>
									</c:choose>           
								</tr>
							</c:forEach>

						</tr>
					</tbody>
				</table>
				<br>

				<div id="pagingArea">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage ne 1 }">
								<li class="page-item"><a class="page-link"
									href="voting.bo?currentPage=${ pi.currentPage-1 }">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:choose>
								<c:when test="${ pi.currentPage ne p }">
									<li class="page-item"><a class="page-link"
										href="voting.bo?currentPage=${ p }">${ p }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled"><a class="page-link"
										href="">${ p }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>


						<c:choose>
							<c:when test="${ pi.currentPage ne pi.maxPage }">
								<li class="page-item"><a class="page-link"
									href="voting.bo?currentPage=${ pi.currentPage+1 }">다음</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link"
									href="voting.bo?currentPage=${ pi.currentPage+1 }">다음</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

				<br clear="both">
				<br> <br>
				<br>
			</div>
			<br>
			<br>
		</div>
	</div>
	<script>
		$(function() {
			$("#boardList tbody tr").click(
					function() {
						location.href = "votingdetail.bo?bno="
								+ $(this).children().eq(0).text();
					});
		});
	</script>
	<%-- js 

	
	<script
		src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/core.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/script.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/process.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/layout-settings.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/jquery.dataTables.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/dataTables.responsive.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
--%>
	<jsp:include page="../common/footer.jsp" />
	</body>
</html>