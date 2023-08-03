<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="./header.jsp"></jsp:include>

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
 
<style>
#popupDiv { /* 팝업창 css */
	top: 50%;
	left: 50%;
	position: absolute;
	background: white;
	width: 500px;
	height: 500px;
	display: none;
}

#popup_mask { /* 팝업 배경 css */
	position: fixed;
	width: 100%;
	height: 1000px;
	top: 0px;
	left: 0px;
	display: none;
	background-color: #000;
	opacity: 0.8;
}
/* 이미지 스타일링 */
#slideshow {
	position: relative;
	overflow: hidden;
	width: 100%;
	height: 100%;
}

#slideshow img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	opacity: 0;
	transition: opacity 1s ease-in-out;
	z-index: 1;
}

#popCloseBtn {
	position: absolute;
	top: 10px;
	right: 10px;
	z-index: 10;
	cursor: pointer;
}

#caption {
	text-align: center;
	padding: 30px; /* Increased padding to make the text area larger */
	font-size: 22px;
	font-family: 'Arial', sans-serif;
	/* Change font style to Arial or any other font you prefer */
	font-weight: bold; /* Make the text bold */
	color: #ff1493; /* Pink color */
	position: absolute;
	z-index: 2;
	bottom: 0; /* 위치 조정을 통해 이미지 아래에 배치 */
	left: 50%; /* 가운데 정렬 */
	transform: translateX(-50%); /* 가운데 정렬 */
	width: 80%; /* Increased width to make the text area wider */
	border-radius: 10px; /* Rounded corners for the text area */
}

/* 클릭 버튼 스타일링 */
#clickButton {
	position: absolute;
	z-index: 2;
	bottom: 80px; /* 위치 조정을 통해 이미지 아래에 배치 */
	left: 50%; /* 가운데 정렬 */
	transform: translateX(-50%); /* 가운데 정렬 */
	background-color: #3498db;
	color: #fff;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border: none;
	border-radius: 4px;
	animation: sparkle 1s infinite alternate;
	transition: background-color 0.3s ease;
}

/* 클릭 버튼 애니메이션 */
@
keyframes sparkle {from { background-color:rgba(255, 255, 255, 0);
	box-shadow: none;
}

to {
	background-color: #ff1493;
	box-shadow: 0 0 5px #rgba(255, 255, 255, 0);
}

}

/* 공지사항 테이블 스타일 */
.notice-table {
	width: 100%;
	border-collapse: collapse;
	font-size: 16px;
}

/* 테이블 헤더 스타일 */
.notice-table th {
	background-color: #f2f2f2;
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
	font-weight: bold;
}

/* 테이블 셀 스타일 */
.notice-table td {
	border: 1px solid #dddddd;
	text-align: center;
}

/* 카테고리 셀 스타일 */
.notice-category-cell {
	position: relative; /* 구분선 위치 조정을 위해 상대적 위치로 지정 */
	width: 200px;
	padding: 0; /* 셀 안의 패딩 제거 */
	text-align: center; /* 가운데 정렬 */
}

/* 카테고리 원형 스타일 */
.notice-category {
	width: 67px;
	height: 46px;
	left: 58px;
	border-radius: 50%;
	display: flex; /* Flexbox로 변경 */
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
	border: 2px solid red;
	background-color: white;
	text-align: center;
	color: black;
	font-size: 12px;
	font-weight: bold;
	text-decoration: none;
	position: relative; /* 원형 스타일에 포함된 내용을 위해 상대적 위치로 지정 */
	z-index: 1; /* 원형 스타일을 위로 올리기 위해 z-index 지정 */
}

/* 카테고리 마우스 호버 스타일 */
.notice-category:hover {
	background-color: #ffdddd; /* 마우스 호버 시 배경색 변경 */
}

/* 번호 폭 조정 */
.notice-number {
	width: 50px; /* 번호의 폭을 줄임 */
	text-align: center;
}

/* 구분선 스타일 */
.notice-divider {
	position: absolute;
	top: 0;
	right: 0;
	height: 100%;
	border-right: 1px solid #dddddd; /* 우측에 구분선 추가 */
	z-index: 0; /* 구분선을 원형 스타일 아래로 숨기기 위해 z-index 지정 */
}

