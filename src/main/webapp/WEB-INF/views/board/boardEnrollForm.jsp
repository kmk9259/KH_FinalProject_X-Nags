<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Normal GroupWare Solution</title>
<style>
 	#enrollForm>table{width:100%;}
    #enrollForm>table *{ margin:5px;}
</style>
</head>
<body style = "background: #ecf0f4">
    <jsp:include page="../common/menubar.jsp"/>
<div class="mobile-menu-overlay"></div>
	<div class="main-container">	
	<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>게시글 작성하기</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">게시글 작성하기</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
    <div class="content">
        <div class="innerOuter">          
			<div class="pd-20 card-box mb-30">
            <form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data">
             <input type = "hidden" name = "empId" value = "${loginUser.empId }">
              <div class="form-group">
     			 <label><b style="font-size : 20px">제목 :</b></label>
    				  <input style = "height: 40px" type="text" class="form-control" id="check" name="boardTitle">
   						 </div>
   						 <div class="form-group">
     						 <label><b style="font-size : 20px">첨부파일</b></label>
     			 <input type="file" class="form-control-file border" id="upfile"  name="uploadFile">
   						 </div>
                <table style = "text-align: center">                            
                    <tr>
                        <th colspan="2"><label for="content"><b style="font-size : 20px">내용</b></label></th>
                    </tr>
                     <tr>
                        <th colspan="2"><textarea id = "contentCheck"class="textarea_editor form-control border-radius-0"  name = "boardContent"  ></textarea>
                        </th>
                    </tr>
                </table>
                <br>
                <div align="center">
                    <button type="submit" id = "emptyCheck" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
            </div>
        </div>
        <br><br>
    </div>
        <jsp:include page="../common/footer.jsp"/>
</div>
<script>
$("#emptyCheck").click(function(){
	if($("#check").val() == ''){
		alert("제목을 작성해 주세요");
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

</body>
</html>