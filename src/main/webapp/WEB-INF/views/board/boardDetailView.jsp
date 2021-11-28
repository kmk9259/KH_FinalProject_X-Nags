<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Normal GroupWare Solution</title>
<style>
	#contentArea{width:100%}
	#contentArea *{margin:5px }
</style>
</head>
<body style = "background: #ecf0f4">
    <jsp:include page="../common/menubar.jsp"/>
    <div class="main-container">    
    <div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>익명게시판 상세보기</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item"><a href="">익명게시판 목록</a></li>
									<li class="breadcrumb-item active" aria-current="page">익명게시판 상세보기</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
	<div class="mobile-menu-overlay"></div>	
    <div class="content">
    <div class="pd-20 card-box mb-30">    
        <div class="innerOuter">             
            <table id="contentArea" align="center" class="table ">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${b.boardTitle }</td>
                </tr>
                <tr >
                    <th>작성일</th>
                    <td>${ b.uploadDate }</td>
                </tr>
                <tr  >
                    <th>첨부파일</th>
                    <td colspan="3">
                    	<c:if test="${ !empty b.originFile }">
                        	<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${b.changeFile}" download="${ b.originFile }">${ b.originFile }</a>
                        </c:if>
                        <c:if test="${ empty b.originFile }">
                        	첨부파일이 없습니다.
                        </c:if>
                    </td>
                </tr>
                <tr >
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4">${b.boardContent }</td>
                </tr>
            </table>
			<c:if test="${ loginUser.empId eq b.empId }">
	            <div align="center">
	                <button class="btn btn-info" onclick="postFormSubmit(1);">수정하기</button>
	                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
	            </div>
	            <br><br>
	            <form id="postForm" action="" method="post">
					<input type="hidden" name="bno" value="${ b.boardNo }">
				<input type="hidden" name="fileName" value="${ b.changeFile }">  
				</form>
				<script>
				function postFormSubmit(num){
					var postForm = $("#postForm");					
					if(num == 1){
						postForm.attr("action", "updateForm.bo");
						postForm.submit();				
					}else{
						if(confirm("정말 삭제하시겠습니까?") == true){
							postForm.attr("action", "delete.bo");
							postForm.submit();
							alert("삭제되었습니다");
						}else{
							return;
						}				
					}
				}
				</script>
            </c:if> 
      </div>
        </div>
        </div>
            <br>
	<div class="card-box mb-30">
            <table id="replyArea" class="table"  >
                <thead>
                    <tr>
                    	<c:if test="${ !empty loginUser }">
	                        <th colspan="2" style="width:75%">
	                            <textarea class="form-control" id="replyContent" rows="1" style="resize:none; width:100%" placeholder="댓글을 입력해주세요"></textarea>
	                        </th>
	                        <th style="vertical-align: middle"><button class="btn btn-dark" id="addReply">등록하기</button></th>
                        </c:if>
                        
                    </tr>
                    <tr>
                       <td colspan="3">댓글 (<span id="rcount">0</span>) </td> 
                    </tr>
                </thead>
                <tbody >             
                </tbody>
            </table>           
            </div>
           <div class="card-box mb-30">
           <table id="replyArea1" class="table" >
            <thead class ="thead-dark">
            <tr >         
            <th  style = 'text-align : center'>작성자</th>
            <th style = 'text-align : center'>내용</th>
            <th style = 'text-align : center' >작성일</th>
       		<th></th>
       		<th></th>
            </tr>
            </thead>
            <tbody >		
            </tbody>
            </table>                
        </div>  
    <jsp:include page="../common/footer.jsp"/>
       <br>
    </div>
<div class="modal fade" id="modifyModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>					
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="reply_no">댓글 번호</label> <input class="form-control"
							id="replyNo" name="replyNo"  readonly>
					</div>
					<div class="form-group">
						<label for="reply_text">댓글 내용</label> <input class="form-control"
							id="updateContent" name="replyContent" placeholder="댓글 내용을 입력해주세요">
					</div>
					<div class="form-group">
					<label for="reply_writer">댓글 작성자</label> <input
							class="form-control" id="empId" name="empId" readonly>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-dark"
					data-dismiss="modal">닫기</button>
				<button type="button"  class="btn btn-success modalModBtn">수정</button>
					
			</div>
		</div>
	</div>
