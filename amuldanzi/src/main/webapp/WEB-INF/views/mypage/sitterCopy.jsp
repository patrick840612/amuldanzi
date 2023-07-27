<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="production//production/images/favicon.ico" type="image/ico" />
<title>돌보미</title>
<!-- 섬머노트 추가--> 
<link rel="stylesheet" href="/mypage/summernote/summernote-lite.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 섬머노트 추가 -->
<script src="/mypage/summernote/summernote-lite.js"></script>
<script src="/mypage/summernote/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
  
$(document).ready(function() {
	// 썸머노트 에디터 로딩
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	}); // 썸머노트 에디터 로딩 끝
});
</script>
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
<link href="/admin/chunks/css/39c68523bb4928b9.css" rel="stylesheet">
<link href="/admin/chunks/css/281067dbec461a13.css" rel="stylesheet">
<link href="/admin/chunks/css/3ca3804aef0f69b8.css" rel="stylesheet">
<link href="/admin/chunks/css/text.css" rel="stylesheet">

<style type="text/css">
.nav-md .container.body .right_col {
     margin-left: 0px;
}
.spaceSelect{
	margin-right: 100px;
}

</style>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>


<body class="nav-md">
	<div class="container body">
		<div class="main_container">


			<!-- page content -->
			<div class="right_col" role="main">  
				<!-- top tiles -->
				<div class="question_questionContainer__xQp_P">
					<div class="question_questionContent__Y4VxA">
						<form id="adModify" action="adModify" method="post" enctype="multipart/form-data">
							<span class="question_questionCategory__1QDx6">돌보미 신청</span><span
								class="question_questionMark__AykT_">*</span>
							<div class="question_radioWrap__WZ6ME">
								<div>
									<input type="radio" name="question" id="신청하기" value="신청하기" checked="신청하기"><label
										for="신청하기">신청하기</label>
								</div>
								<div>
									<input type="radio" name="question" id="승인대기" value="승인대기"><label
										for="승인대기">승인대기</label>
								</div>
								<div>
									<input type="radio" name="question" id="승인완료" value="승인완료" ><label
										for="승인완료">승인완료</label>
								</div>
							</div>

								<div>
								<input type='hidden' name='id' value='${id }'/>
								<!-- Select tag for 돌보미 경력 -->
								<div>				
									<div>
										<span class="question_questionCategory__1QDx6">돌보미 경력</span><span
											class="question_questionMark__AykT_">*</span>
										<select name="sitterCareer" class="question_selectTag__abcdef spaceSelect">
											<option value="0">경력없음</option>
											<option value="6">6개월이하</option>
											<option value="12">12개월</option>
											<option value="18">18개월</option>
											<option value="24">24개월</option>
											<option value="30">30개월</option>
											<option value="36">36개월</option>
											<option value="42">42개월</option>
											<option value="48">48개월</option>
											<option value="54">54개월</option>
											<option value="60">60개월이상</option>
										</select>
										
										<span class="question_questionCategory__1QDx6">반려동물 양육 경력</span><span
											class="question_questionMark__AykT_">*</span>
										<select name="sitterPetCareer" class="question_selectTag__abcdef spaceSelect">
											<option value="0">경력없음</option>
											<option value="6">6개월이하</option>
											<option value="12">12개월</option>
											<option value="18">18개월</option>
											<option value="24">24개월</option>
											<option value="30">30개월</option>
											<option value="36">36개월</option>
											<option value="42">42개월</option>
											<option value="48">48개월</option>
											<option value="54">54개월</option>
											<option value="60">60개월이상</option>
										</select>
									</div>
									<div class="question_alertText__WnxqW"></div>
								</div>
								
									<div>
										<span class="question_questionCategory__1QDx6">자격증명</span><span
											class="question_questionMark__AykT_">*</span>
									</div>
									<input placeholder="대표 자격증명 입력해주세요"
										class="question_titleInput__S7Isd" type="text" name="sitterLicense" value="${sit.sitterLicense}"/>
									<div class="question_alertText__WnxqW"></div>
								</div>
								<div>
									<div>
										<span class="question_questionCategory__1QDx6">자격증 취득 기관</span><span
											class="question_questionMark__AykT_">*</span>
									</div>
									<input placeholder="어디서 취득하셨쎄요?"
										class="question_titleInput__S7Isd" type="text" name="sitterAuthority" value="${sit.sitterAuthority}" />
									<div class="question_alertText__WnxqW"></div>
								</div>
				                <!-- <div class="question_fileInputWrapper__d9gmU">
				                    <span class="question_questionCategory__1QDx6">자격증 파일 업로드</span>
				                    <div class="question_questionImgContainer__tNqZy" id="imagePreviewContainer"></div>
				                    <input id="uploadFile" name="file" type="file" accept="image/jpg,image/png,image/jpeg,image/gif" style="display: none;">
				                    <label for="uploadFile" class="question_inputFileBtn__zg7jN">
				                    <div class="question_inputFileText__Cgamr">사진 첨부</div>
				                    <img src="/icons/ICON_PHOTO_CAMERA.svg">
				                    </label>
				                    <span class="question_imgDesc__SQFui">개당 업로드 용량: 10MB, 광고 첨부 파일은 1개만 가능합니다.</span>
				                </div> -->

 
 <textarea id="summernote" name="editordata"></textarea>  
								<div>
									<button class="question_submitBtn__vDrt_" type="submit">돌보미 신청하기</button>
								</div>
								<br />
						</form>
						
						<!-- <div class="ajaxImage">
					        <span>
					            <img class="image-preview" src="/images/ad/${adDetail.img}" alt="ad Image" style="width: 200px; height: 200px;">
					        </span>
					        <button class="deleteAjax" onclick="deleteImage('${adDetail.img}')" style="position:relative; left:93px" >&times;</button>
					    </div> -->
						

					</div>
				</div>				
			</div>
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
	

    	
</body>
</html>
