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
width:100%;
}

.dateRage{
padding-right : 25px;
}

.myTable{
padding-top: 32px;
text-align: center;

}

#myTable> thead{
background-color: white;
}

#myTable> tbody{
background-color: #edf9ff;
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
											<h4 class="text-blue h4">비품 예약 기간 연장</h4>
											
										</div>
							</div>
						
						
					    <form id="enrollForm" method="post" action="updateDate.su">
					    <input type = "hidden" name = "empId" value = "${loginUser.empId }"> 
					    <div class="row">

								

	

								
								<div class="col-md-12 col-sm-12 myTable">
								
								
								<c:forEach items="${returnList}" var="su" varStatus="status">
											
											
															
									<table class="table table-bordered" id="myTable">
										 <thead>
										 	<tr>
												 <th style="vertical-align: center; text-align:center; padding: 35px;">예약 날짜</th>
												 <td colspan="2" >
												 <input  type="text"  class="form-control startDate"   name="startDate" readonly value="${returnList[status.index].startDate}"  >
												 <input type = "hidden" name = "empId" value = "${loginUser.empId }"></td>
												
											</tr>
											
											<tr>
											<th style="vertical-align: center; text-align:center; padding: 35px;">반납 날짜</th>
											<td colspan="2" ><input id="toDate${status.index }" type="text" class="form-control toDate" name="endDate"  value="${returnList[status.index].endDate}"></td>
											</tr>
											
											<tr>
												
												<th scope="col">비품</th>
												<th scope="col">개수</th>
											     
											</tr>
										</thead> 
										<tbody>
										<tr>
										
											<td>
											 <input type = "hidden" name = "reNo" value = "${returnList[status.index].reNo}">
											${returnList[status.index].suppliesName}</td>
											<td>${returnList[status.index].counts}</td>
											
										</tr>
										</tbody>
									</table>
									<script>
								
				                	
				                	
					                	$( "#toDate${status.index }" ).datepicker({
					                		minDate: new Date(),
				                    		dateFormat: "yyyy-mm-dd",
				                    		language:"kr",
				                    		todaytHightlight : true
				                			
				                			
				                    		
				                    	});  

				                	
									
									</script>
								</c:forEach>
								

								</div>
								
							
							
							</div><!-- row end -->
							
							
							<button type="submit" class="btn btn-success btn-lg btn-block" >대여 기간 연장</button>
							</form><!-- form end -->
							
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