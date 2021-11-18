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

<style type="text/css">
#pagingArea{width:fit-content;margin:auto;}
#mailList>tbody>tr:hover {
	cursor: pointer;
}
</style>

</head>
<body>

<jsp:include page="../common/menubar.jsp" />

<c:if test="${ !empty msg }">
	<script>
		alert("${msg}");
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

		<!-- basic table  Start -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<!-- <input type="radio" onclick="important();"><label>중요메일만보기</label> -->
						</div>
						<div class="pull-right">
							<button type="button" onclick="waste();" class="btn btn-default"><i class="icon-copy ion-ios-trash"></i></button>
							<button type="button" onclick="reply();" class="btn btn-default"><i class="icon-copy ion-paper-airplane"></i></button>
												
						</div>
					</div>
					<div id="mailList">
					<table class="table table-striped hover mailList" id="mailList">
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" id="allCheck" name="allCheck" onclick="allCheck(event)"></th>
								<th scope="col"></th>
								<th scope="col"><i class="icon-copy ion-star"></i></th>
								<th scope="col"><i class="icon-copy ion-ios-email"></i></th>
								<th scope="col">보낸 사람</th>
								<th scope="col">제목</th>
								<th scope="col">날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ receiveList }" var="s">
								<tr>
									<td><input type="checkbox" class="checkMail" name="checkMail" onclick="checkMail(event)"></td>
									
									<td scope="row">${ s.mailNo }</td>
									
									<c:choose>
										<c:when test="${s.importantFlag == '1'}">
											<td><i class="icon-copy ion-star"></i></td>
										</c:when>
										<c:otherwise>
											<td></td>
										</c:otherwise>
									</c:choose>
									
									<c:choose>
										<c:when test="${s.readCount == '0'}">
											<td><i class="icon-copy ion-ios-email"></i></td>
										</c:when>
										<c:otherwise>
											<td><i class="icon-copy ion-ios-email-outline"></i></td>
										</c:otherwise>
									</c:choose>
									
									<td>${s.empId }</td>
									<td id="title">${s.title }</td>
									<td>${s.date }</td>
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
                			<li class="page-item"><a class="page-link" href="receiveList.ml?currentPage=${ pi.currentPage-1 }">이전</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="receiveList.ml?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="receiveList.ml?currentPage=${ pi.currentPage+1 }">다음</a></li>
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
				
				
				</div>
				</div>
				</div>
				
			
			
			<script>
				//상세보기로 넘어가야하는데 체크박스랑 충돌나서 바꾸려는데 잘 안됨,,,
				$(function(){
					$(".mailList tbody tr").click(function(){
						console.log($(".mailList tbody tr").children().eq(1).text());
						location.href="receiveDetail.ml?mno=" + $(this).children().eq(1).text();
						
					});
				});
				
				
				//전체선택
				function allCheck(e){
					if(e.target.checked){
						document.querySelectorAll(".checkMail").forEach(function(v, i){
							v.checked = true;
						});
					}else{
						document.querySelectorAll(".checkMail").forEach(function(v, i){
							v.checked = false;
						});
					}
				}
				
				//부분선택으로 전체 선택하면 전체선택 켜짐
				function checkMail(e){
					var checkCount = 0;
					document.querySelectorAll(".checkMail").forEach(function(v, i){
						if(v.checked == false){
							checkCount++;
						}
						
					});
					if(checkCount > 0){
						document.getElementById("allCheck").checked = false;
					}else if(checkCount == 0){
						document.getElementById("allCheck").checked = true;
					}
				}
				
				//휴지통이동
				function waste(){
					var confirmVal = confirm("선택한 메일을 휴지통으로 이동하시겠습니까?");
					
					if(confirmVal){
						var wasteList = new Array();
						var checkList = new Array();
						var checkMail = $("input[class=checkMail]:checked");
						
						checkMail.each(function(i){
							var tr = checkMail.parent().parent().eq(i);
							var td = tr.children();
							
							wasteList.push(tr.text());
							
							var mno = td.eq(1).text();
							
							checkList.push(mno);
							
						})
						
						location.href="wasteCheckedReceiveMail.ml?checkList="+checkList;
						alert("메일을 휴지통으로 이동했습니다.");
						
					}
				}
				
				
				
				//선택 메일 답장
				function reply(){
					//체크박스 여러개 선택했을 때 경고창
					
					
					
				}
				
			</script>
			
			
<jsp:include page="../common/footer.jsp" />

</body>
</html>