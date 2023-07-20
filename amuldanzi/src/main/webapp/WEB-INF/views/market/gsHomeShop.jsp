<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" data-page="isTVMain">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>애물단지 라이브커머스</title>


<link rel="stylesheet" type="text/css"
	href="/chunks/css/market/common.min.css">

<script type="text/javascript"
	src="//image.gsshop.com/ui/gsshop/pc/common/scripts/lib/jquery.js?20230705140638"></script>
<script type="text/javascript"
	src="//image.gsshop.com/ui/gsshop/pc/common/scripts/lib/browser.js?20230705140638"></script>
<script type="text/javascript" charset="UTF-8"
	src="//t1.daumcdn.net/adfit/static/kp.js"></script>

<link rel="stylesheet" type="text/css"
	href="//image.gsshop.com/ui/gsshop/pc/shop/tvShop/styles/style.min.css?20230705140638">
<link rel="stylesheet" type="text/css"
	href="//image.gsshop.com/ui/gsshop/pc/shop/player/videojs/styles/video-js.min.css?20230705140638">
<style type="text/css">
/*
	모바일 사파리 disabled telephone detaction 
	 - 스타일로 막는것은 헤더에서만 적용됨!
	 - 메타 설정 가능하지만 추후 검토후 적용 
	*/
a[href^='tel'] {
	display: inline;
	outline: none;
	border: none
}
</style>
</head>
<body class="flexible">
	<div id="doc-container">
		<jsp:include page="../main/header.jsp"></jsp:include>


		<!-- 컨텐츠 영역 -->
		<main id="doc-contents">
			<div class="doc-wrap">
				<input type="hidden" id="broadToday" name="broadToday"
					value="202307061043" /> <input type="hidden" id="pageGbn"
					name="pageGbn" value="isTVMain" /> <input type="hidden"
					id="broadTypCd" name="broadTypCd" value="LIVE" />

				<!-- tv쇼핑 헤더 영역 -->

				<!-- tv쇼핑 헤더 영역 -->
				<header id="shop-header">

					<nav id="tv-shop-name">

						<h2>
							<a href="">애물단지 라이브커머스</a>
						</h2>

					</nav>

					<section id="navi-container">

						<!--// snb -->

						<nav class="lnb">
							<a class="on" href="/shop/tv/tvShopMain.gs?lseq=409695"><span><!-- on air --></span></a>
							<!-- 활성화 클래스 on -->
							<a href="/shop/tv/tvScheduleMain.gs?lseq=409696"><span >방송편성표</span></a>

							<a href="/shop/tv/phoneAlarm/phoneAlarmMain.gs?lseq=409697"><span><!-- 방송알림 --></span></a>
						</nav>

					</section>
				</header>



				<!-- 메인 컨텐츠 -->
				<section id="tv-index">
					<div id="on-air">
						 <iframe src="http://192.168.0.69:5000/viewer.html" width="100%" height="425px" frameborder="0" ></iframe>
					</div>
					<!-- 현재 방송중인 상품 : 메인 페이지  on air와 같은 구조 -->
					<article id="on-air-prd"></article>
				</section>
				<!--// tv-index -->

				<!-- 이전/다음 방송 -->
				<article id="tv-schedule" class="item-module typeE"></article>


				<!-- 베스트 상품 목록 -->
				<article class="item-module typeC tv-best">
					<h3 class="mod-tit">애물단지 Best</h3>
					<div class="outline-wrap">
						<section class="mod-stage">
							<ul>
								
								<!-- 상품 반복 ( 3개까지 ) -->
								<li><a href="" class="prd-item" data-prdid="1034842032">
										<div class="prd-img">

											<img src=""
												onerror=""
												alt="상품이미지"> <span class="badge-abs"> </span> <span
												class="toggle-zzim" id=""></span>

											<button class="link-new-tab">
												<i class="sprite-new-tab"></i>새창 열기
											</button>

										</div>

										<dl class="prd-info">
											<dt class="prd-name">

												<span class="color-cyan">[카테고리]</span> 맛있는 반려동물 사료
											</dt>

											<dd class="price-info" data-exposPrcTypCd="4"
												data-exposPrdTypCd="P" data-consultProduct="false"
												data-rentPrc="0">

												<!-- 가격 -->
												<span class="price"> <span class="set-price">
														<strong>10000</strong>원
												</span>

												</span>
												<!-- //price -->
											</dd>

											<dd class="user-side"></dd>

											<dd class="advantage">
												<div>
													<span>#태그</span>
												</div>
											</dd>
										</dl>
								</a></li>
								<!-- 상품반복 끝 -->
								
								<!-- 상품 반복 ( 3개까지 ) -->
								<li><a href="" class="prd-item" data-prdid="1034842032">
										<div class="prd-img">

											<img src=""
												onerror=""
												alt="상품이미지"> <span class="badge-abs"> </span> <span
												class="toggle-zzim" id=""></span>

											<button class="link-new-tab">
												<i class="sprite-new-tab"></i>새창 열기
											</button>

										</div>

										<dl class="prd-info">
											<dt class="prd-name">

												<span class="color-cyan">[카테고리]</span> 맛있는 반려동물 사료
											</dt>

											<dd class="price-info" data-exposPrcTypCd="4"
												data-exposPrdTypCd="P" data-consultProduct="false"
												data-rentPrc="0">

												<!-- 가격 -->
												<span class="price"> <span class="set-price">
														<strong>10000</strong>원
												</span>

												</span>
												<!-- //price -->
											</dd>

											<dd class="user-side"></dd>

											<dd class="advantage">
												<div>
													<span>#태그</span>
												</div>
											</dd>
										</dl>
								</a></li>
								<!-- 상품반복 끝 -->

							</ul>
						</section>
					</div>
				</article>

				<!-- 전체상품 목록 -->
				<article class="item-module" id="prd-content">


					<h3 class="mod-tit">애물단지 상품들</h3>

					<nav id="detail-tab" class="gui-tab big">
						<ul class="col6" id="detailLnb">
							<!-- 리스트 갯수만큼 클래스 col-n개 추가 -->
							<li class="item on"><a tab-kind="0"
								href="javascript:changeTabTvLive('00','1');"><span>전체</span></a></li>

						</ul>
					</nav>

					<section id="u_prdlst" class="prd-list type-4items">
						<ul id="prd-list"></ul>
					</section>

					<button id="moreBtn" class="gui-btn big">
						<strong>상품 더보기</strong> <i class="sprite-arr-down"></i>
					</button>
				</article>
				<!--// item-module -->

			</div>
			<!--// doc-wrap -->
		</main>

	</div>

	<script type="text/javascript"
		src="//image.gsshop.com/ui/gsshop/pc/common/scripts/gsshop.wcs.js?20230705140638"></script>
	<script type="text/javascript"
		src="//image.gsshop.com/ui/gsshop/pc/common/scripts/gtm.js?20230705140638"></script>
	<script type="text/javascript"
		src="//image.gsshop.com/ui/gsshop/pc/common/scripts/lib/idangerous.swiper.js?20230705140638"></script>


	<script type="text/javascript">
		try {
			window.addEventListener('load', function() {
				var across_adn_contain = new fn_across_adn_contain();
				var across_adn_param = [];
				across_adn_param = {
					"ut" : "Home",
					"ui" : "105053"
				};
				across_adn_contain.init(across_adn_param);
			});
		} catch (e) {
			console.log("across script error : " + e);
		}

		try {
			(function(a, g, e, n, t) {
				a.enp = a.enp || function() {
					(a.enp.q = a.enp.q || []).push(arguments)
				};
				n = g.createElement(e);
				n.async = !0;
				n.defer = !0;
				n.src = "https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js";
				t = g.getElementsByTagName(e)[0];
				t.parentNode.insertBefore(n, t)
			})(window, document, "script");
			enp('create', 'common', 'gsshop2022', {
				device : 'W'
			}); // W:웹, M: 모바일, B: 반응형
			enp('send', 'common', 'gsshop2022');
		} catch (e) {
			console.log("mobon script error : " + e);
		}
	</script>