.cat {
	position: absolute;
	left: 500px;
	top: 500px;
	z-index: 999;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head> 

<script type="text/javascript">
var currentSlideIndex = 0;
var slideInterval;

//팝업창을 로드되자마자 보이도록 실행
$(document).ready(function() {
    showPopup();
    startSlideshow(); // 이미지 슬라이드 쇼 시작 

$("#popCloseBtn").click(function(event) {
    hidePopup();
    stopSlideshow(); // 이미지 슬라이드 쇼 정지
});

function showPopup() {
    $("#popupDiv").css({
        "top": (($(window).height() - $("#popupDiv").outerHeight()) / 2 + $(window).scrollTop()) + "px",
        "left": (($(window).width() - $("#popupDiv").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
    });

    $("#popup_mask").css("display", "block");
    $("#popupDiv").css("display", "block");
    $("body").css("overflow", "hidden");

    // 이미지 슬라이드 쇼 시작
    startSlideshow();
}

function hidePopup() {
    $("#popup_mask").css("display", "none");
    $("#popupDiv").css("display", "none");
    $("body").css("overflow", "auto");

					// 이미지 슬라이드 쇼 정지
					stopSlideshow();
				}

				// 이미지 슬라이드 쇼 시작 함수
				function startSlideshow() {

					$("#slideshow img").eq(currentSlideIndex).css("opacity",
							"1");

					slideInterval = setInterval(nextSlide, 3000); // 2초마다 다음 슬라이드로 이동
				}

				// 이미지 슬라이드 쇼 정지 함수
				function stopSlideshow() {
					clearInterval(slideInterval);
				}

				// 다음 슬라이드로 이동 함수
				function nextSlide() {
					var slides = $("#slideshow img");
					var nextSlideIndex = (currentSlideIndex + 1)
							% slides.length;

					// 현재 슬라이드를 투명하게 만들고 다음 슬라이드를 표시
					slides.eq(currentSlideIndex).css("opacity", "0");
					slides.eq(nextSlideIndex).css("opacity", "1");

					currentSlideIndex = nextSlideIndex;
				}

			});
</script>

<body>
<c:if test="${not empty selectCharacter}">
	<img class='cat' src='/character/images/${selectCharacter}' id="cat"/>
</c:if> 
	<div class="main_mainContents__GXYBn2">
		 <!-- 공지사항 테이블 -->
        <table class="notice-table">
            <tr>
                <th>번호</th>
                <th>카테고리</th>
                <th>제목</th>
                <th>날짜</th>
            </tr>
            <c:forEach items="${noticeList}" var="notice">
                <tr>
                    <td class="notice-number" >${notice.id}</td>
                    <td class="notice-category-cell" >
                        <div class="notice-category" >
			            ${notice.category}
			        </div>
                    <div class="notice-divider"></div>
                    </td>
                    
                    <td>
                        <a href="/notice/noticeDetail?title=${notice.title}">${notice.title}</a>
                    </td>
                    <td>
                        ${notice.regdate}
                    </td>
                </tr>
            </c:forEach>
        </table> 
		<hr class="popper_popperMenuDivider__j1QQj">
		<br/>
		<p class="main_mainTitle__nxOQS">라이브 커머스</p>
		<div class="main_mainGridContainer__xl9yt1">
			<div class="mainContent_mainContentBox__shdST">
				<div>
					<span
						style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;"><span
						style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 63.8298% 0px 0px;"></span><img
						alt="main_image" sizes="700px"
						srcset="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=16&amp;q=75 16w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=32&amp;q=75 32w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=48&amp;q=75 48w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=64&amp;q=75 64w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=96&amp;q=75 96w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=128&amp;q=75 128w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=256&amp;q=75 256w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=384&amp;q=75 384w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=640&amp;q=75 640w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=750&amp;q=75 750w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=828&amp;q=75 828w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=1080&amp;q=75 1080w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=1200&amp;q=75 1200w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=1920&amp;q=75 1920w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=2048&amp;q=75 2048w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=3840&amp;q=75 3840w"
						src="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=3840&amp;q=75"
						decoding="async" data-nimg="responsive"
						class="mainContent_mainImg__dWbCy"
						style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; filter: none; background-size: cover; background-image: none; background-position: 0% 0%;">
					<noscript></noscript></span>
				</div>
				<div class="mainContent_mainContent__w_Buk">
					<div class="mainContent_mainTitle__8iW62">'푸훗. 헛디뎠네' 반려동물 코미디
						사진전</div>
					<div class="mainContent_mainAuthor__kKyGl">꼬리스토리</div>
				</div>
			</div>
			<div class="mainContent_mainContentBox__shdST">
				<div>
					<span
						style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;"><span
						style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 63.8298% 0px 0px;"></span><img
						alt="main_image" sizes="700px"
						srcset="/_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=16&amp;q=75 16w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=32&amp;q=75 32w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=48&amp;q=75 48w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=64&amp;q=75 64w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=96&amp;q=75 96w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=128&amp;q=75 128w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=256&amp;q=75 256w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=384&amp;q=75 384w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=640&amp;q=75 640w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=750&amp;q=75 750w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=828&amp;q=75 828w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=1080&amp;q=75 1080w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=1200&amp;q=75 1200w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=1920&amp;q=75 1920w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=2048&amp;q=75 2048w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=3840&amp;q=75 3840w"
						src="/_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=3840&amp;q=75"
						decoding="async" data-nimg="responsive"
						class="mainContent_mainImg__dWbCy"
						style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; filter: none; background-size: cover; background-image: none; background-position: 0% 0%;">
					<noscript></noscript></span>
				</div>
				<div class="mainContent_mainContent__w_Buk">
					<div class="mainContent_mainTitle__8iW62">동물 알레르기 (강아지, 고양이)
						증상 및 관리법</div>
					<div class="mainContent_mainAuthor__kKyGl">비마이펫</div>
				</div>
			</div>
			<div class="mainContent_mainContentBox__shdST">
				<div>
					<span
						style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;"><span
						style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 63.8298% 0px 0px;"></span><img
						alt="main_image" sizes="700px"
						srcset="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=16&amp;q=75 16w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=32&amp;q=75 32w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=48&amp;q=75 48w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=64&amp;q=75 64w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=96&amp;q=75 96w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=128&amp;q=75 128w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=256&amp;q=75 256w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=384&amp;q=75 384w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=640&amp;q=75 640w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=750&amp;q=75 750w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=828&amp;q=75 828w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1080&amp;q=75 1080w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1200&amp;q=75 1200w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1920&amp;q=75 1920w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=2048&amp;q=75 2048w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=3840&amp;q=75 3840w"
						src="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=3840&amp;q=75"
						decoding="async" data-nimg="responsive"
						class="mainContent_mainImg__dWbCy"
						style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; filter: none; background-size: cover; background-image: none; background-position: 0% 0%;">
					<noscript></noscript></span>
				</div>
				<div class="mainContent_mainContent__w_Buk">
					<div class="mainContent_mainTitle__8iW62">아기 집사가 울음 터트리자
						토닥토닥해준 야옹이.."울지말라옹 뚝!"</div>
					<div class="mainContent_mainAuthor__kKyGl">노트펫</div>
				</div>
			</div>
		</div>
		<hr class="popper_popperMenuDivider__j1QQj">
		<br/>
	</div>	
	<div class="main_mainContents__GXYBn">		
		<hr class="popper_popperMenuDivider__j1QQj">
		<br/>
		<p class="main_mainTitle__nxOQS">반려동물 꿀팁</p>
		<div class="main_mainGridContainer__xl9yt2">
		<c:forEach items="${careList}" var="care">
			<div class="mainContent_mainContentBox__shdST">
				<div>
					<a href="/care/careDetail?id=${care.id}">
					<span
						style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;"><span
						style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 63.8298% 0px 0px;"></span><img
						alt="main_image" sizes="700px" 
						src="/images/care/${care.img}"
						decoding="async" data-nimg="responsive"
						class="mainContent_mainImg__dWbCy"
						style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; filter: none; background-size: cover; background-image: none; background-position: 0% 0%;">
					<noscript></noscript></span></a>
				</div>
				<div class="mainContent_mainContent__w_Buk">
				<a href="/care/careDetail?id=${care.id}">
					<div class="mainContent_mainTitle__8iW62">${care.title}
						</div></a>
					<div class="mainContent_mainAuthor__kKyGl">애물단지</div>
				</div>
			</div> 
			</c:forEach>
			
			
			
			
			
			<div class="mainContent_mainContentBox__shdST">
				<div>
					<span
						style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;"><span
						style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 63.8298% 0px 0px;"></span><img
						alt="main_image" sizes="700px"
						srcset="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=16&amp;q=75 16w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=32&amp;q=75 32w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=48&amp;q=75 48w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=64&amp;q=75 64w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=96&amp;q=75 96w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=128&amp;q=75 128w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=256&amp;q=75 256w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=384&amp;q=75 384w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=640&amp;q=75 640w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=750&amp;q=75 750w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=828&amp;q=75 828w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1080&amp;q=75 1080w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1200&amp;q=75 1200w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1920&amp;q=75 1920w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=2048&amp;q=75 2048w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=3840&amp;q=75 3840w"
						src="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=3840&amp;q=75"
						decoding="async" data-nimg="responsive"
						class="mainContent_mainImg__dWbCy"
						style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; filter: none; background-size: cover; background-image: none; background-position: 0% 0%;">
					<noscript></noscript></span>
				</div>
				<div class="mainContent_mainContent__w_Buk">
					<div class="mainContent_mainTitle__8iW62">아기 집사가 울음 터트리자
						토닥토닥해준 야옹이.."울지말라옹 뚝!"</div>
					<div class="mainContent_mainAuthor__kKyGl">노트펫</div>
				</div>
			</div>
			<div class="mainContent_mainContentBox__shdST">
				<div>
					<span
						style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;"><span
						style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 63.8298% 0px 0px;"></span><img
						alt="main_image" sizes="700px"
						srcset="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=16&amp;q=75 16w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=32&amp;q=75 32w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=48&amp;q=75 48w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=64&amp;q=75 64w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=96&amp;q=75 96w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=128&amp;q=75 128w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=256&amp;q=75 256w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=384&amp;q=75 384w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=640&amp;q=75 640w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=750&amp;q=75 750w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=828&amp;q=75 828w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1080&amp;q=75 1080w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1200&amp;q=75 1200w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1920&amp;q=75 1920w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=2048&amp;q=75 2048w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=3840&amp;q=75 3840w"
						src="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=3840&amp;q=75"
						decoding="async" data-nimg="responsive"
						class="mainContent_mainImg__dWbCy"
						style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; filter: none; background-size: cover; background-image: none; background-position: 0% 0%;">
					<noscript></noscript></span>
				</div>
				<div class="mainContent_mainContent__w_Buk">
					<div class="mainContent_mainTitle__8iW62">아기 집사가 울음 터트리자
						토닥토닥해준 야옹이.."울지말라옹 뚝!"</div>
					<div class="mainContent_mainAuthor__kKyGl">노트펫</div>
				</div>
			</div>
		</div>
		<hr class="popper_popperMenuDivider__j1QQj">
		<br/>
	</div>
	<div class="main_mainContents__GXYBn">		
		<hr class="popper_popperMenuDivider__j1QQj">
		<br/>
		<p class="main_mainTitle__nxOQS">플리마켓</p>
		<div class="main_mainGridContainer__xl9yt2">
			<div class="mainContent_mainContentBox__shdST">
				<div>
					<span
						style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;"><span
						style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 63.8298% 0px 0px;"></span><img
						alt="main_image" sizes="700px"
						srcset="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=16&amp;q=75 16w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=32&amp;q=75 32w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=48&amp;q=75 48w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=64&amp;q=75 64w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=96&amp;q=75 96w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=128&amp;q=75 128w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=256&amp;q=75 256w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=384&amp;q=75 384w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=640&amp;q=75 640w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=750&amp;q=75 750w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=828&amp;q=75 828w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=1080&amp;q=75 1080w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=1200&amp;q=75 1200w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=1920&amp;q=75 1920w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=2048&amp;q=75 2048w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=3840&amp;q=75 3840w"
						src="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2020%2F11%2F25114707%2F20201125112416_465c9308f270f89037be1e7e3f8368bd_9xl4-1.jpg&amp;w=3840&amp;q=75"
						decoding="async" data-nimg="responsive"
						class="mainContent_mainImg__dWbCy"
						style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; filter: none; background-size: cover; background-image: none; background-position: 0% 0%;">
					<noscript></noscript></span>
				</div>
				<div class="mainContent_mainContent__w_Buk">
					<div class="mainContent_mainTitle__8iW62">'푸훗. 헛디뎠네' 반려동물 코미디
						사진전</div>
					<div class="mainContent_mainAuthor__kKyGl">꼬리스토리</div>
				</div>
			</div>
			<div class="mainContent_mainContentBox__shdST">
				<div>
					<span
						style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;"><span
						style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 63.8298% 0px 0px;"></span><img
						alt="main_image" sizes="700px"
						srcset="/_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=16&amp;q=75 16w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=32&amp;q=75 32w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=48&amp;q=75 48w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=64&amp;q=75 64w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=96&amp;q=75 96w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=128&amp;q=75 128w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=256&amp;q=75 256w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=384&amp;q=75 384w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=640&amp;q=75 640w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=750&amp;q=75 750w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=828&amp;q=75 828w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=1080&amp;q=75 1080w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=1200&amp;q=75 1200w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=1920&amp;q=75 1920w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=2048&amp;q=75 2048w, /_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=3840&amp;q=75 3840w"
						src="/_next/image?url=https%3A%2F%2Fimages.mypetlife.co.kr%2Fcontent%2Fuploads%2F2018%2F08%2F09155720%2Fallergy-cold-disease-flu-41284.jpeg&amp;w=3840&amp;q=75"
						decoding="async" data-nimg="responsive"
						class="mainContent_mainImg__dWbCy"
						style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; filter: none; background-size: cover; background-image: none; background-position: 0% 0%;">
					<noscript></noscript></span>
				</div>
				<div class="mainContent_mainContent__w_Buk">
					<div class="mainContent_mainTitle__8iW62">동물 알레르기 (강아지, 고양이)
						증상 및 관리법</div>
					<div class="mainContent_mainAuthor__kKyGl">비마이펫</div>
				</div>
			</div>
			<div class="mainContent_mainContentBox__shdST">
				<div>
					<span
						style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;"><span
						style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 63.8298% 0px 0px;"></span><img
						alt="main_image" sizes="700px"
						srcset="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=16&amp;q=75 16w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=32&amp;q=75 32w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=48&amp;q=75 48w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=64&amp;q=75 64w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=96&amp;q=75 96w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=128&amp;q=75 128w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=256&amp;q=75 256w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=384&amp;q=75 384w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=640&amp;q=75 640w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=750&amp;q=75 750w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=828&amp;q=75 828w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1080&amp;q=75 1080w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1200&amp;q=75 1200w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1920&amp;q=75 1920w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=2048&amp;q=75 2048w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=3840&amp;q=75 3840w"
						src="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=3840&amp;q=75"
						decoding="async" data-nimg="responsive"
						class="mainContent_mainImg__dWbCy"
						style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; filter: none; background-size: cover; background-image: none; background-position: 0% 0%;">
					<noscript></noscript></span>
				</div>
				<div class="mainContent_mainContent__w_Buk">
					<div class="mainContent_mainTitle__8iW62">아기 집사가 울음 터트리자
						토닥토닥해준 야옹이.."울지말라옹 뚝!"</div>
					<div class="mainContent_mainAuthor__kKyGl">노트펫</div>
				</div>
			</div>
			<div class="mainContent_mainContentBox__shdST">
				<div>
					<span
						style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative;"><span
						style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 63.8298% 0px 0px;"></span><img
						alt="main_image" sizes="700px"
						srcset="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=16&amp;q=75 16w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=32&amp;q=75 32w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=48&amp;q=75 48w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=64&amp;q=75 64w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=96&amp;q=75 96w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=128&amp;q=75 128w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=256&amp;q=75 256w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=384&amp;q=75 384w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=640&amp;q=75 640w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=750&amp;q=75 750w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=828&amp;q=75 828w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1080&amp;q=75 1080w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1200&amp;q=75 1200w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=1920&amp;q=75 1920w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=2048&amp;q=75 2048w, /_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=3840&amp;q=75 3840w"
						src="/_next/image?url=https%3A%2F%2Fcontents.creators.mypetlife.co.kr%2Fcontent%2Fuploads%2F2021%2F09%2F09100118%2F2021092Ffb_4f592cad374d6b83d9f89ad31f97ad1d.png&amp;w=3840&amp;q=75"
						decoding="async" data-nimg="responsive"
						class="mainContent_mainImg__dWbCy"
						style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; filter: none; background-size: cover; background-image: none; background-position: 0% 0%;">
					<noscript></noscript></span>
				</div>
				<div class="mainContent_mainContent__w_Buk">
					<div class="mainContent_mainTitle__8iW62">아기 집사가 울음 터트리자
						토닥토닥해준 야옹이.."울지말라옹 뚝!"</div>
					<div class="mainContent_mainAuthor__kKyGl">노트펫</div>
				</div>
			</div>
		</div>
		<hr class="popper_popperMenuDivider__j1QQj">
		<br/>
	</div>
	<div class="main_mainContents__GXYBn">		
		<hr class="popper_popperMenuDivider__j1QQj">
		<br/>
		<p class="main_mainTitle__nxOQS">커뮤니티</p>
			<div class="community_loungeLeftContent__wnv1Z">
			<c:forEach items="${communityLikeList}" var = "likeList">
				<div class="community_loungeList__HbstN">
					<div class="qaList_qaListContainer__73To2">
						<div class="qaList_qaListWrapper___YnhH">
							<div>
							<a href="/community/communityDetail?comm_no=${likeList['commNo']}">
								<div class="qaList_qaListTitle__Z1Ssh">${likeList['title']}</a></div>
								<div class="qaList_qaListText__2Cm8R">${likeList['content']}</div>
							</div>
							<div class="qaList_qaListImg__DiWnU">
								<span
									style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;"><img
									alt="community_image"
									src="/images/community/${likeList['path']}"
									decoding="async" data-nimg="fill" sizes="100vw" 
									style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: cover; object-position: center center; filter: none; background-size: cover; background-image: none; background-position: center center;">
								<noscript></noscript></span>
							</div>
						</div>
						<div class="qaList_qaListAbout__qL7GR">
							<div class="qaList_communityType__p7p5C">좋아요 : ${likeList['likeCount'] }</div>
							<div>${likeList['id']}</div>
							<div>${likeList['date']}</div>
						</div>
						<div class="qaList_labelWrapper__vsqC0">
							<div class="qaList_desktopLabelContainer__EEK_6"></div>
						</div>
						<hr class="qaList_qaListDivider__blo7m">
					</div>		
				</div>  
				</c:forEach>
			</div>
		<hr class="popper_popperMenuDivider__j1QQj">
		<br/>
	</div>
	 <div id ="popup_mask" ></div> <!-- 팝업 배경 DIV --> 
	 
    <div id="popupDiv" style="top: 857px;left: 710.5px;display: block;"> <!-- 팝업창 -->
    
    
        <div id="slideshow" >
            <img src="/images/pet/pet01.jpg" alt="Slide 1" style="opacity: 1;">
            <img src="/images/pet/pet02.jpg" alt="Slide 2">
            <img src="/images/pet/pet03.jpg" alt="Slide 3">
            <img src="/images/pet/pet04.jpg" alt="Slide 4">
        </div>
        <div id="caption">반려동물 표정 맞추러 가기</div>
    	<a href="/pet/emotion">
            <button id="clickButton">☞Click☜</button>
        </a> 
        <button id="popCloseBtn">close</button>
    </div>
</body>

<jsp:include page="./footer.jsp"></jsp:include>

</html>