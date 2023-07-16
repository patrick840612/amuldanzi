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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
  $(document).ready(function() {
	  
	  let postForm = function() {
		  let content = $('#editor-one').summernote('code');
		  $('#content').val(content);
		} 
	  
  
    // 라디오 버튼 클릭 이벤트 핸들러
    function handleRadioChange() {
      var selectedValue = $('input[name="cate"]:checked').val();
      var formContainer = $('#insertCateForm');
      var noticeCategory = $('#noticeCategory');
	  var insertButton = $('#insertButton');
      
	  
      if (selectedValue === '0') {
    	// 선택한 라디오 버튼에 따라 form 영역 변경  
        formContainer.html(`
        <form action="noticeSave" method="post">
        	<div>
                <span class="question_questionCategory__1QDx6">공지 카테고리</span><span
                   class="question_questionMark__AykT_">*</span>

                <div class="question_radioWrap__WZ6ME" id="cateList">
                   <div>
                      <input type="radio" name="category" id="중요공지" value="1"
                         checked><label for="중요공지">중요 공지</label>
                   </div>
                   <div>
                      <input type="radio" name="category" id="일반공지" value="2"><label
                         for="일반공지">일반 공지</label>
                   </div>

                </div>

             </div>

             <div>
                <div>
                   <span class="question_questionCategory__1QDx6">글 작성</span><span
                      class="question_questionMark__AykT_">*</span>
                </div>
                <input placeholder="제목을 입력해주세요" class="question_titleInput__S7Isd" type="text" name="title"/>
                <div class="question_alertText__WnxqW"></div>
             </div>
             <div class="question_questionInputWrapper__fGaar">
                <textarea placeholder="5자 이상의 글 내용을 입력해주세요" class="question_questionInput___Mb57" type="text" name="content"></textarea>
                <div class="question_alertText__WnxqW"></div>
             </div>			          
             <div>
             	<button class="question_submitBtn__vDrt_" type="submit">공지등록</button>
             </div>   
             <br />
        </form>
        `);  
     
      } else if (selectedValue === '2') {
        formContainer.html(`
        <form action="eduSave" method="post">
        	<div>
                <span class="question_questionCategory__1QDx6">교육 카테고리</span><span
                   class="question_questionMark__AykT_">*</span>

                <div class="question_radioWrap__WZ6ME" id="cateList">
                   <div>
                      <input type="radio" name="animal" id="강아지" value="강아지"
                         checked><label for="강아지">강아지</label>
                   </div>
                   <div>
                      <input type="radio" name="animal" id="고양이" value="고양이"><label
                         for="고양이">고양이</label>
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
                   <span class="question_questionCategory__1QDx6">글 작성</span><span
                      class="question_questionMark__AykT_">*</span>
                </div>
                <input placeholder="제목을 입력해주세요" class="question_titleInput__S7Isd" type="text" name="title"/>
                <div class="question_alertText__WnxqW"></div>
             </div>
             <div class="question_questionInputWrapper__fGaar">
                <textarea placeholder="5자 이상의 글 내용을 입력해주세요" class="question_questionInput___Mb57" type="text" name="content"></textarea>
                <div class="question_alertText__WnxqW"></div>
             </div>			          
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
          <div class="question_thumbnailText__h45xg">
          <ul>
             <li>동영상과 사진을 동시에 업로드 시, 업로드된 사진 중 첫 번째 순서의 사진이 썸네일로 지정됩니다.</li>
             <li>동영상 1개만 업로드 시, 동영상에서 랜덤으로 추출되어 썸네일로 지정됩니다.</li>
          </ul>
       </div>
       <div>
       	<button class="question_submitBtn__vDrt_" type="submit">교육정보 등록</button>
       </div>   
       <br />
       </form>
        `);
        
      }else if(selectedValue === '3'){        
    	  formContainer.html(`
    		<form action="careSave" method="post">
    		  <div>
                  <span class="question_questionCategory__1QDx6">케어 카테고리</span><span
                     class="question_questionMark__AykT_">*</span>

                  <div class="question_radioWrap__WZ6ME" id="cateList">
                  	<div>
                  		<input type="radio" name="animal" id="강아지" value="강아지" checked>
                  		<label for="강아지">강아지</label>
               		</div>
               		<div>
                  		<input type="radio" name="animal" id="고양이" value="고양이">
                  		<label for="고양이">고양이</label>
               		</div>
                  </div>

               </div>

               <div>
                  <div>
                     <span class="question_questionCategory__1QDx6">글 작성</span>
                     <span class="question_questionMark__AykT_">*</span>
                  </div>
                  <input placeholder="제목을 입력해주세요" class="question_titleInput__S7Isd" type="text" name="title"/>
                  <div class="question_alertText__WnxqW"></div>
               </div>
               <div class="question_questionInputWrapper__fGaar">
                  <textarea placeholder="5자 이상의 글 내용을 입력해주세요" class="question_questionInput___Mb57" type="text" name="content"></textarea>
                  <div class="question_alertText__WnxqW"></div>
               </div>			            
    			  
              <div class="question_fileInputWrapper__d9gmU">
              <span class="question_questionCategory__1QDx6">사진 업로드</span>
              <div class="question_questionImgContainer__tNqZy"></div>
              <input id="uploadFile" type="file" multiple="" accept="image/jpg,image/png,image/jpeg,image/gif" style="display: none;">
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
            <div class="question_thumbnailText__h45xg">
            <ul>
               <li>동영상과 사진을 동시에 업로드 시, 업로드된 사진 중 첫 번째 순서의 사진이 썸네일로 지정됩니다.</li>
               <li>동영상 1개만 업로드 시, 동영상에서 랜덤으로 추출되어 썸네일로 지정됩니다.</li>
            </ul>
         </div>
         <div>
         	<button class="question_submitBtn__vDrt_" type="submit">케어정보 등록</button>
         </div>   
         <br />
         </form>
          `);    	  
 	  
      }

      // 기타 필요한 작업 수행
    }

    // 라디오 버튼 클릭 이벤트 리스너 등록
    $('input[name="cate"]').on('change', handleRadioChange);
    
 	// 폼 제출 시 postForm 함수 호출
    $('form').submit(function() {
        postForm();
      });
    
    
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
								aria-expanded="false"> <img src="/images/img.jpg" alt="">관리자
							</a>
								<div class="dropdown-menu dropdown-usermenu pull-right"
									aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="login.html"><i
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
						<div id="insertCateForm">
							<form action="noticeSave" method="POST" enctype="multipart/form-data">
								<div>
									<input name="cateId" type="hidden" value="0" /> <span
										class="question_questionCategory__1QDx6">공지 카테고리</span><span
										class="question_questionMark__AykT_">*</span>

									<div class="question_radioWrap__WZ6ME" id="cateList">
										<div>
											<input type="radio" name="category" id="중요공지" value="중요공지"
												checked><label for="중요공지">중요 공지</label>
										</div>
										<div>
											<input type="radio" name="category" id="일반공지" value="일반공지"><label
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
										class="question_titleInput__S7Isd" type="text" name="title" />
									<div class="question_alertText__WnxqW"></div>
								</div>
								<div class="x_panel">
									<div class="x_content">
										<div id="alerts"></div>
										<div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor-one">
											<div class="btn-group">
												<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font" aria-expanded="false"><i class="fa fa-font"></i><b class="caret"></b></a>
												<ul class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 38px, 0px);">
												</ul>
											</div>
		
											<div class="btn-group">
												<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size" aria-expanded="false"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
												<ul class="dropdown-menu" x-placement="bottom-start" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 38px, 0px);">
													<li>
														<a data-edit="fontSize 5" class="">
															<p style="font-size:17px">Huge</p>
														</a>
													</li>
													<li>
														<a data-edit="fontSize 3" class="">
															<p style="font-size:14px">Normal</p>
														</a>
													</li>
													<li>
														<a data-edit="fontSize 1" class="">
															<p style="font-size:11px">Small</p>
														</a>
													</li>
												</ul>
											</div>
		
											<div class="btn-group">
												<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
												<a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
												<a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
												<a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
											</div>
		
											<div class="btn-group">
												<a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
												<a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
												<a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
												<a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
											</div>
		
											<div class="btn-group">
												<a class="btn btn-info" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
												<a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
												<a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
												<a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
											</div>
		
											<div class="btn-group">
												<a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="fa fa-link"></i></a>
												<div class="dropdown-menu input-append">
													<input class="span2" placeholder="URL" type="text" data-edit="createLink">
													<button class="btn" type="button">Add</button>
												</div>
												<a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="fa fa-cut"></i></a>
											</div>
		
											<div class="btn-group">
												<a class="btn" title="Insert picture (or just drag &amp; drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>
												<input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage">
											</div>
		
											<div class="btn-group">
												<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
												<a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
											</div>
										</div>
		
										<div id="editor-one" class="editor-wrapper placeholderText" contenteditable="true"><div style="text-align: left;"><br></div></div>
		
										<textarea name="content" id="content" style="display:none;"></textarea>
		
										<br>
		
										<div class="ln_solid"></div>
									</div>
								</div>
								<div>
									<button class="question_submitBtn__vDrt_" type="submit">공지등록</button>
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
	<!-- bootstrap-progressbar -->
	<script src="/admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="/admin/vendors/iCheck/icheck.min.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="/admin/vendors/moment/min/moment.min.js"></script>
	<script src="/admin/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap-wysiwyg -->
	<script src="/admin/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
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
	<script src="/admin/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
	<!-- starrr -->
	<script src="/admin/vendors/starrr/dist/starrr.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="/admin/build/js/custom.min.js"></script>
	
	
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js"></script>
	

</body>
</html>