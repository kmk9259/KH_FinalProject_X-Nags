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
.toggle btn .btn-primary{
height: 40px;
}

</style>

</head>


<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">


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
								<h4>회의실 예약</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">회의실 예약</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>



				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">회의실 예약하기</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 col-sm-12">
							
								<div class="form-group ">
									<label>예약 날짜</label> <input class="form-control date-picker"
										placeholder="Select Date" id="startDate" type="text">
								</div>

								
		<br><br><br><br>
						
						
				<!-- 	<div class="pd-20 card-box mb-30"> -->
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">시간</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4 col-sm-12">
							<div class="form-group">
								<label>시작 시간</label>
								<input class="form-control time-picker-default" placeholder="time" type="text">
							</div>
						</div>
						<div class="col-sm-4 col-sm-12">
							<div class="form-group">
								<label>마침 시간</label>
								<input class="form-control time-picker-default" placeholder="time" type="text">
							</div>
						</div>
						
					</div>
				<!-- </div> -->
				<button type="button" class="btn btn-success btn-lg btn-block" id="btn1" onclick="input1()">회의실 예약 시간 등록</button>
						
						
						
						
						
								
						</div>
						
						<script>
						function input1(){
							
							var startDate = document.getElementById("startDate").value;
							var endDate = document.getElementById("endDate").value;
							console.log(startDate)
							console.log(endDate)
							var p1 =document.getElementById("p1");
							
							p1.innerHTML =endDate + " 부터  " + startDate + " 일 까지" ;


							
							} 
						
						    
						
						
						
						
						</script>
						
						
						

 						      <div class="col-md-8 col-md-6">
 						
			 						                              	
				                                												
									<div class="col-md-6 col-sm-12 mb-30">
										<h4 class="mb-15 text-blue h4">회의실 1번</h4>
										<p>3인 이상</p>
										<div class="btn-list">
											<input type="checkbox" checked data-toggle="toggle" data-size="xs">
										</div>
									
							        </div>
												
												
												
												
								
									
							
								
								
								</div>
								
								
								<script>
								
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
	
	<!-- js -->
	
	<script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/process.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/vendors/scripts/layout-settings.js"></script>

	
<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
	
	
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/slick/slick.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/momnet-locale-ko.js"></script>
	
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