</body>

<script type="application/json" id="lseq-data">
	{"spclPgm":"409698","populPgmMore":"396924","prevNext":"409708","onAir":"409695","broadSchedule":"409696","tvShopCtgr":"409699","prevNextMove":"409709","currMore":"409707","rcmdTab":"409716","rcmdMore":"409718","gsShopliveTab":"409692","insuPlan":"409720","gsMyShopTab":"409693","spclPgmSub":"409698","mainTitle":"409691","populPgm":"409724","alarm":"409697","preOrder":"415556","curr":"409706","populPgmMove":"409725","tvShopBnft":"409722","tvShopBnftMove":"409723","preOrderMove":"415557","rcmdPrd":"409717"}
</script>

<script type="text/javascript"
	src="//image.gsshop.com/ui/gsshop/pc/shop/amplitude/scripts/amp.min.js?20230705140638"></script>
<script type="text/javascript"
	src="//image.gsshop.com/ui/gsshop/pc/common/scripts/common.min.js?20230705140638"></script>
<script type="text/javascript"
	src="//image.gsshop.com/ui/gsshop/pc/common/scripts/lib/jquery-ui.min.js?20230705140638"></script>
<script type="text/javascript"
	src="//image.gsshop.com/ui/gsshop/pc/common/scripts/lib/idangerous.swiper.js?20230705140638"></script>
