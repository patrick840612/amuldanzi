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

</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".hideView").hide();
		
		$("#viewAllBtn").on("click",function(){
			$("#viewBtnDiv").hide();
			$(".hideView").show();
		});
	}); // end of $
</script>

<jsp:include page="../main/header.jsp"></jsp:include>

<body>
	<div class="main_mainContents__GXYBn2"></div>


	<div class="main_mainContents__GXYBn">
		<hr class="popper_popperMenuDivider__j1QQj">
		<br /> <br />
		<p class="main_mainTitle__nxOQS">마켓정보</p>
		<br /> <br />
		<div class="main_mainGridContainer__xl9yt2">

			<!-- 글 반복 시작부분 -->
			<c:forEach items="${marketshopList}" var="list" end="2">
			<a href="/marketShop/marketDetail?id=${list.id}">
				<div class="mainContent_mainContentBox__shdST">
					<div>
						<span
							style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;"><span
							style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 63.8298% 0px 0px;"></span><img
							alt="main_image" sizes="700px"
							srcset="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=16&amp;q=75 16w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=32&amp;q=75 32w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=48&amp;q=75 48w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=64&amp;q=75 64w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=96&amp;q=75 96w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=128&amp;q=75 128w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=256&amp;q=75 256w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=384&amp;q=75 384w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=640&amp;q=75 640w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=750&amp;q=75 750w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=828&amp;q=75 828w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=1080&amp;q=75 1080w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=1200&amp;q=75 1200w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=1920&amp;q=75 1920w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=2048&amp;q=75 2048w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=3840&amp;q=75 3840w"
							src="" decoding="async" data-nimg="responsive"
							class="mainContent_mainImg__dWbCy"
							style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; filter: none; background-size: cover; background-image: none; background-position: 0% 0%;">
						</span>
					</div>
					<div class="mainContent_mainContent__w_Buk">
						<div class="mainContent_mainTitle__8iW62">${list.title}</div>
						<div class="mainContent_mainAuthor__kKyGl">${list.addr}</div>
					</div>
				</div>
			</a>
			</c:forEach>
			<!-- 글 반복 종료부분 -->
			<c:forEach items="${marketshopList}" var="list" begin="3">
			<a href="/clinic/clinicDetail?id=${list.id}">
				<div class="mainContent_mainContentBox__shdST hideView" >
					<div>
						<span
							style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;"><span
							style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 63.8298% 0px 0px;"></span><img
							alt="main_image" sizes="700px"
							srcset="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=16&amp;q=75 16w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=32&amp;q=75 32w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=48&amp;q=75 48w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=64&amp;q=75 64w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=96&amp;q=75 96w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=128&amp;q=75 128w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=256&amp;q=75 256w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=384&amp;q=75 384w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=640&amp;q=75 640w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=750&amp;q=75 750w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=828&amp;q=75 828w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=1080&amp;q=75 1080w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=1200&amp;q=75 1200w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=1920&amp;q=75 1920w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=2048&amp;q=75 2048w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=3840&amp;q=75 3840w"
							src="" decoding="async" data-nimg="responsive"
							class="mainContent_mainImg__dWbCy"
							style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; filter: none; background-size: cover; background-image: none; background-position: 0% 0%;">
						</span>
					</div>
					<div class="mainContent_mainContent__w_Buk">
						<div class="mainContent_mainTitle__8iW62">${list.title}</div>
						<div class="mainContent_mainAuthor__kKyGl">${list.addr}</div>
					</div>
				</div>
			</a>
			</c:forEach>

		</div>

		<div class="button_btnContainer__MjN_K" id="viewBtnDiv">
			<button class="button_moreBtn__0aLKN" id="viewAllBtn">더보기</button>
		</div>

		<hr class="popper_popperMenuDivider__j1QQj">
		<br />
	</div>

</body>
</html>