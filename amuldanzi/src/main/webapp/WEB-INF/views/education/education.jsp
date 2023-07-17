
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
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>




</head>

<jsp:include page="../main/header.jsp"></jsp:include>

<body>
	<div class="main_mainContents__GXYBn2">
		<hr class="popper_popperMenuDivider__j1QQj">
		<p class="main_mainTitle__nxOQS">
		<h1>
			<center>
				<strong>교육정보</strong>
			</center>
		</h1>
		</p>
		<br /> <br />
		<hr class="popper_popperMenuDivider__j1QQj">
	</div>

	<div class="container">
		<div class="col-xs-12">

			<div class="page-header">
				<h3>기초교육</h3>
			</div>

			<div class="carousel slide" id="myCarousel">
				<div class="carousel-inner">
					<div class="item wactive">
						<ul class="thumbnails">
							<c:forEach items="${eduList}" var="education" varStatus="status">
								<c:if test="${status.index % 4 == 0}">
									<c:set var="active" value="${status.index == 0}" />
									<div class="item ${active ? 'active' : ''}">
										<ul class="thumbnails">
								</c:if>
								<li class="col-sm-3">
									<div class="fff">
										<div class="thumbnail">
											<a href="#"><img src="${education.img}" alt=""></a>
										</div>
										<div class="caption">
											<h4>${education.title}</h4>
											<p>${education.step}</p>
											<a class="btn btn-mini" href="#">» 더보기</a>
										</div>
									</div>
								</li>
								<c:if test="${(status.index + 1) % 4 == 0 || status.last}">
						</ul>
					</div>
					</c:if>
					</c:forEach>
				</div>
				<nav>
					<ul class="control-box pager">
						<li><a data-slide="prev" href="#myCarousel" class=""><i
								class="glyphicon glyphicon-chevron-left"></i></a></li>
						<li><a data-slide="next" href="#myCarousel" class=""><i
								class="glyphicon glyphicon-chevron-right"></i></li>
					</ul>
				</nav>
				
				
				<div class="page-header">
				<h3>사회화교육</h3>
			</div>

			<div class="carousel slide" id="myCarousel">
				<div class="carousel-inner">
					<div class="item wactive">
						<ul class="thumbnails">
							<c:forEach items="${eduList}" var="education" varStatus="status">
								<c:if test="${status.index % 4 == 0}">
									<c:set var="active" value="${status.index == 0}" />
									<div class="item ${active ? 'active' : ''}">
										<ul class="thumbnails">
								</c:if>
								<li class="col-sm-3">
									<div class="fff">
										<div class="thumbnail">
											<a href="#"><img src="${education.img}" alt=""></a>
										</div>
										<div class="caption">
											<h4>${education.title}</h4>
											<p>${education.step}</p>
											<a class="btn btn-mini" href="#">» 더보기</a>
										</div>
									</div>
								</li>
								<c:if test="${(status.index + 1) % 4 == 0 || status.last}">
						</ul>
					</div>
					</c:if>
					</c:forEach>
				</div>
				<nav>
					<ul class="control-box pager">
						<li><a data-slide="prev" href="#myCarousel" class=""><i
								class="glyphicon glyphicon-chevron-left"></i></a></li>
						<li><a data-slide="next" href="#myCarousel" class=""><i
								class="glyphicon glyphicon-chevron-right"></i></li>
					</ul>
				</nav>
				
				<div class="page-header">
				<h3>기본교육</h3>
			</div>

			<div class="carousel slide" id="myCarousel">
				<div class="carousel-inner">
					<div class="item wactive">
						<ul class="thumbnails">
							<c:forEach items="${eduList}" var="education" varStatus="status">
								<c:if test="${status.index % 4 == 0}">
									<c:set var="active" value="${status.index == 0}" />
									<div class="item ${active ? 'active' : ''}">
										<ul class="thumbnails">
								</c:if>
								<li class="col-sm-3">
									<div class="fff">
										<div class="thumbnail">
											<a href="#"><img src="${education.img}" alt=""></a>
										</div>
										<div class="caption">
											<h4>${education.title}</h4>
											<p>${education.step}</p>
											<a class="btn btn-mini" href="#">» 더보기</a>
										</div>
									</div>
								</li>
								<c:if test="${(status.index + 1) % 4 == 0 || status.last}">
						</ul>
					</div>
					</c:if>
					</c:forEach>
				</div>
				<nav>
					<ul class="control-box pager">
						<li><a data-slide="prev" href="#myCarousel" class=""><i
								class="glyphicon glyphicon-chevron-left"></i></a></li>
						<li><a data-slide="next" href="#myCarousel" class=""><i
								class="glyphicon glyphicon-chevron-right"></i></li>
					</ul>
				</nav>
				
				<div class="page-header">
				<h3>습관화</h3>
			</div>

			<div class="carousel slide" id="myCarousel">
				<div class="carousel-inner">
					<div class="item wactive">
						<ul class="thumbnails">
							<c:forEach items="${eduList}" var="education" varStatus="status">
								<c:if test="${status.index % 4 == 0}">
									<c:set var="active" value="${status.index == 0}" />
									<div class="item ${active ? 'active' : ''}">
										<ul class="thumbnails">
								</c:if>
								<li class="col-sm-3">
									<div class="fff">
										<div class="thumbnail">
											<a href="#"><img src="${education.img}" alt=""></a>
										</div>
										<div class="caption">
											<h4>${education.title}</h4>
											<p>${education.step}</p>
											<a class="btn btn-mini" href="#">» 더보기</a>
										</div>
									</div>
								</li>
								<c:if test="${(status.index + 1) % 4 == 0 || status.last}">
						</ul>
					</div>
					</c:if>
					</c:forEach>
				</div>
				<nav>
					<ul class="control-box pager">
						<li><a data-slide="prev" href="#myCarousel" class=""><i
								class="glyphicon glyphicon-chevron-left"></i></a></li>
						<li><a data-slide="next" href="#myCarousel" class=""><i
								class="glyphicon glyphicon-chevron-right"></i></li>
					</ul>
				</nav>
				
				<!-- /.control-box -->

			</div>
			<!-- /#myCarousel -->

		</div>
		<!-- /.col-xs-12 -->

	</div>
	<!-- /.container -->

</body>
</html>