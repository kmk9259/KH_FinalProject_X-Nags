<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%
Date d = new Date(); 
SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
int time = Integer.parseInt(sdf.format(d).substring(0, 2));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	 <% if(time >=9 && time<18){ %>
	<jsp:forward page="WEB-INF/views/attendance/attendanceLogin.jsp"/>
	<%} else{%>
	<jsp:forward page="WEB-INF/views/member/login.jsp"/>
	<%} %> 
	<!--  
	<jsp:forward page="WEB-INF/views/member/login.jsp"/>-->
</body>
</html>