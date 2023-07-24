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
.btn-pink {
	background-color: pink;
	border-color: pink;
	color: white;
}

.btn-pink:hover {
	background-color: hotpink;
	border-color: hotpink;
	color: white;
}

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
</style>

</head>

<jsp:include page="../main/header.jsp" />

<body>
	<div class="main_mainContents__GXYBn2">
		<hr class="popper_popperMenuDivider__j1QQj">
		<p class="main_mainTitle__nxOQS">
		<h1>
			<center>
				<strong>케어정보 상세보기</strong>
			</center>
		</h1>
		</p>
		<br /> <br />
		<hr class="popper_popperMenuDivider__j1QQj">
	</div>
	<br />

	<div class="container">
		<h1 style="display: inline-block; color: pink;">▶</h1>
		<h3 style="display: inline-block; margin-left: 5px;">
			${care.title}</h3>
		<br />
		<div class="row">
			<div class="col-md-8 offset-md-1">
				<div class="video-container">
					<video class="large-video" controls autoplay muted playsinline>
						<source src="/videos/care/${care.video}" type="video/mp4">
					</video>
				</div>
			</div>

			<br /> <br />

			<div class="col-md-4">
				<div class="video-list">
					<c:forEach var="item" items="${items}">
						<a href="/care/careDetail?id=${item.id}"> <img
							src="/images/care/${item.image}" alt="#" width="200" height="125">
							${item.title}
						</a>
					</c:forEach>
					<br />



					<!--<a href="http://localhost:8080/care/careDetail?id=99"><img
						src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021071903372/10/36a5afed-e2fc-45c9-bfce-2e289281e107.jpg?type=f&w=288&h=167&quality=100&align=4"
						alt="#" width="230" height="145"> 30초로 배우는, 강아지 스케일링 준비하는 법</a>
					<a href="http://localhost:8080/care/careDetail?id=100"><img
						src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021071903371/10/c8e5eae7-70ec-476e-a280-d1ced8157410.jpg?type=f&w=288&h=167&quality=100&align=4"
						alt="#" width="230" height="145"> 30초로 배우는, 이빨이 깨지지 않게 예방하는
						법</a> <a href="http://localhost:8080/care/careDetail?id=101"><img
						src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021071903370/10/f10dc2f3-5b6d-489a-97df-b9922003372d.jpg?type=f&w=288&h=167&quality=100&align=4"
						alt="#" width="230" height="145"> 30초로 배우는, 강아지 양치 제대로 하는 법</a>
					<a href="http://localhost:8080/care/careDetail?id=102"><img
						src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021071903369/10/bf51fe20-b386-4a21-8c1b-e0e1ec8d9408.jpg?type=m&w=1440&h=810&quality=95&bgcolor=FFFFFF&extopt=3"
						alt="#" width="230" height="145"> 30초로 배우는, 양치의 중요성</a> <a
						href="http://localhost:8080/care/careDetail?id=103"><img
						src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021060703259/10/def79842-62da-4472-95ac-a3c687600d48.jpg?type=m&w=1440&h=810&quality=95&bgcolor=FFFFFF&extopt=3"
						alt="#" width="230" height="145"> 30초로 배우는, 강아지 털관리 한큐에 끝내기</a>
					<a href="http://localhost:8080/care/careDetail?id=104"><img
						src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021052103224/10/0f4bd967-9de0-4bec-be17-d8194a43dacb.jpg?type=m&w=1440&h=810&quality=95&bgcolor=FFFFFF&extopt=3"
						alt="#" width="230" height="145"> 빗에도 종류가 있다, 빗 종류별 사용법</a> <a
						href="http://localhost:8080/care/careDetail?id=105"><img
						src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021052103223/10/9d8e2796-4e7c-45b0-9404-e39e057bc5b1.jpg?type=m&w=1440&h=810&quality=95&bgcolor=FFFFFF&extopt=3"
						alt="#" width="230" height="145"> 꼭 봐야 할 빗질 잘 하는 법</a><br/> <a
						href="http://localhost:8080/care/careDetail?id=106"><img
						src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021052103222/10/eec42ab2-d03d-4592-ae6f-b06cd16e14b5.jpg?type=f&w=288&h=167&quality=100&align=4"
						alt="#" width="230" height="145"> 빗질만 잘해도 털 관리 절반은 성공!</a> <a
						href="http://localhost:8080/care/careDetail?id=107"><img
						src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021052103221/10/52d82e8a-64ea-4726-934c-364a89362e39.jpg?type=m&w=1440&h=810&quality=95&bgcolor=FFFFFF&extopt=3"
						alt="#" width="230" height="145"> 강아지 발톱이 빠졌을 때 응급처치하는 법</a> <a
						href="http://localhost:8080/care/careDetail?id=108"><img
						src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021043003120/10/09c7e05f-eeb1-4142-8290-0d56dc070398.jpg?type=f&w=288&h=167&quality=100&align=4"
						alt="#" width="230" height="145"> 발톱을 자르다가 피가 난다면?</a><br/> <a
						href="http://localhost:8080/care/careDetail?id=109"><img
						src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021043003117/10/47e1b70c-6ade-40fa-af04-d5d7092d43c5.png?type=f&w=288&h=167&quality=100&align=4"
						alt="#" width="230" height="145"> 30초로 배우는, 강아지 발톱 쉽게 자르는 법!</a>
					<a href="http://localhost:8080/care/careDetail?id=110"><img
						src="https://cdudsyowwnmx6388661.cdn.ntruss.com/aboutPet/images/vod/N2021043003116/10/9264df5b-47bc-493c-8e2b-a6a2a231f6d5.png?type=m&w=1440&h=810&quality=95&bgcolor=FFFFFF&extopt=3"
						alt="#" width="230" height="145"> 우리 강아지 발톱을 꼭 잘라줘야 하는 이유!</a> -->
					<br />
				</div>
			</div>

			<!--<div class="col-md-3">
				<div class="video-list">
					<c:forEach items="${careList}" var="care" varStatus="status">
						<a href="#"> <img src="${care.img}" width="160" height="100">
							${care.title}
						</a>
					</c:forEach>
				</div>
			</div>-->


		</div>
	</div>

	<div class="container">
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
				<br /> <a href="/care/care" class="btn btn-pink">목록가기</a><br /> <br />
				<br />

			</div>
		</div>
	</div>







</body>
</html>
