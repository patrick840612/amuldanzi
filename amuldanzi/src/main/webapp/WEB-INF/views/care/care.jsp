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

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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

/*썸네일 목록*/
.custom-thumbnails {
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
	align-items: flex-start;
}
/*썸네일*/
.custom-thumbnails .thumbnail {
	width: 370px; /*너비*/
	height: 350px; /*높이*/
	margin-right: 20px; /*여백*/
	margin-bottom: 20px; /*여백*/
}
/*썸네일 가운데 정렬*/
.custom-thumbnails .caption {
	text-align: center;
}
/*썸네일 너비에 맞게 버튼 폭 조정*/
.custom-thumbnails .btn-pink {
	width: 100%;
}

.custom-thumbnails .thumbnail {
	position: relative;
}
/*썸네일 버튼*/
.custom-thumbnails .button-container {
	position: absolute;
	bottom: 10px;/*여백*/
	left: 0;/*여백*/
	width: 100%;
	text-align: center;
}
</style>


</head>

<jsp:include page="../main/header.jsp" />

<body>
	<div class="main_mainContents__GXYBn2">
	
		<hr class="popper_popperMenuDivider__j1QQj">
		<p class="main_mainTitle__nxOQS" style="font-weight: bold;">케어정보</p> 
		<hr class="popper_popperMenuDivider__j1QQj">
	</div>  
	<br/>
	<div class="container">
		<div class="row">
			<!-- careList 순회하며 케어정보를 썸네일 형식으로 보여줌 -->
			<div class="custom-thumbnails">
				<c:forEach items="${careList}" var="care" varStatus="status">
					<div class="thumbnail">
						<img src="/images/care/${care.img}" alt="ALT NAME"
							class="img-responsive" width="350" height="270">
						<div class="caption">
							<h3>${care.title}</h3>
						</div>
						<!-- 케어정보 상세 페이지로 이동 -->
						<div class="button-container">
							<!-- care.id를 파라미터로 전달하여 해당 ID를 식별 -->
							<a href="/care/careDetail?id=${care.id}" class="btn btn-pink">더보기</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	</div>
	<br />
	<br />
	<br />
	<br />
	<br /> 

</body> 
</html>
