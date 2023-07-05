<%@ page contentType="text/html; charset=UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>애물단지</title>




<!-- 부트스트랩 -->
<link href="/css/bootstrap.min.css" rel="stylesheet">



<link href="/chunks/css/c552b37c371c331c.css" rel="stylesheet">
<link href="/chunks/css/39c68523bb4928b9.css" rel="stylesheet">
<link href="/chunks/css/281067dbec461a13.css" rel="stylesheet">
<link href="/chunks/css/3ca3804aef0f69b8.css" rel="stylesheet">
<link href="/chunks/css/text.css" rel="stylesheet">





</head>

<jsp:include page="./header.jsp"></jsp:include>

<body>
	<div class="question_questionContainer__xQp_P">
		<div class="question_questionContent__Y4VxA">
			<span class="question_questionCategory__1QDx6">카테고리</span><span
				class="question_questionMark__AykT_">*</span>
			<div class="question_radioWrap__WZ6ME">
				<div>
					<input type="radio" name="question" id="공지" value="공지" checked="공지"><label
						for="공지">공지</label>
				</div>
				<div>
					<input type="radio" name="question" id="병원정보" value="병원정보"><label
						for="병원정보">병원정보</label>
				</div>
				<div>
					<input type="radio" name="question" id="교육정보" value="교육정보"><label
						for="교육정보">교육정보</label>
				</div>
				<div>
					<input type="radio" name="question" id="케어정보" value="케어정보"><label
						for="케어정보">케어정보</label>
				</div>
				<div>
					<input type="radio" name="question" id="마켓정보" value="마켓정보"><label
						for="마켓정보">마켓정보</label>
				</div>
				<div>
					<input type="radio" name="question" id="커뮤니티" value="커뮤니티"><label
						for="커뮤니티">커뮤니티</label>
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


			<div>
				<div class="question_questionCategory__1QDx6">태그 입력</div>
				<input placeholder="태그를 입력해주세요" class="question_titleInput__S7Isd"
					value="">
				<div class="question_questionTagWrapper__cTwHo"></div>
			</div>
			<form enctype="multipart/form-data">
				<div class="question_fileInputWrapper__d9gmU">
					<span class="question_questionCategory__1QDx6">사진 업로드</span>
					<div class="question_questionImgContainer__tNqZy"></div>
					<input id="uploadFile" type="file" multiple=""
						accept="image/jpg,image/png,image/jpeg,image/gif"
						style="display: none;"><label for="uploadFile"
						class="question_inputFileBtn__zg7jN"><div
							class="question_inputFileText__Cgamr">사진 첨부</div> <img
						src="/icons/community/ICON_PHOTO_CAMERA.svg"></label><span
						class="question_imgDesc__SQFui">개당 업로드 용량: 10MB, 첨부 파일의 경우
						사진과 동영상을 합쳐 최대 10개 업로드 가능합니다.</span>
				</div>
				<div class="question_fileInputWrapper__d9gmU">
					<span class="question_questionCategory__1QDx6">동영상 업로드</span>
					<div class="question_questionImgContainer__tNqZy"></div>
					<input id="uploadVideo" type="file"
						accept="video/mp4,video/quicktime" style="display: none;"><label
						for="uploadVideo" class="question_inputFileBtn__zg7jN"><div
							class="question_inputFileText__Cgamr">동영상 첨부</div> <img
						src="/icons/community/ICON_VIDEO.svg"></label><span
						class="question_imgDesc__SQFui">최대 업로드 용량: 65MB, 동영상은 최대 1개
						업로드 가능합니다.</span>
				</div>
			</form>
			<div class="question_thumbnailText__h45xg">
				<ul>
					<li>동영상과 사진을 동시에 업로드 시, 업로드된 사진 중 첫 번째 순서의 사진이 썸네일로 지정됩니다.</li>
					<li>동영상 1개만 업로드 시, 동영상에서 랜덤으로 추출되어 썸네일로 지정됩니다.</li>
				</ul>
			</div>
			<button class="question_nosubmitBtn__TgNR3" disabled="">글 등록</button>
			<br />
		</div>
	</div>
</body>
</html>