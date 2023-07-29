<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko" class="light-theme">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">



<title>애물단지 | 돌보미</title>


<link rel="stylesheet" href="/chunks/css/market/marketOld.css"
	media="all" />

<link rel="preload" href="/chunks/css/market/marketShop.css" as="style" />
<link rel="stylesheet" href="/chunks/css/market/marketShop.css" />
<link rel="preload" href="/chunks/css/market/marketShop2.css" as="style" />
<link rel="stylesheet" href="/chunks/css/market/marketShop2.css" />
<script
	src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base-4b55f04bb2798d1f6aa4e078c0ad3504ef4993ad4123005ec35dde545e5788bd.js"></script>


</head>

<jsp:include page="../main/header.jsp"></jsp:include>

<body class="hoian-kr">

	<div class="__margin-top120px">
		<section class="_3nqg3y0">
			<div class="_3nqg3y1 _1ff3f302">
				<h1 class="_3nqg3y2">
					돌보미를
					<!-- -->
					<br />구해보세요!
					<!-- -->
				</h1>
				<span class="_3nqg3y3">저희 사이트에서 인증받은<!-- --> <br />돌보미 분들이
					글을 보고 연락 드립니다.<!-- --></span><br /> <a href="/market/dolbomiInsert"><button
						class="btn btn-primary">글쓰기</button></a>
				<div class="_3nqg3y4">
					<span
						style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0; margin: 0; padding: 0; position: absolute; top: 0; left: 0; bottom: 0; right: 0"><img
						alt="배너 이미지"
						src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7"
						decoding="async" data-nimg="fill" class="_19qbbiq0 undefined"
						style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; box-sizing: border-box; padding: 0; border: none; margin: auto; display: block; width: 0; height: 0; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover" />
						<noscript>
							<img alt="배너 이미지"
								src="/_next/static/media/nearby_stores_hero_image_3x.47c43e04.png"
								decoding="async" data-nimg="fill"
								style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; box-sizing: border-box; padding: 0; border: none; margin: auto; display: block; width: 0; height: 0; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover"
								class="_19qbbiq0 undefined" loading="lazy" />
						</noscript></span>
				</div>
			</div>
		</section>


		<section id="content">
			<h1 class="head-title" id="hot-articles-head-title">애물단지 돌보미</h1>

			<nav id="hot-articles-navigation"></nav>


			<section class="cards-wrap">

				<!-- 상품 반복부분 -->
				<c:forEach items="${marketList}" var="list">
					<article class="card-top ">
						<a class="card-link " href="/market/jungoDetail?goodsId=${list.goodsId}">
							<div class="card-photo ">
								<img alt="" src="" />
							</div>
							<div class="card-desc">
								<h2 class="card-title">${list.goodsName}</h2>
								<div class="card-price ">시급 : ${list.goodsPrice}원</div>
								<div class="card-region-name">날짜 | 시간</div>
								<div class="card-counts">
									<span> 조회수 ${list.goodsCount} </span>
								</div>
							</div>
						</a>
					</article>
				</c:forEach>
				<!-- 상품 반복 끝 -->

			</section>
		</section>
	</div>

	<div>
		<ul class="pagination justify-content-center">
			<!-- 처음 페이지로 이동하는 버튼 -->
			<li
				class="page-item <c:if test='${currentPage eq 0}'>disabled</c:if>">
				<c:if test='${currentPage gt 0}'>
					<c:url var="firstPageUrl" value="/market/carrot">
						<c:param name="page" value="0" />
					</c:url>
					<a class="page-link" href="${firstPageUrl}" aria-label="First">
						<span aria-hidden="true" class="glyphicon glyphicon-step-backward"></span>
					</a>
				</c:if>
			</li>
			<!-- 이전 페이지로 이동하는 버튼 -->
			<li
				class="page-item <c:if test='${currentPage eq 0}'>disabled</c:if>">
				<c:if test='${currentPage gt 0}'>
					<c:url var="prevPageUrl" value="/market/carrot">
						<c:param name="page" value="${currentPage - 1}" />
					</c:url>
					<a class="page-link" href="${prevPageUrl}" aria-label="Previous">
						<span aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span>
					</a>
				</c:if>
			</li>
			<!-- 페이지 그룹을 출력하는 부분 -->
			<c:forEach begin="${startPage}" end="${endPage}" var="page">
				<li
					class="page-item <c:if test='${currentPage eq page}'>active</c:if>">
					<c:url var="pageUrl" value="/market/carrot">
						<c:param name="page" value="${page}" />
					</c:url> <c:choose>
						<c:when test="${currentPage eq page}">
							<span class="page-link">${page + 1}</span>
						</c:when>
						<c:otherwise>
							<a class="page-link" href="${pageUrl}">${page + 1}</a>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
			<!-- 다음 페이지로 이동하는 버튼 -->
			<li
				class="page-item <c:if test='${currentPage eq totalPages - 1}'>disabled</c:if>">
				<c:if test='${currentPage lt totalPages - 1}'>
					<c:url var="nextPageUrl" value="/market/carrot">
						<c:param name="page" value="${currentPage + 1}" />
					</c:url>
					<a class="page-link" href="${nextPageUrl}" aria-label="Next"> <span
						aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</c:if>
			</li>
			<!-- 마지막 페이지로 이동하는 버튼 -->
			<li
				class="page-item <c:if test='${currentPage eq totalPages - 1}'>disabled</c:if>">
				<c:if test='${currentPage lt totalPages - 1}'>
					<c:url var="lastPageUrl" value="/market/carrot">
						<c:param name="page" value="${totalPages - 1}" />
					</c:url>
					<a class="page-link" href="${lastPageUrl}" aria-label="Last"> <span
						aria-hidden="true" class="glyphicon glyphicon-step-forward"></span>
					</a>
				</c:if>
			</li>
		</ul>
	</div>

	<div class="ye5i0m0">
		<div class="_10rqyav0">

			<!-- 여기까지 -->
			<div class="_10rqyav1">
				<div class="_1qbix3d0">
					<div class="_1qbix3d1 _1ff3f300 _1ff3f302">
						<div class="_1irmkvy0">
							<section class="_1irmkvy1">
								<div class="_1irmkvy2">
									<span
										style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0; margin: 0; padding: 0; position: absolute; top: 0; left: 0; bottom: 0; right: 0"><img
										alt="town image"
										src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7"
										decoding="async" data-nimg="fill" class="_19qbbiq0 undefined"
										style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; box-sizing: border-box; padding: 0; border: none; margin: auto; display: block; width: 0; height: 0; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover" />
										<noscript>
											<img alt="town image"
												src="/_next/static/media/ic_category_town_colored_m.13979d69.svg"
												decoding="async" data-nimg="fill"
												style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; box-sizing: border-box; padding: 0; border: none; margin: auto; display: block; width: 0; height: 0; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover"
												class="_19qbbiq0 undefined" loading="lazy" />
										</noscript></span>
								</div>
								<div class="_1irmkvy3">
									<h6 class="_1irmkvy4">돌보미 자격증/경력이 있으신가요?</h6>
									<span class="_1irmkvy5 _1irmkvy4">애물단지 돌보미등록을 하고 마켓을
										이용해보세요!</span>
								</div>
								<div class="_1irmkvy6">
									<a as="a" href="https://business.daangn.com" target="_blank"
										class="karrot-button _1aul9fg0 korcsc3 korcsc4 _1aul9fg1 _1aul9fg8 _1aul9fgj _1irmkvy7">돌보미등록
										하러가기</a>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>
