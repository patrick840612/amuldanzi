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
<title>1:1문의 상세</title>

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

label{
	width: 90px !important;
}

#replyC{
	background-color: transparent;
    border: none;
    resize: none;
    outline: none;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	// 답변대기일 때
	if('${qnaAnswerOk}'=="답변대기"){

		$('#답변대기').prop('disabled', false);
		$('#답변대기').prop('checked', true);
		$('#reply').hide();
	// 답변완료일 때
	}else{
		$('#답변완료').prop('disabled', false);
		$('#답변완료').prop('checked', true);
		$('#summernote').remove();		
		$('#qnaUpdate').hide();
		$('#qnaDelete').hide();
	}
	
	// 답변유형 체크하기
	if('${qna.qnaCategory}'=='나의반려동물'){
		$('#나의반려동물').prop('checked', true);
	}else if('${qna.qnaCategory}'=='마켓'){
		$('#마켓').prop('checked', true);
	}else if('${qna.qnaCategory}'=='게시판'){
		$('#게시판').prop('checked', true);
	}else if('${qna.qnaCategory}'=='커뮤니티'){
		$('#커뮤니티').prop('checked', true);
	}else{
		$('#시스템').prop('checked', true);
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
    
	$('#summernote').val("${qna.qnaContent}");
    // 썸머노트 에디터 로딩
    $('#summernote').summernote({
    	height: 400,                 // 에디터 높이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR",                // 한글 설정
        placeholder: '<h2 style="color: blue;">문의 내용을 작성해주세요.</h2><br><h4 style="color: red;">이미지를 업로드하면 변경됩니다</h4>',    //placeholder 설정
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
                    imgNameWhenupdate = '${qna.qnaImg}';
                    $('#qnaImg').val('${qna.qnaImg}');

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
            	$('#qnaImg').val(imgNameWhenupdate);
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
	$('#qnaRegist').submit(function(event){
	    	imgNameWhenupdate = '';
	});
    
 	$('#qnaListBack').click(function(){
 		location.href="/mypage/qnalist";
 	});
	
 	$('#qnaDelete').click(function(){
 		$('#qnaRegist').attr('action', '/mypage/qnaDelete');
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
						<form id="qnaRegist" action="/mypage/qnaUpdate"
							method="post" enctype="multipart/form-data">
							<span class="question_questionCategory__1QDx6">문의 상세내역</span>
							<div class="question_radioWrap__WZ6ME">
								<div>
									<input type="radio" name="qnaAnswerOk" id="답변대기" value="답변대기"
										disabled="disabled"><label for="답변대기">답변대기</label>
								</div>
								<div>
									<input type="radio" name="qnaAnswerOk" id="답변완료" value="답변완료"
										disabled="disabled"><label for="답변완료">답변완료</label>
								</div>
							</div>
							<div id="levelChange">
								<span class="question_questionCategory__1QDx6">문의유형</span>
								<div class="question_radioWrap__WZ6ME">
									<div>
										<input type="radio" name="qnaCategory" id="나의반려동물" value="나의반려동물"
											checked><label for="나의반려동물">나의 반려동물</label>
									</div>
									<div>
										<input type="radio" name="qnaCategory" id="마켓" value="마켓"
											><label for="마켓">마켓</label>
									</div>
									<div>
										<input type="radio" name="qnaCategory" id="게시판" value="게시판"
											><label for="게시판">게시판</label>
									</div>
									<div>
										<input type="radio" name="qnaCategory" id="커뮤니티" value="커뮤니티"
											><label for="커뮤니티">커뮤니티</label>
									</div>
									<div>
										<input type="radio" name="qnaCategory" id="시스템" value="시스템"
											><label for="시스템">시스템</label>
									</div>
								</div>
								<div>
									<div>
										<input type='hidden' name='id' value='${id}' />
										<input type='hidden' name='qnaNo' value='${qna.qnaNo}' /> 
										<div>
											<span class="question_questionCategory__1QDx6">문의제목</span><span
												class="question_questionMark__AykT_">*</span>
										</div>
										<input placeholder="문의제목을 입력해주세요"
											class="question_titleInput__S7Isd" type="text"
											name="qnaTitle" required="required" value="${qna.qnaTitle}"/>
										<div class="question_alertText__WnxqW"></div>
									</div>

									<textarea id="summernote" name="editordata"></textarea>
									<input type="hidden" name="qnaImg" id="qnaImg"
										required="required" value="${qna.qnaImg}"/>
								<div class="qaDetail_qaDetailContent__ggrjL">
									<div class="qaDetail_qaDetailImgBox__VzApc">
										<c:if test="${not empty qna.qnaImg}">
											<h2>등록된 문의 이미지</h2>										 
											<img  class="img_verticalImage__P4gbA" src="/images/mypage/${qna.qnaImg}" alt="문의 Image" style="width: 600px; height: 500px;" />
										</c:if>		
									</div>
								</div>
								<!-- 답변 부분 시작 -->	
								<div id="reply">	
									<div class="qaDetail_qaDetailBar__tOqjr"></div>
									<ins class="adsbygoogle" data-ad-client="ca-pub-4786722989459138"
										data-ad-slot="6986428526" data-ad-format="auto"
										data-full-width-responsive="true" style="display: block;"></ins>
									<div class="qaDetail_qaDetailAnswerWrapper__TJpOV">
										<div class="qaDetail_qaDetailTotal__wSReo">문의 답변</div>
										<div class="qaDetail_qaDetailComment__7y1PJ">
											<div class="answer_qaAnswerInputWrapper___cOZ0">
												<textarea id="replyC" style="overflow: hidden; height: auto;" readonly="readonly">${qna.qnaAnswer}</textarea>
												<div class="answer_inputBtnWrapper__8hVzb">
													<div class="answer_questionImgContainer__oRcY2"></div>
													<div class="answer_answerBtnContainer__VgUOs">
														<div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="qaDetail_qaDetailAnswer__E9eTw" id="answers-30298">
											<div class="comment_qaDetailComment__guTi_">
												<div class="comment_qaCommentIdWrapper__u6F4S">
													<div>답변 작성자 : ${qna.qnaAnswerWriter}</div>
													<div>
														<c:set var="formattedDate">
															<fmt:formatDate value="${qna.qnaAnswerDate}"
																pattern="yyyy-MM-dd" />
														</c:set>

														<c:out value="${formattedDate}" />													
													</div>
												</div>
												<div class="comment_qaDetailImgNone__ngvPO"></div>
												<div class="comment_commentInfo__OI8e5">
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 답변 부분 끝 -->												
							</div>
								
							<div class="qaDetail_qaDetailContent__ggrjL">
									<div class="qaDetail_qaDetailImgBox__VzApc">
										<button class="question_submitBtn__vDrt_ buttonMove" type="submit" id="qnaUpdate">1:1 문의 수정하기</button>
										<button class="question_submitBtn__vDrt_ buttonMove" type="submit" id="qnaDelete">1:1 문의 삭제하기</button>
										<button class="question_submitBtn__vDrt_ buttonMove2" type="button" id="qnaListBack">1:1 문의리스트 보기</button>
									</div>
								</div>

								<br />
							</div>
						</form>
						<!-- 문의 수정 삭제하기 끝 -->
						


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
