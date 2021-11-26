<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
width:80px;
}


</style>

<link href="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker3.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker3.standalone.css" rel="stylesheet" />
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />

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
				<form id="enrollForm" method="post" action="insertSup.su">
				<input type = "hidden" name = "empId" value = "${loginUser.empId }"> 
				<div class="row">
				
					<div class="col-md-4 col-sm-12 dateRage">
					<div class="clearfix mb-20">
					<div class="pull-left"><h4 class="text-blue h4">날짜 선택</h4></div>
					</div>
							
					<div class="form-group ">
					<label>예약 날짜</label>
					<input type="text" id="startDate" class="form-control startDate">
					</div>

					<div class="form-group">
					<label>반납 날짜</label> <input type="text" id="endDate" class="form-control startDate">
					</div>
					<button type="button" data-toggle="modal" class="btn btn-success btn-lg btn-block" id="btn1" onclick="input1()">대여 기간 등록</button>
					</div>
					
					<!-- 날짜 입력 관련 팝업 01 -->
							<div class="modal fade" id="warning-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-sm modal-dialog-centered">
									<div class="modal-content bg-warning">
										<div class="modal-body text-center">
											<h3 class="mb-15"><i class="fa fa-exclamation-triangle"></i> 경고</h3>
											<p>날짜를 입력해 주세요.</p>
											<button type="button" class="btn btn-dark" data-dismiss="modal">Ok</button>
										</div>
									</div>
								</div>
							</div>
							
					<!-- 날짜 입력 관련 팝업 02 -->
							<div class="modal fade" id="warning-modal2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-sm modal-dialog-centered">
									<div class="modal-content bg-warning">
										<div class="modal-body text-center">
											<h3 class="mb-15"><i class="fa fa-exclamation-triangle"></i> 경고</h3>
											<p>오늘날짜 이후로 선택해 주세요.</p>
											<button type="button" class="btn btn-dark" data-dismiss="modal">Ok</button>
										</div>
									</div>
								</div>
							</div>
							
					<!-- 날짜 입력 관련 팝업 03 -->
							<div class="modal fade" id="warning-modal3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-sm modal-dialog-centered">
									<div class="modal-content bg-warning">
										<div class="modal-body text-center">
											<h3 class="mb-15"><i class="fa fa-exclamation-triangle"></i> 경고</h3>
											<p>반납일은 예약일 이후여야 합니다.</p>
											<button type="button" class="btn btn-dark" data-dismiss="modal">Ok</button>
										</div>
									</div>
								</div>
							</div>
						
						<script>
	
		                	   $( "#startDate" ).datepicker({
		                    		dateFormat: "yyyy-mm-dd",
		                    		minDate: new Date(),
		                    		language:"kr",
		                    		todaytHightlight : true

		                   	   });  
		                	
			                	$( "#endDate" ).datepicker({
			                		minDate: new Date(),
		                    		dateFormat: "yyyy-mm-dd",
		                    		language:"kr",
		                    		todaytHightlight : true
		                			
		                    	});  
		                	

						
						function input1(){
							
	                    	    var startDate = document.getElementById("startDate").value;
	                    	    var endDate = document.getElementById("endDate").value;
	                    	    var now = new Date();
	                    	    
	                    	    console.log(startDate.valueOf())
	                    	    console.log(now.valueOf())
	                    	    console.log(Date.parse(startDate))
	                    	    console.log(Date.parse(now))
	                    	  
	                    	    var fromDate=document.getElementById("fromDate");
	                    	    var toDate=document.getElementById("toDate");

	                    	    
	                    	    if(startDate == "" || endDate == ""){
	                    	    	
	                    	    	 $("#btn1").attr('data-target','#warning-modal');
	                    	    	
	                    	    }else{
	                    	    	//if ((Date.parse(startDate) < Date.parse(now)))
	                    	    	if ((Date.parse(startDate) < Date.parse(now))) {
		                    	        
		                    	        $("#btn1").attr('data-target','#warning-modal2');
		                    	        document.getElementById("startDate").value = "";
		                    	        
		                    	    }else{
		                    	    	$("#btn1").removeAttr('data-target','#warning-modal2');
		                    	    	fromDate.value = startDate;
		                    	    }
	                    	    	
	                    	    	if ((Date.parse(endDate) <= Date.parse(startDate))) {
	 	                    	    	$("#btn1").attr('data-target','#warning-modal3');
	 	                    	        document.getElementById("endDate").value = "";
	 	                    	        
	 	                    	    } else {
	 	                    	    	toDate.value = endDate;
	 	                    	    } 
	                    	    	
	                    	    }
	                    	    

	              
							} 
						
						</script>
						

						
						
 						<div class="col-md-4 col-sm-12" style="padding-left: 50px; padding-right: 50px;">
 						  <div class="clearfix mb-20">
								<div class="pull-left"><h4 class="text-blue h4">비품 목록</h4></div>
						  </div>
 						
 						  <c:forEach items="${supList}" var="st" varStatus="status">
 						          <div class="mb-4">
 						          		<input type="hidden" id="suppliesCode${status.index +1}" value="${st.suppliesCode }">
 						          		<!--  data-toggle="modal" data-target="#alert-modal"  -->
										<input type="checkbox"  data-toggle="modal" name="supplies" class="styled-checkbox" id="styled-checkbox-${status.index+1 }" value="${st.suppliesName}">
										
										<label for="styled-checkbox-${status.index+1 }"class="it${status.index+1 }">${st.suppliesName}</label>
										<div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
										<span class="input-group-btn input-group-prepend"></span>
										<input id="item0${status.index +1}" type="text" value="0" name="count" class="form-control"  style="height: 30px; text-align: center;">
										<span class="input-group-btn input-group-append up" >
										</span></div>
									</div>
									
									
								
								<!-- 모달 팝업  -->
								<div class="modal fade " id="alert-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-modal="true">
								<div class="modal-dialog modal-sm modal-dialog-centered" > 
									<div class="modal-content bg-danger text-white">
										<div class="modal-body text-center">
											<h3 class="text-white mb-15"><i class="fa fa-exclamation-triangle"></i>입력 오류</h3>
											<p>"먼저 숫자를 입력하세요. 0 보다 큰 숫자이어야 합니다."</p>
											<button type="button" class="btn btn-light" data-dismiss="modal">Ok</button>
										</div>
									</div>
								</div>
							   </div>
							   
							   
						      
						 	
								<script>
								
								 $(document).ready(function() {
									 
									 
									
									 
									$('#styled-checkbox-${status.index+1 }').on('click', function(){
										if($(this).prop('checked')){
											
											var inputNum =$("#item0${status.index +1}").val();
											 console.log($("#item0${status.index +1}").val())
											 if($("#item0${status.index +1}").val() == '0') {
												 
												 $("#styled-checkbox-${status.index+1 }").attr('data-target','#alert-modal');
												 $(this).prop('checked', false); 
											 }else{
											
											 $("#styled-checkbox-${status.index+1 }").removeAttr('data-target','#alert-modal');
											 $(this).prop('checked', true); 
											 var html = "";
												var count = $("#item0${status.index +1}").val();
													
												html +='<tr>'; 
												html +='<td  class="it${status.index +1}"><input type="hidden" id="code" name="suppliesCode" value="'+$("#suppliesCode${status.index +1}").val()+'"><input class="item" name="suppliesName" value="'+ $(this).val()+'"readonly/>'+ '</td>';
												html +='<td><input class="count" name="counts" value="'+count+'"readonly/>' +  '</td>';
												html +='</tr>';
												$("#myTable").append(html); 

											 }
											
											
											 
											 var trlist = $("#myTable>tbody>tr").length;
											 
											 console.log("after "+trlist)
											
											
										}else{
											if($(".it${status.index+1}:eq(1) .item").val() === $(this).val()) {
												var tr = $(".it${status.index+1}:eq(1)").parent();
												tr.remove();
											} 
										}
									})
									
								}); 
								
								
								</script>
							</c:forEach>
						</div>
								
						<div class="col-md-4 col-sm-12">
							<div class="clearfix mb-20">
							<div class="pull-left">
									<h4 class="text-blue h4">비품 예약</h4>
									<p>선택한 비품 목록</p>
							</div>
							</div>
									
									<table class="table table-bordered" id="myTable">
										 <thead>
										 	<tr>
												<th style="vertical-align: center;">예약 날짜</th>
												<td><input id="fromDate"  name="startDate" readonly >
											</tr>
											
											<tr>
												<th>반납 날짜</th>
												<td><input id="toDate"  name="endDate" readonly></td>
											</tr>
											
											<tr>
												<th scope="col">비품</th>
												<th scope="col">개수</th>
											</tr>
											
										</thead> 
										<tbody><!-- 동적 테이블 --></tbody>
									</table>
								<button id="booking" data-toggle="modal" data-target="" class="btn btn-primary btn-lg btn-block" >비품 예약 신청</button>
								
								
								<!-- 확인 창 모달 팝업 -->
								<div class="modal fade" id="confirmation-modal2" tabindex="-1" role="dialog" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-body text-center font-18">
											<h4 class="padding-top-30 mb-30 weight-500">비품 대여 목록을 확인 하였으며, 진행 하시겠습니까? </h4>
											<div class="padding-bottom-30 row" style="max-width: 170px; margin: 0 auto;">
												<div class="col-6">
													<button type="button" class="btn btn-secondary border-radius-100 btn-block confirmation-btn" data-dismiss="modal"><i class="fa fa-times"></i></button>
													NO
												</div>
												<div class="col-6">
													<button type="submit" class="btn btn-primary border-radius-100 btn-block confirmation-btn" data-dismiss="modal"><i class="fa fa-check"></i></button>
													YES
												</div>
											</div>
										</div>
									</div>
								  </div>
								</div>
								
								
								<!-- 모달 팝업2  -->
							   <div class="modal fade " id="alert-modal2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-modal="true">
								<div class="modal-dialog modal-sm modal-dialog-centered" > 
									<div class="modal-content bg-danger text-white">
										<div class="modal-body text-center">
											<h3 class="text-white mb-15"><i class="fa fa-exclamation-triangle"></i>입력 오류</h3>
											<p>"비품을 선택하세요 !"</p>
											<button type="button" class="btn btn-light" data-dismiss="modal">Ok</button>
										</div>
									</div>
								</div>
							   </div>
							   
							   <!-- 예약 날짜 모달 팝업1  -->
							   <div class="modal fade " id="alert-modal3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-modal="true">
								<div class="modal-dialog modal-sm modal-dialog-centered" > 
									<div class="modal-content bg-danger text-white">
										<div class="modal-body text-center">
											<h3 class="text-white mb-15"><i class="fa fa-exclamation-triangle"></i>입력 오류</h3>
											<p>"예약 날짜를 선택하세요 "</p>
											<button type="button" class="btn btn-light" data-dismiss="modal">Ok</button>
										</div>
									</div>
								</div>
							   </div>
							   
							   <!-- 반납 날짜 모달 팝업2  -->
							   <div class="modal fade " id="alert-modal4" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-modal="true">
								<div class="modal-dialog modal-sm modal-dialog-centered" > 
									<div class="modal-content bg-danger text-white">
										<div class="modal-body text-center">
											<h3 class="text-white mb-15"><i class="fa fa-exclamation-triangle"></i>입력 오류</h3>
											<p>"반납날짜를 선택하세요."</p>
											<button type="button" class="btn btn-light" data-dismiss="modal" id="ok">Ok</button>
										</div>
									</div>
								</div>
							   </div>
							
						 </div>
						 </div><!-- row end -->
						 </form><!-- form end -->
						 </div>
						 
						 <script type="text/javascript">
						 $("#booking").click(function(){
							 
							var trlist = $("#myTable>tbody>tr").length;
							
							if($("#fromDate").val() == "" ){
								$("#booking").attr('data-target','#alert-modal3');
								alert("예약 날짜를 선택해주세요.")
								return false;
							}else if($("#toDate").val() == "" ){
								$("#booking").attr('data-target','#alert-modal4');
								alert("반납 날짜를 선택해주세요.")
								return false;
							}else if(trlist <= 0){
								alert("비품을 선택해 주세요.")
								$("#booking").attr('data-target','#alert-modal2');
								return false;
							}else{
								//$("#booking").attr('data-target','#confirmation-modal2');
								//return false;
							}

							
						 })
						 
						 </script>

						<jsp:include page="../common/footer.jsp" />
					</div>
				</div>

			</div>

	
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker.kr.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/slick/slick.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
	
	
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
			$("input[name='count']").TouchSpin({
				initval: 1
			});
		});
	</script>
</body>
</html>