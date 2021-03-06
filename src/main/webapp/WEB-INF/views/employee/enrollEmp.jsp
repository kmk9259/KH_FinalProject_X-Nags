<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>X-Nomal Groupware Solution</title>


<style type="text/css">
#close {
	position: absolute;
	float: right;
	background: red;
	color: white;
	width: 30px;
	z-index: 1;
}


* {
    margin: 0;
    padding: 0
}

html {
    height: 100%
}

p {
    color: grey
}

#heading {
    text-transform: uppercase;
    color: #673AB7;
    font-weight: normal
}

#msform {
    text-align: center;
    position: relative;
    margin-top: 20px
}

#msform fieldset {
    background: white;
    border: 0 none;
    border-radius: 0.5rem;
    box-sizing: border-box;
    width: 100%;
    margin: 0;
    padding-bottom: 20px;
    position: relative
}

.form-card {
    text-align: left
}

#msform fieldset:not(:first-of-type) {
    display: none
}

#msform input,
#msform textarea {
    padding: 8px 15px 8px 15px;
    border: 1px solid #ccc;
    border-radius: 0px;
    /* margin-bottom: 25px; */
    margin-top: 2px;
    /* width: 100%; */
    box-sizing: border-box;
    font-family: montserrat;
    color: #2C3E50;
   /*  background-color: #ECEFF1; */
    font-size: 16px;
    letter-spacing: 1px
}

#msform input:focus,
#msform textarea:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #673AB7;
    outline-width: 0
}

#msform .action-button {
    width: 100px;
    font-weight: bold;
    background: #28a745;
    color: white;
    border: 0 none;
    border-radius: 0.25rem;
    cursor: pointer;
    padding: 10px 5px;
    margin: 10px 0px 10px 5px;
    float: right
}

#msform .action-button:hover,
#msform .action-button:focus {
    background-color: #311B92
}

#msform .action-button-previous {
    width: 100px;
    background: #616161;
    font-weight: bold;
    color: white;
    border: 0 none;
    border-radius: 0.25rem;
    cursor: pointer;
    padding: 10px 5px;
    margin: 10px 5px 10px 0px;
    float: right
}

#msform .action-button-previous:hover,
#msform .action-button-previous:focus {
    background-color: #000000
}

.card {
    z-index: 0;
    border: none;
    position: relative;
    
}

.fs-title {
    font-size: 25px;
    color: #673AB7;
    margin-bottom: 15px;
    font-weight: normal;
    text-align: left
}

.purple-text {
    color: #673AB7;
    font-weight: normal
}

.steps {
    font-size: 25px;
    color: gray;
    margin-bottom: 10px;
    font-weight: normal;
    text-align: right
}

.fieldlabels {
    color: gray;
    text-align: left
}

#progressbar {
    margin-bottom: 30px;
    overflow: hidden;
    color: lightgrey
}

#progressbar .active {
    color: #673AB7
}

#progressbar li {
    list-style-type: none;
    font-size: 15px;
    width: 25%;
    float: left;
    position: relative;
    font-weight: 400
}

#progressbar #account:before {
    font-family: FontAwesome;
    content: "\f13e"
}

#progressbar #personal:before {
    font-family: FontAwesome;
    content: "\f007"
}

#progressbar #payment:before {
    font-family: FontAwesome;
    content: "\f030"
}

#progressbar #confirm:before {
    font-family: FontAwesome;
    content: "\f00c"
}

#progressbar li:before {
    width: 50px;
    height: 50px;
    line-height: 45px;
    display: block;
    font-size: 20px;
    color: #ffffff;
    background: lightgray;
    border-radius: 50%;
    margin: 0 auto 10px auto;
    padding: 2px
}

#progressbar li:after {
    content: '';
    width: 100%;
    height: 2px;
    background: lightgray;
    position: absolute;
    left: 0;
    top: 25px;
    z-index: -1
}

#progressbar li.active:before,
#progressbar li.active:after {
    background: #673AB7
}

.progress {
    height: 20px
}

.progress-bar {
    background-color: #673AB7
}

.fit-image {
    width: 100%;
    object-fit: cover
}

</style>
  

