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
	<br />
	<br />



	<div class="container">
		<div class="row">
			<h3>
				<center>제목 : ${care.title}</center>
			</h3>
			<br />
		</div>
		<!--.row -->
	</div>
	<!--./container -->

	<div class="container">
		<div class="row">

			<!--.col -->
			<div class="col-md-8">
				<video controls autoplay muted playsinline>
					<source src="${care.video}" type="video/mp4">
				</video>
			</div>
			
			


			<br />

		</div>
		<br />
		<h4>영상정보 : ${care.content}</h4>
		<br />
		<div class="col-md-6 offset-md-3">
			<a href="/care/care" class="btn btn-pink">목록가기</a>
		</div>
		<br /> <br /> <br /> <br /> <br />
		<!--./row -->
	</div>
	<!--./container -->


</body>
</html>
