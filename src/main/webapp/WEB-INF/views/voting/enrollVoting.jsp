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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>


<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="innerOuter">
			<h2>투표하기</h2>
			<br> <br>
			<br>
			<form method="post" action="votingInsert.bo">
				<input type="hidden" name="empId" value="${loginUser.empId }">
				주제 :<input type="text" name="votingTitle"  id = "check">
				<table id="example">
					<tr>
						<th>항목</th>
					</tr>
					<tr class="item1">
						<td><input id = "check" type="text" style='width: 500px'
							name="votingContent"></td>
					</tr>
				</table>
				<button id="emptyCheck" type="submit">등록하기</button>
			</form>
			<button id="addItemBtn">항목추가하기</button>
			<button id="delBtn">항목제거하기</button>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$("#addItemBtn").click(function() {
			var value = "";
		 	value += "<tr><td><input type ='text' id ='check' style = 'width:500px' name = 'votingContent'></td></tr>"
		$("#example").append(value);
			});
		// 삭제버튼 클릭시
		$("#delBtn").click(function() {
		$("#example tr:last").remove();
				})
		});
		$("#emptyCheck").click(function(){
			if($("#check").val() == ''){
				alert("빈 칸이 있습니다");
				return false;
			}else{
				return true;
			}
		})
		
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>

</html>