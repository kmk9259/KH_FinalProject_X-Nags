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

<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>보낸 메일함</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="">홈</a></li>
									<li class="breadcrumb-item active" aria-current="page">보낸 메일함</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
				
				<!-- 중간내용 널어라 -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix mb-20">
		            <div class="card-header">
		              <h3 class="card-title">보낸 메일</h3>
		            </div>
				
				<div class="card-body p-0">
              <div class="mailbox-read-info">
                <label>메일 제목 </label><h5>${m.title }</h5>
                <label>받는 사람 </label><h6>${m.receiver }
                  <span class="mailbox-read-time float-right">${m.date }</span></h6>
              </div>
              <!-- /.mailbox-read-info -->
              
              <div class="mailbox-controls with-border text-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Delete">
                    <i class="icon-copy ion-trash-a"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Reply">
                    <i class="icon-copy ion-paper-airplane"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Forward">
                    <i class="icon-copy ion-share"></i>
                  </button>
                </div>
                <!-- /.btn-group -->
                <button type="button" class="btn btn-default btn-sm" title="Print">
                  <i class="icon-copy ion-printer"></i>
                </button>
              </div>
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
                <P>${m.content }</P>
              </div>
              <!-- /.mailbox-read-message -->
            </div>
            
            <!-- 첨부파일 부분 -->
            <div class="card-footer bg-white">
              <ul class="mailbox-attachments d-flex align-items-stretch clearfix">
                <li>
                  <span class="mailbox-attachment-icon"><i class="far fa-file-pdf"></i></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i> Sep2014-report.pdf</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>1,245 KB</span>
                          <a href="#" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i></a>
                        </span>
                  </div>
                </li>
                <li>
                  <span class="mailbox-attachment-icon"><i class="far fa-file-word"></i></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i> App Description.docx</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>1,245 KB</span>
                          <a href="#" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i></a>
                        </span>
                  </div>
                </li>
                <li>
                  <span class="mailbox-attachment-icon has-img"><img src="../../dist/img/photo1.png" alt="Attachment"></span>

                  <div class="mailbox-attachment-info">
                  
                    <a href="#" class="mailbox-attachment-name"><i class="fas fa-camera"></i> photo1.png</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>2.67 MB</span>
                          <a href="#" class="btn btn-default btn-sm float-right"><i class="icon-copy ion-cloud"></i></a>
                        </span>
                 
                  </div>
                </li>
                <li>
                  <span class="mailbox-attachment-icon has-img"><img src="../../dist/img/photo2.png" alt="Attachment"></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fas fa-camera"></i> photo2.png</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>1.9 MB</span>
                          <a href="#" class="btn btn-default btn-sm float-right"><i class="icon-copy ion-cloud"></i></a>
                        </span>
                  </div>
                </li>
              </ul>
            </div>
            <div class="card-footer">
              <div class="float-right">
                <button type="button" onclick="" class="btn btn-default"><i class="icon-copy ion-paper-airplane"></i> 답장</button>
                <button type="button" class="btn btn-default"><i class="icon-copy ion-share"></i> 전달</button>
              </div>
              <button type="button" class="btn btn-default"><i class="icon-copy ion-trash-a"></i> 삭제</button>
              <button type="button" class="btn btn-default"><i class="icon-copy ion-printer"></i> 인쇄</button>
            </div>
				
				<!-- 중간내용 끝 -->
				</div>
				</div>
				</div>
				</div>
				</div>
				
				<jsp:include page="../common/footer.jsp" />

</body>
</html>