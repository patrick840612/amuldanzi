<%@page contentType="text/html; charset=UTF-8"%>

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
<link href="/admin/vendors/bootstrap-daterangepicker/daterangepicker.css"
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
						<a href="index.html" class="site_title"><i class="fa fa-paw"></i>
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
										<li><a href="form.html">역할관리</a></li>
										<li><a href="form_advanced.html">문의관리</a></li>
									</ul></li>
								<li><a><i class="fa fa-edit"></i> 게시판<span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="/admin/adminInsert">글 추가</a></li>
										<li><a href="/admin/adminContentList">기존 글 관리</a></li>
										<li><a href="form_validation.html">신고 글 관리</a></li>
									</ul></li>
								<li><a><i class="fa fa-video-camera"></i> 라이브 커머스 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="general_elements.html">방송 일정</a></li>
										<li><a href="media_gallery.html">상품 관리</a></li>
									</ul></li>
								<li><a><i class="fa fa-tags"></i> 광고 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="general_elements.html">광고 등록</a></li>
										<li><a href="media_gallery.html">광고 관리</a></li>
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
								aria-expanded="false"> <img src="/admin/images/img.jpg" alt="">관리자
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
			<div class="right_col" role="main">
				<!-- top tiles -->
				<div class="question_questionContainer__xQp_P">
					<div class="question_questionContent__Y4VxA">
						<span class="question_questionCategory__1QDx6">카테고리</span><span
							class="question_questionMark__AykT_">*</span>
						<div class="question_radioWrap__WZ6ME">
							<div>
								<input type="radio" name="question" id="광고" value="광고" checked="광고"><label
									for="광고">광고</label>
							</div>
						</div>
						<div>
							<div>
								<span class="question_questionCategory__1QDx6">글 작성</span><span
									class="question_questionMark__AykT_">*</span>
							</div>
							<input placeholder="제목을 입력해주세요" class="question_titleInput__S7Isd"
								value="">
							<div class="question_alertText__WnxqW"></div>
						</div>
						<div class="question_questionInputWrapper__fGaar">
							<textarea placeholder="5자 이상의 글 내용을 입력해주세요"
								class="question_questionInput___Mb57"></textarea>
							<div class="question_alertText__WnxqW"></div>
						</div>
			
						<form enctype="multipart/form-data">
							<div class="question_fileInputWrapper__d9gmU">
								<span class="question_questionCategory__1QDx6">사진 업로드</span>
								<div class="question_questionImgContainer__tNqZy"></div>
								<input id="uploadFile" type="file" multiple=""
									accept="image/jpg,image/png,image/jpeg,image/gif"
									style="display: none;"><label for="uploadFile"
									class="question_inputFileBtn__zg7jN"><div
										class="question_inputFileText__Cgamr">사진 첨부</div>
									<img src="/admin/icons/admin/ICON_PHOTO_CAMERA.svg"></label><span
									class="question_imgDesc__SQFui">개당 업로드 용량: 10MB, 첨부 파일의 경우
									사진과 동영상 파일 업로드 가능합니다.</span>
							</div>
						<button class="question_submitBtn__vDrt_">글 등록</button>
						<br/>
					</div>
				</div>				
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<div class="pull-right">
					Gentelella - Bootstrap Admin Template by <a
						href="https://colorlib.com">Colorlib</a>
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
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
	<!-- Chart.js -->
	<script src="/admin/vendors/Chart.js/dist/Chart.min.js"></script>
	<!-- gauge.js -->
	<script src="/admin/vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="/admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="/admin/vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script src="/admin/vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script src="/admin/vendors/Flot/jquery.flot.js"></script>
	<script src="/admin/vendors/Flot/jquery.flot.pie.js"></script>
	<script src="/admin/vendors/Flot/jquery.flot.time.js"></script>
	<script src="/admin/vendors/Flot/jquery.flot.stack.js"></script>
	<script src="/admin/vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script src="/admin/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script src="/admin/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script src="/admin/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script src="/admin/vendors/DateJS/build/date.js"></script>
	<!-- JQVMap -->
	<script src="/admin/vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script src="/admin/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script src="/admin/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="/admin/vendors/moment/min/moment.min.js"></script>
	<script src="/admin/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="/admin/build/js/custom.min.js"></script>

</body>
</html>
