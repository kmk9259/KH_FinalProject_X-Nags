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
					
							/* var length = $("input[name='supplies']:checked").length;
							
							console.log(length) */

							
	                    	    var startDate = document.getElementById("startDate").value;
	                    	    var endDate = document.getElementById("endDate").value;
	                    	    var p1 =document.getElementById("p1");

	                    	    if ((Date.parse(endDate) <= Date.parse(startDate))) {
	                    	        alert("반납일은 시작일 이후여야 합니다.");
	                    	        document.getElementById("endDate").value = "";
	                    	        
	                    	    }else{
	                    	    	p1.innerHTML =startDate + " 부터  " + endDate + " 일 까지" ;
	                    	    }
	                    	
	                    	    
								
								
							
							} 
						
						    
							/* var count1 = $("input[id='item01']").val();
							console.log(count1)
							var count2 = $("input[id='item02']").val();
							console.log(count2) */
						
						
						
						
						</script>
						
						
						<!-- private String suppliesCode;
						private String suppliesName;
						private int count; -->
						
						
						
						
						
 						<div class="col-md-4 col-sm-12">
 						<fieldset class="outer" > <legend style="color: #1b00ff; font-weight: 700; width: 50%;"> 비품 목록</legend>
 						  <c:forEach items="${supList}" var="st" varStatus="status">
 						          <div class="mb-4">
										<input type="checkbox" name="supplies" class="styled-checkbox" id="styled-checkbox-${status.index+1 }" value="${st.suppliesName}">
										<label for="styled-checkbox-${status.index+1 }"class="it${status.index+1 }">${st.suppliesName} : ${st.count}</label>
										<div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
										<span class="input-group-btn input-group-prepend"></span>
										<input id="item0${status.index +1}" type="text" value="0" name="demo3_22" "class="form-control" style="height: 30px; text-align: center;">
										<span class="input-group-btn input-group-append">
										</span></div>
									</div>
						 	</c:forEach>
					
									
									<br><br><br><br>
									<button type="button" class="btn btn-success btn-lg btn-block" onclick="input2()">비품 선택 완료</button>
									
							</fieldset>		
								
								
								</div>
								
								
								<script >
								
								
								 $(document).ready(function() {
									$('.styled-checkbox').on('click', function(){
										if($(this).prop('checked')){
											
											var html = "";
											
											
											 html +='<tr>'; 
											 html +='<td>'+ $(this).val()+ '</td>';
											 html +='<td>' + $("input[name='demo3_22']").val()+ '</td>';
											 html +='<td><button type="submit" class="btn btn-primary">삭제</button></td>';
											 html +='</tr>';
											 
											$("#myTable").append(html);
										}else{
											
											if($(".it1").text() == $(this).val()) {
												var tr = $(this).parent();
												tr.remove();
											}
												//alert($(this).val())
												//alert("각 레이블 이름 값 " + $(".it1").text())
												//alert($("#myTable tr:eq(1) td:eq(0)").text())
												var tr = $("#myTable tbody tr:last");
												tr.remove();
											
											
											
											//var t = $("#myTable").find("td:eq(0)").text();
											var length = $("#myTable tbody tr").length;
											console.log("행 개수 "+length);
											for(var i =0; i < length; i++ ){
												//var t = $("#myTable tr:eq(1) td:eq(0)").text();
												//console.log(i);
												console.log($("#myTable tr").length)
												
												//console.log("찾은 컬럼 명 "+t)
												//console.log($(this).val())
											}
										
											
											
										}
									})
								}); 
								
								
								
							
								
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
					<table class="table table-bordered" id="myTable">
						 <thead>
							<tr>
								
								<th scope="col">비품</th>
								<th scope="col">개수</th>
								<th scope="col">삭제</th>
							</tr>
						</thead> 
						<tbody>
							
							
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