<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
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

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Fonts -->
<link rel="dns-prefetch" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600"
	rel="stylesheet" type="text/css">

<link rel="stylesheet" href="css/style.css">

<link rel="icon" href="Favicon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

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

.center-align {
	text-align: center;
}

.card-header {
	background-color: pink;
}
</style>




</head>

<jsp:include page="../main/header.jsp" />

<body>

	<div class="main_mainContents__GXYBn2">
		<hr class="popper_popperMenuDivider__j1QQj">
		<br />
		<p class="main_mainTitle__nxOQS">공지사항 상세보기</p>
		<hr class="popper_popperMenuDivider__j1QQj">
		<br /> <br />

		<main class="login-form">
			<div class="cotainer">
				<div class="row justify-content-center">
					<div class="col-md-8">
					<!-- 공지사항 디테일 -->
						<div class="card">
							<div class="card-header">제목 : ${notice.title}</div>
							<div class="card">
								<div class="card-header">
									<div style="float: left;">작성일자 : ${notice.regdate}</div>
									<div style="float: right;">조회수 : ${notice.count}</div>

								</div>
								<div class="card-body">
								<br />
								<!-- 공지사항 내용 -->
									<div>${notice.content}</div>
									<br />
									<br />
									<br />
									<center>
									<!-- 목록으로 돌아가기 버튼 -->
									<a href="/notice/notice" class="btn btn-pink">목록가기</a>
								</center>
								</div>
							</div>
							


						</div>
					</div>
				</div>
			</div>
		</main>

	</div>

</body>
</html>
