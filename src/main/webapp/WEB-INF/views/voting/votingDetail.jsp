<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <br><br>
        <div class="innerOuter">
            <h2>투표 상세보기</h2>
            <br>
            
            <br><br>
            <table id="contentArea" align="center" class="table">
             <tr>
                    <th width="100">작성자</th>
                    <td colspan="3">${ v.empId }</td>
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
            	<c:forEach var = "name" items ="${vContent }">
            	<tr><td ><p >${name}</p></td></tr>
            	</c:forEach>
                  <%--   <td colspan="4"><p style="height:150px">${ vContent[0] }</p></td> --%>
                </tr>
            </table>
            <br>     
            <br><br>

        </div>
        </div>
        <br><br>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>