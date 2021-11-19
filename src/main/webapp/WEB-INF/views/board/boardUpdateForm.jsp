<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Nomal Groupware Solution</title>
<style>
	#updateForm>table{width:100%;}
    #updateForm>table *{ margin:5px;}
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
<div class="mobile-menu-overlay"></div>
	<div class="main-container">
    <div class="content">
        <br><br>
        <div class="innerOuter">
        <div class="html-editor pd-20 card-box mb-30">
            <h2>게시글 수정하기</h2>
            <br>
		
            <form id="updateForm" method="post" action="update.bo" enctype="multipart/form-data">
            	<input type="hidden" name="boardNo" value="${ b.boardNo }">
            	<input type = "hidden" name = "empId" value = "${b.empId }">
            	<div class="form-group">
     			 <label><b style="font-size : 20px">제목 :</b></label>
    			  <input style = "height: 40px" type="text" class="form-control" id="check" name="boardTitle" value ="${ b.boardTitle }" required>
   						 </div>
   						 <div class="form-group">
     					 <label><b style="font-size : 20px">첨부파일</b></label>
     			 <input type="file" class="form-control-file border" id="upfile"  name="reUploadFile">
     			  <c:if test="${ !empty b.originFile }">
	                                                        현재 업로드된 파일 : ${ b.originFile } <br>
	                            <input type="hidden" name="changeName" value="${ b.changeFile }">
	                            <input type="hidden" name="originName" value="${ b.originFile }">
                            </c:if>
   							 </div>  		           	           	         	
                <table>                 
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>                        
                    </tr>
                    <tr>
                    <th colspan="2">
                    <textarea id = "contentCheck"class="textarea_editor form-control border-radius-0"  name = "boardContent" >${ b.boardContent }</textarea>
                       </th>
                    </tr>
                </table>
                <br>
                <div align="center">
                    <button id = "update" type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
        </div>
        </div>
        </div>
        
        <br><br>
    </div>
	<script >
	$("#update").click(function(){
		alert("수정되었습니다");
	})
	
	</script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>