<script type="text/javascript"
	src="//image.gsshop.com/ui/gsshop/pc/shop/base/scripts/base.min.js?20230705140638"></script>
<script type="text/javascript"
	src="//image.gsshop.com/ui/gsshop/pc/shop/tvShop/scripts/tv.min.js?20230705140638"></script>
<script type="text/javascript"
	src="//image.gsshop.com/ui/gsshop/pc/shop/player/videojs/scripts/videojs-7.14.1.min.js?20230705140638"></script>
<!-- 배포해야함 2022-01-04 -->
<script type="text/javascript">
	jQuery(function($) {

		var url = '//gstv-myshop.gsshop.com/myshop_hd/_definst_/myshop_hd.stream/playlist.m3u8';
		/* var rtmpUrl = 'rtmp://livem.gsshop.com/gsmyshop_hd/_definst_/gsmyshop_hd.stream'; */

		url = '//gstv-gsshop.gsshop.com/gsshop_hd/_definst_/gsshop_hd.stream/playlist.m3u8';
		/* rtmpUrl = 'rtmp://livem.gsshop.com/gsshop_hd/_definst_/gsshop_hd.stream'; */

		// 옵션 정리 2022-01-04
		var type = 'application/x-mpegurl';
		var videoSrc = url;

		var $playerController = $('#player-control');
		var $player = $('#videojs-player');
		var pauseTieme;

		var playerOption = {
			preload : 'auto',
			autoplay : true,
			muted : false,
			playsinline : true,
			fullscreenToggle : false,
			sources : [ {
				'type' : type,
				'src' : videoSrc
			} ]
		}
		//    playerOption.techOrder = ['html5','flash'];

		var player = videojs('videojs-player', playerOption);

		player.on('play', function() {

			$player = $('#videojs-player');

			if (GsBase.os == 'android') {
				$('.video-js').append($playerController);
			}

			setTimeout(function() {
				if ($player.hasClass('vjs-playing')) {
					$playerController.removeClass('ready');
				}
			}, 1000);
		})
		player.on('fullscreenchange', function() {
			if (this.isFullscreen()) {
				if (!$player.hasClass('vjs-playing'))
					$playerController.find('.play').click();
			} else {
				$playerController.find('.stop').click();
			}
		});

		$playerController.find('.play').on('click', function() {
			$playerController.removeAttr('class').addClass('play');
			player.play();
		});

		$playerController.find('.stop').on('click', function() {
			$playerController.addClass('on').addClass('pause');
			player.pause();
		});

		$playerController.find('.volume').on('click', function() {
			if ($(this).hasClass('off')) {
				$(this).removeClass('off');
				player.muted(false);
			} else {
				$(this).addClass('off');
				player.muted(true);
			}
		});

		$playerController.find('.fullscreen').on('click', function() {
			$('.vjs-fullscreen-control').click();
			if (GsBase.mobileBrowser)
				$('.vjs-play-control').click();
		});

		$playerController.find('button').on('click', function(e) {
			e.stopPropagation();
			clearTimeout(pauseTieme);
			pauseTieme = null;
		});

		$playerController.find('.go').on('click', function() {
			var linkUrl = $('#currentBroadLink').attr('href');
			document.location.href = linkUrl;
		});

		if (GsBase.mobileBrowser) {
			$('#player-control-inner').on(
					'click',
					function(e) {
						e.stopPropagation();

						clearTimeout(pauseTieme);
						pauseTieme = null;

						if ($playerController.hasClass('on')) {
							if ($player.hasClass('vjs-playing')) {
								$playerController.removeClass('on');
							}
						} else {
							$playerController.addClass('on');

							if ($player.hasClass('vjs-playing')) {
								pauseTieme = setTimeout(function() {
									$playerController.removeClass('on')
											.removeClass('over');
								}, 3000);
							}
						}

						if ($player.hasClass('vjs-paused')) {
							$playerController.removeClass('play').addClass(
									'pause');
						} else {
							$playerController.addClass('over');
						}
					});
		}

		amplitudeCall()

	});
</script>
</html>