</div>
     <script>
     var rlist = [];
 	$(function(){
		selectReplyList();		
		$("#addReply").click(function(){
    		var bno = ${b.boardNo};			
			if($("#replyContent").val().trim().length != 0){				
				$.ajax({
					url:"rinsert.bo",
					type:"post",
					data:{replyContent:$("#replyContent").val(),
						boardNo:bno,
						  empId:"${loginUser.empId}"},
						  
					success:function(result){
						if(result > 0){
							$("#replyContent").val("");
							selectReplyList();
							
						}else{
							alert("댓글등록실패");
						}
					},error:function(){
						alert("댓글 작성 ajax 통신 실패");
					}
				});
				
			}else{
				alert("댓글을 입력해주세요");
			}
			
		});
	});
 	function selectReplyList(){
 	      var bno = ${b.boardNo};
 	      $.ajax({
 	         url:"rlist.bo",
 	         data:{bno:bno},
 	         type:"get",
 	         success:function(list){
 	            $("#rcount").text(list.length);	            
 	            var value="";
 	            $.each(list, function(i, obj){
 	            	rlist.push(obj);
 	                  value += "<tr class = 'table-warning'>" 	                		
 	                        +"<td style = 'text-align : center'> 익명 </td>" 
 	                         +"<td style = 'text-align : center'>" + obj.replyContent + "</td>" 
 	                        + "<td style = 'text-align : center'>" + obj.replyDate + "</td>"; 	                       
 	               if("${loginUser.empId}" == obj.empId){
 	            	  value +="<td><button class = 'btn btn-outline-info' onclick = 'updateForm("+obj.replyNo+");'type='button'data-toggle='modal' data-target='#modifyModal'>수정</button> </td>"
              	    	 + "<td><button class = 'btn btn-outline-danger' onclick = 'deleteReply("+obj.replyNo+");'>삭제 </button>"
               				 + "</td></tr>"; 
 	               }else{
 	                  value += "<td></td><td></td></tr>";
 	               }               
 	            });
 	            $("#replyArea1 tbody").html(value);
 	         },error:function(){
 	           alert("댓글 리스트조회용 ajax 통신 실패");
 	         }
 	      }); 	      	      
 	   }	
 	function updateForm(replyNo){	 
 		for(var i = 0; i< rlist.length; i++){
 			if(replyNo == rlist[i].replyNo){
 				$("#replyNo").val(rlist[i].replyNo);
 				$("#updateContent").val(rlist[i].replyContent);
 				$("#empId").val("익명"); 
 				}	
 			}
		 };
		 	$(".modalModBtn").on("click", function(){
		 		var reply = $(this).parent().parent();
		 		var replyNo = reply.find("#replyNo").val();
		 		var replyContent = reply.find("#updateContent").val();
		 		$.ajax({
					url:"updateReply.bo",
		 			type:"get",
		 			data:{replyContent:replyContent,
		 					replyNo:replyNo},				
		 					success :function(result){ 						
		 						if(result > 0){
		 							alert("댓글수정 성공");
		 							$("#modifyModal").modal("hide");	
		 							selectReplyList();
		 						}else{
		 							alert("댓글 수정 실패");
		 						}
		 				
		 					}
		 			});
		 	});	   
		 	function deleteReply(replyNo){
		 		if(confirm("정말 삭제하시겠습니까?") == true){
		 			$.ajax({
			 			url:"deleteReply.bo",
			 			type:"get",
			 			data:{replyNo:replyNo},
			 			success :function(result){
			 				if(result > 0){	
			 						alert("삭제되었습니다");
				 					selectReplyList();				 									
			 				}else{
			 					alert("삭제 실패");
			 				}
			 			}
			 		});
		 		}else{
		 		return;
		 	}		 			
	 	}
    </script>
</body>
</html>