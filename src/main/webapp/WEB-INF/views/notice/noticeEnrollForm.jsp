<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Nomal Groupware Solution</title>
<style>
 	#enrollForm>table{width:100%;}
    #enrollForm>table *{ margin:5px;}
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
<div class="mobile-menu-overlay"></div>

	<div class="main-container">
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>공지사항 작성하기</h2>
            <br>
			<div class="html-editor pd-20 card-box mb-30">
			<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
            <form id="enrollForm" method="post" action="noticeInsert.bo" enctype="multipart/form-data">
             <input type = "hidden" name = "empId" value = "${loginUser.empId }">
             <div class="form-group">
     			 <label><b style="font-size : 20px">제목 :</b></label>
    			  <input style = "height: 40px" type="text" class="form-control" id="check" name="noticeTitle">
   						 </div>
   						 <div class="form-group">
     					 <label><b style="font-size : 20px">첨부파일</b></label>
     			 <input type="file" class="form-control-file border" id="upfile"  name="uploadFile">
   							 </div>  							 
                <table style = "text-align: center">                             
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea id = "contentCheck"class="textarea_editor form-control border-radius-0"  name = "noticeContent"  ></textarea>
                        </th>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" id = "emptyCheck" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger" onclick ="history.back();">취소하기</button>
                    
                </div>
            </form>
            </div>
        </div>
        <br><br>
    </div>
</div>
<script>
$("#emptyCheck").click(function(){
	if($("#check").val() == ''){
		alert("제목 좀 작성해 주세요");
		return false;
	}else{
		return true;
	}
})

$("#emptyCheck").click(function(){
	if($("#contentCheck").val() == ''){
		alert("내용 좀 작성해 주세요");
		return false;
	}else{
		return true;
	}
})
</script>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>