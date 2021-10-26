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

</head>
<body>
    <!-- <div class="pre-loader">
        <div class="pre-loader-box">
            <div class="loader-logo"><img src="vendors/images/deskapp-logo.svg" alt=""></div>
            <div class='loader-progress' id="progress_div">
                <div class='bar' id='bar1'></div>
            </div>
            <div class='percent' id='percent1'>0%</div>
            <div class="loading-text">
                Loading...
            </div>
        </div>
    </div> -->
    <jsp:include page="../common/menubar.jsp"/>

    <div class="mobile-menu-overlay"></div>

    <div class="main-container">
        <div class="pd-ltr-20 xs-pd-20-10">
            <div class="min-height-200px">

                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 mb-30">
                        <div class="pd-20 card-box height-100-p">
                            <div class="profile-photo">
                                <a href="modal" data-toggle="modal" data-target="#modal" class="edit-avatar"><i class="fa fa-pencil"></i></a>
                                <img src="${ pageContext.servletContext.contextPath }/resources/vendors/images/photo1.jpg" alt="" class="avatar-photo">
                                <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-body pd-5">
                                                <div class="img-container">
                                                    <img id="image" src="${ pageContext.servletContext.contextPath }/resources/vendors/images/photo2.jpg" alt="Picture">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <input type="submit" value="Update" class="btn btn-primary">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h5 class="text-center h5 mb-0">${ sessionScope.loginUser.userName }</h5>
                            <p class="text-center text-muted font-14">동에 번쩍 서에 번쩍</p>
                            <div class="profile-info">
                                <h5 class="mb-20 h5 text-blue">Contact Information</h5>
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
                            <div class="profile-skills">
                                <h5 class="mb-20 h5 text-blue">Key Skills</h5>
                                <h6 class="mb-5 font-14">HTML</h6>
                                <div class="progress mb-20" style="height: 6px;">
                                    <div class="progress-bar" role="progressbar" style="width: 90%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <h6 class="mb-5 font-14">Css</h6>
                                <div class="progress mb-20" style="height: 6px;">
                                    <div class="progress-bar" role="progressbar" style="width: 70%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <h6 class="mb-5 font-14">jQuery</h6>
                                <div class="progress mb-20" style="height: 6px;">
                                    <div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <h6 class="mb-5 font-14">Bootstrap</h6>
                                <div class="progress mb-20" style="height: 6px;">
                                    <div class="progress-bar" role="progressbar" style="width: 80%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 mb-30">
                        <div class="card-box height-100-p overflow-hidden">
                            <div class="profile-tab height-100-p">
                                <div class="tab height-100-p">
                                    <ul class="nav nav-tabs customtab" role="tablist">

                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#setting" role="tab">Settings</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">

                                        <!-- Setting Tab start -->
                                        <div class="tab-pane fade height-100-p show active" id="setting" role="tabpanel">
                                            <div class="profile-setting">
                                                <form action="update.me" method="post" onsubmit="">
                                                    <ul class="profile">
                                                        <li class=" col-md-6"><br>
                                                            <h4 class="text-blue h5 mb-20">Edit Personal Information</h4>
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
												                  <%-- <input type="text" class="form-control" id="address" name="address" value="${ loginUser.address }"><br>--%>
												                    
												              	
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
											                    			console.log("dd");
											                    		}else if("${ sessionScope.loginUser.gender }" == "F"){
											                    			$("#Female").attr("checked", true);
											                    		}
											                    		
											                    	});
											                    </script>
                                                            </div>

                                                            
                                                            <div class="form-group mb-0">
                                                                <input type="submit" class="btn btn-primary" value="Update Information">
                                                            </div>
                                                        </li>

                                                    </ul>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- Setting Tab End -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--footer-->
            <jsp:include page="../common/footer.jsp"/>
        </div>
    </div><!-- <div class="main-container"> -->
   
    <!-- js -->
  	
    <script src="${ pageContext.servletContext.contextPath }/resources/plugins/cropperjs/dist/cropper.js"></script>
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