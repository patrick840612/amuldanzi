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

<!-- Bootstrap <link href="/admin/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">  드랍다운 화살표 2개씩 나옴-->

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

/* Summernote의 팝업창 위치 조정 */
.note-modal{
    top: 200px !important;
}

/* Summernote의 기본 스타일 재정의 */
.note-editor .note-editable {
    font-family: '굴림체', sans-serif !important;
}
/*  */

</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
    // 드래그 앤 드랍 보정
	$("div.note-editable").on('drop',function(e){
        for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
        	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
        }
       e.preventDefault();
  	})
    
    // 에디터 로딩 후 기본 글꼴 변경
    $('#summernote').on('summernote.init', function() {
        $('.note-editable').css('font-family', '굴림체, sans-serif');
    });

    let imgNameWhenupdate='';
    
    // 썸머노트 에디터 로딩
    $('#summernote').summernote({
        height: 600,                 // 에디터 높이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",                // 한글 설정
        placeholder: '최대 2048자까지 쓸 수 있습니다',    //placeholder 설정
        toolbar: [
		    // [groupName, [list of button]]
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','backcolor']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['picture','link','video']],
		    ['view', ['help']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
        popover: {
            image: [
                ['imagesize', ['imageSize100', 'imageSize50', 'imageSize25']],
                ['float', ['floatLeft', 'floatRight', 'floatNone']],
                ['remove', ['removeMedia']],
            ],
            // 여기에 새로운 그룹을 추가하여 위치를 변경할 기능을 넣습니다.
            customGroup: [
                ['custom', ['imageAttributes', 'imageShape']],
            ]
        },
        // 새로운 그룹에 대한 CSS 스타일을 정의합니다.
        followingToolbar: '.customGroup', // 팝업창을 .customGroup 클래스를 가진 요소 위치 아래로 이동시킵니다.
        callbacks: {
            onInit: function() {
                $('.note-editable').css('background-color', '#fff');
            },
          	//여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {

				if(imgNameWhenupdate != ''){
					deleteSummernoteImageFile(imgNameWhenupdate);
					$('.note-editable>p img').remove();
				}

				uploadSummernoteImageFile(files[0],this);
			},
			onPaste: function (e) {
				var clipboardData = e.originalEvent.clipboardData;
				if (clipboardData && clipboardData.items && clipboardData.items.length) {
					var item = clipboardData.items[0];
					if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
						e.preventDefault();
					}
				}
			},
            onMediaDelete: function ($target, editor, $editable) {
                if (confirm('이미지를 삭제 하시겠습니까?')) {
                    var deletedImageUrl = $target
                        .attr('src')
                        .split('/')
                        .pop()
                    imgNameWhenupdate = '';
                    $('#sitterImg').val('');

                    // ajax 함수 호출
                    deleteSummernoteImageFile(deletedImageUrl)
                }
            }
        }
    }); // 썸머노트 에디터 로딩 끝
    

	/**
	* 이미지 파일 업로드
	*/
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/mypage/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			dataType : 'json',
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
            	imgNameWhenupdate = data.url.split('/').pop();
            	$('#sitterImg').val(imgNameWhenupdate);
			      if (data && data.url) {
			        // 업로드된 이미지 URL을 에디터에 삽입
			        $(editor).summernote("insertImage", data.url);
			      } else {
			        alert("서버에서 올바른 응답을 받지 못했습니다.");
			      }
			},
			error : function(err){
				console.log(err);
				alert('error');
			}
		});
	}
    
    // 이미지 삭제
    function deleteSummernoteImageFile(imageName) {
        data = new FormData()
        data.append('file', imageName)
        $.ajax({
            data: data,
            type: 'POST',
            url: '/mypage/deleteSummernoteImageFile',
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
        })
    }
    
    // 페이지가 이동하거나 브라우저가 닫힐 때 발생하는 이벤트 처리
    $(window).on('beforeunload', function(event) {
		if(imgNameWhenupdate != ''){
			deleteSummernoteImageFile(imgNameWhenupdate);
		}
        //return '이 페이지를 벗어나시겠습니까?';
    });
    
    // 돌보미 신청할 때 파일지워지지 않게하기
    $('#sitterRegist').submit(function(){
    	imgNameWhenupdate = '';
    });
    

 	// 승인등급 조건    
	if(${not empty sitter}){

		if('${sitter.sitter}'=="승인대기"){
			$('#신청하기').prop('disabled', true);
			$('#승인대기').prop('disabled', false);
			$('#승인대기').prop('checked', true);
			$('#level').hide();
			$('#levelChange').before($('<div style="text-align: center; margin-top: 200px;"><p style="font-size: 36px;">돌보미 심사 중입니다... 기다려주세요...</p><br/>'+
					'<p style="font-size: 24px; color: red; font-weight: bold;">재신청시 기존 신청내역이 삭제됩니다</p></div>'));
			$('#levelChange').empty();
			$('#levelChange').append($('<button class="question_submitBtn__vDrt_" type="button" id="sitterRe">돌보미 재신청</button>'));
			
		    $('#sitterRe').click(function(){
		    	location.href='/mypage/deleteSitter?id=${id}'; 
	    	});
		    
		}else{
			$('#신청하기').prop('disabled', true);
			$('#승인완료').prop('disabled', false);
			$('#승인완료').prop('checked', true);
			$('#level').hide();
			$('#levelChange').before($('<div style="text-align: center; margin-top: 200px;"><p style="font-size: 36px;">돌보미 승인이 완료 되었습니다</p><br/>'+
			'<p style="font-size: 24px; color: green; font-weight: bold;">돌보미샵에 등록할 수 있습니다</p></div>'));
			$('#levelChange').empty();
			$('#levelChange').append($('<button class="question_submitBtn__vDrt_" type="button" id="dolbomiShop">돌보미샵 가기</button>'));
		}
		    $('#dolbomiShop').click(function(){
		    	location.href='/market/dolbomiShop'; 
	    	});
	} // 승인등급 조건
	

});
</script>
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
						<form id="sitterRegist" action="/mypage/sitterRegist" method="post" enctype="multipart/form-data">
							<span class="question_questionCategory__1QDx6">돌보미 신청
							<div class="question_radioWrap__WZ6ME">
								<div>
									<input type="radio" name="sitter" id="신청하기" value="승인대기" checked="신청하기"><label
										for="신청하기">신청하기</label>
								</div>
								<div>
									<input type="radio" name="sitter" id="승인대기" value="승인대기" disabled="disabled"><label
										for="승인대기">승인대기</label>
								</div>
								<div>
									<input type="radio" name="sitter" id="승인완료" value="승인완료" disabled="disabled"><label
										for="승인완료">승인완료</label>
								</div>
							</div>
							
							<div id="level">
								<div>
								<input type='hidden' name='id' value='${id}'/>
								<input type='hidden' name='sitterTitle' value='돌보미 역할신청'/>
								<!-- Select tag for 돌보미 경력 -->
								<div>				
									<div>
										<span class="question_questionCategory__1QDx6">돌보미 경력</span><span
											class="question_questionMark__AykT_">*</span>
										<select name="sitterCareer" class="question_selectTag__abcdef spaceSelect">
											<option value="경력없음">경력없음</option>
											<option value="6개월미만">6개월미만</option>
											<option value="6개월이상~1년이하">6개월이상~1년이하</option>
											<option value="1년이상~2년미만">1년이상~2년미만</option>
											<option value="2년이상~3년미만">2년이상~3년미만</option>
											<option value="3년이상~4년미만">3년이상~4년미만</option>
											<option value="4년이상~5년미만">4년이상~5년미만</option>
											<option value="5년이상">5년이상</option>
										</select>
										
										<span class="question_questionCategory__1QDx6">반려동물 양육 경력</span><span
											class="question_questionMark__AykT_">*</span>
										<select name="sitterPetCareer" class="question_selectTag__abcdef spaceSelect">
											<option value="경력없음">경력없음</option>
											<option value="6개월미만">6개월미만</option>
											<option value="6개월이상~1년이하">6개월이상~1년이하</option>
											<option value="1년이상~2년미만">1년이상~2년미만</option>
											<option value="2년이상~3년미만">2년이상~3년미만</option>
											<option value="3년이상~4년미만">3년이상~4년미만</option>
											<option value="4년이상~5년미만">4년이상~5년미만</option>
											<option value="5년이상">5년이상</option>
										</select>
									</div>
									<div class="question_alertText__WnxqW"></div>
								</div>
								
									<div>
										<span class="question_questionCategory__1QDx6">자격증명</span><span
											class="question_questionMark__AykT_">*</span>
									</div>
									<input placeholder="대표 자격증명 입력해주세요"
										class="question_titleInput__S7Isd" type="text" name="sitterLicense"/>
									<div class="question_alertText__WnxqW"></div>
								</div>
								<div>
									<div>
										<span class="question_questionCategory__1QDx6">자격증 취득 기관</span><span
											class="question_questionMark__AykT_">*</span>
									</div>
									<input placeholder="어디서 취득하셨쎄요?"
										class="question_titleInput__S7Isd" type="text" name="sitterAuthority"/>
									<div class="question_alertText__WnxqW"></div>
								</div>

 								<textarea id="summernote" name="editordata"></textarea>  
 								<input type="hidden" name="sitterImg" id="sitterImg"/>
 							</div>
								<div id="levelChange">
									<button class="question_submitBtn__vDrt_" type="submit">돌보미 신청하기</button>
								</div>
								<br />
						</form>

					</div>
				</div>				
			</div>
		</div>
	</div>


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
	<!-- Custom Theme Scripts 	<script src="/admin/build/js/custom.min.js"></script> 에러로 삭제함-->

	

    	
</body>
</html>
