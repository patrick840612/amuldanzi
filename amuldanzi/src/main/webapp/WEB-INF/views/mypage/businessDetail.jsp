<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="/admin/production/images/favicon.ico"
	type="image/ico" />
<title>쇼핑몰신청</title>

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
<link href="/admin/chunks/css/39c68523bb4928b9.css" rel="stylesheet">
<link href="/admin/chunks/css/281067dbec461a13.css" rel="stylesheet">
<link href="/admin/chunks/css/3ca3804aef0f69b8.css" rel="stylesheet">
<link href="/admin/chunks/css/text.css" rel="stylesheet">

<!-- 커뮤니티 css 빌려오기(리스트용) -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/chunks/css/c552b37c371c331c.css" rel="stylesheet">
<link href="/chunks/css/39c68523bb4928b9.css" rel="stylesheet">
<link href="/chunks/css/281067dbec461a13.css" rel="stylesheet">
<link href="/chunks/css/3ca3804aef0f69b8.css" rel="stylesheet">
<link href="/chunks/css/communitytext.css" rel="stylesheet">
<link href="/css/community/text.css" rel="stylesheet">

<style type="text/css">
.nav-md .container.body .right_col {
	margin-left: 0px;
}

/* Summernote의 팝업창 위치 조정 */
.note-modal {
	top: 200px !important;
}

/* Summernote의 기본 스타일 재정의 */
.note-editor .note-editable {
	font-family: '굴림체', sans-serif !important;
}

.buttonMove{
	margin-top: 0px !important;
	margin-bottom: 15px !important;
}
.buttonMove2{
	margin-top: 0px !important;
	margin-bottom: 30px !important;
}

.qaDetail_qaDetailImgBox__VzApc{
	gap: 0px !important;
}

.cat {
  position: absolute;
  left: 500px;
  top: 500px;
  z-index: 999;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 승인대기일 때
	if('${businessOk}'=="승인대기"){

		$('#승인대기').prop('disabled', false);
		$('#승인대기').prop('checked', true);
	// 승인완료일 때    
	}else{
		$('#승인완료').prop('disabled', false);
		$('#승인완료').prop('checked', true);
		$("input[name='businessName']").prop("readonly", true);
		$("input[name='businessSector']").prop("readonly", true);
		$('#summernote').remove();		
		$('#businessUpdate').hide();
		$('#businessDelete').hide();
		$('#사업자').text('*');
	}


	
    // 드래그 앤 드랍 보정
	$("div.note-editable").on('drop',function(e){
        for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
        	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
        }
       e.preventDefault();
  	});
    
    // 에디터 로딩 후 기본 글꼴 변경
    $('#summernote').on('summernote.init', function() {
        $('.note-editable').css('font-family', '굴림체, sans-serif');
    });

    let imgNameWhenupdate='';
    
    // 썸머노트 에디터 로딩
    $('#summernote').summernote({
        height: 400,                 // 에디터 높이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",                // 한글 설정
        placeholder: '<h2 style="color: blue;">수정할 사업자 등록증 이미지를 첨부해주세요.</h2><br><h4 style="color: red;">이곳에 작성된 텍스트는 사용하지 않습니다.</h4>',    //placeholder 설정
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
                    imgNameWhenupdate = '${business.businessImg}';
                    $('#businessImg').val('${business.businessImg}');

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
            	$('#businessImg').val(imgNameWhenupdate);
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
    
    // 쇼핑몰 신청할 때 파일지워지지 않게하기	
	$('#businessRegist').submit(function(event){
		if($('#businessImg').val()==''){
			event.preventDefault();
			alert('이미지를 첨부해 주세요');
		}else{
	    	imgNameWhenupdate = '';
		}
			
	});
    
 	$('#businessListBack').click(function(){
 		location.href="/mypage/business";
 	});
	
 	$('#businessDelete').click(function(){
 		$('#businessRegist').attr('action', '/mypage/businessDelete');
 	});
 	
	
});
</script>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>

<body class="nav-md">
<c:if test="${not empty selectCharacter}">
	<img class='cat' src='/character/images/${selectCharacter}' id="cat"/>
</c:if> 
	<div class="container body">
		<div class="main_container">

			<!-- page content -->
			<div class="right_col" role="main">
				<!-- top tiles -->
				<div class="question_questionContainer__xQp_P">
					<div class="question_questionContent__Y4VxA">
						<form id="businessRegist" action="/mypage/businessUpdate"
							method="post" enctype="multipart/form-data">
							<span class="question_questionCategory__1QDx6">쇼핑몰 상세내역</span>
							<div class="question_radioWrap__WZ6ME">
								<div>
									<input type="radio" name="businessOk" id="승인대기" value="승인대기"
										disabled="disabled"><label for="승인대기">승인대기</label>
								</div>
								<div>
									<input type="radio" name="businessOk" id="승인완료" value="승인완료"
										disabled="disabled"><label for="승인완료">승인완료</label>
								</div>
							</div>
							<div id="levelChange">
								<div>
									<div>
										<input type='hidden' name='id' value='${id}' /> <input
											type='hidden' name='businessTitle' value='사업자 역할신청' />
										<div>
											<span class="question_questionCategory__1QDx6">사업자등록번호(주민번호)</span><span
												class="question_questionMark__AykT_" id="사업자">*수정불가</span>
										</div>
										<input placeholder="숫자만 입력해주세요 (사업자번호 미보유시 주민번호)"
											class="question_titleInput__S7Isd" type="text"
											name="businessNumber" required="required" value="${business.businessNumber}" readonly="readonly"/>
										<div class="question_alertText__WnxqW"></div>
									</div>
									<div>
										<div>
											<span class="question_questionCategory__1QDx6">상호명(대표자명)</span><span
												class="question_questionMark__AykT_">*</span>
										</div>
										<input placeholder="(상호명 미보유시 대표자명)"
											class="question_titleInput__S7Isd" type="text"
											name="businessName" required="required" value="${business.businessName}"/>
										<div class="question_alertText__WnxqW"></div>
									</div>
									<div>
										<div>
											<span class="question_questionCategory__1QDx6">업종</span><span
												class="question_questionMark__AykT_">*</span>
										</div>
										<input placeholder="" class="question_titleInput__S7Isd"
											type="text" name="businessSector" required="required" value="${business.businessSector}"/>
										<div class="question_alertText__WnxqW"></div>
									</div>

									<textarea id="summernote" name="editordata"></textarea>
									<input type="hidden" name="businessImg" id="businessImg"
										required="required" value="${business.businessImg}"/>
								</div>
								

								<div class="qaDetail_qaDetailContent__ggrjL">
									<div class="qaDetail_qaDetailImgBox__VzApc">
										<h2>등록된 사업자 등록증 이미지</h2>										 
										<img  class="img_verticalImage__P4gbA" src="/images/mypage/${business.businessImg}" alt="사업자등록증 Image" style="width: 600px; height: 500px;" />
										<button class="question_submitBtn__vDrt_ buttonMove" type="submit" id="businessUpdate">쇼핑몰 수정하기</button>
										<button class="question_submitBtn__vDrt_ buttonMove" type="submit" id="businessDelete">쇼핑몰 삭제하기</button>
										<button class="question_submitBtn__vDrt_ buttonMove2" type="button" id="businessListBack">쇼핑몰리스트 보기</button>
									</div>
								</div>



								<br />
							</div>
						</form>
						<!-- 쇼핑몰 수정하기 끝 -->


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
