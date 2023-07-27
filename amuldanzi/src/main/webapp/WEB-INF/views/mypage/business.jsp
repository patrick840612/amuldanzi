<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자등록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 섬머노트 추가--> 
<link rel="stylesheet" href="/mypage/summernote/summernote-lite.css">
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
</head>
<body>
<textarea id="summernote" name="editordata"></textarea>  
</body>
</html>