<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>X-Nomal Groupware Solution</title>
</head>
<body>

<jsp:include page="../common/menubar.jsp" />

		<!-- basic table  Start -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
						<div class="pull-left">
							<h4 class="text-blue h4">Basic Table</h4>
							<p>Add class <code>.table</code></p>
						</div>
						<div class="pull-right">
							<a href="#basic-table" class="btn btn-primary btn-sm scroll-click" rel="content-y"  data-toggle="collapse" role="button"><i class="fa fa-code"></i> Source Code</a>
						</div>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">First</th>
								<th scope="col">Last</th>
								<th scope="col">Handle</th>
								<th scope="col">Tag</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
								<td><span class="badge badge-primary">Primary</span></td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>@fat</td>
								<td><span class="badge badge-secondary">Secondary</span></td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry</td>
								<td>the Bird</td>
								<td>@twitter</td>
								<td><span class="badge badge-success">Success</span></td>
							</tr>
						</tbody>
					</table>
					<div class="collapse collapse-box" id="basic-table" >
						<div class="code-box">
							<div class="clearfix">
								<a href="javascript:;" class="btn btn-primary btn-sm code-copy pull-left"  data-clipboard-target="#basic-table-code"><i class="fa fa-clipboard"></i> Copy Code</a>
								<a href="#basic-table" class="btn btn-primary btn-sm pull-right" rel="content-y"  data-toggle="collapse" role="button"><i class="fa fa-eye-slash"></i> Hide Code</a>
							</div>
							<pre><code class="xml copy-pre" id="basic-table-code">
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
    </tr>
  </tbody>
</table>
							</code></pre>
						</div>
					</div>
				</div>
				<!-- basic table  End -->
				
<jsp:include page="../common/footer.jsp" />

</body>
</html>