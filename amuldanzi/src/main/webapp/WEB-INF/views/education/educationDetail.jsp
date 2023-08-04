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
	display: inline-block; /* 요소를 가로로 배치 */
	flex: 0 0 160px;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
	margin-left: -11px;
}

.video-container {
    margin-left: -80px; /* 왼쪽으로 20px 간격 주기 */
    display: flex;
    flex-wrap: wrap;
    width: calc(190% + -100px); /* 비디오 컨테이너의 폭을 전체로 설정하고 왼쪽으로 20px만큼 이동 */
}

.large-video {
    width: calc(85.00% - 20px); /* 3개의 비디오가 한 줄에 정확히 들어갈 수 있도록 폭 설정 */
    height: auto;
    margin-right: 20px; /* 비디오 사이의 가로 간격 설정 */
    margin-bottom: 20px; /* 비디오 사이의 세로 간격 설정 */
    margin-left: -10px; /* 비디오가 왼쪽으로 10px만큼 이동하여 간격 조정 */
}
.col-md-4 {
	display: inline-block;
}
</style>

</head>

<jsp:include page="../main/header.jsp" />

<body>
	<br />

	<div class="container">
	<!-- 케어정보 상세보기 화살표 -->
		<h1 style="display: inline-block; color: pink;">▶</h1>
		<!-- 케어 정보 제목 -->
		<h3 style="display: inline-block; margin-top:150px; margin-left: 5px;">
			${education.title}</h3>
		<br />
		<div class="row">
			<div class="col-md-8 offset-md-1">
<div class="video-container" style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 10px;">        <!-- 비디오 플레이어 -->
        <c:forEach items="${videoList}" var="videoName" varStatus="loop">
            <video class="large-video" controls autoplay muted playsinline style="margin-right: 10px; margin-bottom: 10px;">
                <source src="/videos/edu/${videoName}" type="video/mp4">
            </video>
            
        </c:forEach>
    </div>
</div>


			<br /> <br /> 
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-9 offset-md-3" style="left: -286px;">
				<h3 style="display: inline-block; color: pink;">▶</h3>
				<h4 style="display: inline-block; margin-left: 5px;">영상정보</h4>
				<h4>${education.content}</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 offset-md-3" style="left: -286px;>
			<!-- "목록가기" 버튼 -->
				<br /> <a href="/education/education" class="btn btn-pink">목록가기</a><br /> <br />
				<br />

			</div>
		</div>
	</div>
</body>
<jsp:include page="../main/footer.jsp" />
</html>
