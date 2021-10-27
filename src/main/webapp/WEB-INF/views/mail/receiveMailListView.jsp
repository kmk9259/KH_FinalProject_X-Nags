<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>X-Nomal Groupware Solution</title>
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
								<h4>받은 메일함</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">받은 메일함</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>


	<!-- Checkbox select Datatable start -->
				<div class="card-box mb-30">
					<div class="pd-20">
						<h4 class="text-blue h4">받은 메일함</h4>
					</div>
					<div class="pb-20">
						<table class="checkbox-datatable table nowrap">
							<thead>
								<tr>
									<th><div class="dt-checkbox">
											<input type="checkbox" name="select_all" value="1" id="example-select-all">
											<span class="dt-checkbox-label"></span>
										</div>
									</th>
									<th>중요표시</th>
									<th>읽음표시</th>
									<th>보낸사람</th>
									<th>제목</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td>Tiger Nixon</td>
									<td>System Architect</td>
									<td>Tokyo</td>
									<td>2008/11/28</td>
									<td>$162,700</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- Checkbox select Datatable End -->
				
				</div>
				</div>
				</div>

<jsp:include page="../common/footer.jsp" />
	
	<!-- buttons for Export datatable 
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/dataTables.buttons.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/buttons.print.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/buttons.html5.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/buttons.flash.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/pdfmake.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/vfs_fonts.js"></script>
	-->
	<!-- Datatable Setting js 
	<script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/datatable-setting.js"></script></body>
	-->

</body>
</html>