<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>X-Nomal Groupware Solution</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- Site favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="${ pageContext.servletContext.contextPath }/resources/vendors/images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${ pageContext.servletContext.contextPath }/resources/vendors/images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/vendors/images/favicon-16x16.png">
    
    
<style>
.item{
border : none;
width: 80px;
background-color: white;
}
.count{
border : none;
width: 20px;
background-color: white;
}
#fromDate, #toDate{
border : none;
background-color: white;
resize: vertical;
width:100px;
}

#meeting{
text-align: center;
}

#myTable> tbody>tr> td{
width: 50%;
}

#myTable> tbody>tr> td{
width: 50%;
}

.profile-pic {
    max-width: 200px;
    max-height: 200px;
    display: block;
   
}

.file-upload {
    display: none;
}
.circle {
    border-radius: 1000px !important;
    overflow: hidden;
    width: 128px;
    height: 128px;
    border: 8px solid rgba(255, 255, 255, 0.7);
    position: absolute;
    top: 72px;
}
img {
    max-width: 100%;
    height: auto;
}
.p-image {
  position: absolute;
  top: 167px;
  right: 30px;
  color: #666666;
  transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
}
.p-image:hover {
  transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
}
.upload-button {
  font-size: 1.2em;
}

.upload-button:hover {
  transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
  color: #999;
}

