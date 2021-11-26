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

#meetingRoom1,  #meetingRoom2, #meetingRoom3, #meetingRoom4{
text-align: center;

}

#meetingRoom1>tbody>tr>td,
 #meetingRoom2>tbody>tr>td, 
 #meetingRoom3>tbody>tr>td,
  #meetingRoom4>tbody>tr>td{
  width: 50%
  }
  
  #reserve1,#reserve2,#reserve3,#reserve4{
  text-align: center;
  }
  
  #reset{
  float: right;
  }

</style>

</head>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
<link href="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker3.css" rel="stylesheet" />
<link href="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker3.standalone.css" rel="stylesheet" />


<body>
	<jsp:include page="../common/menubar.jsp" />


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
					        
					        <c:if test="${ loginUser.rightNo eq 5 }">
					        <input id="reset" class="btn btn-info" type="button" id="reset" value="초기화">
					        </c:if>
					        
					      </h5>
					   </div>
					   
					    <script>
					    $("#reset").click(function (){
					    	location.href="reset.me"
					    })
					    </script>
					
					   <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
					   <div class="card-body">
					       
					       							<form method="post" action="insertMeetingA.me">
					 								<input type = "hidden" name = "empId" value = "${loginUser.empId }"> 
					       
					       							<div class="row">
															
															<!-- 1번 -->
															<div class="col-md-6 col-sm-12">
															<div class="pd-20 card-box mb-30">
															<c:forEach items="${TimeTableA }" var="ma" varStatus="aa">

															<table class="table table-bordered" id="meetingRoom1">
															
															
															
															<tbody>
															<tr>
															<td colspan="">${ma.time }</td>
															<td>
															
															<c:choose>
															<c:when test="${ma.status eq 'Y'}">
															<button type="button"  class="btn btn-outline-success usableA${aa.index }" >사용 가능</button>
															<button type="button"  class="btn btn-success usingA${aa.index }" style="display : none; " >선택&nbsp;&nbsp;&nbsp;됨</button>
															</c:when>
															<c:otherwise>
															<button type="button"  class="btn btn-secondary usingA${aa.index }" disabled>예&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; 약</button>
															</c:otherwise>
															</c:choose>
															
															</td>
															</tr>
															</tbody>
															

															</table>
															
															
															<script>
															$(".usableA${aa.index }").click(function(){
																$(this).hide();
																$(this).next().css("display", "inline-block");
																
																var time = $(this).parent().prev().text();
																console.log(time);
																
																var html="";
																
																html +='<tr >'; 
																html +='<td  class="it'+ ${aa.index}+ '" ><input type="hidden" name="time" value="'+ time+'">'+time+'</td>';
																html +='</tr>';
																
																$("#reserve1").append(html);
																
																if($(this).next().css('display')=='inline-block'){
																$(this).next().click(function(){
																		
																		$(this).hide();
																		$(this).prev().show();
																		
																		var tr = $(".it${aa.index}").text();
																		console.log(tr)
																		//console.log("? " + $(this).parent().prev().text())
																		if($(".it${aa.index}").text() == $(this).parent().prev().text() ){
																			$(".it${aa.index}").parent().remove();
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
														
														
														<button id="booking1" class="btn btn-primary btn-lg btn-block" >회의실 예약</button>
													   
													
													</div>
													</div>	
													
													<script>
													 $("#booking1").click(function(){
														 
															var trlist = $("#reserve1>tbody>tr").length;
															
															if(trlist <= 0){
																alert("회의실을 선택해 주세요.")
																return false;
															}

															
														 })
													
													</script>
													
													</div>
													
													</form>
													
													

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
					       
					       
					       
					       				<form method="post" action="insertMeetingB.me">
					 					<input type = "hidden" name = "empId" value = "${loginUser.empId }"> 
					       
					       				<div class="row">
															
															
										<div class="col-md-6 col-sm-12">
										<div class="pd-20 card-box mb-30">
										
										<c:forEach items="${TimeTableB }" var="mb" varStatus="bb">

										<table class="table table-bordered" id="meetingRoom2">
															
										<tbody>
										<tr>
										<td colspan="">${mb.time }</td>
										<td>
										<c:choose>
										<c:when test="${mb.status eq 'Y'}">
										<button type="button"  class="btn btn-outline-success usableB${bb.index }" >사용 가능</button>
										<button type="button"  class="btn btn-success usingB${bb.index }" style="display : none; " >선택&nbsp;&nbsp;&nbsp; 됨</button>
										</c:when>
										<c:otherwise>
										<button type="button"  class="btn btn-secondary usingB${bb.index }" disabled>예&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; 약</button>
										</c:otherwise>
										</c:choose>
										</td>
										</tr>
										</tbody>
										</table>
										
										
										<script>
											
										$(".usableB${bb.index }").click(function(){
										$(this).hide();
										$(this).next().css("display", "inline-block");
										var time = $(this).parent().prev().text();
										console.log(time);
																
										var html="";
																
										html +='<tr >'; 
										html +='<td  class="it'+ ${bb.index}+ '"><input type="hidden" name="time" value="'+ time+'">'+time+'</td>';
										html +='</tr>';
																
										$("#reserve2").append(html);
																
											if($(this).next().css('display')=='inline-block')
											{
												$(this).next().click(function(){
																				
												$(this).hide();
												$(this).prev().show();
																				
												var tr = $(".it${bb.index}").text();
												
														if($(".it${bb.index}").text() == $(this).parent().prev().text() )
														{
																$(".it${bb.index}").parent().remove();
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
														
														
													<table class="table table-bordered" id="reserve2">
													
													<thead>
													<tr>
													<th colspan="">회의실 2
													<input type="hidden"   name="mrNo" value="2"  />
													</th>
													</tr>
													</thead> 
													
													<tbody> </tbody>
													
													</table>
													
													<button id="booking2" class="btn btn-primary btn-lg btn-block" >회의실 예약</button>
													   
													
										</div>
										</div>
										
										<script>
											$("#booking2").click(function(){
														 
												var trlist = $("#reserve2>tbody>tr").length;
													if(trlist <= 0){
														alert("회의실을 선택해 주세요.")
														return false;
													}

															
											})
													
										</script>	
													
										</div>
													
										</form>
					       
       
       
       
				      </div>
				    </div>
				  </div>
				  
				  
				  
				  <div class="card"><!-- card 03 -->
				   
					    <div class="card-header" id="headingThree">
					      <h5 class="mb-0">
					        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseOne">
					         	회의실 3 예약 상황 보기 
					        </button>
					      </h5>
						</div>
					
					    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
					      <div class="card-body">
					       
					       
					       
					       				<form method="post" action="insertMeetingC.me">
					 					<input type = "hidden" name = "empId" value = "${loginUser.empId }"> 
					       
					       				<div class="row">
															
															
										<div class="col-md-6 col-sm-12">
										<div class="pd-20 card-box mb-30">
										
										<c:forEach items="${TimeTableC }" var="mc" varStatus="cc">

										<table class="table table-bordered" id="meetingRoom3">
															
										<tbody>
										<tr>
										<td colspan="">${mc.time }</td>
										<td>
										<c:choose>
										<c:when test="${mc.status eq 'Y'}">
										<button type="button"  class="btn btn-outline-success usableC${cc.index }" >사용 가능</button>
										<button type="button"  class="btn btn-success usingC${cc.index }" style="display : none; " >선택&nbsp;&nbsp;&nbsp; 됨</button>
										</c:when>
										<c:otherwise>
										<button type="button"  class="btn btn-secondary usingC${cc.index }" disabled>예&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; 약</button>
										</c:otherwise>
										</c:choose>
										</td>
										</tr>
										</tbody>
										</table>
										
										
										<script>
											
										$(".usableC${cc.index }").click(function(){
										$(this).hide();
										$(this).next().css("display", "inline-block");
										var time = $(this).parent().prev().text();
										console.log(time);
																
										var html="";
																
										html +='<tr >'; 
										html +='<td  class="it'+ ${cc.index}+ '" ><input type="hidden" name="time" value="'+ time+'">'+time+'</td>';
										html +='</tr>';
																
										$("#reserve3").append(html);
																
											if($(this).next().css('display')=='inline-block')
											{
												$(this).next().click(function(){
																				
												$(this).hide();
												$(this).prev().show();
																				
												var tr = $(".it${cc.index}").text();
												
														if($(".it${cc.index}").text() == $(this).parent().prev().text() )
														{
																$(".it${cc.index}").parent().remove();
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
														
														
													<table class="table table-bordered" id="reserve3">
													
													<thead>
													<tr>
													<th colspan="">회의실 3
													<input type="hidden"   name="mrNo" value="3"  />
													</th>
													</tr>
													</thead> 
													
													<tbody> </tbody>
													
													</table>
													
													<button id="#booking3" class="btn btn-primary btn-lg btn-block" >회의실 예약</button>
													   
													
										</div>
										</div>
										
										<script>
											$("#booking3").click(function(){
														 
												var trlist = $("#reserve3>tbody>tr").length;
													if(trlist <= 0){
														alert("회의실을 선택해 주세요.")
														return false;
													}

															
											})
													
										</script>		
													
										</div>
													
										</form>
					       
       
       
       
				      </div>
				    </div>
				  </div>
				  
				  
				  
				  <div class="card"><!-- card 04 -->
				   
					    <div class="card-header" id="headingFour">
					      <h5 class="mb-0">
					        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseOne">
					         	회의실 4 예약 상황 보기 
					        </button>
					      </h5>
						</div>
					
					    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
					      <div class="card-body">
					       
					       
					       
					       				<form method="post" action="insertMeetingD.me">
					 					<input type = "hidden" name = "empId" value = "${loginUser.empId }"> 
					       
					       				<div class="row">
															
															
										<div class="col-md-6 col-sm-12">
										<div class="pd-20 card-box mb-30">
										
										<c:forEach items="${TimeTableD }" var="md" varStatus="dd">

										<table class="table table-bordered" id="meetingRoom4">
															
										<tbody>
										<tr>
										<td colspan="">${md.time }</td>
										<td>
										<c:choose>
										<c:when test="${md.status eq 'Y'}">
										<button type="button"  class="btn btn-outline-success usableD${dd.index }" >사용 가능</button>
										<button type="button"  class="btn btn-success usingD${dd.index }" style="display : none; " >선택&nbsp;&nbsp;&nbsp; 됨</button>
										</c:when>
										<c:otherwise>
										<button type="button"  class="btn btn-secondary usingD${dd.index }" disabled>예&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; 약</button>
										</c:otherwise>
										</c:choose>
										</td>
										</tr>
										</tbody>
										</table>
										
										
										<script>
											
										$(".usableD${dd.index }").click(function(){
										$(this).hide();
										$(this).next().css("display", "inline-block");
										var time = $(this).parent().prev().text();
										console.log(time);
																
										var html="";
																
										html +='<tr >'; 
										html +='<td  class="it'+ ${dd.index}+ '" ><input type="hidden" name="time" value="'+ time+'">'+time+'</td>';
										html +='</tr>';
																
										$("#reserve4").append(html);
																
											if($(this).next().css('display')=='inline-block')
											{
												$(this).next().click(function(){
																				
												$(this).hide();
												$(this).prev().show();
																				
												var tr = $(".it${dd.index}").text();
												
														if($(".it${dd.index}").text() == $(this).parent().prev().text() )
														{
																$(".it${dd.index}").parent().remove();
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
														
														
													<table class="table table-bordered" id="reserve4">
													
													<thead>
													<tr>
													<th colspan="">회의실 4
													<input type="hidden"   name="mrNo" value="4"  />
													</th>
													</tr>
													</thead> 
													
													<tbody> </tbody>
													
													</table>
													
													<button id="booking4" class="btn btn-primary btn-lg btn-block" >회의실 예약</button>
													   
													
										</div>
										</div>	
										
										<script>
											$("#booking4").click(function(){
														 
												var trlist = $("#reserve4>tbody>tr").length;
													if(trlist <= 0){
														alert("회의실을 선택해 주세요.")
														return false;
													}

															
											})
													
										</script>
													
										</div>
													
										</form>
					       
       
       
       
				      </div>
				    </div>
				  </div>
				  
				</div><!-- accordion end -->
					
					<jsp:include page="../common/footer.jsp" />

					</div>
				</div>
				

			</div>

	
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/bootstrap-datepicker.kr.min.js"></script>
	<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
	
	
	
</body>
</html>