<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Normal GroupWare Solution</title>
<style>
#enrollForm>table {
	width: 100%;
}

#enrollForm>table * {
	margin: 5px;
}
</style>
</head>
<body style = "background: #ecf0f4">
	<jsp:include page="../common/menubar.jsp" />
	<div class="mobile-menu-overlay"></div>
	<div class="main-container">
	<br><br>
	 <div class="card-box mb-30">
		<div class="innerOuter">	
			<h2>투표하기</h2>
			<br> <br>
			<br>
			<form method="post" action="votingInsert.bo">
			 <div class="form-group">
     	 <label><b style="font-size : 20px">주제 :</b></label>
     	 <input  type="text" class="form-control" id="check" name="votingTitle" style = "height: 40px">
     	 <input type="hidden" name="empId" value="${loginUser.empId }">
   				 </div>
				<table id="example">
				<tr>
				<th>
				 <label><b style="font-size : 20px">항목 :</b></label>
				 </th>
					</tr>
					<tr class="item1">
					<td>
					 <input  type="text" class="form-control" id="check" name="votingContent" style = "width:500px;height: 30px">
					 <br>
					</td>								
					</tr>				
				</table>			
				<button id="emptyCheck"  class="btn btn-dark" type="submit">등록하기</button>		
			</form>
			<br>
			<button id="addItemBtn" class="btn btn-warning">항목추가하기</button>
			<button id="delBtn"  class="btn btn-danger">항목제거하기</button>
		</div>
		</div>
			<jsp:include page="../common/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$("#addItemBtn").click(function() {
			var value = "";
		 	value += "<tr><td><input type ='text' id ='check' class = 'form-control' style = 'width:500px; height: 30px' name = 'votingContent'><br></td></tr>"
		$("#example").append(value);
			});
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
</body>

</html>