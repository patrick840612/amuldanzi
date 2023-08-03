<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Meta, title, CSS, favicons, etc. -->
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



<link href="/admin/chunks/css/text.css" rel="stylesheet">


<link href="/admin/summernote/summernote-lite.css" rel="stylesheet">



</head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
  $(document).ready(function() {
    
	$('#noticeForm').show();
    $('#eduForm').hide();
    $('#careForm').hide(); 

    // 라디오 버튼 클릭 이벤트 핸들러
    function handleRadioChange() {
      var selectedValue = $('input[name="cate"]:checked').val();
      var noticeForm = $('#noticeForm');
      var eduForm = $('#eduForm');
      var careForm = $('#careForm');
      var noticeCategory = $('#noticeCategory');
      var insertButton = $('#insertButton');

     if (selectedValue === '0') {
       // 선택한 라디오 버튼에 따라 form 영역 변경  
        $('#noticeForm').show(); 
        $('#eduForm').hide();
        $('#careForm').hide();
    
      }else if (selectedValue === '2') {
          $('#noticeForm').hide(); 
          $('#eduForm').show();
          $('#careForm').hide();
        
      }else if(selectedValue === '3'){        
          $('#noticeForm').hide(); 
          $('#eduForm').hide();
          $('#careForm').show();     
      
      }

      // 기타 필요한 작업 수행
    }

    
    // 모든 라디오 버튼을 선택 가능하도록 초기화
    $('input[name="cate"]').prop('disabled', false);
    

    // 라디오 버튼 클릭 이벤트 리스너 등록
    $('input[name="cate"]').on('change', handleRadioChange);
    
    // 폼 제출 시 postForm 함수 호출
    $('form').submit(function() {
        postForm();
    });


    
    //이미지 및 비디오 업로드 미리보기 함수
    function handlePreview(event, imageContainer, videoContainer) {
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
          } else if (file.type.startsWith('video')) {
            var video = document.createElement('video');
            video.setAttribute('controls', 'controls');
            video.setAttribute('src', e.target.result);
            var preview = $('<div class="video-preview"></div>').append(video);
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
    
    
    // 교육 이미지 업로드 미리보기
    $('#eduUploadFile').on('change', function(event) {
      handlePreview(event, '#eduImagePreviewContainer', '#eduVideoPreviewContainer');
    });

    // 교육 비디오 업로드 미리보기
    $('#eduUploadVideoFile').on('change', function(event) {
      handlePreview(event, '#eduVideoPreviewContainer', '#eduImagePreviewContainer');
    });

    // 케어 이미지 업로드 미리보기
    $('#careUploadFile').on('change', function(event) {
      handlePreview(event, '#careImagePreviewContainer', '#careVideoPreviewContainer');
    });

    // 케어 비디오 업로드 미리보기
    $('#careUploadVideoFile').on('change', function(event) {
      handlePreview(event, '#careVideoPreviewContainer', '#careImagePreviewContainer');
    });

  });
</script>

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
										<li><a href="/admin/commerceSchedule">방송 일정</a></li>
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
      <div class="right_col" role="main">
        <!-- top tiles -->
        <div class="question_questionContainer__xQp_P">
          <div class="question_questionContent__Y4VxA">
            <span class="question_questionCategory__1QDx6">카테고리</span>
            <span class="question_questionMark__AykT_">*</span>
            <div class="question_radioWrap__WZ6ME" id="cateList">
              <div>
                <input type="radio" name="cate" id="공지" value="0" checked>
                <label for="공지">공지</label>
              </div>
              <div>
                <input type="radio" name="cate" id="교육정보" value="2">
                <label for="교육정보">교육정보</label>
              </div>
              <div>
                <input type="radio" name="cate" id="케어정보" value="3">
                <label for="케어정보">케어정보</label>
              </div>
            </div>

            <div id="noticeForm">
              <form action="noticeSave" method="POST" enctype="multipart/form-data">
                <div>
                  <input name="cateId" type="hidden" value="0" />
                  <span class="question_questionCategory__1QDx6">공지 카테고리</span>
                  <span class="question_questionMark__AykT_">*</span>

                  <div class="question_radioWrap__WZ6ME" id="cateList">
                    <div>
                      <input type="radio" name="category" id="중요공지" value="중요공지" checked>
                      <label for="중요공지">중요 공지</label>
                    </div>
                    <div>
                      <input type="radio" name="category" id="일반공지" value="일반공지">
                      <label for="일반공지">일반 공지</label>
                    </div>
                  </div>
                </div>
                <div>
                  <div>
                    <span class="question_questionCategory__1QDx6">글 작성</span>
                    <span class="question_questionMark__AykT_">*</span>
                  </div>
                  <input placeholder="제목을 입력해주세요" class="question_titleInput__S7Isd" type="text" name="title" />
                  <div class="question_alertText__WnxqW"></div>
                </div>
                <div class="question_questionInputWrapper__fGaar">
                  <textarea placeholder="5자 이상의 글 내용을 입력해주세요" class="question_questionInput___Mb57" name="content"></textarea>
                </div>
                <div>
                  <button class="question_submitBtn__vDrt_" type="submit">공지등록</button>
                </div>
                <br />
              </form>
            </div>
            <div id="eduForm">
              <form action="eduSave" method="POST" enctype="multipart/form-data">
                <div>
                  <span class="question_questionCategory__1QDx6">교육 카테고리</span>
                  <span class="question_questionMark__AykT_">*</span>

                  <div class="question_radioWrap__WZ6ME" id="cateList">
                    <div>
                      <input type="radio" name="animal" id="eduDog" value="강아지" checked>
                      <label for="eduDog">강아지</label>
                    </div>
                    <div>
                      <input type="radio" name="animal" id="eduCat" value="고양이">
                      <label for="eduCat">고양이</label>
                    </div>
                  </div>
                </div>
                <div>
                  <div>
                    <span class="question_questionCategory__1QDx6">교육 단계</span>
                    <span class="question_questionMark__AykT_">*</span>
                  </div>
                  <input placeholder="교육 단계를 입력해주세요" class="question_titleInput__S7Isd" type="text" name="step">
                  <div class="question_alertText__WnxqW"></div>
                </div>
                <div>
                  <div>
                    <span class="question_questionCategory__1QDx6">교육 난이도</span>
                    <span class="question_questionMark__AykT_">*</span>
                  </div>
                  <input placeholder="교육 난이도를 입력해주세요" class="question_titleInput__S7Isd" type="text" name="level">
                  <div class="question_alertText__WnxqW"></div>
                </div>
                <div>
                  <div>
                    <span class="question_questionCategory__1QDx6">글 작성</span>
                    <span class="question_questionMark__AykT_">*</span>
                  </div>
                  <input placeholder="제목을 입력해주세요" class="question_titleInput__S7Isd" type="text" name="title" />
                  <div class="question_alertText__WnxqW"></div>
                </div>
                <div class="question_questionInputWrapper__fGaar">
                  <textarea placeholder="5자 이상의 글 내용을 입력해주세요" class="question_questionInput___Mb57" name="content"></textarea>
                </div>
                <div class="eduFileForm">
                  <div class="question_fileInputWrapper__d9gmU">
                    <span class="question_questionCategory__1QDx6">사진 업로드</span>
                    <div class="question_questionImgContainer__tNqZy" id="eduImagePreviewContainer"></div>
                    <input id="eduUploadFile" name="file" type="file" accept="image/jpg,image/png,image/jpeg,image/gif" style="display: none;">
                    <label for="eduUploadFile" class="question_inputFileBtn__zg7jN">
                      <div class="question_inputFileText__Cgamr">사진 첨부</div>
                      <img src="/icons/ICON_PHOTO_CAMERA.svg">
                    </label>
                    <span class="question_imgDesc__SQFui">이미지 파일 첨부는 1개만 가능합니다.</span>
                  </div>
                  <div class="question_fileInputWrapper__d9gmU">
                    <span class="question_questionCategory__1QDx6">비디오 업로드</span>
                    <div class="question_questionImgContainer__tNqZy" id="eduVideoPreviewContainer"></div>
                    <input id="eduUploadVideoFile" name="videoFile" type="file" accept="video/*" style="display: none;">
                    <label for="eduUploadVideoFile" class="question_inputFileBtn__zg7jN">
                      <div class="question_inputFileText__Cgamr">동영상 첨부</div>
                      <img src="/icons/ICON_VIDEO.svg">
                    </label>
                    <span class="question_imgDesc__SQFui">동영상 첨부 파일 첨부는 1개만 가능합니다.</span>
                  </div>
                </div>
                <div>
                  <button class="question_submitBtn__vDrt_" type="submit">교육정보 등록</button>
                </div>
                <br />
              </form>
            </div>
            <div id="careForm">
              <form action="careSave" method="POST" enctype="multipart/form-data">
                <div>
                  <span class="question_questionCategory__1QDx6">케어 카테고리</span><span class="question_questionMark__AykT_">*</span>

                  <div class="question_radioWrap__WZ6ME" id="cateList">
                    <div>
                      <input type="radio" name="animal" id="careDog" value="강아지" checked>
                      <label for="careDog">강아지</label>
                    </div>
                    <div>
                      <input type="radio" name="animal" id="careCat" value="고양이">
                      <label for="careCat">고양이</label>
                    </div>
                  </div>
                </div>
                <div>
                  <div>
                    <span class="question_questionCategory__1QDx6">글 작성</span>
                    <span class="question_questionMark__AykT_">*</span>
                  </div>
                  <input placeholder="제목을 입력해주세요" class="question_titleInput__S7Isd" type="text" name="title" />
                  <div class="question_alertText__WnxqW"></div>
                </div>
                <div class="question_questionInputWrapper__fGaar">
                  <textarea placeholder="5자 이상의 글 내용을 입력해주세요" class="question_questionInput___Mb57" name="content"></textarea>
                </div>
                <div class="question_fileInputWrapper__d9gmU">
                  <span class="question_questionCategory__1QDx6">사진 업로드</span>
                  <div class="question_questionImgContainer__tNqZy" id="careImagePreviewContainer"></div>
                  <input id="careUploadFile" name="file" type="file" accept="image/jpg,image/png,image/jpeg,image/gif" style="display: none;">
                  <label for="careUploadFile" class="question_inputFileBtn__zg7jN">
                    <div class="question_inputFileText__Cgamr">사진 첨부</div>
                    <img src="/icons/ICON_PHOTO_CAMERA.svg">
                  </label>
                  <span class="question_imgDesc__SQFui">이미지 파일 첨부는 1개만 가능합니다.</span>
                </div>
                <div class="question_fileInputWrapper__d9gmU">
                  <span class="question_questionCategory__1QDx6">동영상 업로드</span>
                  <div class="question_questionImgContainer__tNqZy" id="careVideoPreviewContainer"></div>
                  <input id="careUploadVideoFile" name="videoFile" type="file" accept="video/*" style="display: none;">
                  <label for="careUploadVideoFile" class="question_inputFileBtn__zg7jN">
                    <div class="question_inputFileText__Cgamr">동영상 첨부</div>
                    <img src="/icons/ICON_VIDEO.svg">
                  </label>
                  <span class="question_imgDesc__SQFui">동영상 첨부 파일 첨부는 1개만 가능합니다.</span>
                </div>
                <div>
                  <button class="question_submitBtn__vDrt_" type="submit">케어정보 등록</button>
                </div>
                <br />
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- /page content -->

      <!-- footer content -->
      <footer>
        <div class="pull-right">
          Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
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
	<!-- bootstrap-progressbar -->
	<script
		src="/admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="/admin/vendors/iCheck/icheck.min.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="/admin/vendors/moment/min/moment.min.js"></script>
	<script
		src="/admin/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap-wysiwyg -->
	<script
		src="/admin/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
	<script src="/admin/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
	<script src="/admin/vendors/google-code-prettify/src/prettify.js"></script>
	<!-- jQuery Tags Input -->
	<script src="/admin/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
	<!-- Switchery -->
	<script src="/admin/vendors/switchery/dist/switchery.min.js"></script>
	<!-- Select2 -->
	<script src="/admin/vendors/select2/dist/js/select2.full.min.js"></script>
	<!-- Parsley -->
	<script src="/admin/vendors/parsleyjs/dist/parsley.min.js"></script>
	<!-- Autosize -->
	<script src="/admin/vendors/autosize/dist/autosize.min.js"></script>
	<!-- jQuery autocomplete -->
	<script
		src="/admin/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
	<!-- starrr -->
	<script src="/admin/vendors/starrr/dist/starrr.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="/admin/build/js/custom.min.js"></script>

</body>
</html>