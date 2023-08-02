<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%  //웹브라우저가 게시글 목록을 캐싱할 경우 새로운 글이 추가되더라도 새글이 목록에 안 보일 수 있기 때문에 설정
	response.setHeader("Pragma","No-cache");		// HTTP 1.0 version
	response.setHeader("Cache-Control","no-cache");	// HTTP 1.1 version
	response.setHeader("Cache-Control","no-store"); // 일부 파이어폭스 버스 관련
	response.setDateHeader("Expires", 1L);			// 현재 시간 이전으로 만료일을 지정함으로써 응답결과가 캐쉬되지 않도록 설정
%>

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

.approval {
	margin-top: -150px;
}

.buttonMove{
	margin-top: 0px !important;
}

li{
	background-color : #ffeb994d !important;
	margin-left: 10px;
}

li.disabled .atag {
  /*pointer-events: none;
   cursor: default; 
   페이징 맨앞과 맨 뒷 페이지일 때 화살표로 이동금지 클릭금지 아이콘 비활성화로 인해 적용 안함*/
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
        placeholder: '<h2 style="color: blue;">사업자 등록증 이미지를 첨부해주세요.</h2><br><h4 style="color: red;">이곳에 작성된 텍스트는 사용하지 않습니다.</h4>',    //placeholder 설정
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
                    $('#businessImg').val('');

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
    
    
	$('#levelChange2').hide();
	$('#levelChange3').hide();
    
 	// 승인등급 조건    
	if(${not empty business}){
		// 승인대기만 있을때
		if('${business}'=="승인대기"){

			$('#승인대기').prop('disabled', false);
			$('#승인대기').prop('checked', true);
			$('#levelChange').hide();
			$('#levelChange2').show();
			
		// 승인완료만 있을 때    
		}else if('${business}'=="승인완료"){
			$('#승인완료').prop('disabled', false);
			$('#승인완료').prop('checked', true);
			$('#levelChange').hide();
			$('#levelChange3').show();

		    $('#carrotShop').click(function(){		////////////////////////////////////////////// 쇼핑몰 이동경로 나중에 수정하기
		    	location.href='/market/carrotShop'; 
	    	});
		// 승인완료와 대기가 같이 있을 때    
		}else{

			$('#승인대기').prop('disabled', false);
			$('#승인완료').prop('disabled', false);
			$('#levelChange').hide();
			if('${businessOk}'=="승인완료"){
				$('#승인완료').prop('checked', true);
				$('#levelChange3').show();
				
			}else{
				$('#승인대기').prop('checked', true);
				$('#levelChange2').show();
			}
		}

	} // 승인등급 조건
	
	// 라디오 버튼 변경 이벤트 감지
	$("input[name='businessOk']").on('change', function() {
	    // 선택된 라디오 버튼의 값을 가져옵니다.
	    var selectedValue = $("input[name='businessOk']:checked").attr('id');
	    
	    // 조건에 따라 동작을 수행합니다.
	    if (selectedValue === "승인대기") {
	        // 승인대기일 경우에 수행할 작업을 여기에 작성합니다.
	        $('#levelChange2').show();
	        $('#levelChange').hide();
	        $('#levelChange3').hide();
	    } else if (selectedValue === "승인완료") {
	        // 승인완료일 경우에 수행할 작업을 여기에 작성합니다.
	        $('#levelChange3').show();
	        $('#levelChange').hide();
	        $('#levelChange2').hide();
	    } else {
	        // 신청하기일 경우에 수행할 작업을 여기에 작성합니다.
	        $('#levelChange').show();
	        $('#levelChange2').hide();
	        $('#levelChange3').hide();	        
	    }
	});
	
    // 돌보미 신청할 때 파일지워지지 않게하기	
	$('#businessRegist').submit(function(event){
		if($('#businessImg').val()==''){
			event.preventDefault();
			alert('이미지를 첨부해 주세요');
		}else{
	    	imgNameWhenupdate = '';
		}
			
	});
    
	$('.atag').click(function(event){
		 event.preventDefault();
		 
		 var href = $(this).attr('href');
		 href += "&businessOk=" + $('input[name="businessOk"]:checked').attr('id');
		 $(this).attr('href', href);
		 window.location.href = href;
		 
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
						<form id="businessRegist" action="/mypage/businessRegist"
							method="post" enctype="multipart/form-data">
							<span class="question_questionCategory__1QDx6">쇼핑몰 신청</span>
							<div class="question_radioWrap__WZ6ME">
								<div>
									<input type="radio" name="businessOk" id="신청하기" value="승인대기"
										checked><label for="신청하기">신청하기</label>
								</div>
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
												class="question_questionMark__AykT_">*숫자만 입력</span>
										</div>
										<input placeholder="숫자만 입력해주세요 (사업자번호 미보유시 주민번호)"
											class="question_titleInput__S7Isd" type="number"
											name="businessNumber" required="required" />
										<div class="question_alertText__WnxqW"></div>
									</div>
									<div>
										<div>
											<span class="question_questionCategory__1QDx6">상호명(대표자명)</span><span
												class="question_questionMark__AykT_">*</span>
										</div>
										<input placeholder="(상호명 미보유시 대표자명)"
											class="question_titleInput__S7Isd" type="text"
											name="businessName" required="required" />
										<div class="question_alertText__WnxqW"></div>
									</div>
									<div>
										<div>
											<span class="question_questionCategory__1QDx6">업종</span><span
												class="question_questionMark__AykT_">*</span>
										</div>
										<input placeholder="" class="question_titleInput__S7Isd"
											type="text" name="businessSector" required="required" />
										<div class="question_alertText__WnxqW"></div>
									</div>

									<textarea id="summernote" name="editordata"></textarea>
									<input type="hidden" name="businessImg" id="businessImg"
										required="required" />
								</div>

								<div>
									<button class="question_submitBtn__vDrt_" type="submit">쇼핑몰
										신청하기</button>
								</div>
								<br />
							</div>
						</form>


						<!-- 쇼핑몰 신청하기 끝 -->

						<!-- 쇼핑몰 신청대기 시작 -->
						<div id="levelChange2" class="approval">
							<div style="text-align: center; margin-top: 200px;">
								<p style="font-size: 36px;">쇼핑몰 심사 중입니다... 기다려주세요...</p>
								<br />
							</div>
							<div class="main_mainContents__GXYBn">
								<div class="community_loungeLeftContent__wnv1Z">

									<br />
									<hr class="popper_popperMenuDivider__j1QQj">
									<br />


									<c:forEach var="businessItem" items="${business1}">
										<c:choose>
											<c:when test="${businessItem.businessOk eq '승인대기'}">

												<!-- 추가적인 승인 완료 리스트 정보를 여기에 추가하세요 -->

												<div class="community_loungeList__HbstN">
													<div class="qaList_qaListContainer__73To2">
														<div class="qaList_qaListWrapper___YnhH">
															<div>
																<a
																	href="/mypage/businessDetail?businessNumber=${businessItem.businessNumber}">
																	<div class="qaList_qaListTitle__Z1Ssh">${businessItem.businessName}
																</a>
															</div>
															<div class="qaList_qaListText__2Cm8R">${businessItem.businessNumber}</div>
														</div>
														<div class="qaList_qaListImg__DiWnU">
															<span
																style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img
																alt="사업자등록증 이미지"
																src="/images/mypage/${businessItem.businessImg}"
																decoding="async" data-nimg="fill" sizes="100vw"
																style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover; object-position: center center; filter: none; background-size: cover; background-image: none; background-position: center center;">
																<noscript></noscript></span>
														</div>
													</div>
													<div class="qaList_qaListAbout__qL7GR">
														<div class="qaList_communityType__p7p5C">
															${businessItem.businessOk}</div>
														<div>${businessItem.memberId.id}</div>
														<div>
															<c:set var="formattedDate">
																<fmt:formatDate value="${businessItem.businessRegdate}"
																	pattern="yyyy-MM-dd" />
															</c:set>

															<c:out value="${formattedDate}" />
														</div>
													</div>
													<div class="qaList_labelWrapper__vsqC0">
														<div class="qaList_desktopLabelContainer__EEK_6"></div>
													</div>
													<hr class="qaList_qaListDivider__blo7m">
												</div>
</div><!-- 잘못된 태그이지만 없으면 정상작동 안함 -->
											</c:when>
										</c:choose>
									</c:forEach>
								</div>
							</div>


					<ul class="pagination">
						<!-- 처음 페이지로 이동하는 링크를 추가합니다 -->
						<li class="${currentPage == 1 ? 'disabled' : ''}"><a class="atag" 
							href="/mypage/business?page=1" aria-label="처음 페이지로 이동">«</a>
						</li>

						<!-- 이전 페이지로 이동하는 링크를 추가합니다 -->
						<li class="${currentPage == 1 ? 'disabled' : ''}"><a class="atag" 
							href="/mypage/business?page=${currentPage - 1}"
							aria-label="이전 페이지로 이동">‹</a></li>

						<!-- 페이지 번호를 표시합니다 -->
						<c:forEach begin="1" end="${totalPages1}" var="pageNumber">
							<li class="${pageNumber == currentPage ? 'active' : ''}"><a class="atag"
								href="/mypage/business?page=${pageNumber}"
								aria-label="페이지 ${pageNumber}로 이동">${pageNumber}</a></li>
						</c:forEach>

						<!-- 다음 페이지로 이동하는 링크를 추가합니다 -->
						<li class="${currentPage == totalPages1 ? 'disabled' : ''}"><a class="atag"
							href="/mypage/business?page=${currentPage + 1}"
							aria-label="다음 페이지로 이동">›</a></li>

						<!-- 마지막 페이지로 이동하는 링크를 추가합니다 -->
						<li class="${currentPage == totalPages1 ? 'disabled' : ''}"><a class="atag"
							href="/mypage/business?page=${totalPages1}"
							aria-label="마지막 페이지로 이동">»</a></li>
					</ul>
					
				</div>
					<div>
						<hr class="popper_popperMenuDivider__j1QQj">
					</div>
					<!-- 쇼핑몰 신청대기 끝 -->

						<!-- 쇼핑몰 신청완료 시작 -->
						<div id="levelChange3" class="approval">
							<div style="text-align: center; margin-top: 200px;">
								<p style="font-size: 36px;">쇼핑몰 승인이 완료 되었습니다</p>
								<br />
								<p style="font-size: 24px; color: green; font-weight: bold;">쇼핑몰
									운영이 가능합니다</p>
							</div>
							<div class="main_mainContents__GXYBn">
								<div class="community_loungeLeftContent__wnv1Z">

									<br />
									<hr class="popper_popperMenuDivider__j1QQj">
									<br />


									<c:forEach var="businessItem" items="${business2}">
										<c:choose>
											<c:when test="${businessItem.businessOk eq '승인완료'}">

												<!-- 추가적인 승인 완료 리스트 정보를 여기에 추가하세요 -->

												<div class="community_loungeList__HbstN">
													<div class="qaList_qaListContainer__73To2">
														<div class="qaList_qaListWrapper___YnhH">
															<div>
																<a
																	href="/mypage/businessDetail?businessNumber=${businessItem.businessNumber}">
																	<div class="qaList_qaListTitle__Z1Ssh">${businessItem.businessName}
																</a>
															</div>
															<div class="qaList_qaListText__2Cm8R">${businessItem.businessNumber}</div>
														</div>
														<div class="qaList_qaListImg__DiWnU">
															<span
																style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img
																alt="사업자등록증 이미지"
																src="/images/mypage/${businessItem.businessImg}"
																decoding="async" data-nimg="fill" sizes="100vw"
																style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover; object-position: center center; filter: none; background-size: cover; background-image: none; background-position: center center;">
																<noscript></noscript></span>
														</div>
													</div>
													<div class="qaList_qaListAbout__qL7GR">
														<div class="qaList_communityType__p7p5C">
															${businessItem.businessOk}</div>
														<div>${businessItem.memberId.id}</div>
														<div>
															<c:set var="formattedDate">
																<fmt:formatDate value="${businessItem.businessRegdate}"
																	pattern="yyyy-MM-dd" />
															</c:set>

															<c:out value="${formattedDate}" />
														</div>
													</div>
													<div class="qaList_labelWrapper__vsqC0">
														<div class="qaList_desktopLabelContainer__EEK_6"></div>
													</div>
													<hr class="qaList_qaListDivider__blo7m">
												</div>
</div><!-- 잘못된 태그이지만 없으면 정상작동 안함 -->
											</c:when>
										</c:choose>
									</c:forEach>
								</div>
								
					<ul class="pagination">
						<!-- 처음 페이지로 이동하는 링크를 추가합니다 -->
						<li class="${currentPage == 1 ? 'disabled' : ''}"><a class="atag"
							href="/mypage/business?page=1" aria-label="처음 페이지로 이동">«</a>
						</li>

						<!-- 이전 페이지로 이동하는 링크를 추가합니다 -->
						<li class="${currentPage == 1 ? 'disabled' : ''}"><a class="atag"
							href="/mypage/business?page=${currentPage - 1}"
							aria-label="이전 페이지로 이동">‹</a></li>

						<!-- 페이지 번호를 표시합니다 -->
						<c:forEach begin="1" end="${totalPages2}" var="pageNumber">
							<li class="${pageNumber == currentPage ? 'active' : ''}"><a class="atag"
								href="/mypage/business?page=${pageNumber}"
								aria-label="페이지 ${pageNumber}로 이동">${pageNumber}</a></li>
						</c:forEach>

						<!-- 다음 페이지로 이동하는 링크를 추가합니다 -->
						<li class="${currentPage == totalPages2 ? 'disabled' : ''}"><a class="atag"
							href="/mypage/business?page=${currentPage + 1}"
							aria-label="다음 페이지로 이동">›</a></li>

						<!-- 마지막 페이지로 이동하는 링크를 추가합니다 -->
						<li class="${currentPage == totalPages2 ? 'disabled' : ''}"><a class="atag"
							href="/mypage/business?page=${totalPages2}"
							aria-label="마지막 페이지로 이동">»</a></li>
					</ul>								
								
								
							</div>
							<div>
							<button class="question_submitBtn__vDrt_ buttonMove" type="button"
								id="carrotShop">쇼핑몰 가기</button>
							</div>
					<br/>		
					<div>
						<hr class="popper_popperMenuDivider__j1QQj">
					</div>	
						</div>
						
						<!-- 쇼핑몰 신청완료 끝 -->

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

</body>
</html>
