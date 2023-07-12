<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
  $(document).ready(function() {
    // 라디오 버튼 클릭 이벤트 핸들러
    function handleRadioChange() {
      var selectedValue = $('input[name="cate"]:checked').val();
      var formContainer = $('#insertCateForm');
      var noticeCategory = $('#noticeCategory');

      // 선택한 라디오 버튼에 따라 form 영역 변경
      if (selectedValue === '0') {
        formContainer.html(`
          <div class="question_fileInputWrapper__d9gmU">
            <!-- 공지에 해당하는 폼 요소 없음-->
          </div>
        `);
        noticeCategory.show(); // 보이게 설정
      } else if (selectedValue === '2' || selectedValue === '3') {
        formContainer.html(`
          <div class="question_fileInputWrapper__d9gmU">
            <span class="question_questionCategory__1QDx6">사진 업로드</span>
            <div class="question_questionImgContainer__tNqZy"></div>
            <input id="uploadFile" type="file" multiple=""
              accept="image/jpg,image/png,image/jpeg,image/gif"
              style="display: none;">
            <label for="uploadFile" class="question_inputFileBtn__zg7jN">
              <div class="question_inputFileText__Cgamr">사진 첨부</div>
              <img src="/admin/icons/admin/ICON_PHOTO_CAMERA.svg">
            </label>
            <span class="question_imgDesc__SQFui">개당 업로드 용량: 10MB, 첨부 파일의 경우
              사진과 동영상을 합쳐 최대 10개 업로드 가능합니다.</span>
          </div>
          <div class="question_fileInputWrapper__d9gmU">
            <span class="question_questionCategory__1QDx6">동영상 업로드</span>
            <div class="question_questionImgContainer__tNqZy"></div>
            <input id="uploadVideo" type="file" accept="video/mp4,video/quicktime" style="display: none;">
            <label for="uploadVideo" class="question_inputFileBtn__zg7jN">
              <div class="question_inputFileText__Cgamr">동영상 첨부</div>
              <img src="/admin/icons/admin/ICON_VIDEO.svg">
            </label>
            <span class="question_imgDesc__SQFui">최대 업로드 용량: 65MB, 동영상은 최대 1개
              업로드 가능합니다.</span>
          </div>
        `);
        noticeCategory.hide(); // 숨기게 설정
      }

      // 기타 필요한 작업 수행
    }

    // 라디오 버튼 클릭 이벤트 리스너 등록
    $('input[name="cate"]').on('change', handleRadioChange);
  });
</script>

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
										<li><a href="/admin/adminContentInsert">글 추가</a></li>
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
										<li><a href="/admin/adminADInsert">광고 등록</a></li>
										<li><a href="/admin/adminADList">광고 관리</a></li>
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
                  <div class="question_radioWrap__WZ6ME" id="cateList">
                     <div>
                        <input type="radio" name="cate" id="공지" value="0" checked><label
                           for="공지">공지</label>
                     </div>
                     <div>
                        <input type="radio" name="cate" id="교육정보" value="2"><label
                           for="교육정보">교육정보</label>
                     </div>
                     <div>
                        <input type="radio" name="cate" id="케어정보" value="3"><label
                           for="케어정보">케어정보</label>
                     </div>
                  </div>

                  <div id="noticeCategory">

                     <span class="question_questionCategory__1QDx6">공지 카테고리</span><span
                        class="question_questionMark__AykT_">*</span>

                     <div class="question_radioWrap__WZ6ME" id="cateList">
                        <div>
                           <input type="radio" name="noticecate" id="중요공지" value="1"
                              checked><label for="중요공지">중요 공지</label>
                        </div>
                        <div>
                           <input type="radio" name="noticecate" id="일반공지" value="2"><label
                              for="일반공지">일반 공지</label>
                        </div>

                     </div>

                  </div>

                  <div>
                     <div>
                        <span class="question_questionCategory__1QDx6">글 작성</span><span
                           class="question_questionMark__AykT_">*</span>
                     </div>
                     <input placeholder="제목을 입력해주세요"
                        class="question_titleInput__S7Isd" value="">
                     <div class="question_alertText__WnxqW"></div>
                  </div>
                  <div class="question_questionInputWrapper__fGaar">
                     <textarea placeholder="5자 이상의 글 내용을 입력해주세요"
                        class="question_questionInput___Mb57"></textarea>
                     <div class="question_alertText__WnxqW"></div>
                  </div>

                  <form enctype="multipart/form-data" id="insertCateForm"></form>

                  <div class="question_thumbnailText__h45xg">
                     <ul>
                        <li>동영상과 사진을 동시에 업로드 시, 업로드된 사진 중 첫 번째 순서의 사진이 썸네일로 지정됩니다.</li>
                        <li>동영상 1개만 업로드 시, 동영상에서 랜덤으로 추출되어 썸네일로 지정됩니다.</li>
                     </ul>
                  </div>
                  <button class="question_submitBtn__vDrt_" disabled="">글
                     등록</button>
                  <br />
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
   <script
      src="/admin/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
   <!-- bootstrap-daterangepicker -->
   <script src="/admin/vendors/moment/min/moment.min.js"></script>
   <script
      src="/admin/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

   <!-- Custom Theme Scripts -->
   <script src="/admin/build/js/custom.min.js"></script>


</body>
</html>