<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#contentArea{width:100%}
	#contentArea *{margin:5px }
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 상세보기</h2>
            <br>
            
            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${ b.boardTitle }</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${ b.uploadDate }</td>
                </tr>
                <tr>
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
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px">${ b.boardContent }</p></td>
                </tr>
            </table>
            <br>
		
			<c:if test="${ loginUser.empId eq b.empId }">
	            <div align="center">
	                <button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
	                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
	            </div>
	            
	            <form id="postForm" action="" method="post">
					<input type="hidden" name="bno" value="${ b.boardNo }">
				<input type="hidden" name="fileName" value="${ b.changeFile }">  
				</form>
				<script>
				function postFormSubmit(num){
					var postForm = $("#postForm");
					
					if(num == 1){
						postForm.attr("action", "updateForm.bo");
					}else{
						postForm.attr("action", "delete.bo");
					}
					postForm.submit();
					
					}
				</script>
            </c:if> 
      
            <br><br>
            
            

            <table id="replyArea" class="table"  >
                <thead>
                    <tr>
                    	<c:if test="${ !empty loginUser }">
	                        <th colspan="2" style="width:75%">
	                            <textarea class="form-control" id="replyContent" rows="2" style="resize:none; width:100%" placeholder="댓글을 입력해주세요"></textarea>
	                        </th>
	                        <th style="vertical-align: middle"><button class="btn btn-secondary" id="addReply">등록하기</button></th>
                        </c:if>
                        
                    </tr>
                    <tr>
                       <td colspan="3">댓글 (<span id="rcount">0</span>) </td> 
                    </tr>
                </thead>
                <tbody >
                
                </tbody>
            </table>
            <table id="replyArea1" class="table" style ="width:75% ; background :white">
            <thead >
            

            <tr style = "background : yellow">
            <th style ="width:10%; text-align : center">댓글번호</th>
            <th style ="width:10% ;text-align : center" >작성자</th>
            <th style ="width:50% ; text-align : center">내용</th>
            <th style ="width:25%; text-align : center">작성일</th>
       		<th style ="width:10%"></th>
       		
       		
            </tr>
            </thead>
            <tbody >

            </tbody>
            </table>
        </div>
        </div>
        <br><br>
    </div>
<div class="modal fade" id="modifyModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">댓글 수정창</h4>
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
							class="form-control" id="empId" name="empId"
							readonly>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-success modalModBtn">수정</button>
					<button type="button" class="btn btn-danger modalDelBtn">삭제</button>
				</div>
			</div>
		</div>
	</div>
	

     <script>
     var obj2 = "";
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
						console.log("댓글 작성 ajax 통신 실패");
					}
				});
				
			}else{
				alert("댓글등록하셈");
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
 	           
 	           console.log(rlist);
 	            $.each(list, function(i, obj){
 	            	rlist.push(obj);
 	            	
 	            	/* rlist.forEach(function(item){
 	            		console.log(i,item);
 	            	}); */
 	            	
                  value += "<tr style='background:white;'>"
 	                		 +"<td style = 'text-align : center'>"  + obj.replyNo + "</td>" 
 	                        +"<td style = 'text-align : center'> 익명 </td>" 
 	                         +"<td  style = 'text-align : center'>" + obj.replyContent + "</td>" 
 	                        + "<td style = 'text-align : center'>" + obj.replyDate + "</td>"; 
 	                                               
 	               if("${loginUser.empId}" == obj.empId){
 	            	  
 	                  value += "<td style = 'text-align : center '><button style ='width:80px' onclick = 'test("+obj.replyNo+");'type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>수정 </button>"
 	                  + "</td></tr>"; 
 	               }else{
 	                  value += "</tr>";	                  
 	               }  
 	             
 	            });
 	            $("#replyArea1 tbody").html(value);
 	          
 	         },error:function(){
 	            console.log("댓글 리스트조회용 ajax 통신 실패");
 	         }
 	      });      
 	   }
 	
 	
 	function test(replyNo){	 	 
 		for(var i = 0; i< rlist.length; i++){
 			if(replyNo == rlist[i].replyNo){
 				$("#replyNo").val(rlist[i].replyNo);
 				$("#updateContent").val(rlist[i].replyContent);
 				$("#empId").val("익명"); 	
 			}
 		}
 	}
 <%--

 	   function replyUpdate(replyNo){
 	      alert("kkkkkkkkkp");
 	      var value = "";
 	      value += "<textarea style ='width:80%'placeholder='수정할 내용을 입력해주세요'> </textarea>"
 	      $("#"+replyNo+"").html(value);
 	   }

 	
     
	--%>
    </script>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>