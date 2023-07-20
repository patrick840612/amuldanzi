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

.custom-thumbnails {
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start;
  align-items: flex-start;
}

.custom-thumbnails .thumbnail {
  width: 370px;
  height: 350px;
  margin-right: 20px;
  margin-bottom: 20px;
}

.custom-thumbnails .caption {
  text-align: center;
}

.custom-thumbnails .btn-pink {
  width: 100%;
}

.custom-thumbnails .thumbnail {
  position: relative;
}

.custom-thumbnails .button-container {
  position: absolute;
  bottom: 10px;
  left: 0;
  width: 100%;
  text-align: center;
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
				<strong>케어정보</strong>
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
    <div class="custom-thumbnails">
      <c:forEach items="${careList}" var="care" varStatus="status">
        <div class="thumbnail">
          <img src="${care.img}" alt="ALT NAME" class="img-responsive" width="350" height="270">
          <div class="caption">
            <h3>${care.title}</h3>
          </div>
          <div class="button-container">
            <a href="/care/careDetail?id=${care.id}" class="btn btn-pink">더보기</a>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>

	</div>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
</body>
</html>
