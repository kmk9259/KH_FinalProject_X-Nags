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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
     

<body>
	<jsp:include page="../common/menubar.jsp" />
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
	<form  method="post" action="votingInsert.bo">
	<input type = "hidden" name = "empId" value = "${loginUser.empId }">	
	주제 :<input type = "text" name = "votingTitle">
<table id="example" >
        <tr>
            <th>항목</th> 			          
      </tr>
        <tr class="item1">      
            <td><input type="text" style = 'width:500px' name = "votingContent"></td>                 
        </tr>
</table>
<button id = "votingNo" type = "submit">등록하기</button>
</form>
 <button id="addItemBtn">항목추가하기</button>
 <button id="delBtn">항목제거하기</button>	
</div>
<script >

$(document).ready(function(){
    $("#addItemBtn").click(function(){
        var value = "";
        value += "<tr><td><input type ='text' style = 'width:500px' name = 'votingContent'></td></tr>"
        $("#example").append(value);        
    });
     
    // 삭제버튼 클릭시
   $("#delBtn").click(function(){
	   $("#example tr:last").remove();
   })
   

});

</script>  
<jsp:include page="../common/footer.jsp" />
</body>
						
</html>