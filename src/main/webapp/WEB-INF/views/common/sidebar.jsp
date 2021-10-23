<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>X-Nags 알잘딱깔센 </title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
</head>
<body>
   
    <div class="left-side-bar">
        <div class="brand-logo">
            <a href="index.html">
                <img src="${ pageContext.servletContext.contextPath }/resources/vendors/images/deskapp-logo.svg" alt="" class="dark-logo">
                <img src="${ pageContext.servletContext.contextPath }/resources/vendors/images/deskapp-logo-white.svg" alt="" class="light-logo">
            </a>
            <div class="close-sidebar" data-toggle="left-sidebar-close">
                <i class="ion-close-round"></i>
            </div>
        </div>
        <div class="menu-block customscroll">
            <div class="sidebar-menu">
                <ul id="accordion-menu">
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">홈</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="index.jsp">로그인 후 메인화면</a></li>
                            <li><a href="index2.html">로그인 후 메인화면 2</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-edit2"></span><span class="mtext">양식</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="form-basic.html">사원 등록, 파일선택도 있음</a></li>
                            <li><a href="advanced-components.html">select, 토글, 태그기능</a></li>
                            <li><a href="form-wizard.html">결재 승인 창</a></li>
                            <li><a href="html5-editor.html">게시판 등록 창</a></li>
                            <li><a href="form-pickers.html">캘린더, 시간, 색깔 뽑기</a></li>

                            <li><a href="image-dropzone.html">파일 첨부</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-library"></span><span class="mtext">Tables</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="datatable.html">테이블</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="calendar.html" class="dropdown-toggle no-arrow">
                            <span class="micon dw dw-calendar1"></span><span class="mtext">캘린더</span>
                        </a>
                    </li>



                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-right-arrow1"></span><span class="mtext">Additional Pages</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="login.html">로그인 진입</a></li>
                            <li><a href="forgot-password.html">비번 잊었을 떄</a></li>
                            <li><a href="reset-password.html">비번 리셋</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-browser2"></span><span class="mtext">Error Pages</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="400.html">400</a></li>
                            <li><a href="403.html">403</a></li>
                            <li><a href="404.html">404</a></li>
                            <li><a href="500.html">500</a></li>
                            <li><a href="503.html">503</a></li>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-copy"></span><span class="mtext">Extra Pages</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="blank.html">Blank</a></li>
                            <li><a href="contact-directory.html">Contact Directory</a></li>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="blog-detail.html">Blog Detail</a></li>
                            <li><a href="product.html">Product</a></li>
                            <li><a href="product-detail.html">Product Detail</a></li>
                            <li><a href="faq.html">FAQ</a></li>
                            <li><a href="profile.html">Profile</a></li>
                            <li><a href="gallery.html">Gallery</a></li>
                            <li><a href="pricing-table.html">Pricing Tables</a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="sitemap.html" class="dropdown-toggle no-arrow">
                            <span class="micon dw dw-diagram"></span><span class="mtext">조직도?</span>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">전자 메일</span>
                        </a>
                        <ul class="submenu">

                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">전자 결재</span>
                        </a>
                        <ul class="submenu">

                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">커뮤니티</span>
                        </a>
                        <ul class="submenu">
                            <li><a href="">투표 게시판</a></li>
                            <li><a href="">익명 게시판</a></li>
                            <li><a href="">공지 사항</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">근태 관리</span>
                        </a>
                        <ul class="submenu">

                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">근무 스케쥴 관리</span>
                        </a>
                        <ul class="submenu">

                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="javascript:;" class="dropdown-toggle">
                            <span class="micon dw dw-house-1"></span><span class="mtext">시스템 관리</span>
                        </a>
                        <ul class="submenu">

                        </ul>
                    </li>

                </ul>
            </div>
        </div>
    </div>

    
</body>
</html>