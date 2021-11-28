<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Normal GroupWare Solution</title>
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
</head>
<body style = "background: #ecf0f4">
	<jsp:include page="../common/menubar.jsp" />
	<div class="mobile-menu-overlay"></div>
	<div class="main-container">
	<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>익명게시판 목록</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">익명게시판 목록</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
		<div class="pd-20 card-box mb-30">
			<div class="pd-20">
				<c:if test="${ !empty loginUser }">
					<a class="btn btn-dark" style="float: right"
						href="enrollForm.bo">글쓰기</a>
				</c:if>
			</div>
			<div class="pb-20">
				<table id="boardList" class="data-table table stripe hover nowrap">
					<thead class="bg-dark text-white">
						<tr>
							<th>글 번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>첨부파일</th>
						</tr>
					</thead>
					<tbody  class="bg-light text-dark">
						<tr>
							<c:forEach items="${ list }" var="b">
								<tr class ="table-warning">
									<td>${ b.boardNo }</td>
									<td>${ b.boardTitle }</td>
									<td>${ b.uploadDate }</td>
									<td>${b.count }</td>
									<c:if test="${ !empty b.originFile }">
										<td>★</td>
									</c:if>
									<c:if test="${ empty b.originFile }">
										<td>&nbsp;</td>
									</c:if>
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
									href="list.bo?currentPage=${ pi.currentPage-1 }">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:choose>
								<c:when test="${ pi.currentPage ne p }">
									<li class="page-item"><a class="page-link"
										href="list.bo?currentPage=${ p }">${ p }</a></li>
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
									href="list.bo?currentPage=${ pi.currentPage+1 }">다음</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link"
									href="list.bo?currentPage=${ pi.currentPage+1 }">다음</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>		
		</div>
		<br><br>
			<jsp:include page="../common/footer.jsp" />
	</div>
	<script>
		$(function() {
			$("#boardList tbody tr").click(
					function() {
						location.href = "detail.bo?bno="
								+ $(this).children().eq(0).text();
					});
		});
	</script>
</body>
</html>