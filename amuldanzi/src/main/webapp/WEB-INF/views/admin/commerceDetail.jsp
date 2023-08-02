<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="production//production/images/favicon.ico"
	type="image/ico" />

<title>애물단지</title>

<!-- Bootstrap -->
<link href="/admin/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="/admin/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="/admin/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="/admin/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<!-- bootstrap-progressbar -->
<link
	href="/admin/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link href="/admin/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link
	href="/admin/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="/admin/build/css/custom.min.css" rel="stylesheet">

<link href="/admin/chunks/css/c552b37c371c331c.css" rel="stylesheet">
<link href="/admin/chunks/css/39c68523bb4928b9.css" rel="stylesheet">
<link href="/admin/chunks/css/281067dbec461a13.css" rel="stylesheet">
<link href="/admin/chunks/css/3ca3804aef0f69b8.css" rel="stylesheet">
<link href="/admin/chunks/css/text.css" rel="stylesheet">
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="/admin/adminMain" class="site_title"><i class="fa fa-paw"></i>
							<span>애물단지</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img src="/admin/production/images/img.jpg" alt="..."
								class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>환영합니다</span>
							<h2>관리자님</h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<h3>General</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-user"></i> 회원관리<span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="/admin/roleList">역할관리</a></li>
										<li><a href="/admin/qnaList">문의관리</a></li>
									</ul></li>
								<li><a><i class="fa fa-edit"></i> 게시판<span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="/admin/adminContentInsert">글 추가</a></li>
										<li><a href="/admin/adminContentList">기존 글 관리</a></li>
										<li><a href="/admin/blamedList">신고 글 관리</a></li>
									</ul></li>
								<li><a><i class="fa fa-video-camera"></i> 라이브 커머스 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="/admin/commerce">방송 일정</a></li>
										<li><a href="/admin/commerceList">상품 관리</a></li>
									</ul></li>
								<li><a><i class="fa fa-tags"></i> 광고 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="/admin/adInsert">광고 등록</a></li>
										<li><a href="/admin/adList">광고 관리</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<div class="sidebar-footer hidden-small">
						<a data-toggle="tooltip" data-placement="top" title="Settings">
							<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="FullScreen">
							<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <span
							class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Logout"
							href="login.html"> <span class="glyphicon glyphicon-off"
							aria-hidden="true"></span>
						</a>
					</div>
					<!-- /menu footer buttons -->
				</div>
			</div>


			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<div class="nav toggle">
						<a id="menu_toggle"><i class="fa fa-bars"></i></a>
					</div>
					<nav class="nav navbar-nav">
						<ul class=" navbar-right">
							<li class="nav-item dropdown open" style="padding-left: 15px;">
								<a href="javascript:;" class="user-profile dropdown-toggle"
								aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown"
								aria-expanded="false">관리자
							</a>
								<div class="dropdown-menu dropdown-usermenu pull-right"
									aria-labelledby="navbarDropdown">
									<a	class="dropdown-item" href="login.html"><i
										class="fa fa-sign-out pull-right"></i> Log Out</a>
								</div>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->



			<!-- page content -->
			<div class="right_col" role="main" style="min-height: 1055px;">
				<div class="question_questionContainer__xQp_P">
					<div class="question_questionContent__Y4VxA">
						<span class="question_questionCategory__1QDx6">카테고리</span>
						<span class="question_questionMark__AykT_">*</span>
						<div class="question_radioWrap__WZ6ME">
							<div>
								<input type="radio" name="question" id="상품" value="9" checked="상품"><label
									for="상품">상품</label>
							</div>
						</div>
			            <div id="commerceForm">
			              <form action="commerceUpdate" method="POST" enctype="multipart/form-data">
			                <div>
			                  <div>
			                    <span class="question_questionCategory__1QDx6">상품명</span>
			                    <span class="question_questionMark__AykT_">*</span>
			                  </div>
			                  <input type="hidden" name="commerceId" value="${commerceDetail.commerceId }">
			                  <input class="question_titleInput__S7Isd" type="text" name="commerceName" value="${commerceDetail.commerceName }">
			                  <div class="question_alertText__WnxqW"></div>
			                </div>
			                <div>
			                  <div>
			                    <span class="question_questionCategory__1QDx6">재고량</span>
			                    <span class="question_questionMark__AykT_">*</span>
			                  </div>
			                  <input class="question_titleInput__S7Isd" type="number" name="commercePrice" min="0" value="${commerceDetail.commercePrice }">
			                  <div class="question_alertText__WnxqW"></div>
			                </div>
			                <div>
			                  <div>
			                    <span class="question_questionCategory__1QDx6">가격</span>
			                    <span class="question_questionMark__AykT_">*</span>
			                  </div>
			                  
			                  <input class="question_titleInput__S7Isd" type="number" name="commerceStock" min="0" value="${commerceDetail.commerceStock }" />
			                  <div class="question_alertText__WnxqW"></div>
			                </div>
			                <div>
			                  <div>
			                    <span class="question_questionCategory__1QDx6">할인률 %</span>
			                    <span class="question_questionMark__AykT_">*</span>
			                  </div>
			                  
			                  <input class="question_titleInput__S7Isd" type="number" name="commercePer" min="0" max="100" value="${commerceDetail.commercePer }" />			                  
			                  <div class="question_alertText__WnxqW"></div>
			                </div>
			                <div class="commerceFileForm">
			                  <div class="question_fileInputWrapper__d9gmU">
			                    <span class="question_questionCategory__1QDx6">상품 이미지</span>
			                    <div class="question_questionImgContainer__tNqZy" id="commerceImagePreviewContainer">
			                          <img class="image-preview" src="/images/commerce/${commerceDetail.img}" alt="commerceImage">
			                    </div>	                   
			                    <input id="commerceUploadFile" name="file" type="file" accept="image/jpg,image/png,image/jpeg,image/gif" style="display: none;">
			                    <label for="commerceUploadFile" class="question_inputFileBtn__zg7jN">
			                      <div class="question_inputFileText__Cgamr">상품 사진 첨부</div>
			                      <img src="/icons/ICON_PHOTO_CAMERA.svg">
			                    </label>
			                    <span class="question_imgDesc__SQFui">이미지 파일 첨부는 1개만 가능합니다.</span>
			                  </div>
			                  <div class="question_fileInputWrapper__d9gmU">
			                    <span class="question_questionCategory__1QDx6">상품상세 이미지</span>
			                    <div class="question_questionImgContainer__tNqZy" id="commerceDetailImagePreviewContainer">
			                       <img class="image-preview" src="/images/commerceDetail/${commerceDetail.detailImg}" alt="commerceDetailImage">
			                    </div>	                    
			                    <input id="commerceUploadDetailFile" name="detailFile" type="file" accept="image/*" style="display: none;" >
			                    <label for="commerceUploadDetailFile" class="question_inputFileBtn__zg7jN">
			                      <div class="question_inputFileText__Cgamr">상세 정보 첨부</div>
			                      <img src="/icons/ICON_PHOTO_CAMERA.svg">
			                    </label>
			                    <span class="question_imgDesc__SQFui">이미지 파일 첨부는 1개만 가능합니다.</span>
			                  </div>
			                </div>
			                <div>
			                  <button class="question_submitBtn__vDrt_" type="submit">상품 정보 수정</button>
			                </div>
			                <br />
			              </form>
			              </div>
	            	</div>
	            </div>
		    </div>
    
		<!-- /page content -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="/admin/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="/admin/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- FastClick -->
	<script src="/admin/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="/admin/vendors/nprogress/nprogress.js"></script>
	<!-- iCheck -->
	<script src="/admin/vendors/iCheck/icheck.min.js"></script>
	<!-- Datatables -->
	<script src="/admin/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script
		src="/admin/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
	<script src="/admin/vendors/jszip/dist/jszip.min.js"></script>
	<script src="/admin/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script src="/admin/vendors/pdfmake/build/vfs_fonts.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="/admin/build/js/custom.min.js"></script>
	

<script>
$(document).ready(function() {
	  // 이미지 및 비디오 업로드 미리보기 함수
	  function handlePreview(event, imageContainer) {
	    var previewContainer = $(imageContainer);
	    previewContainer.html('');

	    var files = event.target.files;
	    if (files && files.length > 0) {
	      var file = files[0];
	      var reader = new FileReader();

	      reader.onload = function(e) {
	        if (file.type.startsWith('image')) {
	          var image = $('<img>').attr('src', e.target.result);
	          var preview = $('<div class="image-preview"></div>').append(image);
	        }

	        var deleteButton = $('<span class="delete-button">&times;</span>');
	        deleteButton.on('click', function() {
	          preview.remove();
	        });

	        preview.append(deleteButton);
	        previewContainer.append(preview);
	      };

	      reader.readAsDataURL(file);
	    }
	  }

	  // 상품 이미지 업로드 미리보기
	  $('#commerceUploadFile').on('change', function(event) {
	    handlePreview(event, '#commerceImagePreviewContainer');
	  });

	  // 상품 상세 이미지 업로드 미리보기
	  $('#commerceUploadDetailFile').on('change', function(event) {
	    handlePreview(event, '#commerceDetailImagePreviewContainer');
	  });

	});
</script>


</body>
</html>