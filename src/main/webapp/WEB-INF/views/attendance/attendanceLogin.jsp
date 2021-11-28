
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="UTF-8">
	<title>X-Nomal Groupware Solution</title>

	<!-- Site favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="${ pageContext.servletContext.contextPath }/resources/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="${ pageContext.servletContext.contextPath }/resources/vendors/images/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${ pageContext.servletContext.contextPath }/resources/vendors/images/favicon-16x16.png">

	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/vendors/styles/style.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.servletContext.contextPath }/resources/plugins/sweetalert2/sweetalert2.css">

	
	<style>
	.logo>a>img{
	width: 170px;
	height:80px;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 50px
	}
	</style>
</head>
<body class="login-page">
	<div class="login-header box-shadow">
		<div class="container-fluid d-flex justify-content-between align-items-center">
			<div class="logo">
				<a href="">
					<img src="${ pageContext.servletContext.contextPath }/resources/images/logo/logoblack.png" alt="">
				</a>
			</div>			
		</div>
	</div>
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 col-lg-7">
					<img src="${ pageContext.servletContext.contextPath }/resources/vendors/images/login-page-img.png" alt="">
				</div>
				<div class="col-md-6 col-lg-5">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-primary">Login To DeskApp</h2>
						</div>
						
						<video id="video" width="350" height="240" autoplay></video><br><br><br>
						<div class="row pb-30">
							<div class="col-12">
								<div class="forgot-password"><a href="generalLogin.me">General Login</a></div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="input-group mb-0">
									<input class="btn btn-primary btn-lg btn-block" type="button" id="modalbtn"  data-toggle='modal' data-target='#attmodal' value="Sign In" >																		
								</div>									
							</div>
						</div>
						<div class="modal fade" id="attmodal" tabindex="-1" role="dialog" aria-hidden="true">
			                <div class="modal-dialog modal-dialog-centered" role="document">
			                    <div class="modal-content">			                    
			                        <div class="modal-body text-center font-18">	
			                        	<!-- canvas :  웹페이지에서 그래픽을 그릴 때 사용하는 컨테이너
			                        				       자바스크립트를 통해 그림을 그리고 애니메이션과 이벤트 처리 등을 구현 -->		                            
			                            <canvas id="canvas" width="350" height="240"></canvas><br><br>
			                            <div class="padding-bottom-30 row" style="max-width: 170px; margin: 0 auto;">
			                                <div class="col-6">
			                                    <button type="button" class="btn btn-secondary border-radius-100 btn-block confirmation-btn" data-dismiss="modal"><i class="fa fa-times"></i></button> NO
			                                </div>			                                
			                                <div class="col-6">
			                                    <button type="button" class="btn btn-primary border-radius-100 btn-block confirmation-btn" onclick="saveImage();"><i class="fa fa-check"></i></button> YES
			                                </div>			                               
			                            </div>
			                        </div>
			                    
			                    </div>
			                </div>
		            	</div>
		            	<div class="modal fade" id="success-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	                        <div class="modal-dialog modal-sm modal-dialog-centered">
	                            <div class="modal-content bg-danger text-white">
	                                <div class="modal-body text-center">
	                                    <h3 class="text-white mb-15"><i class="fa ion-checkmark-round"></i> 로그인 성공  <i class="fa ion-checkmark-round"></i></h3>
	                                    <p>얼굴인식에 성공했습니다.<br> </p>
	                                    <button type="button" class="btn btn-light" id="loginBtn">Ok</button>
	                                </div>
	                            </div>
	                        </div>
                        </div>
		            	<div class="modal fade" id="fail-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	                        <div class="modal-dialog modal-sm modal-dialog-centered">
	                            <div class="modal-content bg-danger text-white">
	                                <div class="modal-body text-center">
	                                    <h3 class="text-white mb-15"><i class="fa ion-alert-circled"></i> 로그인 실패  <i class="fa ion-alert-circled"></i></h3>
	                                    <p>얼굴인식에 실패했습니다.<br> 사원 등록이 되지 않았거나 얼굴 인식을 다시 시도해주시기 바랍니다.</p>
	                                    <button type="button" class="btn btn-light" data-dismiss="modal">Ok</button>
	                                </div>
	                            </div>
	                        </div>
                        </div>
                        
						<script>
						//navigator.mediaDevices : 카메라, 마이크, 화면 공유와 같이 현재 연결된 미디어 입력 장치에 접근할 수 있는 MediaDevices 객체를 반환
						//navigator.mediaDevices.getUserMedia : 사용자에게 미디어 입력 장치 사용 권한을 요청하며, 사용자가 수락하면 요청한 미디어 종류의 트랙을 포함한 Stream을 반환합니다.
						if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
							navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
								var video = document.getElementById('video');
								video.srcObject = stream;					//Stream은 새로 생성된 <video> 요소에 할당됩니다.
								video.play();
							});
						}						
						var canvas = document.getElementById('canvas');					
						var context = canvas.getContext('2d');				//2d모드의 그리기 객체 =>canvas에 그림을 그릴 수 있다.
						var video = document.getElementById('video');
						document.getElementById("modalbtn").addEventListener("click",function() {
							context.drawImage(video,0,0,350,240);
						});
						
						function saveImage(){							
						    var imgDataUrl = canvas.toDataURL('image/png');
						    var blobBin = atob(imgDataUrl.split(',')[1]);	// base64 데이터 디코딩
						    var array = [];
						    for (var i = 0; i < blobBin.length; i++) {
						        array.push(blobBin.charCodeAt(i));
						    }
						    var file = new Blob([new Uint8Array(array)], {type: 'image/png'});	// Blob 생성
						    var formdata = new FormData();										// formData 생성 
						    formdata.append("file", file, 'capture.png');						// file data 추가
						   
						    //Capture된 사진은 무조건 저장
						    $.ajax({
						        type : 'post',
						        url : 'attImage.att',
						        enctype: 'multipart/form-data',
						        data:  formdata,						        
						        processData : false,						// data 파라미터 강제 string 변환 방지!!
						        contentType : false,						// application/x-www-form-urlencoded; 방지!!
						        success : function (data) {						            
						            console.log("캡쳐 저장");
						        }						        
						    });	
						    var result=faceRecognition(file);			//등록된 사원의 프로필사진과 캠으로 캡쳐된 사진이 동일 인물인지 결과 값을 result 변수에 담기
						    if(result.match('true')){					//결과 값이 true이면	
						    	var empId= result.substring(43, 52);	//해당 사원의 empId를 가져오기
						    	
						    	$('#attmodal').modal('hide');
						    	$('#success-modal').modal('show');
						    	document.getElementById("loginBtn").addEventListener("click",function() {
						    		location.href = "main.xnags?empId="+empId;
								});						    		
						    }else{						    	 
						    	 $('#attmodal').modal('hide');
						    	 $('#fail-modal').modal('show');
						    }						   					
						}
						//등록된 프로필 사진과 캡쳐된 사진이 동일인물인지 비교하기						
						function faceRecognition(file){
							var result=""; 
							const form = new FormData();
							form.append("image", file);							
							const settings = {
								"async": false,
								"crossDomain": true,
								"url": "https://alchera-face-authentication.p.rapidapi.com/v1/face/match",
								"method": "POST",
								"headers": {
									"x-rapidapi-host": "alchera-face-authentication.p.rapidapi.com",
									"x-rapidapi-key": "c2f7322849msh59b980548a487b0p18c3a3jsn2a28749fcc50"
								},
								"processData": false,
								"contentType": false,
								"mimeType": "multipart/form-data",
								"data": form
							};
							$.ajax(settings).done(function (response) {								
								result = response;								
							}); 
							return result;							
						}						
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- js -->
    <script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/core.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/script.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/process.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/layout-settings.js"></script>
       <!-- add sweet alert js & css in footer -->
    <script src="${ pageContext.servletContext.contextPath }/resources/plugins/sweetalert2/sweetalert2.all.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/plugins/sweetalert2/sweet-alert.init.js"></script>
</body>
</html>