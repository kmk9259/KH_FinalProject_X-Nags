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
								<h4>투표게시판 목록</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">투표게시판 목록</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>				
		<div class="pd-20 card-box mb-30">
			<div class="pd-20">	
				<c:if test="${ !empty loginUser }">
					<a class="btn btn-dark" style="float: right" data-toggle="modal" data-target="#myModal"
						href="enrollVoting.vo">투표함 만들기</a><br>
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
							<th>조회수</th>
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
									<td>${v.count}</td>
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
									href="voting.vo?currentPage=${ pi.currentPage-1 }">이전</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:choose>
								<c:when test="${ pi.currentPage ne p }">
									<li class="page-item"><a class="page-link"
										href="voting.vo?currentPage=${ p }">${ p }</a></li>
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
									href="voting.vo?currentPage=${ pi.currentPage+1 }">다음</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link"
									href="voting.vo?currentPage=${ pi.currentPage+1 }">다음</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>					
			</div>						 
		</div>	
<br><br>
 <jsp:include page="../common/footer.jsp" />  			
</div>
  <div class="modal fade" id="myModal">  
    <div class="modal-dialog">    
      <div class="modal-content"> 
        <div class="modal-header">         
          <h4 class="modal-title">투표함 만들기</h4>         
          <button type="button" class="close" data-dismiss="modal">&times;</button>          
        </div>
        <div id = "modalContent" class="modal-body">
        <form method="post" action="votingInsert.bo">
        <button id="emptyCheck" style = "float: right" class="btn btn-dark" type="submit">등록하기</button>
        <br>
        	<b style="font-size : 20px">주제 :</b>      	
        <input  type="text" class="form-control" id="check" name="votingTitle">
     	 <input type="hidden" name="empId" value="${loginUser.empId }">
     	<table id="example">
				<tr>
				<th>
				 <label><b style="font-size : 20px">항목 :</b></label>
				 </th>
					</tr>
					<tr >
					<td>
		 <input  type="text" class="form-control" id="check" style ="width:470px" name="votingContent">
		 <br>
					</td>								
					</tr>				
				</table>    	 
     	 </form>
        </div> 
        <br>
        <div class="modal-footer">      
           <button id="addItemBtn" class="btn btn-warning">항목추가하기</button>
		<button id="delBtn"  class="btn btn-danger">항목제거하기</button>    
		  </div>    
      </div>        
    </div>     	
  </div>
	<script>	
		$(function() {			
			$("#boardList tbody tr").click(function() {
				var result = $(this).children().eq(5).text();
				if(result == '이미 투표 하셨습니다'){
					alert("이미 투표 하신 게시글 입니다. 결과화면으로 이동합니다");
					location.href = "votingResult.vo?bno="
						+ $(this).children().eq(0).text();
				}else{
					location.href = "votingdetail.bo?bno="
						+ $(this).children().eq(0).text();
				}
			});
		});	
		$(document).ready(function() {
			$("#addItemBtn").click(function() {
			var value = "";
		 	value += "<tr><td><input type ='text' id ='check' class = 'form-control' style = 'width:470px' name = 'votingContent'><br></td></tr>"
		$("#example").append(value);
			});
		$("#delBtn").click(function() {
		$("#example tr:last").remove();
			})
		});
		$("#emptyCheck").click(function(){
			if($("#check").val() == ''){
				alert("빈 칸이 있습니다");
				return false;
			}else{
				return true;
			}
		})
	</script>
	</body>
</html>