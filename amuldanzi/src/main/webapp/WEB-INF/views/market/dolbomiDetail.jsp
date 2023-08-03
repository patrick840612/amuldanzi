<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<link rel="stylesheet"
	href="https://d1unjqcospf8gs.cloudfront.net/assets/home/articles/flea_market-fe277be5f7199c789aca76d8d0cb818baed8140ac2e13fac2531d40ab404b0bb.css" />
<link rel="preload" href="/chunks/css/market/marketDetail.css"
	as="style" />
<link rel="stylesheet" href="/chunks/css/market/marketDetail.css" />

<title>애물단지 돌보미</title>
<link rel="canonical" href="https://www.daangn.com/articles/611832877" />


<link rel="stylesheet" href="/chunks/css/market/jungoDetail.css"
	media="all" />
<script
	src="https://d1unjqcospf8gs.cloudfront.net/assets/home/articles/show-0ebaacd6603e988929d1ee8e8f730bfc88669900a4e3033d34702b1f67b80b11.js"></script>
</head>

<jsp:include page="../main/header.jsp"></jsp:include>

<body class="hoian-kr">

	<article id="content" data-id="611832877">
		<h1 class="hide">${marketList.goodsName}</h1>
		<section id="article-images">
			<h3 class="hide">이미지</h3>
			<div id="image-slider">
				<div class="slider-wrap">
					<div class="slider">
						<a href="">
							<div>
								<div class="image-wrap" data-image-index="1">
									<img
										data-lazy="https://dnvefa72aowie.cloudfront.net/origin/article/202307/68df93aa32dcb16bbe1dd44ed2a1e49e8db7a9253ebb237f6b0ecbb1a99c32af.jpg?q=95&amp;s=1440x1440&amp;t=inside&amp;f=webp"
										class="portrait" src="/images/market/${marketList.img}" />
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</section>

		<section id="article-profile">
			<a id="article-profile-link" href="">
				<h3 class="hide">프로필</h3>
				<div class="space-between">

					<div style="display: flex;">
						<div id="article-profile-image">
							<img alt="kwk06075"
								src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-c649f052a34ebc4eee35048815d8e4f73061bf74552558bb70e07133f25524f9.png" />
						</div>
						<div id="article-profile-left">
							<div id="nickname">${marketList.id }</div>
							<div id="region-name">애물단지 회원</div>
						</div>
					</div>

					<div id="gnb-root">
						<div class="light-theme">
							<div class="_1knjz491 _1s38h9c0">
								<div class="_1s38h9c1 _1s38h9c0">
									<c:if test="${hasLike eq 0 }">
										<span id="heart-button"
											style="padding-right: 15px; font-size: 36px;">&#9825;</span>
									</c:if>
									<c:if test="${hasLike eq 1 }">
										<span id="heart-button" class="liked"
											style="padding-right: 15px; font-size: 36px;">&#9829;</span>
									</c:if>
									<span>
										<button type="button"
											class="karrot-button r14vym4 r14vym7 _1knjz49j"
											onclick="alert('ok')">채팅하기</button>
									</span>
								</div>
							</div>
						</div>
					</div>


				</div>
			</a>
		</section>

		<section id="article-description">
			<h1 property="schema:name" id="article-title"
				style="margin-top: 0px;">${marketList.goodsContent }</h1>
			<p id="article-category">
				<time>
					<fmt:formatDate value="${marketList.goodsDate}"
						pattern="yyyy-MM-dd HH:mm:ss" />
				</time>
				∙
				<c:if test="${hours ne 0 }">
					<time>${hours} 시간 전</time>
				</c:if>
				<c:if test="${hours eq 0 }">
					<time>${minutes} 분 전</time>
				</c:if>
			</p>
			<p id="article-price" property="schema:price" content=""
				style="font-size: 18px; font-weight: bold;">${marketList.goodsPrice }</p>
			<div property="schema:description" id="article-detail">
				<p>${marketList.goodsContent }</p>
			</div>
			<p id="article-counts"></p>
		</section>
	</article>

	<section id="article-detail-hot-more">
		<h3>애물단지 돌보미</h3>

		<section class="cards-wrap">

			<!-- 상품 반복 시작 ( 총 6개 ) -->
			<article class="card ">
				<a class="card-link ga-click" data-event-label="611959626"
					data-event-category="show_article_from"
					data-event-action="hot_region" href="/articles/611959626">
					<div class="card-photo ">
						<img alt="" src="사진링크부분">
					</div>
					<div class="card-desc">
						<h2 class="card-title">아이폰</h2>
						<div class="card-price ">5억원</div>
						<div class="card-region-name">가산</div>
						<div class="card-counts">
							<span> 관심 99 </span> ∙ <span> 채팅 99 </span>
						</div>
					</div>
				</a>
			</article>
			<!-- 상품 반복 종료 -->
		</section>

	</section>
	<script type="text/javascript">
		//페이지 로딩 시 좋아요 개수 가져오기
		$(document).ready(function() {
			updateLikeCount();
		});

		//좋아요 버튼 클릭 이벤트
		$("#heart-button").click(function(event) {
			var memberId = "${marketList.id}";
			var goodsId = "${marketList.goodsId}";
			likeGoods(memberId, goodsId, event);
		});

		// 좋아요 / 좋아요 취소 기능 처리 함수
		function likeGoods(memberId, goodsId, event) {

			// submit 으로 넘어가는걸 막고
			event.preventDefault();

			// 현재 좋아요 상태 확인
			var isLiked = $("#heart-button").hasClass("liked");

			// 이미 좋아요가 되어있는 경우 좋아요 취소 요청을 보냅니다.
			if (isLiked) {
				$.ajax({
					url : "/market/unlike",
					type : "DELETE",
					data : {
						memberId : memberId,
						goodsId : goodsId
					},
					success : function(response) {
						updateLikeCount();
						console.log("좋아요 취소 성공");
						// 좋아요 취소 후 버튼 스타일 변경
						$("#heart-button").html('&#9825;');
						$("#heart-button").removeClass("liked");
					},
					error : function(error) {
						console.log(error);
					}
				});
			} else {
				// 좋아요를 처리하는 요청을 보냅니다.
				$.ajax({
					url : "/market/like",
					type : "POST",
					data : {
						memberId : memberId,
						goodsId : goodsId
					},
					success : function(response) {
						updateLikeCount();
						console.log("좋아요 성공");
						// 좋아요 처리 후 버튼 스타일 변경
						$("#heart-button").html('&#9829;');
						$("#heart-button").addClass("liked");
					},
					error : function(error) {
						console.log(error);
					}
				});
			}
		}

		// 좋아요 개수 갱신
		function updateLikeCount() {
			var goodsId = "${marketList.goodsId}";
			$.ajax({
				url : "/market/likeCount",
				type : "GET",
				data : {
					goodsId : goodsId
				},
				success : function(response) {
					$("#article-counts").text("관심 : "+response.likeCount +" ∙ 조회 : "+${marketList.goodsCount});
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	</script>

</body>
</html>
