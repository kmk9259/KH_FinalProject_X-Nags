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
            <h2>공지사항 수정하기</h2>
            <br>
		
            <form id="updateForm" method="post" action="noticeUpdate.bo" enctype="multipart/form-data">
            	<input type="hidden" name="noticeNo" value="${ n.noticeNo }">
            	<input type = "hidden" name = "empId" value = "${n.empId }">
            	<div class="form-group">
     			 <label><b style="font-size : 20px">제목 :</b></label>
    			  <input style = "height: 40px" type="text" class="form-control" id="check" name="noticeTitle" value ="${ n.noticeTitle }" required>
   						 </div>
   						 <div class="form-group">
     					 <label><b style="font-size : 20px">첨부파일</b></label>
     			 <input type="file" class="form-control-file border" id="upfile"  name="reUploadFile">
     			  <c:if test="${ !empty n.originFile }">
	                                                        현재 업로드된 파일 : ${ n.originFile } <br>
	                            <input type="hidden" name="changeName" value="${ n.changeFile }">
	                            <input type="hidden" name="originName" value="${ n.originFile }">
                            </c:if>
   							 </div>  		           	           	         	
                <table>                 
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>                        
                    </tr>
                    <tr>
                    <th colspan="2">
                    <textarea id = "contentCheck"class="textarea_editor form-control border-radius-0"  name = "noticeContent" >${ n.noticeContent }</textarea>
                       </th>
                    </tr>
                </table>
                <br>
                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
        </div>
        </div>
        </div>
        
        <br><br>
    </div>
	
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>