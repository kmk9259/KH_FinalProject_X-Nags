<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menubar.jsp"/>
	
	<br>
	<div align="center">	
		<br><br><br>
		<img src="${ pageContext.servletContext.contextPath }/resources/images/error.png" width="300">
		<br><br><br><br>
		<h3 style="font-weight:bold">${ msg }</h3>
		<h3 style="font-weight:bold">${ ref_form }</h3>
		<h5 style="color: red;"> ${ requestScope['javax.servlet.error.message'] }</h5>
		<form action="loginerror" method="post">
			<input class="btn btn-primary btn-lg btn-block" type="submit" value="이전으로" style="width: 300px">							
		</form>
	
		<!-- 
		  - javax.servlet.error.status_code (오류 상태 코드)
		  - javax.servlet.error.message (오류 메시지)
		  - javax.servlet.error.request_uri (오류가 발생한 요청 URI)
		  - javax.servlet.error.exception (발생한 예외처리 내용)
		  - javax.servlet.error.servelt_name (오류가 발생한 Servlet)
		
		
		 -->
	</div>
	<br>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>