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

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

<style>
/* 버튼 스타일 */
.btn-pink {
	background-color: pink;
	border-color: pink;
	color: white;
}
/* 버튼에 마우스 오버시 스타일 */
.btn-pink:hover {
	background-color: hotpink;
	border-color: hotpink;
	color: white;
}
/* 비디오 리스트*/
.video-list a {
	display: block;
	margin-bottom: 10px;
	direction: ltr; /* 텍스트 방향을 왼쪽에서 오른쪽으로 변경 */
}

.video-list {
	float: left;
	overflow-y: auto;
	height: 465px;
	white-space: nowrap;
	width: 525px;
	display: flex;
	border: 1px solid lightgray;
	display: inline-block;
	/*background-color: lightpink;  Light gray background */
}

.video-list {
	position: relative;
	display: inline-block; /* 요소를 가로로 배치 */
	flex: 0 0 160px;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start; 
	left: 844px;
	top: -471px;
	
}

.video-container {
	float: right;
	margin-left: 20px; /* Move to the left by 20px */
}

.large-video {
	width: 130%;
	height: auto;
	margin-left: -200px;
}

.col-md-4 {
	display: inline-block;
}

#list{

	position: relative;
    bottom: 380px;
    right: 300px;

}

#footer{

	position: relative;
    bottom: 300px;

}
</style>

</head>

<jsp:include page="../main/header.jsp" />

<body>
	<div class="main_mainContents__GXYBn2">
	</div>
	<br />

	<div class="container">
	<!-- 케어정보 상세보기 화살표 -->
		<h1 style="display: inline-block; color: pink;">▶</h1>
		<!-- 케어 정보 제목 -->
		<h3 style="display: inline-block; margin-left: 5px;">
			${care.title}</h3>
		<br />
		<div class="row">
			<div class="col-md-8 offset-md-1">
				<div class="video-container">
				<!-- 비디오 플레이어 -->
					<video class="large-video" controls autoplay muted playsinline>
						<source src="/videos/care/${care.video}" type="video/mp4">
					</video>
				</div>
			</div>

			<br /> <br />
			<!-- 썸네일 리스트 -->
			<div class="col-md-4">
				<div class="video-list">
					<c:forEach var="item" items="${items}">
					<!-- 각 썸네일에 대한 -->
						<a href="/care/careDetail?id=${item.id}"> <img
							src="/images/care/${item.image}" alt="#" width="200" height="125">
							${item.title}
						</a>
					</c:forEach>
					<br /> <br />
				</div>
			</div>
		</div>
	</div>

	<div class="container" id="list">
		<div class="row">
			<div class="col-md-9 offset-md-3">
				<h3 style="display: inline-block; color: pink;">▶</h3>
				<h4 style="display: inline-block; margin-left: 5px;">영상정보</h4>
				<h4
					style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${care.content}</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 offset-md-3">
			<!-- "목록가기" 버튼 -->
				<br /> <a href="/care/care" class="btn btn-pink">목록가기</a><br /> <br />
				<br />

			</div>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />

</html>
