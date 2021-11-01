<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            <h2>공지사항 수정하기</h2>
            <br>

            <form id="updateForm" method="post" action="noticeUpdate.bo" enctype="multipart/form-data">
            	<input type="hidden" name="noticeNo" value="${ n.noticeNo }">
            	<input type = "hidden" name = "empId" value = "${loginUser.empId }">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="noticeTitle" value="${ n.noticeTitle }" required></td>
                    </tr>

                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td>
                            <input type="file" id="upfile" class="form-control-file border" name="reUploadFile">
                            <c:if test="${ !empty n.originFile }">
	                                                               현재 업로드된 파일 : ${ n.originFile } <br>
	                            <input type="hidden" name="changeName" value="${ n.changeFile }">
	                            <input type="hidden" name="originName" value="${ n.originFile }">
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                        
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="noticeContent" id="content" rows="10" style="resize:none;">${ n.noticeContent }</textarea></th>
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
        <br><br>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>