</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<!-- ================================================================================= -->
	
	
	<div class="mobile-menu-overlay"></div> 
	
	

	<div class="main-container">
	
	<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>?????? ??????</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">???</a></li>
									<li class="breadcrumb-item active" aria-current="page">?????? ??????</li>
								
								</ol>
							</nav>
						</div>
					</div>
				</div>
	
	
	<div class="pd-20 card-box mb-30">
	<div class="clearfix">
	<h4 class="text-blue h4">?????? ??????</h4>
	<p class="mb-30">????????? ????????? ????????? ?????????</p>
	</div>
					
					
					
					
		<div class="container-fluid">
		    <div class="row justify-content-center">
		        <div class="col-11">
		            <div class="card px-0 pt-4 pb-0 mt-3 mb-3" style="border: none;">
		                <h2 id="heading">????????? ???????????????</h2>
		                <p>?????? ???????????? ???????????????</p>
		                <form id="msform" action="insertEmp.me" method="post" enctype="multipart/form-data">
		                    
		                    <ul id="progressbar">
		                        <li class="active" id="account"><strong>???????????? ??????</strong></li>
		                        <li id="personal"><strong>???????????? ?????? + ????????????</strong></li>
		                        <li id="payment"><strong>????????????</strong></li>
		                        <li id="confirm"><strong>?????? ??????</strong></li>
		                    </ul>
		                    <div class="progress">
		                        <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
		                    </div> <br>
							
							
		                    

	            <!--============================= step 1 =====================================-->
				<fieldset>
		   		<div class="form-card">
		                   <div class="row">
		                   <div class="col-7"><h2 class="fs-title">?????? ?????? ?????? ??????:</h2></div>
		                   <div class="col-5"><h2 class="steps">Step 1 - 4</h2></div>
		                   </div>
										


						<div class="form-group">
							<label>?????? ??????(*)</label>
							<input class="form-control" type="text" placeholder="userName" id="userName" name="userName">
						</div>


						<div class="form-group">
							<label>????????????(*)</label> <div class="form-control-feedback"  style="font-size: 0.9rem;">?????? ?????? ???????????? ?????? 6?????? ?????? 15??? ????????? ???????????????</div>
							<input class="form-control" type="password" placeholder="password" id="userPwd" name="userPwd">
							
						</div>
						<div class="form-group">
							<label>??????????????????(*)</label>
							<input class="form-control" type="text" id="userSsn" name="userSsn" onkeyup="setSSn(this)" maxlength='14'>
							
							<script>
							function setSSn(obj)
							{
								var ssn = obj.value;
								var ssn = ssn.replace("-","");
								if(ssn.length < 7) {
									var ssn1 = ssn.substring(0,7);
									var ssn2 = ssn.substring(7,8);
															
									obj.value = ssn1+"-"+ssn2;
								}
							}
							
							</script>
						</div>
						
						<div class="form-group">
							<label>?????????(*)</label> <input class="form-control" placeholder="email" type="email" id="email" name="email">
						</div>
						
						<div class="form-group">
							<label>????????????(*)</label> <input class="form-control" placeholder="000-0000-0000" type="tel" id="phone" name="phone" oninput="autoHyphen(this)" maxlength='13'>
						</div><br><br><br>
						<script>
						const autoHyphen = (target) => {
							 target.value = target.value
							   .replace(/[^0-9]/, '')
							   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
							}
						
						</script>

						<!-- ????????????  -->

						<label for="address"> &nbsp; ?????? ?????? :</label><br>

						<div class="form-inline">
							<label> &nbsp; ???????????? : &nbsp;</label> <input type="text"
								id="post" name="post" class="form-control mr-2 postcodify_postcode5"
								size="6">
							<button type="button" class="btn btn-primary"
								id="postcodify_search_button">??????</button>
						</div>
						<br> <label> &nbsp; ??????????????? : </label> <input type="text" id="address1"
							name="address1" class="form-control postcodify_address" size="30">
						<br> <label> &nbsp; ???????????? : </label> <input type="text" id="address2"
							name="address2" class="form-control postcodify_extra_info"
							size="30"> <br>


						<!-- jQuery??? Postcodify??? ????????????. -->
						<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
						<script>
							// ?????? ????????? ????????? ?????? ???????????? ???????????? ????????????.
							$(function() {
								$("#postcodify_search_button")
										.postcodifyPopUp();
							});
						</script> 


						<!-- ????????????   ???-->
						

						<!-- ?????? ?????? -->
						<br>
						<br>
						<label for=""> &nbsp; Gender : </label>&nbsp;&nbsp;
						<input type="radio" name="gender" id="Male" value="M">
						<label	for="Male">??????</label> &nbsp;&nbsp;
						<input type="radio" name="gender" id="Female" value="F">
						<label for="Female">??????</label><br>

						<!-- ?????? ?????? ??? -->



						<div class="btns" align="center">
						<button type="reset" class="btn btn-outline-danger">?????????</button>
						</div>

					    </div>
					    
						<input type="button" data-toggle="modal" id="hoho" name="next" class="next1 action-button" value="??????" > 
                  </fieldset>
		                    
		          
		          <!--========================= step 2 =====================================-->
		          <fieldset>
		          <div class="form-group row">
				  <label class="col-sm-12 col-md-2 col-form-label" >????????????(*)</label>
							<div class="col-sm-12 col-md-10">
 							<select class="form-control" id="jobCode" name="jobCode" required>
							<option selected disabled hidden="hidden" value="">????????? ???????????????</option>
							
							<c:forEach items="${jlist }" var="job" varStatus="status">
									<option value="${job.jobCode }">${job.jobName }</option> 
							</c:forEach> 
							</select>
							</div>
				  </div>
				  
				  <div class="form-group row">
				  <label class="col-sm-12 col-md-2 col-form-label">??????</label>
				  <div class="col-sm-12 col-md-10">
				  
				  <select class="form-control" id="rightNo" name="rightNo">
							<c:forEach items="${rlist }" var="r" varStatus="status">
							<option value="${r.rightNo }">${r.rightName }</option> 
							</c:forEach> 
				  </select>
				  </div>
				  </div>
				  
				  <div class="form-group row">
				  <label class="col-sm-12 col-md-2 col-form-label">???????????? (*)</label>
				  <div class="col-sm-12 col-md-10">
				  <select class="form-control" id="deptCode" name="deptCode">
				  <option hidden="hidden" value=""  selected >??????????????? ???????????????</option>
				  
				  <c:forEach items="${dlist }" var="d" varStatus="status">
				  <option value="${d.deptCode }">${d.deptName }</option> 
				  </c:forEach> 
				  </select>
				  </div>
				  </div>

				  <div class="form-group row">
				  <label class="col-sm-12 col-md-2 col-form-label">?????? ?????? (*)</label>
				  <div class="col-sm-12 col-md-10">
				  <select class="form-control" id="salLevel" data-toggle="modal" name="salLevel" onchange="salGrade()">
				  <option value="" selected disabled hidden="hidden">?????? ?????? ??????</option>
				  
				  <c:forEach items="${slist }" var="s" varStatus="status">
				  <option value="${s.salLevel }">${s.salLevel }</option> 
				  </c:forEach> 
				  
				  </select>
				  </div>
				  </div>
				  
				 
				  
				  <script>
				  function salGrade() {
					  var salGrade =$("#salLevel").val();
					  var i = parseInt(($("#money1").val()).replace(/,/g,""));
					  console.log(salGrade);
					  if(salGrade == 'S1' ){
						 
						 alert("S1 ??? ?????? 6000000 ?????? ???????????????.");
						 $("#money1").val('6,000,000');
						 $("#money11").val('6000000');
						 
					  }
					  if(salGrade == 'S2'){
						  alert("S2 ??? ?????? 5000000 ?????? ???????????????.");
						  $("#money1").val('5,000,000');
						  $("#money11").val('5000000');
					  }
					  if(salGrade == 'S3'){
						  alert("S3 ??? ?????? 4000000 ?????? ???????????????.");
						  $("#money1").val('4,000,000');
						  $("#money11").val('4000000');
					  }
					  if(salGrade == 'S4'){
						  alert("S4 ??? ?????? 3000000 ?????? ???????????????.");
						  $("#money1").val('3,000,000');
						  $("#money11").val('3000000');
					  }
					  if(salGrade == 'S5'){
						  alert("S5 ??? ?????? 2000000 ?????? ???????????????.");
						  $("#money1").val('2,000,000');
						  $("#money11").val('2000000');
					  }
					  if(salGrade == 'S6'){
						  alert("S6 ??? ?????? 1000000 ?????? ???????????????.");
						  $("#money1").val('1,000,000');
						  $("#money11").val('1000000');
					  }
					
				  }
				  </script>

				  <br><br><br>


 <!--=================================== ???????????? ?????? ??? ?????? =================================== -->
		                  
		          <h4 class="text-blue h5">&nbsp;?????? ??????</h4><br><br><br>
		          
		          <table class="table table-bordered salary">
						<thead>
							<tr>
								<th scope="col">??????</th>
								<th scope="col">??????</th>
								<th scope="col">????????????</th>
								<th scope="col">??????</th>
								
							</tr>
				  </thead>
				  <tbody>
							<tr>
								<th scope="row">?????????</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								???</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="money1"  onchange="inputNumberFormat(this)">
								<input style="display: block; float: right; width: 82%;" type="hidden" class="form-control" id="money11" name="basic">
								</td>
								
								<th>?????????</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								???</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="incometax"   onInput="inputNumberFormat(this)" readonly>
								<input style="display: block; float: right; width: 82%;" type="hidden" class="form-control" id="incometax1" name="incomeTax">
								</td>
								
							</tr>
							<tr>
								<th scope="row">?????????</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								???</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="money2"  onInput="inputNumberFormat(this)">
								<input type="hidden" class="form-control" id="money22" name="commission"></td>
								<th>?????? ??????</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								???</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="empIn"  onInput="inputNumberFormat(this)" readonly>
								<input type="hidden" class="form-control" id="empIn1" name="empInsurance"></td>
								
							</tr>
							<tr>
								<th scope="row">??????</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								???</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="money3"  onInput="inputNumberFormat(this)">
								<input type="hidden" class="form-control" id="money33" name="meal"></td>
								<th>?????? ??????</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								???</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="retirement"  onInput="inputNumberFormat(this)" readonly>
								<input type="hidden" class="form-control" id="retirement1" name="retirement"></td>
								
							</tr>
							
							<tr>
								<th scope="row"></th>
								<td></td>
								<th>?????? ??????</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								???</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="health"  onInput="inputNumberFormat(this)" readonly>
								<input type="hidden" class="form-control" id="health1" name="healthInsurance"></td>
								
							</tr>
							
							
							
							<tr>
								<th scope="row">?????? ??????</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								???</label>
								</div>
								
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="sum01" onInput="inputNumberFormat(this)"  readonly>
								
								<input type="hidden" class="form-control" id="sum011" name="total" ></td>
								<th>?????? ??????</th>
								<td>
								<div class="col-sm-2" style="float: left;">
								<label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
								???</label>
								</div>
								<input style="display: block; float: right; width: 82%;" type="text" class="form-control"  id="result" onInput="inputNumberFormat(this)" readonly>
								<input type="hidden" class="form-control" id="inSum" name="inTotal"></td>
								
							</tr>
							
							 <tr>
							  <th colspan="2">?????? ?????????</th> 
							  <td colspan="2">
							  <div class="col-sm-2" style="float: left;">
							  <label class="col-sm-12 col-md-2 col-form-label" style="text-align: right; vertical-align: middle; font-size: 18px;">
							  ???</label>
							  </div>
							  <input style="display: block; float: right; width: 82%;" type="text" class="form-control" id="sum02"  onInput="inputNumberFormat(this)" readonly>
							  <input type="hidden" class="form-control" id="actualPay" name="subTotal"></td>
								
							</tr> 
						</tbody>
					</table>
					
					
					<!--==========================?????? ?????? ?????? (????????????)====================== -->
								<script>
								
								function inputNumberFormat(obj) {
								     obj.value = comma(uncomma(obj.value));
								     
								     var sum =document.getElementById('sum01');
								     var sumh =document.getElementById('sum011');
								     
								     var sum2 =document.getElementById('sum02');
								     var n1 = document.getElementById('money1');
								     var n2 = document.getElementById('money2');
								     var n3 = document.getElementById('money3');
								     
								     var nh1 = document.getElementById('money11');
								     var nh2 = document.getElementById('money22');
								     var nh3 = document.getElementById('money33'); 
								     
								     var n4 = document.getElementById('incometax');
								     var n5 = document.getElementById('empIn');
								     var n6 = document.getElementById('retirement');
								     var n7 = document.getElementById('health');
								     
								     
								     
								     var nh4 = document.getElementById('incometax1');
								     var nh5 = document.getElementById('empIn1');
								     var nh6 = document.getElementById('retirement1');
								     var nh7 = document.getElementById('health1');
								     
								     var inSum = document.getElementById('inSum');
								     var actualPay =document.getElementById('actualPay');
								     
								     var n8 = document.getElementById('result');
								     
								   
								     /*????????? ??????(????????? ?????? ) ?????? int ??? ??????(?????? ??????) */
								     var num1 = parseInt((n1.value).replace(/,/g,""));
								     var num2 = parseInt((n2.value).replace(/,/g,""));
								     var num3 = parseInt((n3.value).replace(/,/g,""));
								     
								     var jobCode = $("#jobCode").val();
								     

								     
								     /*???????????? ???????????? ????????? ?????? input*/
								     nh1.value= num1;
								     nh2.value= num2;
								     nh3.value= num3;
								     
								     
								     
								    // console.log("?????? ??? numh1 "+nh1.value); 
								     
								     
								     
								    /*????????? ????????? ???????????? ??????*/
								     var total = num1 + num2 + num3; 
								    // console.log("?????????? ?????? ?????? ?????? ??? ????????? "+total); 
								     
								     /*4??? ?????? ??????*/
								     var incometax = total * 0.033;
								     var empIn = total * 0.0065;
								     var retirement = total * 0.045;
								     var health = total * 0.0306;
								     
								     var inTotal = incometax + empIn + retirement +health;
								     var subTotal = total - inTotal;
								     //console.log( "?????? ?????? ????????? ?????? ?????????? "+ subTotal )
								    // console.log( "?????? ?????? inTotal?? "+ inTotal)
								     
								     inSum.value = num4;
								     actualPay.value =num5;
								     
								     /*???????????? ???????????? ????????? ?????? input*/
								     nh4.value= incometax;
								     nh5.value= empIn;
								     nh6.value= retirement;
								     nh7.value= health;
								     inSum.value= inTotal;
								     
								     sumh.value=total;
								     actualPay.value=subTotal;
								     
								     //console.log("????????? ??????!!! "+sumh.value)
								     //console.log("????????? ??????!!! "+ actualPay.value)
								     //console.log("????????? ??????!!! inSum.value "+ inSum.value)
								     
								     /*4??? ?????? ??????*/
								     var total2 = incometax + empIn + retirement + health; 
								     
								     /* ????????? - ????????? */
								     var finalresult = total - total2 ;
								    
								     /* 4??? ?????? ??? ?????? ?????? (?????? ??????)*/
								     n4.value = incometax.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								     n5.value = empIn.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								     n6.value = retirement.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								     n7.value = health.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								     
								     /*?????? ?????? ??????(?????? ??????)*/
								   	 n8.value = total2.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								      
								     
								   	/*?????? ??????(?????? ??????)*/
								     sum.value  = total.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								     
								     /*?????? ?????? ??????(?????? ??????)*/
								     sum2.value = finalresult.toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								     
								     
								     var num4 = parseInt((n8.value).replace(/,/g,""));
								     var num5 = parseInt((sum2.value).replace(/,/g,""));
								     
								     //console.log("resut1 ????????? ?????? ???? "+num4)
								     //console.log("n8.value ?????? ?????? ??? ??? ????????? ?????? ???? "+num4)
								     //console.log("sum2.value  ?????? ?????? ?????? ????????? ?????? ???? "+num5)
								 }

								 function comma(str) {
								     str = String(str);
								     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
								 }

								 function uncomma(str) {
								     str = String(str);
								     return str.replace(/[^\d]+/g, '');
								 } 
								 
								
								
								</script>



						<div class="btns" align="center"><button type="reset" class="btn btn-outline-danger">?????????</button>
						</div>
		                  
		                <input type="button" name="next" class="next2 action-button" value="??????"  /> 
		                <input type="button" name="previous" class="previous action-button-previous" value="??????" />
		                
		                </fieldset>
		                    
		                <!-- ============================ ?????? ????????? ================================ -->
		                <fieldset><div class="text-center">
						<label class="title">?????? ????????? ??????</label>
						<div>
						<a class="fileRemove" id="close"> X </a>
						<img name="uploadFile" id="uploadFile" width="200px" height="180">
						</div>
							
							<br>

						<div id="fileArea">
						<input type="file" style="color: black;" name="uploadFile" id="file" onchange="loadImg(this, 1);" required>
						</div>

							<script>
								$(function() {
									$("#fileArea").hide();

									$("#uploadFile").click(function() {
										$("#file").click();
									});

								});

								function loadImg(inputFile, num) {// ????????? ???????????? 
									//inputFile : ?????? ????????? ?????? input type = "file"
									//num : ???????????? ?????? ?????? ?????? ???????????? ????????????

									//console.dir(inputFile);

									if (inputFile.files.length == 1) {//file??? ?????? ????????? 
										var reader = new FileReader();// ????????? ???????????? FileReader????????? ?????? 

										reader.readAsDataURL(inputFile.files[0]);//????????? ???????????? ?????????  --> ?????? ????????? ????????? url??? ?????? (???????????? ?????? )
										registerFace(inputFile.files[0]);

										reader.onload = function(e) {//?????? ????????? ????????? ?????? ????????? ????????? 
											console.log(e);
											switch (num) {
											case 1:
												$("#uploadFile").attr("src",
														e.target.result);
												break;// result :  ???????????? ?????? ?????? data:URL ?????? 

											}
										}
									}
								};
								
								
								
								//=====================================???????????? ??? ??? ?????? ?????? ?????? ???????????? (Profile Img)============================================
		                        function registerFace(image){
		                           var nextEmp=${nextEmp};
		                           console.log(nextEmp);
		                           const form = new FormData();
		                           form.append("image", image);
		                           const settings = {
		                              "async": true,
		                              "crossDomain": true,
		                              "url": "https://alchera-face-authentication.p.rapidapi.com/v1/face",
		                              "method": "POST",
		                              "headers": {
		                                 "uid": nextEmp,
		                                 "x-rapidapi-host": "alchera-face-authentication.p.rapidapi.com",
		                                 "x-rapidapi-key": "c2f7322849msh59b980548a487b0p18c3a3jsn2a28749fcc50"
		                              },
		                              "processData": false,
		                              "contentType": false,
		                              "mimeType": "multipart/form-data",
		                              "data": form
		                           };
		                           $.ajax(settings).done(function (response) {
		                              console.log("?????? ?????? : "+response);
		                           });
		                        }
								

								//==================?????? ????????? ?????? 

								$(".fileRemove").click(function() {
									$("#uploadFile").attr("src", " ");

								})

							</script>


						</div>
								<input type="button" name="next" class="next3 action-button" value="??????"  />
								<input type="button" name="previous" class="previous action-button-previous" value="??????" />
		                </fieldset>
		                    
		                 <fieldset>
		                        <div class="form-card">
		                            <div class="row">
		                            <div class="col-7"> <h2 class="fs-title">?????? ??????:</h2></div>
		                            <div class="col-5"> <h2 class="steps">Step 4 - 4</h2></div>
		                            </div> 
		                            
		                            <br><br>
		                            
		                            <h2 class="purple-text text-center"><strong>SUCCESS !</strong></h2> <br>
		                            <div class="row justify-content-center">
		                            <div class="col-3"> <img src="https://i.imgur.com/GwStPmg.png" class="fit-image"> </div>
		                            </div> <br><br>
		                            
		                            <div class="row justify-content-center">
		                                <div class="col-7 text-center">
		                                    <h5 class="purple-text text-center">??????????????? ?????? ???????????????!</h5>
		                                </div>
		                            </div>
		                            
		                        </div>
		                   </fieldset> 
		                    
		                </form>
		            </div>
		        </div>
		    </div>
		</div>
		
		
					

			<script>
	
			$(document).ready(function(){
				
				var current_fs, next_fs, previous_fs; //fieldsets
				var opacity;
				var current = 1;
				var steps = $("fieldset").length;

				setProgressBar(current);

				$(".next1").click(function(){
					
				/*=====================????????? ?????? =====================*/
					var userName = $("#msform input[name=userName]");

					if(userName.val() == ''){
						
						alert("????????? ???????????????")
						userName.focus();
						 return false;
					} 
			         
					
					var pwd = $("#msform input[name=userPwd]");
					var pw = $("#msform input[name=userPwd]").val();
					var num = pw.search(/[0-9]/g);
					var eng = pw.search(/[a-z]/ig);
					var spe = pw.search(/[`~!@@#$%^&*|?????????'???";:???/?]/gi); 
					
					if(pwd.val() == ''){
						
							alert("??????????????? ???????????????")
							pwd.focus();
							return false;

					} 
					
					
				 	if(pw.length < 6 )
				 	{

						  alert("6?????? ~ 15?????? ????????? ??????????????????.");
						  return false;
						 }else if(pw.search(/\s/) != -1){
						  alert("??????????????? ?????? ?????? ??????????????????.");
						  return false;
						 }else if(num < 0 || eng < 0 || spe < 0 ){
						  alert("??????,??????, ??????????????? ???????????? ??????????????????.");
						  return false;
						 }else {
							console.log("??????"); 
						    
					}
				 
				 	if(pw.length > 15 ){
				 		
				 		 alert("15?????? ????????? ??????????????????.");
						  return false;
					
				 	}
					
					var ssn = $("#msform input[name=userSsn]");
					//console.log(ssn.val());
					if(ssn.val() == ''){
						//alert("??????????????? ???????????????")
						
						ssn.focus();
						return false;
					} 
					
					var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

					var email = $("#msform input[name=email]").val();
					if (email == '' || !re.test(email)) {
					alert("????????? ????????? ????????? ???????????????")
					return false;
					}


					var patternPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;

					
					var phone = $("#msform input[name=phone]");
					//console.log(phone.val());
					if(phone.val() == ''){
						alert("??????????????? ???????????????")
						phone.focus();
						 return false;
					} 
					
					  if(!patternPhone.test(phone.val()))
					    {
					        alert('????????? ????????? ?????? ????????????');
					        return;
					    }  


					var post = $("#msform input[name=post]");
					//console.log(post.val());
					if(post.val() == ''){
						alert("??????????????? ???????????????")
						post.focus();
						 return false;
					} 
					
					var address1 = $("#msform input[name=address1]");
					//console.log(address1.val());
					if(address1.val() == ''){
						alert("????????? ???????????????")
						address1.focus();
						 return false;
					} 
					
					
					var address2 = $("#msform input[name=address2]");
					//console.log(address2.val());
					if(address2.val() == ''){
						alert("?????? ????????? ???????????????")
						address2.focus();
						 return false;
					} 
					
					
					if($("input[name=gender]:radio:checked").length < 1){
						alert("????????? ???????????????")
						$("input[name=gender]:radio:checked").focus();
						 return false;
					} 
					
					var add1 = $("#address1").val();
					
					//console.log(add1);
					  
					
					current_fs = $(this).parent();
					next_fs = $(this).parent().next(); 
					 
					
					/*=====================????????? ?????? ??? =====================*/
				

				//Add Class Active
				$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

				//show the next fieldset
				next_fs.show();
				
				
				//hide the current fieldset with style
				current_fs.animate({opacity: 0}, {
				step: function(now) {
				// for making fielset appear animation
				opacity = 1 - now;

				current_fs.css({
				'display': 'none',
				'position': 'relative'
				});
				next_fs.css({'opacity': opacity});
				},
				duration: 500
				});
				setProgressBar(++current);
				});

				$(".previous").click(function(){

				current_fs = $(this).parent();
				previous_fs = $(this).parent().prev();

				//Remove class active
				$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

				//show the previous fieldset
				previous_fs.show();

				//hide the current fieldset with style
				current_fs.animate({opacity: 0}, {
				step: function(now) {
				// for making fielset appear animation
				opacity = 1 - now;

				current_fs.css({
				'display': 'none',
				'position': 'relative'
				});
				previous_fs.css({'opacity': opacity});
				},
				duration: 500
				});
				setProgressBar(--current);
				});

				function setProgressBar(curStep){
				var percent = parseFloat(100 / steps) * curStep;
				percent = percent.toFixed();
				$(".progress-bar")
				.css("width",percent+"%")
				}
				
				
				
				/* =============== step 2=============  */
				
				
				$(".next2").click(function(){
					
				
				 /*=====================????????? ?????? =====================*/
					
					 
					 var jobCode = document.getElementById("jobCode").selectedIndex;
					 //console.log(jobCode);
					  if(jobCode === 0)
					  {
							alert("?????? ????????? ???????????????")
							document.getElementById("jobCode").focus();
							e.preventDefault();
							return false;
					  } 
					  
					  
					  var deptCode = document.getElementById("deptCode").selectedIndex;
						 console.log(deptCode);
						  if(deptCode === 0)
						  {
								alert("????????? ???????????????")
								document.getElementById("deptCode").focus();
								e.preventDefault();
								return false;
						  } 
						  
						  
					  var salLevel = document.getElementById("salLevel").selectedIndex;
							 console.log(salLevel);
							  if(salLevel === 0)
							{
									alert("??????????????? ???????????????")
									document.getElementById("salLevel").focus();
									e.preventDefault();
									return false;
							} 
					
					
					
					/* var money1 = $("#money1").val();
					var valiAmount = parseInt(($("#money1").val()).replace(/,/g,""));
					 */
					if(money1 == ""){
						alert("???????????? ???????????????")
						document.getElementById("money1").focus();
						return false;
					
					}
					
					/* if(jobCode === 1 && valiAmount < 6000000){
						alert("6000000 ?????? ???????????????")
						document.getElementById("money1").focus();
						return false;
					} */
					
					
					var money2 = $("#money2").val();
					
					
					if(money2 == ""){
						alert("???????????? ???????????????")
						document.getElementById("money2").focus();
						
						return false;
					}
					
					
					var money3 = $("#money3").val();
					
					
					if(money3 == ""){
						alert("????????? ???????????????")
						document.getElementById("money3").focus();
						
						return false;
					}
					
					
					
					 
					/*=====================????????? ?????? ??? =====================*/
				
				
					current_fs = $(this).parent();
					next_fs = $(this).parent().next(); 



				//Add Class Active
				$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

				//show the next fieldset
				next_fs.show();
				
	
				
				//hide the current fieldset with style
				current_fs.animate({opacity: 0}, {
				step: function(now) {
				// for making fielset appear animation
				opacity = 1 - now;

				current_fs.css({
				'display': 'none',
				'position': 'relative'
				});
				next_fs.css({'opacity': opacity});
				},
				duration: 500
				});
				setProgressBar(++current);
				});

				$(".previous").click(function(){

				current_fs = $(this).parent();
				previous_fs = $(this).parent().prev();

				//Remove class active
				$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

				//show the previous fieldset
				previous_fs.show();

				//hide the current fieldset with style
				current_fs.animate({opacity: 0}, {
				step: function(now) {
				// for making fielset appear animation
				opacity = 1 - now;

				current_fs.css({
				'display': 'none',
				'position': 'relative'
				});
				previous_fs.css({'opacity': opacity});
				},
				duration: 500
				});
				setProgressBar(--current);
				});

				function setProgressBar(curStep){
				var percent = parseFloat(100 / steps) * curStep;
				percent = percent.toFixed();
				$(".progress-bar")
				.css("width",percent+"%")
				}
				
				
				
				
				/* =============== step 3=============  */
				
				
				$(".next3").click(function(){
				
				/*=====================????????? ?????? =====================*/
					
					var file = $("#file").val();
					 console.log(file);
					 
					 if(file == ""){
						 alert("????????? ???????????????")
						 document.getElementById("file").focus();
						 return false;
						 
					 } else{
						 $("#msform").submit();
						 return true;
					 }
				/*=====================????????? ?????? ??? =====================*/
				
				
					current_fs = $(this).parent();
					next_fs = $(this).parent().next(); 



				//Add Class Active
				$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

				//show the next fieldset
				next_fs.show();
				
	
				
				//hide the current fieldset with style
				current_fs.animate({opacity: 0}, {
				step: function(now) {
				// for making fielset appear animation
				opacity = 1 - now;

				current_fs.css({
				'display': 'none',
				'position': 'relative'
				});
				next_fs.css({'opacity': opacity});
				},
				duration: 500
				});
				setProgressBar(++current);
				});

				$(".previous").click(function(){

				current_fs = $(this).parent();
				previous_fs = $(this).parent().prev();

				//Remove class active
				$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

				//show the previous fieldset
				previous_fs.show();

				//hide the current fieldset with style
				current_fs.animate({opacity: 0}, {
				step: function(now) {
				// for making fielset appear animation
				opacity = 1 - now;

				current_fs.css({
				'display': 'none',
				'position': 'relative'
				});
				previous_fs.css({'opacity': opacity});
				},
				duration: 500
				});
				setProgressBar(--current);
				});

				function setProgressBar(curStep){
				var percent = parseFloat(100 / steps) * curStep;
				percent = percent.toFixed();
				$(".progress-bar")
				.css("width",percent+"%")
				}
				


				$(".submit").click(function(){
					
					var file = $("#file").val();
					 console.log(file);
					 
					 if(file == ""){
						 alert("????????? ???????????????")
						 document.getElementById("file").focus();
						 return false;
						 
					 } else{
						 return true;
					 }
					

					
				
				})

				});
			

			
			</script>	
			
			
					
			</div>
			
			<jsp:include page="../common/footer.jsp" />
			</div>


	
</body>
</html>