</style>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>

    <div class="mobile-menu-overlay"></div>

    <div class="main-container">
        <div class="pd-ltr-20 xs-pd-20-10">
            <div class="min-height-200px">
			<form action="update.me" method="post" enctype="multipart/form-data" id="postForm">
			<%-- <input type="hidden" name="empId" value="${ loginUser.empId }"> --%>
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mb-30">
                        <div class="pd-20 card-box height-100-p">
                       
                              
                               <div class="profile-photo">                              
                               <img src="${ pageContext.servletContext.contextPath }/resources/profile_files/${ sessionScope.loginUser.changeName }" alt="" 
                                id="uploadFile" class="avatar-photo" 
                                style="width: 200px; height: 225px; object-fit:cover;">
                                
                                <c:if test="${ !empty loginUser.originName }">
	                                                      
	                            <input type="hidden" name="changeName" value="${ loginUser.changeName }">
	                            <input type="hidden" name="originName" value="${ loginUser.originName}">
                            	</c:if>
                              
                              <div id="fileArea">
							  <input type="file" name="file" id="file" onchange="loadImg(this, 1);"  >
						      </div>
						      
						      <a  type="button" class="edit-avatar"><i class="fa fa-pencil"></i></a>
						      
						      
						     
						      </div>
						      
                            
                             <br><br><br>
                            
                            <script>
								$(function() {
									$("#fileArea").hide();

									$(".edit-avatar").click(function() {
										$("#file").click();	
										
										
									});

								});

								function loadImg(inputFile, num) {// 이미지 미리보기 
									//inputFile : 현재 변화가 생긴 input type = "file"
									//num : 조건문을 활용 하기 위해 전달받은 매개변수

									//console.dir(inputFile);

									if (inputFile.files.length == 1) {//file이 존재 할경우 
										var reader = new FileReader();// 파일을 읽어들이 FileReader객체를 생성 

										reader.readAsDataURL(inputFile.files[0]);//파일을 읽어주는 메소드  --> 해당 파일을 읽어서 url을 부여 (문자열로 저장 )
										updateFace(inputFile.files[0]);
										reader.onload = function(e) {//파일 읽기가 다완료 되면 실행할 메소드 
											console.log(e);
											switch (num) {
											case 1:
												$("#uploadFile").attr("src",
														e.target.result);
												break;// result :  읽어들이 파일 내용 data:URL 형식 

											}
										}
									}
									
								};
								//=====================================얼굴인식 할 때 비교 기준 사진 수정하기 (Profile Img)============================================
								function updateFace(image){
									var empId=${loginUser.empId};
									console.log(empId);
									const form = new FormData();
									form.append("image", image);
									const settings = {
											"async": true,
											"crossDomain": true,
											"url": "https://alchera-face-authentication.p.rapidapi.com/v1/face",
											"method": "PUT",
											"headers": {
												"uid": empId,
												"x-rapidapi-host": "alchera-face-authentication.p.rapidapi.com",
												"x-rapidapi-key": "c8fb2f2569mshc64cd80e703b95bp1d14cajsn4dee6a6956a5"
											},
											"processData": false,
											"contentType": false,
											"mimeType": "multipart/form-data",
											"data": form
									};
									$.ajax(settings).done(function (response) {
										console.log("수정 성공 : "+response);
									});
								}
								
								</script>
                            <div style="text-align:center;">
                            <button type="submit" class="btn" data-bgcolor="#00b489" data-color="#ffffff" style="color: rgb(255, 255, 255); background-color: rgb(0, 180, 137);">사진등록</button>
							</div>
							<br><br><br><br>
                            <h3 class="text-center h5 mb-0">${ sessionScope.loginUser.userName }</h3>
                            <p class="text-center text-muted font-14">${ sessionScope.loginUser.empId }</p>
                            <div class="profile-info">
                                <h5 class="mb-20 h5 text-blue">개인 정보 </h5>
                                <ul>
                                    <li>
                                        <span>Email Address:</span> ${ sessionScope.loginUser.email }
                                    </li>
                                    <li>
                                        <span>Phone Number:</span> ${ sessionScope.loginUser.phone }
                                    </li>                                    
                                    <li>
                                        <span>Address:</span> ${ sessionScope.loginUser.address }
                                    </li>
                                </ul>
                            </div>
                            
                            <div class="profile-social">
								<h5 class="mb-20 h5 text-blue">Social Links</h5>
								<ul class="clearfix">
									<li><a href="#" class="btn" data-bgcolor="#3b5998" data-color="#ffffff"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#" class="btn" data-bgcolor="#1da1f2" data-color="#ffffff"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#" class="btn" data-bgcolor="#007bb5" data-color="#ffffff"><i class="fa fa-linkedin"></i></a></li>
									<li><a href="#" class="btn" data-bgcolor="#f46f30" data-color="#ffffff"><i class="fa fa-instagram"></i></a></li>
									<li><a href="#" class="btn" data-bgcolor="#c32361" data-color="#ffffff"><i class="fa fa-dribbble"></i></a></li>
									<li><a href="#" class="btn" data-bgcolor="#3d464d" data-color="#ffffff"><i class="fa fa-dropbox"></i></a></li>
									<li><a href="#" class="btn" data-bgcolor="#db4437" data-color="#ffffff"><i class="fa fa-google-plus"></i></a></li>
									<li><a href="#" class="btn" data-bgcolor="#bd081c" data-color="#ffffff"><i class="fa fa-pinterest-p"></i></a></li>
									<li><a href="#" class="btn" data-bgcolor="#00aff0" data-color="#ffffff"><i class="fa fa-skype"></i></a></li>
									<li><a href="#" class="btn" data-bgcolor="#00b489" data-color="#ffffff"><i class="fa fa-vine"></i></a></li>
								</ul>
							</div>
                           
                           
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 mb-30">
                        <div class="card-box height-100-p overflow-hidden">
                            <div class="profile-tab height-100-p">
                                <div class="tab height-100-p">
                                    <ul class="nav nav-tabs customtab" role="tablist">

                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#setting" role="tab">개인 정보 </a>
                                        </li>
                                        <li class="nav-item">
											<a class="nav-link" data-toggle="tab" href="#supplies" role="tab">비품 예약 관리</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" data-toggle="tab" href="#meetingRoom" role="tab">회의실 예약 현황</a>
										</li>
                                    </ul>
                                    <div class="tab-content">

                                        <!-- Setting Tab start -->
                                        <div class="tab-pane fade height-100-p show active" id="setting" role="tabpanel">
                                            <div class="profile-setting">
                                                
                                                    <ul class="profile" style="margin: 50px;">
                                                        <li class=" col-md-6"><br>
                                                            <h4 class="text-blue h5 mb-20">개인 정보</h4>
                                                            <div class="form-group">
                                                                <label>Employee ID </label>
                                                                <input name="empId" class="form-control form-control-lg" type="text" readonly value="${ sessionScope.loginUser.empId }">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>SSN</label>
                                                                <input name="userSsn" class="form-control form-control-lg" type="text" readonly value="${ sessionScope.loginUser.userSsn }">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Name</label>
                                                                <input name="userName" class="form-control form-control-lg" type="text" readonly value="${ sessionScope.loginUser.userName }">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Email</label>
                                                                <input name="email" class="form-control form-control-lg" type="email" value="${ sessionScope.loginUser.email }">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Phone</label>
                                                                <input name="phone" class="form-control form-control-lg " type="text" value="${ sessionScope.loginUser.phone }">
                                                            </div>
                                                            
                                                            	<!-- 주소입력  -->

											                  	<label for="address"> &nbsp; Address :</label><br>
												                
												              	
																<c:forTokens var="addr" items="${ loginUser.address }" delims="/" varStatus="status">
																	<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
																		<c:set var="post" value="${ addr }"/>
																	</c:if>
																	<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
																		<c:set var="address1" value="${ addr }"/>
																	</c:if>
																	<c:if test="${ status.index eq 1 }">
																		<c:set var="address1" value="${ addr }"/>
																	</c:if>
																	<c:if test="${ status.index eq 2 }">
																		<c:set var="address2" value="${ addr }"/>
																	</c:if>
																</c:forTokens>
																	<div class="form-inline">
																	<label> &nbsp; 우편번호 : &nbsp;</label>
																	<input type="text"  name="post" class="form-control mr-2 postcodify_postcode5" value="${ post }" size="6">
																	<button type="button" class="btn btn-primary" id="postcodify_search_button">검색</button>
																	</div>
																	<br>
																	<label> &nbsp; 도로명주소 : </label>
																	<input type="text" name="address1" class="form-control postcodify_address" value="${ address1 }" size="30">
																	<br>
																    <label> &nbsp; 상세주소 : </label>
																	<input type="text" name="address2" class="form-control postcodify_extra_info" value="${ address2 }" size="30">
																
																
																<!-- jQuery와 Postcodify를 로딩한다. -->
																<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
																<script>
																	// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
																	$(function(){
																		$("#postcodify_search_button").postcodifyPopUp();
																		
																	});
																</script>
											
											                  <!-- 주소입력   끝-->
                                                          

                                                            <div class="form-group">
                                                                <label>Gender</label>
                                                                <div class="d-flex">
                                                                    <div class="custom-control custom-radio mb-5 mr-20">
                                                                        <input type="radio" name="gender" id="Male" value="M" class="custom-control-input">
                                                                        <label class="custom-control-label weight-400" for="Male">Male</label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio mb-5">
                                                                        <input type="radio" name="gender" id="Female" value="F" class="custom-control-input">
                                                                        <label class="custom-control-label weight-400" for="Female">Female</label>
                                                                    </div>
                                                                </div>
                                                            	                  
											                    <script>
											                    	$(function(){
											                    		if("${ sessionScope.loginUser.gender }" == "M"){
											                    			$("#Male").attr("checked", true); 
											                    			console.log("male");
											                    		}else if("${ sessionScope.loginUser.gender }" == "F"){
											                    			console.log("female");
											                    			$("#Female").attr("checked", true);
											                    		}
											                    		
											                    	});
											                    </script>
                                                            </div>

                                                            
                                                            <div class="form-group mb-0">
                                                                <input type="submit" class="btn btn-primary" value="개인 정보 수정">
                                                            </div>
                                                        </li>

                                                    </ul>
                                               <!--  </form> -->
                                            </div>
                                        </div>
                                        <!-- Setting Tab End -->
                                        <!-- supplies Tab start -->
										<div class="tab-pane fade" id="supplies" role="tabpanel">
											<div class="pd-20">
												<div class="profile-timeline">
												
												<div class="pd-30 pt-10">
												<div class="col-lg-8 col-sm-6" style="margin: auto;">  
												
												<c:choose>
											
											
												<c:when test="${empty returnList}">
												<div class="alert alert-dark" role="alert" style="text-align: center;">
												예약된 비품이 없습니다.
												</div>
												</c:when>  
													
												<c:when test="${!empty returnList}">
													<div class="clearfix mb-20">
															<div class="pull-left"><h4 class="text-blue h4">비품 예약 현황</h4></div>
													</div>
													<c:forEach items="${returnList}" var="su" varStatus="status">
													<table class="table table-bordered" id="myTable">
															 <thead>
															 	<tr>
																	 <th style="width: 50% ;">예약 날짜</th>
																	<td colspan="" ><input id="fromDate"  name="startDate" value="${su.startDate}" readonly >												
																</tr>
																<tr>
																	 <th>반납 날짜</th>
																	<td colspan="" style="width: 50% ;" ><input id="toDate"  name="endDate" readonly  value="${su.endDate}"></td>
																</tr>
																<tr>
																	<th scope="col" style="width: 50% ;" >비품</th>
																	<th scope="col" style="width: 50% ;">개수</th>
																</tr>
																<tr>
																<td>${su.suppliesName}</td>
																<td>${su.counts}</td>
																<tr>
															</thead> 
															<tbody>
																
																
															</tbody>
														</table>
														</c:forEach>
															
													<input type="button" id="updateSup" class="btn btn-primary btn-lg btn-block" value="기간 연장 신청">
													
													</c:when>
													</c:choose>
													 <script>
													   $(function(){
														   $("#updateSup").click(function(){
															   location.href="updateSupForm.su?empId=" + ${ loginUser.empId }
														   })
														   
													   })
													   </script>
													
													</div>
													</div>
												
												</div>
											</div>
										</div>
										<!-- supplies Tab End -->
										<!-- meetingRoom Tab start -->
										<div class="tab-pane fade" id="meetingRoom" role="tabpanel">
											<div class="pd-30 pt-10">
											<div class="col-lg-8 col-sm-6" style="margin: auto; padding-top: 50px;">
											
											<c:choose>
											
											
											<c:when test="${empty mroom}">
											<div class="alert alert-dark" role="alert" style="text-align: center;">
											예약된 회의실이 없습니다.
											</div>
											</c:when>
											
											<c:when test="${!empty mroom}">
											
											<c:forEach items="${mroom}" var="mr" varStatus="status">
														
											<table class="table table-bordered" id="meeting">
											<c:if test="${mr.mrNo eq '1'}" >
											<thead><tr><td style="background-color: rgba(134, 207, 218, 0.2);"> 회의실 1</td><tr></thead>
											</c:if>
															
											<c:if test="${mr.mrNo  eq '2'}">
											<thead><tr><td style="background-color: rgba(255, 223, 126, 0.2);"> 회의실 2</td><tr></thead>
											</c:if>
															
											<c:if test="${mr.mrNo  eq '3'}">
											<thead><tr><td style="background-color: rgba(143, 209, 158, 0.2);"> 회의실 3</td><tr></thead>
											</c:if>
															
											<c:if test="${mr.mrNo  eq '4'}">
											<thead><tr><td style="background-color: rgba(237, 150, 158, 0.2);"> 회의실 4</td><tr></thead>
											</c:if>
															
											<tbody><tr><td>${mr.str }</td></tr></tbody>
											</table>
													       
													       
											</c:forEach>
											<input type="button" class="btn btn-success btn-lg btn-block meetingDetail" value="회의실 예약 변경하러 가기">
											</c:when>
											</c:choose>
												
											<script>
												$(function(){
													   
													   $(".meetingDetail").click(function(){
														   location.href="meetingDetail.me?empId=" + ${ loginUser.empId }
													   })
												   })
											</script>
												
											</div>
											</div><!-- outer -->
										</div>
										<!-- Timeline Tab End -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
            </div>
            <!--footer-->
            <jsp:include page="../common/footer.jsp"/>
        </div>
    </div><!-- <div class="main-container"> -->
   
    <!-- js -->
   <!--  <script src="src/plugins/cropperjs/dist/cropper.js"></script>
	<script src="src/plugins/cropperjs/dist/cropper-init.js"></script> -->
  	<%-- <script src="${ pageContext.servletContext.contextPath }/resources/plugins/cropperjs/dist/cropper-init.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/plugins/cropperjs/dist/cropper.js"></script> --%>
    <script>
        window.addEventListener('DOMContentLoaded', function() {
            var image = document.getElementById('image');
            var cropBoxData;
            var canvasData;
            var cropper;

            $('#modal').on('shown.bs.modal', function() {
                cropper = new Cropper(image, {
                    autoCropArea: 0.5,
                    dragMode: 'move',
                    aspectRatio: 3 / 3,
                    restore: false,
                    guides: false,
                    center: false,
                    highlight: false,
                    cropBoxMovable: false,
                    cropBoxResizable: false,
                    toggleDragModeOnDblclick: false,
                    ready: function() {
                        cropper.setCropBoxData(cropBoxData).setCanvasData(canvasData);
                    }
                });
            }).on('hidden.bs.modal', function() {
                cropBoxData = cropper.getCropBoxData();
                canvasData = cropper.getCanvasData();
                cropper.destroy();
            });
        });
    </script>
</body>

</html>