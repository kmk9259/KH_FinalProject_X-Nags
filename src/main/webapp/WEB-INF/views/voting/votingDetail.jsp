<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Nomal Groupware Solution</title>
<style>
	#contentArea{width:100%}
	#contentArea *{margin:5px }
</style>
</head>

<body style = "background : white">

    <jsp:include page="../common/menubar.jsp"/>
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
    <div class="content">
    <div class="pd-20">
        <br><br>
        <div class="innerOuter">
            <h2>투표하기</h2>
            <br>
       
            <br><br>
            <form method = "post" action = "votingAction.vo">
           	<input type = "hidden" name = "votingNo" value = "${v.votingNo}">
           	<input type = "hidden" name = "empId" value = "${loginUser.empId}">
            <table id="contentArea"  class="table">
            <c:if test ="${result == 0 }">
             <tr>
                    <th width="100">작성자</th>
                    <td colspan="3" >${ v.userName }</td>
                </tr>
                <tr>
                    <th width="100">주제</th>
                    <td colspan="3">${ v.votingTitle }</td>
                   
                </tr>
              
                <tr>
                    <th>항목</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
            	<c:forEach var = "a" items ="${va}">
            	<tr >
            	
            	<td><input  type = "checkbox" name = "content" value = "${a.content }">${a.content }</td> 
            	   	
            	</tr>
            	</c:forEach>
                
                </tr>
                </c:if>
            </table>    
                   
			 <c:choose>	
 		   <c:when test="${result == 1}">
  			   <b>이미 투표 하셨습니다</b>
   			 </c:when>	
  			 <c:otherwise>
    		<input type = "submit" value = "투표하기">
  			 </c:otherwise>
		</c:choose>                  
            </form>         	
             <br>           
            <form id="postForm" action="votingResult.vo" method="post">
			<input type="hidden" name="bno" value="${v.votingNo}">	
			<c:if test ="${result == 1 }">	  
			<input type = "submit" value = "결과보러가기">
			  
			 </c:if>
			</form>
            <br>  
           <c:if test="${ loginUser.empId eq v.empId }">
	            <div align="center">

	                <button class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</button>
	            </div>
	            
	            <form id="postForm" action="" method="post">
					<input type="hidden" name="bno" value="${ v.votingNo }">				
				</form>
				<script>
				function postFormSubmit(){
					var postForm = $("#postForm");
						if(confirm("정말 삭제하시겠습니까?") == true){
							postForm.attr("action", "deleteVoting.vo");
							postForm.submit();
							alert("삭제되었습니다");
						}else{
							return;
							}					
						}				
					
				</script>
            </c:if> 
            <br><br>
		</div>
        </div>
        </div>
        <br><br>
    </div>

    <jsp:include page="../common/footer.jsp"/>
    <script >
    
    $(document).ready(function() {
	
    	$('input[type="checkbox"][name="content"]').click(function(){  	 
    	  if($(this).prop('checked')){    	 
    	     $('input[type="checkbox"][name="content"]').prop('checked',false);    	 
    	     $(this).prop('checked',true);
    	 
  	 	    }
    	 
       });
    	    	        	  
 });
    </script>
</body>
</html>