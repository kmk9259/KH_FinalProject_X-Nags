<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
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
	<div class="mobile-menu-overlay"></div>
	<div class="main-container">
	<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>투표하기 </h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item"><a href="">투표 상세</a></li>
									<li class="breadcrumb-item active" aria-current="page">투표하기</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
    <div class="content">
    <div class="card-box mb-30">
    <div class="pd-20">
        <div class="innerOuter">          
            <br>     
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
                </c:if>      
            </table>             
           <table  class="table table-bordered table-sm" >       
            <c:if test ="${result == 0 }">     
           <c:forEach var = "a" items ="${va}" varStatus="i">             
           <tr class ="table-warning">
              <td>
               <div class="form-group">
	          <div class="d-flex">
	              <div class="custom-control custom-radio mb-5 ">
	            <input type="radio" name = "content" id="check${i.index }" value = "${a.content }" class="custom-control-input">
	              <label class="custom-control-label weight-400" for="check${i.index }">${a.content }</label>
	          </div>
	        </div>
	        </div>	                                         
            </td>     	     	   	
           	</tr>            	      
           </c:forEach>
          	</c:if>
           </table>     
			 <c:choose>	
 		   <c:when test="${result == 1}">
  			   <b>이미 투표 하셨습니다</b>
   			 </c:when>	
		</c:choose>     
		<div align="center">
		 <input id = "emptyCheck" type = "submit" value = "투표하기" class="btn btn-dark">  
		 	 <c:if test="${ loginUser.empId eq v.empId }"> 
	<input class="btn btn-danger" type="button" id="delBtn" value="삭제하기">   	  
			<input type="hidden" name="bno" value="${ v.votingNo }">				
            </c:if> 
	   </div>	    
            </form>         	    
            <br>  
		</div>
        </div>
        </div>
        </div>
        <br><br>
            <jsp:include page="../common/footer.jsp"/>
    </div>
    <script >
    
    $(document).ready(function() {
    	$("#delBtn").click(function(){ 
    		if(confirm("정말 삭제하시겠습니까?") == true){
    			location.href = "deleteVoting.vo?bno="
    				+${v.votingNo};
    				
    			alert("삭제되었습니다");
    		}else{
    			return;
    			}							
    	})
    	$("#emptyCheck").click(function(){
    		if (!$("input:radio[name ='content']").is(":checked")){ 
    			alert("반드시 하나의 항목은 투표해야합니다");
    			return false; 
    			}else{
    				alert("투표 되었습니다");
    			}					
    	    });	    	        	  
     });  	
    </script>
</body>
</html>