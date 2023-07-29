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
<link href="/admin/chunks/css/c552b37c371c331c.css" rel="stylesheet">
<link href="/admin/chunks/css/39c68523bb4928b9.css" rel="stylesheet">
<link href="/admin/chunks/css/281067dbec461a13.css" rel="stylesheet">
<link href="/admin/chunks/css/3ca3804aef0f69b8.css" rel="stylesheet">
<link href="/css/community/communitytext.css" rel="stylesheet"> 
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
 
    <script>
        $(document).ready(function() {
            var imageFiles = []; // 이미지 파일들을 저장할 배열

            // 사진 업로드 미리보기 
            $('#uploadFile').on('change', function(event) {
                var previewContainer = $('#imagePreviewContainer');
                previewContainer.html('');

                var files = event.target.files;
				console.log(files)
                
                for (var i = 0; i < files.length && i < 3; i++) {
                    (function(file, id) {
                        var reader = new FileReader();

                        reader.onload = function(e) {
                            var imageSrc = e.target.result;
                            var image = $('<img>').attr('src', imageSrc);
                            var preview = $('<div class="image-preview" data-id="' + id + '"></div>').append(image);
                            var deleteButton = $('<span class="delete-button">&times;</span>');

                            preview.append(deleteButton);
                            previewContainer.append(preview);
                            // 이미지 목록에 추가 (중복 방지)
                            if (!imageFiles.some(function(item) { return item.id === id; })) {
                                imageFiles.push({ id: id, file: file });
                                // hidden input 추가
                                var hiddenInput = $('<input type="hidden">').attr('name', 'image_' + id).attr('id', 'hiddenInput_' + id).val(file);
                                $('form').append(hiddenInput);
                            }
                        };

                        reader.readAsDataURL(file);
                    })(files[i], i); // 각 파일에 고유한 식별자(id)를 전달
                }
            });

            // 이미지 미리보기 삭제 구현 
            // 삭제 버튼 이벤트 위임
            $('#imagePreviewContainer').on('click', '.delete-button', function() {
                
                var id = $(this).parent('.image-preview').data('id');
                $(this).parent('.image-preview').remove();
                // 해당 이미지의 hidden input도 제거
                $(`#hiddenInput_${id}`).remove();
                // 이미지 목록에서 삭제
                imageFiles = imageFiles.filter(function(item) {
                    return item.id !== id;
                });

                // files 변수에서도 이미지를 제거
                var files = $('#uploadFile')[0].files;
                var newFiles = [];
                for (var i = 0; i < files.length; i++) {
                    if (i !== id) {
                        newFiles.push(files[i]);
                    }
                }
                // 새로운 FileList 객체 생성
                var dataTransfer = new DataTransfer();
                for (var i = 0; i < newFiles.length; i++) {
                    dataTransfer.items.add(newFiles[i]);
                }
                $('#uploadFile')[0].files = dataTransfer.files;
            });
        });
    </script> 
</html>
 
<jsp:include page="../main/header.jsp"></jsp:include>

<body>
    <form enctype="multipart/form-data" action="/community/submit" method="post">
        <div class="question_questionContainer__xQp_P">
            <div class="question_questionContent__Y4VxA">
                <span class="question_questionCategory__1QDx6">카테고리</span><span class="question_questionMark__AykT_">*</span>
                <div class="question_radioWrap__WZ6ME">
                    <div>
                        <input type="radio" name="question" id="공지" value="공지" checked="공지">
                        <label for="공지">돌보미</label>
                    </div>
                </div>
                <div>
                    <div>
                        <span class="question_questionCategory__1QDx6">아이디</span><span class="question_questionMark__AykT_">*</span>
                        <input placeholder="아이디를 입력해 주세요" class="question_titleInput__S7Isd" name="memberId.id" value = "${id}">
                        <div class="question_alertText__WnxqW"></div>
                    </div>
                    <div>
                        <span class="question_questionCategory__1QDx6">글 작성</span><span class="question_questionMark__AykT_">*</span>
                    </div>
                    <input placeholder="제목을 입력해주세요" class="question_titleInput__S7Isd" name="commTitle">
                    <div class="question_alertText__WnxqW"></div>
                </div>
                <div class="question_questionInputWrapper__fGaar">
                    <textarea placeholder="5자 이상의 글 내용을 입력해주세요" class="question_questionInput___Mb57" name="commContent"></textarea>
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
                <button type="submit" class="question_submitBtn__vDrt_" >글 등록</button>
            </div>
        </div>
    </form>
 
</body>
</html>