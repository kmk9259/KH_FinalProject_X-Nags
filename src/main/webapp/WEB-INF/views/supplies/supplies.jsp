<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Nomal Groupware Solution</title>
<style>
.btn-success {
    
    margin-bottom: 50px;
}
.outer {
	border : 1px solid black;
	padding: 50px;
}

legend { width: 40%;
text-align: center;
}
.input-group .input-group-btn {
height: 30px;

}

nput[type=checkbox] + label {
  display: block;
  margin: 0.2em;
  cursor: pointer;
  padding: 0.2em;
  font-family: 'Arial'
}

input[type=checkbox] {
  display: none;
}

input[type=checkbox] + label:before {
  content: "\2714";
  border: 0.1em solid lightgray;
  border-radius: 0.2em;
  display: inline-block;
  width: 1.5em;
  height: 1.5em;
  padding-left: 0.2em;
  padding-bottom: 0.3em;
  margin-right: 0.2em;
  vertical-align: bottom;
  color: transparent;
  transition: .2s;
}

input[type=checkbox] + label:active:before {
  transform: scale(0);
}

input[type=checkbox]:checked + label:before {
  background-color: gray;
  border-color: gray;
  color: #fff;
}

input[type=checkbox]:disabled + label:before {
  transform: scale(1);
  border-color: #aaa;
}

input[type=checkbox]:checked:disabled + label:before {
  transform: scale(1);
  background-color: #F7C28F;
  border-color: #F7C28F;
}

#p1{
 border-color: #aaa;
 border : 1px solid black;
 witdh: 100%;
 height: 500px;
}


</style>


