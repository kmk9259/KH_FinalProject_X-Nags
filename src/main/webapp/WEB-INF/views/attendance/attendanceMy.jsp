<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>X-Nomal Groupware Solution</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
    
    <div class="mobile-menu-overlay"></div>

    <div class="main-container">
        <div class="pd-ltr-20">
            <div class="card-box pd-20 height-100-p mb-30">
                <div class="row align-items-center">
                    <div class="col-md-4">
                        <img src="${ pageContext.servletContext.contextPath }/resources/vendors/images/banner-img.png" alt="">
                    </div>
                    <div class="col-md-8">
                        <h4 class="font-20 weight-500 mb-10 text-capitalize">
                            
                            <div class="weight-600 font-30 text-blue">${ sessionScope.loginUser.userName }님</div>
                        </h4>
                        
						
							
                    </div>
                </div>
            </div>
            <div class="card-box pd-20 height-100-p mb-30">
                <div class="row align-items-center">
                    <div class="col-md-4">
                        <h3>내 근태 현황</h3>
                    </div>
                    <!-- <div class="col-md-8">
                        <h4 class="font-20 weight-500 mb-10 text-capitalize">ㅇㅇ</h4>
                        
						
							
                    </div> -->
                </div>
            </div>
            
            
            <jsp:include page="../common/footer.jsp"/>
        </div>
    </div>

</body>
</html>