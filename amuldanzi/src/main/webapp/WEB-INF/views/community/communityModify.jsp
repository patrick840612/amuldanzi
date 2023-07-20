<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>애물단지</title>




<!-- Custom Theme Style -->
<link href="/admin/build/css/custom.min.css" rel="stylesheet">

<link href="/css/community/community.css" rel="stylesheet"> 
<link href="/admin/chunks/css/39c68523bb4928b9.css" rel="stylesheet">
<link href="/admin/chunks/css/281067dbec461a13.css" rel="stylesheet">
<link href="/admin/chunks/css/3ca3804aef0f69b8.css" rel="stylesheet"> 
<link href="/css/community/text.css" rel="stylesheet"> 
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    // 사진 업로드 미리보기
    $('#uploadFile').on('change', function(event) {
      var previewContainer = $('#imagePreviewContainer');
      previewContainer.html('');

      var files = event.target.files;

      for (var i = 0; i < files.length && i < 3; i++) {
        var file = files[i];
        var reader = new FileReader();

        reader.onload = function(e) {
          var image = $('<img>').attr('src', e.target.result);
          var preview = $('<div class="image-preview"></div>').append(image);
          var deleteButton = $('<span class="delete-button">&times;</span>');

          deleteButton.on('click', function() {
            preview.remove();
          });

          preview.append(deleteButton);
          previewContainer.append(preview);
        };

        reader.readAsDataURL(file);
      }
    });

    // 이미지 삭제 버튼 클릭 시
    $(document).on('click', '.deleteAjax', function() { 
      var imagePreview = $(this).closest('.ajaxImage');
      var imagePath = imagePreview.find('img').attr('src');
      var imageName = imagePath.substring(imagePath.lastIndexOf('/') + 1);
      console.log(imageName);
      deleteImage(imageName, imagePreview);
    });
  });

  function deleteImage(imageName, imagePreview) {
    $.ajax({
      url: '/community/deleteImage',
      data: {"imageName": imageName},
      type: 'DELETE',
      success: function() {
        // 이미지가 성공적으로 삭제되었을 때, UI를 업데이트하거나 추가 작업을 수행할 수 있습니다.
        imagePreview.remove();
        console.log("성공");
      },
      error: function(error) {
        // 에러가 발생한 경우 처리할 수 있습니다.
        console.log('에러')
        console.error(error);
      }
    });
  }
</script>
<jsp:include page="../main/header.jsp"></jsp:include>

<body>
    <form enctype="multipart/form-data" action="/community/modify" method="post">
        <div class="question_questionContainer__xQp_P">
            <div class="question_questionContent__Y4VxA">
                <span class="question_questionCategory__1QDx6">카테고리</span><span class="question_questionMark__AykT_">*</span>
                <div class="question_radioWrap__WZ6ME">
                    <div>
                        <input type="radio" name="question" id="공지" value="공지" checked="공지">
                        <label for="공지">커뮤니티</label>
                    </div>
                </div>
                <div>
                    <div>
                        <span class="question_questionCategory__1QDx6">아이디</span><span class="question_questionMark__AykT_">*</span>
                        <input placeholder="아이디를 입력해 주세요" class="question_titleInput__S7Isd" name="memberId.id" value="${community.memberId.id}">
                        <div class="question_alertText__WnxqW"></div>
                    </div>
                    <div>
                        <span class="question_questionCategory__1QDx6">글 작성</span><span class="question_questionMark__AykT_">*</span>
                    </div>
                    <input placeholder="제목을 입력해주세요" class="question_titleInput__S7Isd" name="commTitle" value="${community.commTitle}">
                    <div class="question_alertText__WnxqW"></div>
                </div>
                <div class="question_questionInputWrapper__fGaar">
                    <textarea placeholder="5자 이상의 글 내용을 입력해주세요" class="question_questionInput___Mb57" name="commContent" >${community.commContent }</textarea>
                    <div class="question_alertText__WnxqW"></div>
                </div>
                <div class="question_fileInputWrapper__d9gmU"> 
                    <span class="question_questionCategory__1QDx6">사진 업로드</span>
                    <div class="question_questionImgContainer__tNqZy" id="imagePreviewContainer"></div>
                    <input id="uploadFile" name="files" type="file" multiple="" accept="image/jpg,image/png,image/jpeg,image/gif" style="display: none;">
                    <label for="uploadFile" class="question_inputFileBtn__zg7jN">
                        <div class="question_inputFileText__Cgamr">사진 첨부</div>
                        <img src="/icons/ICON_PHOTO_CAMERA.svg">
                    </label>
                    <span class="question_imgDesc__SQFui">개당 업로드 용량: 10MB, 첨부 파일의 경우 사진3개까지 업로드 가능합니다.</span>
                </div>
                <div class="question_thumbnailText__h45xg">
                    <ul>
                        <li>사진을 업로드 시, 업로드된 사진 중 첫 번째 순서의 사진이 썸네일로 지정됩니다.</li>
                        <li>사진은 최대 3개까지 업로드 가능합니다.</li>
                    </ul>
                </div>
                 <input type="hidden" name="comm_no" value="${community.commNo}"> 
                <button type="submit" class="question_submitBtn__vDrt_" >글 수정</button>
            </div>
        </div>
    </form>
		    <c:forEach var="image" items="${commImages}">
			<div class="ajaxImage">
			        <span>
			            <img class="image-preview" src="/images/community/${image}" alt="Community Image" style="width: 200px; height: 200px;">
			        </span>
			        <button class="deleteAjax" onclick="deleteImage('${image}')" style="position:relative; left:93px" >&times;</button>
			    </div>
			</c:forEach><br/>
</body>
</html>