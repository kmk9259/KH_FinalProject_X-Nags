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

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/vendors/styles/core.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/vendors/styles/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/vendors/styles/style.css">
    <link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/plugins/sweetalert2/sweetalert2.css">

     <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'UA-119386393-1');
    </script> 
</head>
<body>
   
    <div class="header">
        <div class="header-left">
            <div class="menu-icon dw dw-menu"></div>
            <div class="search-toggle-icon dw dw-search2" data-toggle="header_search"></div>
            <div class="header-search">
                <form>
                    <div class="form-group mb-0">
                        <i class="dw dw-search2 search-icon"></i>
                        <input type="text" class="form-control search-input" placeholder="Search Here">
                        
                    </div>
                </form>
            </div>
        </div>
        <div class="header-right">
            
            <div class="user-notification">
                <div class="dropdown">
                    <a class="dropdown-toggle no-arrow" href="#" role="button" data-toggle="dropdown">
                        <i class="icon-copy dw dw-notification"></i>
                        <span class="badge notification-active"></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="notification-list mx-h-350 customscroll">
                            <ul>
                                <li>
                                    <a href="#">
                                        <img src="${ pageContext.servletContext.contextPath }/resources/vendors/images/img.jpg" alt="">
                                        <h3>John Doe</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="${ pageContext.servletContext.contextPath }/resources/vendors/images/photo1.jpg" alt="">
                                        <h3>Lea R. Frith</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="${ pageContext.servletContext.contextPath }/resources/vendors/images/photo2.jpg" alt="">
                                        <h3>Erik L. Richards</h3>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
                                    </a>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
           <!--  <div class="col-lg-4 col-md-6 col-sm-12 mb-30">
                <div class="pd-20 card-box text-center height-100-p">                    
                    <div class="max-width-200 mx-auto">
                        <button type="button" class="btn mb-20 btn-primary btn-block" id="sa-basic">Click me</button>
                    </div>
                </div>
            </div> -->
           
            <c:if test="${ !empty sessionScope.loginUser }">
            <div class="user-info-dropdown">
                <div class="dropdown">
                    <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                        
                        <span class="user-icon">
							<img src="${ pageContext.servletContext.contextPath }/resources/profile_files/${ sessionScope.loginUser.changeName }" alt="">
						</span>
                        <span class="user-name">${ sessionScope.loginUser.userName }님</span>
                         
                    </a>
                    <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                        <a class="dropdown-item" href="myPage.me"><i class="dw dw-user1"></i> Mypage</a>
                        <a class="dropdown-item" href="selectEmployee.me"><i class="dw dw-settings2"></i> Setting</a>                        
                        <a class="dropdown-item btn-block" href="#" data-toggle='modal' data-target='#confirmation-modal'"><i class="dw dw-logout"></i> Log Out</a>
                      	
                      	<div class="modal fade" id="confirmation-modal" tabindex="-1" role="dialog" aria-hidden="true">
			                <div class="modal-dialog modal-dialog-centered" role="document">
			                    <div class="modal-content">
			                    <form action="logout.me" method="get">
			                        <div class="modal-body text-center font-18">
			                            <h4 class="padding-top-30 mb-30 weight-500">로그아웃 하시겠습니까?</h4>
			                            <p class="padding-top-30 mb-30 weight-500 text-blue">※ 로그아웃시 퇴근 시간이 찍히므로 <br>주의해주시길 바랍니다.</p>
			                            <div class="padding-bottom-30 row" style="max-width: 170px; margin: 0 auto;">
			                                <div class="col-6">
			                                    <button type="button" class="btn btn-secondary border-radius-100 btn-block confirmation-btn" data-dismiss="modal"><i class="fa fa-times"></i></button> NO
			                                </div>
			                                
			                                <div class="col-6">
			                                    <button type="submit" class="btn btn-primary border-radius-100 btn-block confirmation-btn" ><i class="fa fa-check"></i></button> YES
			                                </div>
			                               
			                            </div>
			                        </div>
			                    </form>
			                    </div>
			                </div>
			            </div>
                    </div>
					<script>
						$('#confirmation-modal').appendTo("body");
						!function ($) {
						    "use strict";

						    var SweetAlert = function () {
						    };

						    //examples
						    SweetAlert.prototype.init = function () {

						        //Basic
						        $('#sa-basic').on('click', function () {
						            swal('test')
						        });

						    },
						        //init
						        $.SweetAlert = new SweetAlert, $.SweetAlert.Constructor = SweetAlert
						}(window.jQuery),

						//initializing
						    function ($) {
						        "use strict";
						        $.SweetAlert.init()
						    }(window.jQuery);
					</script> 

                </div>
            </div>
            </c:if>
        </div>
    </div>

    <jsp:include page="sidebar.jsp"/>


    <!-- js -->
    <script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/core.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/script.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/process.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/layout-settings.js"></script>
    <%-- <script src="${ pageContext.servletContext.contextPath }/resources/plugins/apexcharts/apexcharts.min.js"></script> --%>
    <script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/jquery.dataTables.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/dataTables.responsive.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
    <%-- <script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/dashboard.js"></script> --%>
    <!-- add sweet alert js & css in footer -->
    <script src="${ pageContext.servletContext.contextPath }/resources/plugins/sweetalert2/sweetalert2.all.js"></script>
<%--     <script src="${ pageContext.servletContext.contextPath }/resources/plugins/sweetalert2/sweet-alert.init.js"></script> --%>
    
</body>
</html>