<link href="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker3.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker3.standalone.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<!-- ================================================================================= -->






	<div class="main-container" aria-labelledby="headingOne">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
			
			
			<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>비품 예약</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">비품 예약</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>



				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">비품 예약하기</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 col-sm-12 dateRage">
							
								<div class="form-group ">
									<label>예약 날짜</label>

									<input type="text" id="startDate" class="form-control startDate">
									
									
								</div>

								<div class="form-group">
									<label>반납 날짜</label> <input type="text" id="endDate" class="form-control startDate">
								</div>
								<button type="button" class="btn btn-success btn-lg btn-block" id="btn1" onclick="input1()">대여 기간 등록</button>
								
								
						</div>
						
						<script>
						


		                	/* $( "#startDate" ).datepicker({
		                    		dateFormat: "yyyy-mm-dd",
		                    		minDate: new Date(),
		                    		language:"kr",
		                    		todaytHightlight : true
		                			
		                			
		                    		
		                    });  */
		                	
		                	
		                	$( "#endDate" ).datepicker({
		                		minDate: new Date(),
	                    		dateFormat: "yyyy-mm-dd",
	                    		language:"kr",
	                    		todaytHightlight : true
	                			
	                			
	                    		
	                    	});
		                	
		                	
		                $("#startDate").datepicker({
		                	format: "yyyy-mm-dd",
		                	minDate: new Date(),
		                	autoclose : true,
		                }).on('changeDate', function(selected){
		                	var startDate = new Date(selected.date.valueOf());
		                	$("#endDate").datepicker('setStartDate', startDate);
		                }).on('clearDate', function (selected) {
		                	$('#endDate').datepicker('setStartDate', null);
		                });
		                
		                
		                $("#endDate").datepicker({
		                	format: "yyyy-mm-dd",
		                	minDate: new Date(),
		                	autoclose : true,
		                }).on('changeDate', function(selected){
		                	var endDate = new Date(selected.date.valueOf());
		                	$("#startDate").datepicker('setEndDate', endDate);
		                }).on('clearDate', function (selected) {
		                	$('#startDate').datepicker('setEndDate', null);
		                });
		                	
						
						
						
						function input1(){
							
							var startDate = document.getElementById("startDate").value
							var endDate = document.getElementById("endDate").value; 
							console.log(startDate)
							console.log(endDate)
							var p1 =document.getElementById("p1");
							
							p1.innerHTML =startDate + " 부터  " + endDate + " 일 까지" ;

							
							/* var length = $("input[name='supplies']:checked").length;
							
							console.log(length) */
							
							
						
							

							
						
							
							} 
						
						    
							/* var count1 = $("input[id='item01']").val();
							console.log(count1)
							var count2 = $("input[id='item02']").val();
							console.log(count2) */
						
						
						
						
						</script>
						
						
						

 						<div class="col-md-4 col-sm-12">
 						<fieldset class="outer" > <legend style="color: #1b00ff; font-weight: 700; width: 50%;"> 비품 목록</legend>
 						          <div class="mb-4">
										<input type="checkbox" name="supplies" class="styled-checkbox" id="styled-checkbox-1" value="모니터">
										<label for="styled-checkbox-1">모니터</label>
										<div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
										<span class="input-group-btn input-group-prepend"></span>
										<input id="item01" type="text" value="0" name="demo3_22" class="form-control" style="height: 30px; text-align: center;">
										<span class="input-group-btn input-group-append">
										</span></div>
									</div>
									
									<div class="mb-4">
										<input type="checkbox"  name="supplies" class="styled-checkbox" id="styled-checkbox-2"  value="프린터">
										<label for="styled-checkbox-2">프린터</label>
										<div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
										<span class="input-group-btn input-group-prepend"></span>
										<input id="item02" type="text" value="0" name="demo3_22" class="form-control" style="height: 30px; text-align: center;">
										<span class="input-group-btn input-group-append">
										</span></div>
									</div>
									
									<div class="mb-4">
										<input type="checkbox" name="supplies" class="styled-checkbox" id="styled-checkbox-3" value="책상">
										<label for="styled-checkbox-3">책상</label>
										<div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
										<span class="input-group-btn input-group-prepend"></span>
										<input id="item03" type="text" value="0" name="demo3_22" class="form-control" style="height: 30px; text-align: center;">
										<span class="input-group-btn input-group-append">
										</span></div>
									</div> 
									
									<div class="mb-4">
										<input type="checkbox"  name="supplies"class="styled-checkbox" id="styled-checkbox-4" value="케비넷">
										<label for="styled-checkbox-4">케비넷</label>
										<div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
										<span class="input-group-btn input-group-prepend"></span>
										<input id="item04" type="text" value="0" name="demo3_22" class="form-control" style="height: 30px; text-align: center;">
										<span class="input-group-btn input-group-append">
										</span></div>
									</div> 
									
									<div class="mb-4">
										<input type="checkbox" name="supplies" class="styled-checkbox" id="styled-checkbox-5" value="책 수납장">
										<label for="styled-checkbox-5">책 수납장</label>
										<div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
										<span class="input-group-btn input-group-prepend"></span>
										<input id="item05" type="text" value="0" name="demo3_22" class="form-control" style="height: 30px; text-align: center;">
										<span class="input-group-btn input-group-append">
										</span></div>
									</div> 
									
									<div class="mb-4">
										<input type="checkbox" name="supplies" class="styled-checkbox" id="styled-checkbox-6" value="카메라">
										<label for="styled-checkbox-6">카메라</label>
										<div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
										<span class="input-group-btn input-group-prepend"></span>
										<input id="item06" type="text" value="0" name="demo3_22" class="form-control" style="height: 30px; text-align: center;">
										<span class="input-group-btn input-group-append"></span></div>
									</div> 
									
									<div class="mb-4">
										<input type="checkbox" name="supplies" class="styled-checkbox" id="styled-checkbox-7"  value="조명">
										<label for="styled-checkbox-7">조명</label>
										<div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
										<span class="input-group-btn input-group-prepend"></span>
										<input id="item07" type="text" value="0" name="demo3_22" class="form-control" style="height: 30px; text-align: center;">
										<span class="input-group-btn input-group-append"></span></div>
										
									</div> 
									
									<div class="mb-4">
										<input type="checkbox" name="supplies" class="styled-checkbox" id="styled-checkbox-8" value="사다리">
										<label for="styled-checkbox-8">사다리</label>
										
										<div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
										<span class="input-group-btn input-group-prepend"></span>
										<input id="item08" type="text" value="0" name="demo3_22" class="form-control" style="height: 30px; text-align: center;">
										<span class="input-group-btn input-group-append">
										</span>
										</div>
										
									</div> 
									
									<br><br><br><br>
									<button type="button" class="btn btn-success btn-lg btn-block" onclick="input2()">비품 선택 완료</button>
									
							</fieldset>		
								
								
								</div>
								
								
								<script >
								
								function input2(){
									
									$("input[name='demo3_22']").each(function(e){
										console.log($(this).val())
										var count = $(this).val();
										
										if(count >0) {
											var p1 =document.getElementById("p1");
											p1.innerHTML += count + " 갯수" ;
										}
										
										
										
									})
									
									
								 	if ($('input[name="supplies"]').is(':checked') == true) {
										
								 		 $("input[name='supplies']:checked").each(function(e){
											console.log($(this).val())
											var items = $(this).val();
											var p1 =document.getElementById("p1");
											
											p1.innerHTML += items ;
											
										}) 
									
								 		/* var length = $("input[name='supplies']:checked").length;
										let text = "";
										for(i =0; i < length; i++;){
											var items = $(this).val();
											p1.innerHTML = items ;
										} */
										
								 	}
								}
								
								</script>
								
								
						
								
								<div class="col-md-4 col-sm-12">
								<p id ="p1" ></p>
								
								
								<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">비품 예약</h4>
							<p>선택한 비품 목록</p>
						</div>
						
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">비품</th>
								<th scope="col">갯수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
								
							</tr>
							
							
						</tbody>
					</table>
					
				</div>
								
								
								<button type="button" class="btn btn-primary btn-lg btn-block" >비품 예약 신청</button>
								</div>
								
							

							</div>
							
							
										
							</div>


					</div>
				</div>
				<!-- ======================================================================= -->

			</div>

	<jsp:include page="../common/footer.jsp" />
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker.kr.min.js"></script>
	
	
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/slick/slick.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
	<%-- <script src="${ pageContext.servletContext.contextPath }/resources/assets/js/momnet-locale-ko.js"></script> --%>
	
	<script>
		jQuery(document).ready(function() {
			jQuery('.product-slider').slick({
				slidesToShow: 1,
				slidesToScroll: 1,
				arrows: true,
				infinite: true,
				speed: 1000,
				fade: true,
				asNavFor: '.product-slider-nav'
			});
			jQuery('.product-slider-nav').slick({
				slidesToShow: 3,
				slidesToScroll: 1,
				asNavFor: '.product-slider',
				dots: false,
				infinite: true,
				arrows: false,
				speed: 1000,
				centerMode: true,
				focusOnSelect: true
			});
			$("input[name='demo3_22']").TouchSpin({
				initval: 1
			});
		});
	</script>
</body>
</html>