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
			
			<!-- 첨부파일도 등록할꺼니깐 Multipart/form-data encType 지정!! -->
            <form id="enrollForm" method="post" action="noticeInsert.bo" enctype="multipart/form-data">
             <input type = "hidden" name = "empId" value = "${loginUser.empId }">
                <table style = "text-align: center">             
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="noticeTitle" required></td>
                    </tr>

                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td><input type="file" id="upfile" class="form-control-file border" name="uploadFile"></td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="noticeContent" id="content" rows="10" style="resize:none;"></textarea></th>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger" onclick ="history.back();">취소하기</button>
                    
                </div>
            </form>
        </div>
        <br><br>
    </div>
</div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>