<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Nomal Groupware Solution</title>
<style>
.btn-success {
    
    margin-bottom: 0px;
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
 height: 100px;
}
.toggle btn .btn-primary{
height: 40px;
}

#meetingRoom{
border : none;
resize: vertical;
width:120px;
}


#reserve1{
text-align: center;
}
</style>

</head>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
<link href="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker3.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker3.standalone.css" rel="stylesheet" />


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
					
					
					<div id="accordion">
					
					  <div class="card"><!-- card 01 -->
					    <div class="card-header" id="headingOne">
					      <h5 class="mb-0">
					        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					         	<strong>회의실 1 예약 상황 보기 </strong>
					        </button>
					      </h5>
					    </div>
					
					    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
					      <div class="card-body">
					       
					       
					       
					       							<div class="row">
															
															<!-- 1번 -->
															<div class="col-md-6 col-sm-12">
															<div class="pd-20 card-box mb-30">
															<c:forEach items="${TimeTableA }" var="time" varStatus="status">

															<table class="table table-bordered" id="meetingRoom1">
															
															
															
															<tbody>
															<tr>
															<td colspan="">${time.timeA }</td>
															<td>
															
															<c:choose>
															<c:when test="${time.statusA eq 'Y'}">
															<button type="button"  class="btn btn-outline-success usable${status.index }" >사용 가능</button>
															<button type="button"  class="btn btn-success using${status.index }" style="display : none; " >선택 됨</button>
															</c:when>
															<c:otherwise>
															<button type="button"  class="btn btn-secondary using${status.index }">사용 중</button>
															</c:otherwise>
															</c:choose>
															
															</td>
															</tr>
															</tbody>
															

															</table>
															
															
															<script>
															$(".usable${status.index }").click(function(){
																$(this).hide()
																$(this).next().css("display", "block");
																
																var time = $(this).parent().prev().text()
																console.log(time)
																
																var html="";
																
																html +='<tr >'; 
																html +='<td  class="it'+ ${status.index}+ ' ><input type="hidden" name="timeA" >'+time+'</td>';
																html +='</tr>';
																
																$("#reserve1").append(html);
																
																if($(this).next().css('display')=='block'){
																$(this).next().click(function(){
																		
																		$(this).hide();
																		$(this).prev().show();
																		
																		var tr = $(".it${status.index}").text();
																		console.log(tr)
																		//console.log("? " + $(this).parent().prev().text())
																		if($(".it${status.index}").text() == $(this).parent().prev().text() ){
																			$(".it${status.index}").parent().remove();
																		}
																	});
																	
																}
															})
															</script>
															</c:forEach>
					
															
													</div>
													</div>
															
													
													<div class="col-md-6 col-sm-12">
													<div class="pd-20 card-box mb-30">		
														<div class="clearfix mb-20">
															<div class="pull-left">
																<h4 class="text-blue h4">회의실 예약하기</h4>
															</div>
														</div>
														
														<form id="" method="post" action="insertMeeting.me">
					 									<input type = "hidden" name = "empId" value = "${loginUser.empId }"> 
														<table class="table table-bordered" id="reserve1">
														 <thead>
															<tr>
															<th colspan="">회의실 1
															<input type="hidden"   name="mrNo" value="1"  />
															</th>
															</tr>

														</thead> 
														<tbody>
																				
																				
														</tbody>
														</table>
														
														
														<button type="button" class="btn btn-primary btn-lg btn-block" >회의실 예약</button>
													    </form>
													
													</div>
													</div>	
													
													</div>
													
													
															
															
															
					       
       
       
       
				      </div>
				    </div>
				  </div>
				</div>
				 
				   <div class="card"><!-- card 02 -->
					    <div class="card-header" id="headingTwo">
					      <h5 class="mb-0">
					        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseOne">
					         	회의실 2 예약 상황 보기 
					        </button>
					      </h5>
					    </div>
					
					    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
					      <div class="card-body">
					       
					       
					       
					       				<div class="row">
															
															<!-- 1번 -->
															<div class="col-md-6 col-sm-12">
															<div class="pd-20 card-box mb-30">
															

															<table class="table table-bordered" id="myTable">
															<thead><tr><th colspan="2"> 회의실 2 </th><tr></thead>
															
															<c:forEach items="${TimeTableB }" var="time" varStatus="status">
															<tbody>
															<tr>
															<td colspan="">${time.timeB }</td>
															<td>
															
															<c:choose>
															<c:when test="${time.statusB eq 'Y'}">
															<button type="button"  class="btn btn-outline-success usable${status.index }">사용 가능</button>
															</c:when>
															<c:otherwise>
															<button type="button"  class="btn btn-secondary using${status.index }">사용 중</button>
															</c:otherwise>
															</c:choose>
															
															</td>
															</tr>
															</tbody>
															</c:forEach>
															
															
															</table>
															

															
															
															<!-- <script>
															$(".usable${s1.index }").click(function(){
																
																$(this).hide()
																$(this).next().css("display", "block");
																
																/*시간 가져오기*/
																var time = $(this).parent().prev().text()
																console.log(time)
																var html="";
																
																html +='<tr >'; 
																html +='<td colspan="2" class="it${s1.index +1} ><input type="hidden" name="Time_A">'+time+'</td>';
																html +='</tr>';
																
																$("#reserve").append(html);
																
																console.log("길이 ?"+ $("#reserve tbody tr").length)
																
																
																/*회의실 이름 가져오기*/
																var mName = $(this).parent().parent().parent().children().children(".title").text();
																console.log(mName)
																
																if($(this).next().css('display')=='block'){
																	$(this).next().click(function(){
																		
																		$(this).hide();
																		$(this).prev().show();
																		
																			var i = $("#reserve tbody tr:eq(i) td:eq(0)").text();
																			class="it${status.index +1}
																			
																			
																			console.log("찾는 값?" + i)
																			var u = $(this).parent().prev().text();
																			console.log("u " + u)
																		
																		
																	})
																}
															})
															

															</script> -->
															
															
					
															
													</div>
													</div>
															
															
														
															
													</div>
															
															
					       
       
       
       
				      </div>
				    </div>
				  </div>
				  
				</div><!-- accordion end -->
					
					
	



					</div>
				</div>
				<!-- ======================================================================= -->

			</div>

	<jsp:include page="../common/footer.jsp" />
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker.kr.min.js"></script>
<%-- 	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/slick/slick.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script> --%>

	
<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
	
	
	
</body>
</html>