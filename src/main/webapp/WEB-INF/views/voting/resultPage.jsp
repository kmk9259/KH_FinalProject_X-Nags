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
            <h2>투표 결과보기</h2>
             <table id="contentArea"  class="table">
             <tr>
                    <th width="100">작성자</th>
                    <td colspan="3" >${loginUser.userName}</td>
                </tr>
                <tr>
                    <th width="100">주제</th>
                    <td colspan="3">${ v.votingTitle }</td>
                   
                </tr>
                
                <%-- 조회수 총합 --%>
                
                 <c:set var ="sum" value ="0" />
                 <c:forEach var = "cntSum" items ="${va }">                
                 <c:set var ="sum" value ="${sum + cntSum.count }"/>               
                 </c:forEach>              
                <tr>
                 <th width="100">총 투표수</th>
                <td> <c:out value ="${sum }" /> </td>
                </tr>
                </table>
             <%-- ----------------------------------------------------------------- --%>
          
                 
                 
                   <%--비율 --%>
              
                     <div class = "zt-span6 last"> 
              	 <c:set var ="avg" value ="0" />
                 <c:forEach var = "cntAvg" items ="${va}">                
                 <c:set var ="avg" value ="${ cntAvg.count /sum*100}"/>
                 <fmt:parseNumber var= "test" value ="${avg }" integerOnly ="true"/>
                        
                
                <div  class = "zt-skill-bar">
               
               	<div style = "width:${test}% "><b style = "color : white; text-align: left; vertical-align:middle">${cntAvg.content}</b><span ><b style =  "vertical-align:middle">${test}%</b> </span>
               	
               		
               	</div>
               <b style = "color :blue" >${cntAvg.count }표</b> 
               	 </div>                       
               
                        
                        
                 </c:forEach>               
                 </div>   
		</div>
        </div>
        </div>
        <br><br>
       <button id = "list">목록으로</button>
    </div>
   <%--  
               <%--비율 
               <table border ="1">
               
              	 <c:set var ="avg" value ="0" />
                 <c:forEach var = "cntAvg" items ="${va}">                
                 <c:set var ="avg" value ="${ cntAvg.count /sum*100}"/>
                 <fmt:parseNumber var= "test" value ="${avg }" integerOnly ="true"/>
                
                 <th width="100">비율</th>
                <td> <c:out value ="${avg }" /> </td>                             
                </tr> 
               
                     
                <tr style = "width:100%">
                
                <c:out value = "${test }"/>
                <td >${cntAvg.content}</td>
                <td style = "background-color: red; width:${test}%"></td>
                <td>${cntAvg.count }</td>
                </tr>
                         
                 </c:forEach>
                 </table>
                 --%>
    <jsp:include page="../common/footer.jsp"/>
<script>

$(function() {
	$("#list").click(
			function() {
				location.href = "voting.vo"
					
			});
});
</script>
</body>
</html>