<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>X-Normal GroupWare Solution</title>
<style type="text/css">
#pagingArea{width:fit-content;margin:auto;}
#appList>tbody>tr:hover {
	cursor: pointer;
}
table{
	text-align: center;
}
#ok{
color: green;
}
#no{
color: red;
}
</style>
</head>
<body>

<jsp:include page="../common/menubar.jsp" />

<c:if test="${ !empty msg }">
	<script>
		swal("${msg}")
	</script>
	<c:remove var="msg" scope="session"/>
</c:if>


<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>결재 요청 문서함</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">결재 요청 문서함</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

		<!-- basic table  Start -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							
						</div>
					</div>
					<div id="mailList">
					<table class="table appList table-striped" id="appList">
						<thead>
							<tr>
								<th scope="col">문서 번호</th>
								<th scope="col">문서 종류</th>
								<th scope="col">기안자</th>
								<th scope="col">제목</th>
								<th scope="col">작성일</th>
								<th scope="col">기안일</th>
								<th scope="col">중간 결재 상태</th>
								<th scope="col">최종 결재 상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ appList }" var="app">
								<tr>
									
									<td scope="row">${app.appNo }</td>
									
									<c:choose>
		              					<c:when test="${app.category eq 1 }">
											<td scope="row">휴가 신청서</td>
										</c:when>
			              				<c:when test="${app.category eq 2 }">
											<td scope="row">반차 신청서</td>
										</c:when>
			              				<c:when test="${app.category eq 3 }">
											<td scope="row">외근 신청서</td>
										</c:when>
			              				<c:when test="${app.category eq 4 }">
											<td scope="row">증명서 신청서(재직증명서)</td>
										</c:when>
			              				<c:when test="${app.category eq 5 }">
											<td scope="row">증명서 신청서(급여명세서)</td>
										</c:when>
			              				<c:when test="${app.category eq 6 }">
											<td scope="row">증명서 신청서(기타)</td>
										</c:when>
		             			 	</c:choose>
									
									<td>${app.empId }</td>
									<td>${app.title }</td>
									
									<td><fmt:formatDate type="date" dateStyle="short" value="${app.writeDate }"/></td>
									<td><fmt:formatDate type="date" dateStyle="short" value="${app.endDate }"/></td>
								
									<c:if test="${app.midStatus eq 1}">
										<td scope="row"><i class="icon-copy ion-ios-circle-outline"></i></td>
									</c:if>
									<c:if test="${app.midStatus eq 2}">
										<td scope="row"><i class="icon-copy ion-ios-checkmark" id="ok"></i></td>
									</c:if>
									<c:if test="${app.midStatus eq 3}">
										<td scope="row"><i class="icon-copy ion-ios-close" id="no"></i></td>
									</c:if>
									
									<c:if test="${app.finStatus eq 1}">
										<td scope="row"><i class="icon-copy ion-ios-circle-outline"></i></td>
									</c:if>
									<c:if test="${app.finStatus eq 2}">
										<td scope="row"><i class="icon-copy ion-ios-checkmark" id="ok"></i></td>
									</c:if>
									<c:if test="${app.finStatus eq 3}">
										<td scope="row"><i class="icon-copy ion-ios-close" id="no"></i></td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
					
					
										
				<!-- 페이징 시작 -->							
				 <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="askapp.ap?currentPage=${ pi.currentPage-1 }">이전</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="askapp.ap?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="askapp.ap?currentPage=${ pi.currentPage+1 }">다음</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">다음</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            <!-- 페이징끝 -->
            
            </div>
			</div>
									
									
				<!-- basic table  End -->
				
				<jsp:include page="../common/footer.jsp" />
				</div>
				</div>
				</div>
				
				
<script type="text/javascript">
	$(function(){
		$(".appList tbody tr").click(function(){
			location.href="askDetail.ap?ano=" + $(this).children().eq(0).text();
		});
	});
</script>

</body>
</html>