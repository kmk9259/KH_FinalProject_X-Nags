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
	.zt-skill-bar {
        color: white;
        font-size: 20px;
        line-height: 35px;
        height: 35px;
        margin-bottom: 2px;
 		
        background-color: rgba(0,0,0,0.1);
 
        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
            -ms-border-radius: 2px;
                border-radius: 2px;
 
    }
 
    .zt-skill-bar * {
    
        webkit-transition: all 0.5s ease;
          -moz-transition: all 0.5s ease;
           -ms-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
               transition: all 0.5s ease;
    }
 
    .zt-skill-bar div {
        background-color: #ffc600;
        position: relative;
        padding-left: 25px;
        width: 0;
 		margin-top :2em;
        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
           -ms- border-radius: 2px;
                border-radius: 2px;
    }
 
    .zt-skill-bar span {
        display: block;
        position: absolute;
        right: 0;
        top: 0;
        height: 100%;
        padding: 0 5px 0 10px;
        background-color: #1a1a1a;
 
        -webkit-border-radius: 0 2px 2px 0;
           -moz-border-radius: 0 2px 2px 0;
            -ms-border-radius: 0 2px 2px 0;
                border-radius: 0 2px 2px 0;
    }
 .zt-skill-bar span:before {
        content: "";
        position: absolute;
        width: 6px;
        height: 6px;
        top: 50%;
        left: -3px;
        margin-top: -3px;
        background-color: #1a1a1a;

        -webkit-transform: rotate(45deg);
           -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
                transform: rotate(45deg);
    }
   .per{
        position: relative;
        top: 0;       
        height: 100%;
        padding: 5.5px 5px 5.5px 10px;
        background-color: #1a1a1a;
        -webkit-border-radius: 0 2px 2px 0;
           -moz-border-radius: 0 2px 2px 0;
            -ms-border-radius: 0 2px 2px 0;
                border-radius: 0 2px 2px 0;
   }
   .per:before{
        content: "";
        position: absolute;
        width: 6px;
        height: 6px;
        top: 50%;
        left: -3px;
        margin-top: -3px;
        background-color: #1a1a1a;

        -webkit-transform: rotate(45deg);
           -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
                transform: rotate(45deg);
   }
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
								<h4>투표 결과보기 </h4>							
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item"><a href="">투표게시판 목록</a></li>
									<li class="breadcrumb-item active" aria-current="page">투표 결과보기</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
    <div class="content">
    <div class="pd-20 card-box mb-30">    
             <table id="contentArea"  class="table">
             <tr>
                    <th width="100">작성자</th>
                    <td colspan="3" >${loginUser.userName}</td>
                </tr>
                <tr>
                    <th width="100">주제</th>
                    <td colspan="3">${ v.votingTitle }</td>                   
                </tr>          
                 <c:set var ="sum" value ="0" />
                 <c:forEach var = "cntSum" items ="${va }">                
                 <c:set var ="sum" value ="${sum + cntSum.count }"/>               
                 </c:forEach>              
                <tr>
                 <th width="100">총 투표수</th>
                <td > <c:out value ="${sum }" /> </td>
                </tr>
                </table>        
                     <div class = "zt-span6 last"> 
              	 <c:set var ="avg" value ="0" />
                 <c:forEach var = "cntAvg" items ="${va}">                
                 <c:set var ="avg" value ="${ cntAvg.count /sum*100}"/>
                 <fmt:parseNumber var= "test" value ="${avg }" integerOnly ="true"/>      
                <div  class = "zt-skill-bar" style = "width:100%">       
               <c:if test ="${test == 0 }">   
                <div style = "width:auto; background: #ecf0f4">    
               <b style ="color:black"> ${test}%</b>
                  </div>
                  <b style = "color : black; text-align: left">${cntAvg.content}</b>
               <b style = "margin-right:1em; color :blue" >${cntAvg.count }표 </b>
               <br>
               </c:if>     
               <c:if test ="${test > 0 && test <= 97}">	
               	<div style = "width:${test +3}%; text-align:right ">            
               	 <b style ="color:black"> ${test}% &nbsp;</b>       		
               	</div>              	 
              	<b style = "color : black; text-align: left">${cntAvg.content}</b>                
               	<b style = "margin-right:1em;color :blue" >${cntAvg.count }표</b>     
             	 </c:if>      	         
                <c:if test ="${test > 97 }">	
               <div style = "width:${test}%; text-align:right ">            
               	 <b style ="color:black"> ${test}% &nbsp;</b>       		
               	</div>              	 
              	<b style = "color : black; text-align: left">${cntAvg.content}</b>                
               	<b style = "margin-right:1em;color :blue" >${cntAvg.count }표</b>  
                   </c:if> 
                  </div>                                     
                 </c:forEach>               
                 </div>   
                 <br><br>
                  <button class="btn btn-dark"  id = "list">목록으로</button>
                 <c:if test="${ loginUser.empId eq v.empId }"> 
				<input class="btn btn-danger" type="button" id="delBtn" value="삭제하기">  
				<input type="hidden" name="bno" value="${ v.votingNo }">				
            </c:if> 
        </div>  
        </div>
         <jsp:include page="../common/footer.jsp"/>
    </div>
<script>
$("#delBtn").click(function(){ 
	if(confirm("정말 삭제하시겠습니까?") == true){
		location.href = "deleteVoting.vo?bno="
			+${v.votingNo};			
		alert("삭제되었습니다");
	}else{
		return;
		}							
})
$(function() {
	$("#list").click(
			function() {
				location.href = "voting.vo"			
			});
});
</script>
</body>
</html>