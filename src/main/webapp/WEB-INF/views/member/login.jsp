<!DOCTYPE html>
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
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

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
	</script>
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
						<form action="main.xnags" method="post">
							<div class="select-role">
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn active">
										<input type="radio" name="admin" id="admin">
										<div class="icon"><img src="${ pageContext.servletContext.contextPath }/resources/vendors/images/briefcase.svg" class="svg" alt=""></div>
										<span>I'm</span>
										Manager
									</label>
									<label class="btn">
										<input type="radio" name="user" id="user">
										<div class="icon"><img src="${ pageContext.servletContext.contextPath }/resources/vendors/images/person.svg" class="svg" alt=""></div>
										<span>I'm</span>
										Employee
									</label>
								</div>
							</div>
							<div class="input-group custom">
								<input type="text" name="empId" class="form-control form-control-lg" placeholder="Username">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
								</div>
							</div>
							<div class="input-group custom">
								<input type="password" name="userPwd" class="form-control form-control-lg" placeholder="**********">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
								</div>
							</div>							
							<div class="row">
								<div class="col-sm-12">
									<div class="input-group mb-0">
										
										<input class="btn btn-primary btn-lg btn-block" type="submit" value="Sign In">
										<%-- <a class="btn btn-primary btn-lg btn-block" href="${ pageContext.servletContext.contextPath }/WEB-INF/views/main.jsp">Sign In</a> --%>
									</div>									
								</div>
							</div>
						</form>
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
</body>
</html>