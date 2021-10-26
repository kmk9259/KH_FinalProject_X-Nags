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
</head>
<body>


	<jsp:include page="../common/menubar.jsp" />
  <div class="mobile-menu-overlay"></div>

    <div class="main-container">
	<!-- Simple Datatable start -->
	<div class="card-box mb-30">
		<div class="pd-20">
			<h4 class="text-blue h4">Data Table Simple</h4>
		
		</div>
		<div class="pb-20">
			<table class="data-table table stripe hover nowrap">
				<thead>
					<tr>
						<th>글 번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<c:forEach items="${ list }" var="b">
	                    <tr>
	                        <td>${ b.boardNo }</td>
	                        <td>${ b.empId }</td>
	                        <td>${ b.boardTitle }</td>                                         
	                        <td>${ b.boardDate }</td>	                      
	                    </tr>
                    </c:forEach>
                    
						<td>
							<div class="dropdown">
								<a
									class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
									href="#" role="button" data-toggle="dropdown"> <i
									class="dw dw-more"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
									<a class="dropdown-item" href="#"><i class="dw dw-eye"></i>
										View</a> <a class="dropdown-item" href="#"><i
										class="dw dw-edit2"></i> Edit</a> <a class="dropdown-item"
										href="#"><i class="dw dw-delete-3"></i> Delete</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-plus">Andrea J. Cagle</td>
						<td>30</td>
						<td>Gemini</td>
						<td>1280 Prospect Valley Road Long Beach, CA 90802</td>
						<td>29-03-2018</td>
						<td>
							<div class="dropdown">
								<a
									class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
									href="#" role="button" data-toggle="dropdown"> <i
									class="dw dw-more"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
									<a class="dropdown-item" href="#"><i class="dw dw-eye"></i>
										View</a> <a class="dropdown-item" href="#"><i
										class="dw dw-edit2"></i> Edit</a> <a class="dropdown-item"
										href="#"><i class="dw dw-delete-3"></i> Delete</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-plus">Andrea J. Cagle</td>
						<td>20</td>
						<td>Gemini</td>
						<td>2829 Trainer Avenue Peoria, IL 61602</td>
						<td>29-03-2018</td>
						<td>
							<div class="dropdown">
								<a
									class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
									href="#" role="button" data-toggle="dropdown"> <i
									class="dw dw-more"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
									<a class="dropdown-item" href="#"><i class="dw dw-eye"></i>
										View</a> <a class="dropdown-item" href="#"><i
										class="dw dw-edit2"></i> Edit</a> <a class="dropdown-item"
										href="#"><i class="dw dw-delete-3"></i> Delete</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-plus">Andrea J. Cagle</td>
						<td>30</td>
						<td>Sagittarius</td>
						<td>1280 Prospect Valley Road Long Beach, CA 90802</td>
						<td>29-03-2018</td>
						<td>
							<div class="dropdown">
								<a
									class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
									href="#" role="button" data-toggle="dropdown"> <i
									class="dw dw-more"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
									<a class="dropdown-item" href="#"><i class="dw dw-eye"></i>
										View</a> <a class="dropdown-item" href="#"><i
										class="dw dw-edit2"></i> Edit</a> <a class="dropdown-item"
										href="#"><i class="dw dw-delete-3"></i> Delete</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-plus">Andrea J. Cagle</td>
						<td>25</td>
						<td>Gemini</td>
						<td>2829 Trainer Avenue Peoria, IL 61602</td>
						<td>29-03-2018</td>
						<td>
							<div class="dropdown">
								<a
									class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
									href="#" role="button" data-toggle="dropdown"> <i
									class="dw dw-more"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
									<a class="dropdown-item" href="#"><i class="dw dw-eye"></i>
										View</a> <a class="dropdown-item" href="#"><i
										class="dw dw-edit2"></i> Edit</a> <a class="dropdown-item"
										href="#"><i class="dw dw-delete-3"></i> Delete</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-plus">Andrea J. Cagle</td>
						<td>20</td>
						<td>Sagittarius</td>
						<td>1280 Prospect Valley Road Long Beach, CA 90802</td>
						<td>29-03-2018</td>
						<td>
							<div class="dropdown">
								<a
									class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
									href="#" role="button" data-toggle="dropdown"> <i
									class="dw dw-more"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
									<a class="dropdown-item" href="#"><i class="dw dw-eye"></i>
										View</a> <a class="dropdown-item" href="#"><i
										class="dw dw-edit2"></i> Edit</a> <a class="dropdown-item"
										href="#"><i class="dw dw-delete-3"></i> Delete</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-plus">Andrea J. Cagle</td>
						<td>18</td>
						<td>Gemini</td>
						<td>1280 Prospect Valley Road Long Beach, CA 90802</td>
						<td>29-03-2018</td>
						<td>
							<div class="dropdown">
								<a
									class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
									href="#" role="button" data-toggle="dropdown"> <i
									class="dw dw-more"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
									<a class="dropdown-item" href="#"><i class="dw dw-eye"></i>
										View</a> <a class="dropdown-item" href="#"><i
										class="dw dw-edit2"></i> Edit</a> <a class="dropdown-item"
										href="#"><i class="dw dw-delete-3"></i> Delete</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-plus">Andrea J. Cagle</td>
						<td>30</td>
						<td>Sagittarius</td>
						<td>1280 Prospect Valley Road Long Beach, CA 90802</td>
						<td>29-03-2018</td>
						<td>
							<div class="dropdown">
								<a
									class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
									href="#" role="button" data-toggle="dropdown"> <i
									class="dw dw-more"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
									<a class="dropdown-item" href="#"><i class="dw dw-eye"></i>
										View</a> <a class="dropdown-item" href="#"><i
										class="dw dw-edit2"></i> Edit</a> <a class="dropdown-item"
										href="#"><i class="dw dw-delete-3"></i> Delete</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-plus">Andrea J. Cagle</td>
						<td>30</td>
						<td>Sagittarius</td>
						<td>1280 Prospect Valley Road Long Beach, CA 90802</td>
						<td>29-03-2018</td>
						<td>
							<div class="dropdown">
								<a
									class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
									href="#" role="button" data-toggle="dropdown"> <i
									class="dw dw-more"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
									<a class="dropdown-item" href="#"><i class="dw dw-eye"></i>
										View</a> <a class="dropdown-item" href="#"><i
										class="dw dw-edit2"></i> Edit</a> <a class="dropdown-item"
										href="#"><i class="dw dw-delete-3"></i> Delete</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-plus">Andrea J. Cagle</td>
						<td>30</td>
						<td>Gemini</td>
						<td>1280 Prospect Valley Road Long Beach, CA 90802</td>
						<td>29-03-2018</td>
						<td>
							<div class="dropdown">
								<a
									class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
									href="#" role="button" data-toggle="dropdown"> <i
									class="dw dw-more"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
									<a class="dropdown-item" href="#"><i class="dw dw-eye"></i>
										View</a> <a class="dropdown-item" href="#"><i
										class="dw dw-edit2"></i> Edit</a> <a class="dropdown-item"
										href="#"><i class="dw dw-delete-3"></i> Delete</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-plus">Andrea J. Cagle</td>
						<td>30</td>
						<td>Gemini</td>
						<td>1280 Prospect Valley Road Long Beach, CA 90802</td>
						<td>29-03-2018</td>
						<td>
							<div class="dropdown">
								<a
									class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
									href="#" role="button" data-toggle="dropdown"> <i
									class="dw dw-more"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
									<a class="dropdown-item" href="#"><i class="dw dw-eye"></i>
										View</a> <a class="dropdown-item" href="#"><i
										class="dw dw-edit2"></i> Edit</a> <a class="dropdown-item"
										href="#"><i class="dw dw-delete-3"></i> Delete</a>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-plus">Andrea J. Cagle</td>
						<td>30</td>
						<td>Gemini</td>
						<td>1280 Prospect Valley Road Long Beach, CA 90802</td>
						<td>29-03-2018</td>
						<td>
							<div class="dropdown">
								<a
									class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
									href="#" role="button" data-toggle="dropdown"> <i
									class="dw dw-more"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
									<a class="dropdown-item" href="#"><i class="dw dw-eye"></i>
										View</a> <a class="dropdown-item" href="#"><i
										class="dw dw-edit2"></i> Edit</a> <a class="dropdown-item"
										href="#"><i class="dw dw-delete-3"></i> Delete</a>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</div>
	<!-- Simple Datatable End -->

	<script>
		$(function() {
			$("#boardList tbody tr").click(
					function() {
						location.href = "detail.bo?bno="
								+ $(this).children().eq(0).text();
					});
		});
	</script>


	<jsp:include page="../common/footer.jsp" />
</body>
</html>