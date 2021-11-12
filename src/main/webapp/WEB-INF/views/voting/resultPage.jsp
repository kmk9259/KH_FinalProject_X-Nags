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
                
               <%--비율 --%>
               <table border ="1">
              	 <c:set var ="avg" value ="0" />
                 <c:forEach var = "cntAvg" items ="${va}">                
                 <c:set var ="avg" value ="${ cntAvg.count /sum*100}"/>
                 <fmt:parseNumber var= "test" value ="${avg }" integerOnly ="true"/>
                 <%-- 
                 <th width="100">비율</th>
                <td> <c:out value ="${avg }" /> </td>                             
                </tr> 
                --%>     
                <tr >
                <c:out value = "${test }"/>
                <td >${cntAvg.content}</td>
                <td style = "background-color: red; width:${test}%"></td>
                <td>${cntAvg.count }</td>
                </tr>
                         
                 </c:forEach>
                 </table>
                 <%--              
                <tr>
                 <th width="100">비율</th>
                <td> <c:out value ="${avg }" /> </td>
                </tr>
                     
                     
                 <table style = "width :'${avg }'">
                 
                <tr>
                <td><p>${avg}</p></td>
            	<c:forEach var = "a" items ="${va}">
            	<tr>            	
            	<td style = "backgound = red"><p>${a.content }</p></td> 
            	<td><p>${a.count }</p></td>           	   	
            	</tr>
            	</c:forEach>               
                </tr>
            </table>
          --%>
		</div>
        </div>
        </div>
        <br><br>
    </div>

    <jsp:include page="../common/footer.jsp"/>

</body>
</html>