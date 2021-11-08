<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Nomal Groupware Solution</title>
<style>
#enrollForm>table {
	width: 100%;
}

#enrollForm>table * {
	margin: 5px;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="content">
			<div align="center">
				<br />
				<h2>투표프로그램</h2>
				<hr width="600" />
				
				<hr width="600" />
				<form name="frm" method="post" action="pollInsertProc.jsp">
					<table border="1" width="500" id ="content">
						<tr>
							<td><b>주제</b></td>
							<td colspan="2"><input name="question" size="30"></td>
						</tr>
						
						<tr>
							<td rowspan="10"><b>항목</b></td>
							<td><button type = "button" onclick = "addContent();">항목추가</button></td>
							<%--
								for (int i = 1; i <= 4; i++) {
								out.println("<td>" + (i * 2 - 1) + ": <input name='item'></td>");
								out.println("<td>" + (i * 2) + ": <input name='item'></td>");
								out.println("</tr>");
								if (i == 9) {
									out.println("");
								} else {
									out.println("<tr>");
								}
							} 
							--%>
						</tr>
</table>
 <input type="button" value="작성하기" onclick="">
 <input type="reset" value="모두 지우기"> 
 <input type="button" value="리스트" onClick=""> 
</form>
</div>
</div>
</div>
<script>
function addContent(){
	var value = "";
	value += "<td><input type = 'text' name = 'content'></td>"
	
	("#content").html(value);
}
</script>
    
<jsp:include page="../common/footer.jsp" />
</body>
						
</html>