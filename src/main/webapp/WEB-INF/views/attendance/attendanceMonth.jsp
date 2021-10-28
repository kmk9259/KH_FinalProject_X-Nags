<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>X-Nomal Groupware Solution</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<style>
	.info{
	margin-left: 300px;
	}
	.scrolltbody {
    display: block;
    width: 1715px;
    border-collapse: collapse;
    border: 1px solid #000;
    position:relative;
	}
	.scrolltbody th { border: 1px solid #000; background: white; }
	.scrolltbody td { border: 1px solid #000; border-top: 0; }
	.scrolltbody tbody {
	    display: block;
	    height: 280px;
	    overflow: auto;
	}
	.scrolltbody > thead > tr>th{
	font-size: 15px;
	height: 47.33px;
	}
	.scrolltbody > tbody > tr>th{
	font-size: 15px;
	height: 47.33px;
	width: 500px;
	}
	.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 428px; }
	.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 428px; }
	.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { width: 428px; }
	.scrolltbody th:last-child { width: 428px; }
	 .scrolltbody td:last-child { width: calc( 420px - 19px );  } 
	</style>
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/plugins/jquery-asColorPicker/dist/css/asColorPicker.css">

	
</head>
<body >
	<jsp:include page="../common/menubar.jsp"/>
	
    
    <div class="mobile-menu-overlay"></div>
    <div class="main-container">
        <div class="pd-ltr-20 xs-pd-20-10">
            <div class="min-height-200px">
                
                <div class="pd-20 card-box mb-30">
                    <div class="clearfix mb-20">
                        <div class="pull-left">
                            <h4 class="text-blue h4">월별 근태 현황</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-12">
                            <form>
                                <div class="form-group"> 
                                	<label>날짜</label>
                                    <input class="form-control month-picker" placeholder="Click" type="text">                                
                                </div>
                                <div class="form-group">
	                                <label>항목</label>
	                                <div class="d-flex">
	                                    <div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="choice" id="dept" value="M" class="custom-control-input">
	                                        <label class="custom-control-label weight-400" for="dept">부서&nbsp&nbsp</label>
	                                    </div>
	                                    <div class="custom-control custom-radio mb-5">
	                                        <input type="radio" name="choice" id="job" value="F" class="custom-control-input">
	                                        <label class="custom-control-label weight-400" for="job">직급</label>
	                                    </div>
	                                </div>	                                
                               	</div>
                               	<div class="form-group">
	                                <label>상태</label>
	                                <div class="d-flex">
	                                    <div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="status" id="status1" value="status1" class="custom-control-input">
	                                        <label class="custom-control-label " for="status1">정상&nbsp&nbsp</label>
	                                    </div>
	                                    <div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="status" id="status2" value="status2" class="custom-control-input">
	                                        <label class="custom-control-label " for="status2">지각&nbsp&nbsp</label>
	                                    </div>
	                                    <div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="status" id="status3" value="status3" class="custom-control-input">
	                                        <label class="custom-control-label " for="status3">조퇴&nbsp&nbsp</label>
	                                    </div>
	                                    <div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="status" id="status4" value="status4" class="custom-control-input">
	                                        <label class="custom-control-label " for="status4">결근&nbsp&nbsp</label>
	                                    </div>
	                                    <div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="status" id="status5" value="status5" class="custom-control-input">
	                                        <label class="custom-control-label " for="status5">외근&nbsp&nbsp</label>
	                                    </div>
	                                    <div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="status" id="status6" value="status6" class="custom-control-input">
	                                        <label class="custom-control-label " for="status6">야근&nbsp&nbsp</label>
	                                    </div>
	                                    <div class="custom-control custom-radio mb-5 ">
	                                        <input type="radio" name="status" id="status7" value="status7" class="custom-control-input">
	                                        <label class="custom-control-label " for="status7">연차&nbsp&nbsp</label>
	                                    </div>
	                                </div>	                                
                               	</div>
                                <div class="form-group mb-0">
                                    <input type="submit" class="btn btn-primary" value="&nbsp&nbsp&nbsp&nbsp조회&nbsp&nbsp&nbsp&nbsp">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <jsp:include page="../common/footer.jsp"/>
                
                

            </div>

        </div>
    </div>
    
    
	<!-- JavaScript Includes -->
	
    <script src="${ pageContext.servletContext.contextPath }/resources/plugins/jquery-asGradient/dist/jquery-asGradient.js"></script>
    	
	
</body>
</html>