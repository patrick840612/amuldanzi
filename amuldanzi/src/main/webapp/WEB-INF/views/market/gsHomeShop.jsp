<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" data-page="isTVMain">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GS SHOP LIVE - GS SHOP</title>


<link rel="stylesheet" type="text/css"
	href="//image.gsshop.com/ui/gsshop/pc/common/styles/basic/common.min.css?20230705140638">

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


		<script type="application/json" id="common-data">
	{"topBanner":{"bgStyle":"#D2D6E1","template":"<a class=\"float\" href=\"http://www.gsshop.com/shop/spa/showCase.gs\" ><img src=\"//image.gsshop.com/planprd/banner_MAINCORNER/351705165_01.jpg\" alt=\"핫한 브랜드 행사 GS X 브랜드\"></a><a class=\"float\" href=\"http://www.gsshop.com/shop/landing/smallBestRankingMain.gs\" ><img src=\"//image.gsshop.com/planprd/banner_MAINCORNER/360034165_01.jpg\" alt=\"중소기업 우수상품 모음전\"></a><a class='float' href='http://www.gsshop.com/shop/planCard.gs?svcid=gc&lseq=416465-1&dseq=582123197&gsid=gnb-AU416465-AU416465-1' >\t\t<dl class='card-sum'>\t\t\t<dt><span class='img'><img src='//image.gsshop.com/ui/gsshop/shop/images/card/img_card_02.png' alt='KB국민'></span></dt>\t\t\t<dd>\t\t\t\t<span class='date'>7.6(목)</span>\t\t\t\t<span class='benefit'>KB국민카드 <strong style=''>7<span class='unit'>%</span></strong> 즉시할인 외</span>\t\t\t</dd>\t\t</dl></a>"},"logoBanner":{"image":"//image.gsshop.com/planprd/banner_MAINCORNER/33664261_01.jpg","imageMap":"<area shape=\"rect\" coords=\"0,26,190,77\" href=\"javascript:redirectURL('main');\" alt=\"GS SHOP\">"},"tvLiveBanner":{"broadType":"생방송","imageUrl":"https://asset.m-gs.kr/prod/1033941155/1/90","linkUrl":"/prd/prd.gs?prdid=1033941155&gsid=gnb-AU400104-AU400104-1&lseq=400104-1","snlinkUrl":"/shop/tv/tvShopMain.gs?gsid=gnb-AU390723-AU390723-1&lseq=390723","productName":"네파이젠벅 셋업4종","promotionName":null,"salePrice":49000,"broadScheduleLinkUrl":"/shop/tv/tvScheduleMain.gs?gsid=gnb-AU390790-AU390790-0&lseq=390790","broadCloseTime":"20230706113500","serverCurrentTime":"20230706104350","isRental":false,"pricePreText":null,"exposePriceText":"원","exposPrdTypCd":"P","basePrice":0,"discountRate":0,"cornerImageUrl":"","livePrcTagYn":"N","tvLiveBannerBadge":null,"exceptionMessage":null,"consultProduct":false,"freeInstlPrdYn":null,"prdBnftInfoLst":[{"benefitText":"무료배송","classGbn":null}],"titleId":null,"eventUrl":null},"globalBanner":{"onTodayDeal":false,"onTodayOpen":false,"onTvShop":false,"onEvent":false,"onGnbYn":false,"secondOnGnbYn":false,"themeExist":false,"themeTitleShort24":null,"themeLink":null,"themeDot":null,"totalCnt":7,"onNowBest":false,"onDept":false,"secondThemeExist":false,"secondThemeTitleShort24":null,"secondThemeLink":null,"secondThemeDot":null,"data":[{"lseq":"lseq=415680-1","code":"&gsid=gnb-AU415680-AU415680-1","themeLink":"https://www.gsshop.com/shop/tv/tvScheduleMain.gs","themeDot":"","dataParam":"","title":"TV편성표","urlParam":"N","seq":"tvScheduleMain","urlLink":"https://www.gsshop.com/shop/tv/tvScheduleMain.gs?lseq=415680-1&gsid=gnb-AU415680-AU415680-1"},{"lseq":"lseq=409881-2","code":"&gsid=gnb-AU409881-AU409881-2","themeLink":"https://www.gsshop.com/shop/spa/showCase.gs","themeDot":"","dataParam":"","title":"GS X 브랜드","urlParam":"N","seq":"showCase","urlLink":"https://www.gsshop.com/shop/spa/showCase.gs?lseq=409881-2&gsid=gnb-AU409881-AU409881-2"},{"lseq":"lseq=425246","code":"&gsid=gnb-AU425246-AU425246","themeLink":"https://www.gsshop.com/shop/tvHighlight.gs","themeDot":"","dataParam":"","title":"TV","urlParam":"N","seq":"tvHighlight","urlLink":"https://www.gsshop.com/shop/tvHighlight.gs?lseq=425246&gsid=gnb-AU425246-AU425246"},{"lseq":"lseq=425247","code":"&gsid=gnb-AU425247-AU425247","themeLink":"https://www.gsshop.com/shop/bargain.gs","themeDot":"","dataParam":"","title":"특가","urlParam":"N","seq":"bargain","urlLink":"https://www.gsshop.com/shop/bargain.gs?lseq=425247&gsid=gnb-AU425247-AU425247"},{"lseq":"lseq=408940-1","code":"&gsid=gnb-AU408940-AU408940-1","themeLink":"https://www.gsshop.com/shop/deal/newArrival.gs","themeDot":"","dataParam":"","title":"오늘의딜","urlParam":"N","seq":"newArrival","urlLink":"https://www.gsshop.com/shop/deal/newArrival.gs?lseq=408940-1&gsid=gnb-AU408940-AU408940-1"},{"lseq":"lseq=415303-1","code":"&gsid=gnb-AU415303-AU415303-1","themeLink":"https://www.gsshop.com/shop/spa/nowBest.gs","themeDot":"","dataParam":"","title":"랭킹","urlParam":"N","seq":"nowBest","urlLink":"https://www.gsshop.com/shop/spa/nowBest.gs?lseq=415303-1&gsid=gnb-AU415303-AU415303-1"},{"lseq":"lseq=381084-1","code":"&gsid=gnb-AU381084-AU381084-1","themeLink":"https://www.gsshop.com/shop/eventMain.gs","themeDot":"","dataParam":"","title":"GS혜택","urlParam":"N","seq":"eventMain","urlLink":"https://www.gsshop.com/shop/eventMain.gs?lseq=381084-1&gsid=gnb-AU381084-AU381084-1"}]},"groupList":null,"recentlyPrds":[{"prdCd":91700282,"prdNm":"[10개월]프롬바이오 관절연골엔 보스웰리아(850mg*30정*20박스)","prdShortNm":"[10개월]프롬바이오 관절연골엔 보스웰리...","imageUrl":"https://asset.m-gs.kr/prod/91700282/1/90","pricePreText":null,"stdUprc":349000,"lastUprc":349000,"isDeal":false,"prdGbnCd":"60","frmlesPrdTypCd":"N","exposPrdTypCd":"P","isTempOut":false,"isSaleEnd":false,"onairSalePsblFlg":"Y","liveBroadFlg":"N","dealStrPrdMrkYn":null,"prdStrPrdMrkYn":null,"rentalPrice":null,"rentalTxt":null,"consultProduct":false,"pricePostText":"","rentalPriceTxt":"0"}],"gnbWithHeader":null,"prdCartCnt":null,"wishPrdCnt":null,"brandWishCnt":null,"recentlyPrdsCnt":"1","showWing":true,"restricted":false,"login":false,"mainPage":false,"baroOn":false,"showUpdown":true,"showSiren":false,"ccmYn":true,"domain":"https://www.gsshop.com","appContext":"/shop","gaData":{"uid":"","gender":"U","catvid":"0","wa_pcid":"LJKYgJ1gwjGIL7RLo4eFo","login":"X","gd":"U","age":"0"},"todayForUpdate":"202307061043","gsidPre":"gnb","useSslImage":false,"categoryList":[[{"id":900,"largeId":null,"middleId":null,"name":"TV상품","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/39231380_02.png","groupMseq":"406206","jbpApi":"Y","jbpCd":"1000004208,1000003627,1000003624,1000003455,1000003452,1000003451,1000003450,1000003449,1000003448,1000003447,1000003446,1000003445,1000003444,1000003443,1000003441,1000003440,1000003438,1000003436,1000003434,1000003432,1000003431,1000003430,1000003429,1000003428,1000003427,1000003424,1000003423,1000003322,1000003321,1000003320,1000003311,1000003310,1000003309,1000003297,1000003294,1000003293,1000003281,1000003280,1000003279,1000003278,1000003277,1000003276,1000003274,1000003272,1000003271,1000003270","jbpNew":"","bannerCorner":"","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":421220,"largeId":null,"middleId":null,"name":"GS SHOP LIVE","linkUrl":"https://www.gsshop.com/shop/tv/tvShopMain.gs?lseq=414301-1&gsid=gnb-AU414301-AU414301-1","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1578320,"largeId":null,"middleId":null,"name":"GS MY SHOP","linkUrl":"https://www.gsshop.com/shop/gsmyshop/index.gs?lseq=414301-1&gsid=gnb-AU414301-AU414301-1","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":[[{"title":"제메이스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1655254000047_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003624&lseq=414301-1_1","code":"1000003624"},{"title":"오트리","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649753649409_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003276&lseq=414301-1_2","code":"1000003276"},{"title":"아디다스골프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649305327007_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003452&lseq=414301-1_3","code":"1000003452"},{"title":"산지애","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649725073087_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003436&lseq=414301-1_4","code":"1000003436"},{"title":"닥터그루트","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646616141657_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003448&lseq=414301-1_5","code":"1000003448"},{"title":"KAHI","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646615049442_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003444&lseq=414301-1_6","code":"1000003444"},{"title":"리바이스바디웨...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649737715972_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003309&lseq=414301-1_7","code":"1000003309"},{"title":"비비안","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649739012366_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003310&lseq=414301-1_8","code":"1000003310"},{"title":"TG도미나스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646614801142_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003446&lseq=414301-1_9","code":"1000003446"},{"title":"코데즈컴바인...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649411134530_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003311&lseq=414301-1_10","code":"1000003311"},{"title":"티에스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646280580795_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003445&lseq=414301-1_11","code":"1000003445"},{"title":"로보","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647411048397_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003432&lseq=414301-1_12","code":"1000003432"}],[{"title":"리쥬란힐러","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646617145993_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003443&lseq=414301-1_13","code":"1000003443"},{"title":"이연복","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649667973972_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003322&lseq=414301-1_14","code":"1000003322"},{"title":"라삐아프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1679907382788_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003297&lseq=414301-1_15","code":"1000003297"},{"title":"브루마스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1677487848762_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003278&lseq=414301-1_16","code":"1000003278"},{"title":"크로커다일 언...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649405261292_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003320&lseq=414301-1_17","code":"1000003320"},{"title":"에버콜라겐","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647317447040_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003274&lseq=414301-1_18","code":"1000003274"},{"title":"나인식스뉴욕","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202208/1661492257968_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003277&lseq=414301-1_19","code":"1000003277"},{"title":"지프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647239081486_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003450&lseq=414301-1_20","code":"1000003450"},{"title":"브리엘","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1681719671166_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003430&lseq=414301-1_21","code":"1000003430"},{"title":"마커스바이마커...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646275692408_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003272&lseq=414301-1_22","code":"1000003272"},{"title":"게스 언더웨어","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649404669363_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003321&lseq=414301-1_23","code":"1000003321"},{"title":"코펜하겐럭스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1675920895171_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003281&lseq=414301-1_24","code":"1000003281"}],[{"title":"FILA언더웨어","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649410789388_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003293&lseq=414301-1_25","code":"1000003293"},{"title":"에브리봇","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202301/1672718908983_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003441&lseq=414301-1_26","code":"1000003441"},{"title":"뷰","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646964291954_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003271&lseq=414301-1_27","code":"1000003271"},{"title":"모르간","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1680834227273_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003431&lseq=414301-1_28","code":"1000003431"},{"title":"퍼실","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1677560304419_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003294&lseq=414301-1_29","code":"1000003294"},{"title":"헤드스파7","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646280811663_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003440&lseq=414301-1_30","code":"1000003440"},{"title":"김서룡","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1676701471193_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003428&lseq=414301-1_31","code":"1000003428"},{"title":"제이슨우","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1683521398694_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003424&lseq=414301-1_32","code":"1000003424"},{"title":"SJ와니","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1677044504290_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003427&lseq=414301-1_33","code":"1000003427"},{"title":"브루스필드","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1675225043064_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004208&lseq=414301-1_34","code":"1000004208"},{"title":"막스스튜디오","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1678784413531_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003279&lseq=414301-1_35","code":"1000003279"},{"title":"아뜰리에 마졸...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1676623326221_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003447&lseq=414301-1_36","code":"1000003447"}],[{"title":"제이코닉","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202301/1675055898715_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003423&lseq=414301-1_37","code":"1000003423"},{"title":"엠비피","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649132418758_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003270&lseq=414301-1_38","code":"1000003270"},{"title":"폴햄","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647240276434_1.jpg","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003429&lseq=414301-1_39","code":"1000003429"},{"title":"아르마니익스체...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647321863792_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003449&lseq=414301-1_40","code":"1000003449"},{"title":"깨끗한나라","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1648631002199_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003455&lseq=414301-1_41","code":"1000003455"},{"title":"SO,WOOL","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202209/1662795198111_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003438&lseq=414301-1_42","code":"1000003438"},{"title":"이지드롭","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649737536325_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003451&lseq=414301-1_43","code":"1000003451"},{"title":"그린백&그린박...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649407163120_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003434&lseq=414301-1_44","code":"1000003434"},{"title":"마이클 바스티...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202210/1665552961975_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003280&lseq=414301-1_45","code":"1000003280"},{"title":"심플리쿡","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202207/1658381338730_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003627&lseq=414301-1_46","code":"1000003627"}]],"groupBanner":null},{"id":300,"largeId":null,"middleId":null,"name":"패션의류/속옷","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/39231381_02.png","groupMseq":"404547","jbpApi":"Y","jbpCd":"1000004391,1000004359,1000004319,1000004318,1000004317,1000004289,1000003506,1000003435,1000003406,1000003404,1000003403,1000003402,1000003401,1000003400,1000003399,1000003393,1000003392,1000003390,1000003370,1000003340,1000003308,1000003291,1000003290,1000003289,1000003288,1000003287,1000003286,1000003285,1000003273,1000003265,1000003264,1000003263,1000003262,1000003260,1000003259,1000003255,1000003254,1000003253,1000003248,1000003247,1000003246,1000003245,1000003244,1000003243,1000003242,1000003241,1000003235,1000003234,1000003233,1000003227,1000003121,1000003120,1000003119,1000003118,1000003117,1000003116,1000003115","jbpNew":"","bannerCorner":"413609","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":1378773,"largeId":null,"middleId":null,"name":"여성의류","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378773&lseq=414301-2&gsid=gnb-AU414301-AU414301-2","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378781,"largeId":null,"middleId":null,"name":"여성트렌드의류","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378781&lseq=414301-2&gsid=gnb-AU414301-AU414301-2","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378788,"largeId":null,"middleId":null,"name":"남성의류","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378788&lseq=414301-2&gsid=gnb-AU414301-AU414301-2","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378794,"largeId":null,"middleId":null,"name":"진/유니섹스의류","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378794&lseq=414301-2&gsid=gnb-AU414301-AU414301-2","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1613912,"largeId":null,"middleId":null,"name":"수입명품의류","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1613912&lseq=414301-2&gsid=gnb-AU414301-AU414301-2","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378813,"largeId":null,"middleId":null,"name":"언더웨어/잠옷","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378813&lseq=414301-2&gsid=gnb-AU414301-AU414301-2","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378829,"largeId":null,"middleId":null,"name":"스포츠의류","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378829&lseq=414301-2&gsid=gnb-AU414301-AU414301-2","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378783,"largeId":null,"middleId":null,"name":"신생아/유아의류","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378783&lseq=414301-2&gsid=gnb-AU414301-AU414301-2","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513107,"largeId":null,"middleId":null,"name":"주니어/키즈의류","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513107&lseq=414301-2&gsid=gnb-AU414301-AU414301-2","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378825,"largeId":null,"middleId":null,"name":"디자이너샵","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378825&lseq=414301-2&gsid=gnb-AU414301-AU414301-2","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378828,"largeId":null,"middleId":null,"name":"패션아울렛","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378828&lseq=414301-2&gsid=gnb-AU414301-AU414301-2","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1550418,"largeId":null,"middleId":null,"name":"선물하기 베스트","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1550418&lseq=414301-2&gsid=gnb-AU414301-AU414301-2","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":[[{"title":"올리비아로렌","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649384926354_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003248&lseq=414301-2_1","code":"1000003248"},{"title":"저스트원","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202209/1662602734105_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003263&lseq=414301-2_2","code":"1000003263"},{"title":"조아맘","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1651040648627_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003262&lseq=414301-2_3","code":"1000003262"},{"title":"클릭앤퍼니","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1678152166869_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003264&lseq=414301-2_4","code":"1000003264"},{"title":"더아이잗","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650273189846_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003291&lseq=414301-2_5","code":"1000003291"},{"title":"라코스테","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1675646428091_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003115&lseq=414301-2_6","code":"1000003115"},{"title":"데일리스트","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649384793212_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003247&lseq=414301-2_7","code":"1000003247"},{"title":"빈폴멘","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1683594508901_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003255&lseq=414301-2_8","code":"1000003255"},{"title":"제너럴아이디어","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1655805780106_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003370&lseq=414301-2_9","code":"1000003370"},{"title":"샤틴","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1677822052506_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004319&lseq=414301-2_10","code":"1000004319"},{"title":"ab.plus","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1683702729056_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003404&lseq=414301-2_11","code":"1000003404"},{"title":"JAJU","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1679969575397_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003242&lseq=414301-2_12","code":"1000003242"}],[{"title":"비지트인뉴욕","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1687158966925_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003406&lseq=414301-2_13","code":"1000003406"},{"title":"비키","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649990550726_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003402&lseq=414301-2_14","code":"1000003402"},{"title":"솔브","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202202/1646011613024_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003119&lseq=414301-2_15","code":"1000003119"},{"title":"아디다스 언더...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647823796839_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003116&lseq=414301-2_16","code":"1000003116"},{"title":"베스띠벨리","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649938894127_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003399&lseq=414301-2_17","code":"1000003399"},{"title":"빈폴레이디스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1681454742262_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003244&lseq=414301-2_18","code":"1000003244"},{"title":"더틸버리","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649922991052_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003289&lseq=414301-2_19","code":"1000003289"},{"title":"지센","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649905402742_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003243&lseq=414301-2_20","code":"1000003243"},{"title":"지오다노","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1676451210352_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003340&lseq=414301-2_21","code":"1000003340"},{"title":"원더브라","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202202/1645693519383_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003118&lseq=414301-2_22","code":"1000003118"},{"title":"아이잗바바","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650264487807_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003288&lseq=414301-2_23","code":"1000003288"},{"title":"크로커다일","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1682058548048_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003260&lseq=414301-2_24","code":"1000003260"}],[{"title":"리스트","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1678149549558_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003253&lseq=414301-2_25","code":"1000003253"},{"title":"지고트","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650264750808_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003287&lseq=414301-2_26","code":"1000003287"},{"title":"더아이잗컬렉션","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650263277881_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003290&lseq=414301-2_27","code":"1000003290"},{"title":"쉬즈미스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202208/1661155640191_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003254&lseq=414301-2_28","code":"1000003254"},{"title":"씨","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649949823010_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003401&lseq=414301-2_29","code":"1000003401"},{"title":"타미힐피거","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1687252829581_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003227&lseq=414301-2_30","code":"1000003227"},{"title":"스튜디오럭스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1675732910796_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003273&lseq=414301-2_31","code":"1000003273"},{"title":"이사베이","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649988663740_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003400&lseq=414301-2_32","code":"1000003400"},{"title":"플루크","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202208/1660892987282_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003241&lseq=414301-2_33","code":"1000003241"},{"title":"커버낫","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1680745706837_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004359&lseq=414301-2_34","code":"1000004359"},{"title":"비너스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202202/1646011059225_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003121&lseq=414301-2_35","code":"1000003121"},{"title":"로가디스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1682665213964_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003392&lseq=414301-2_36","code":"1000003392"}],[{"title":"플레이텍스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202202/1645693580984_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003308&lseq=414301-2_37","code":"1000003308"},{"title":"베네통","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650607900862_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003403&lseq=414301-2_38","code":"1000003403"},{"title":"마인드브릿지","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649986677612_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003235&lseq=414301-2_39","code":"1000003235"},{"title":"샤트렌","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1681461431196_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003285&lseq=414301-2_40","code":"1000003285"},{"title":"크로커다일레이...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1681461578518_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003286&lseq=414301-2_41","code":"1000003286"},{"title":"JJ지고트","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649911985648_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003259&lseq=414301-2_42","code":"1000003259"},{"title":"올리비아하슬러","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1683076178184_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003506&lseq=414301-2_43","code":"1000003506"},{"title":"게스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649311144527_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003233&lseq=414301-2_44","code":"1000003233"},{"title":"Rab","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1678687754812_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004289&lseq=414301-2_45","code":"1000004289"},{"title":"베이직하우스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649986470701_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003234&lseq=414301-2_46","code":"1000003234"},{"title":"푸마 언더웨어","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647823939059_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003117&lseq=414301-2_47","code":"1000003117"},{"title":"BY파크랜드","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650256776570_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003390&lseq=414301-2_48","code":"1000003390"}],[{"title":"미센스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649396108803_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003245&lseq=414301-2_49","code":"1000003245"},{"title":"스테파넬","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1682062881030_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003435&lseq=414301-2_50","code":"1000003435"},{"title":"에피그램","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1686297900015_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004391&lseq=414301-2_51","code":"1000004391"},{"title":"꼼빠니아","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1683881415148_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004318&lseq=414301-2_52","code":"1000004318"},{"title":"조이너스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1687422955633_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004317&lseq=414301-2_53","code":"1000004317"},{"title":"티아이포맨","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650327417887_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003393&lseq=414301-2_54","code":"1000003393"},{"title":"와코루","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202202/1646011682257_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003120&lseq=414301-2_55","code":"1000003120"},{"title":"반에이크","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649396165334_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003246&lseq=414301-2_56","code":"1000003246"},{"title":"시크헤라","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1651110696154_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003265&lseq=414301-2_57","code":"1000003265"}]],"groupBanner":null},{"id":303,"largeId":null,"middleId":null,"name":"패션잡화","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/39231384_02.png","groupMseq":"404550","jbpApi":"Y","jbpCd":"1000004268,1000003945,1000003504,1000003464,1000003249,1000003239,1000003236,1000003177,1000003176,1000003175,1000003174,1000003172,1000003169,1000003168,1000003167,1000003166,1000003165,1000003163,1000003160,1000003158,1000003157,1000003156,1000003152,1000003136,1000003135,1000003131,1000003127,1000003114,1000003113,1000003112,1000003110,1000003109,1000003108,1000003107,1000003106,1000003105,1000003104,1000003103,1000000030","jbpNew":"","bannerCorner":"413612","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":1378765,"largeId":null,"middleId":null,"name":"신발","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378765&lseq=414301-3&gsid=gnb-AU414301-AU414301-3","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378762,"largeId":null,"middleId":null,"name":"가방/지갑","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378762&lseq=414301-3&gsid=gnb-AU414301-AU414301-3","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378764,"largeId":null,"middleId":null,"name":"여행가방/소품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378764&lseq=414301-3&gsid=gnb-AU414301-AU414301-3","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378768,"largeId":null,"middleId":null,"name":"주얼리/시계","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378768&lseq=414301-3&gsid=gnb-AU414301-AU414301-3","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1515998,"largeId":null,"middleId":null,"name":"패션소품/액세서리","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1515998&lseq=414301-3&gsid=gnb-AU414301-AU414301-3","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378771,"largeId":null,"middleId":null,"name":"수입명품잡화","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378771&lseq=414301-3&gsid=gnb-AU414301-AU414301-3","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378789,"largeId":null,"middleId":null,"name":"유아동잡화","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378789&lseq=414301-3&gsid=gnb-AU414301-AU414301-3","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513109,"largeId":null,"middleId":null,"name":"스포츠잡화","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513109&lseq=414301-3&gsid=gnb-AU414301-AU414301-3","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":[[{"title":"금강제화","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1676592481254_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000000030&lseq=414301-3_1","code":"1000000030"},{"title":"바네사브루노","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647583709278_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003165&lseq=414301-3_2","code":"1000003165"},{"title":"질스튜어트","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647569909123_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003167&lseq=414301-3_3","code":"1000003167"},{"title":"파슬(Fossil)","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202209/1663046308515_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003113&lseq=414301-3_4","code":"1000003113"},{"title":"헤지스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647494152222_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003166&lseq=414301-3_5","code":"1000003166"},{"title":"제이에스티나","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1677570871160_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003107&lseq=414301-3_6","code":"1000003107"},{"title":"엘칸토","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202307/1688449637246_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003163&lseq=414301-3_7","code":"1000003163"},{"title":"크록스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647312358104_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003239&lseq=414301-3_8","code":"1000003239"},{"title":"소보제화","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202211/1669683693331_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003158&lseq=414301-3_9","code":"1000003158"},{"title":"닥스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647246034434_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003168&lseq=414301-3_10","code":"1000003168"},{"title":"롱샴","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647327444743_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003135&lseq=414301-3_11","code":"1000003135"},{"title":"캉골","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202202/1645767332736_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003236&lseq=414301-3_12","code":"1000003236"}],[{"title":"도로시쥬얼리","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1678691518035_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003112&lseq=414301-3_13","code":"1000003112"},{"title":"스톤헨지","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1685063475106_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003109&lseq=414301-3_14","code":"1000003109"},{"title":"빅토리녹스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649664246147_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003504&lseq=414301-3_15","code":"1000003504"},{"title":"쌤소나이트","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202212/1672288945429_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003176&lseq=414301-3_16","code":"1000003176"},{"title":"스와로브스키","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649654615125_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003106&lseq=414301-3_17","code":"1000003106"},{"title":"지니킴","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1681088412617_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003160&lseq=414301-3_18","code":"1000003160"},{"title":"벤시몽","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1677139321896_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003156&lseq=414301-3_19","code":"1000003156"},{"title":"모리스 라크로...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1678869286948_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004268&lseq=414301-3_20","code":"1000004268"},{"title":"아이띵소","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647391082629_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003169&lseq=414301-3_21","code":"1000003169"},{"title":"갤러리어클락","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650949500613_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003464&lseq=414301-3_22","code":"1000003464"},{"title":"다니엘 웰링턴","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202211/1667263858191_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003110&lseq=414301-3_23","code":"1000003110"},{"title":"루이까또즈","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1679031518511_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003174&lseq=414301-3_24","code":"1000003174"}],[{"title":"오야니","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1676959763283_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003175&lseq=414301-3_25","code":"1000003175"},{"title":"메트로시티","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202301/1675058097701_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003177&lseq=414301-3_26","code":"1000003177"},{"title":"캠퍼","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650950296511_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003157&lseq=414301-3_27","code":"1000003157"},{"title":"아르마니","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202209/1663046337033_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003114&lseq=414301-3_28","code":"1000003114"},{"title":"마이클코어스...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202209/1663046383887_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003105&lseq=414301-3_29","code":"1000003105"},{"title":"로즈몽","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649937827212_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003108&lseq=414301-3_30","code":"1000003108"},{"title":"토리버치 워치","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202209/1663046106172_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003103&lseq=414301-3_31","code":"1000003103"},{"title":"진도","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649327658135_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003249&lseq=414301-3_32","code":"1000003249"},{"title":"마이클코어스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650936225700_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003136&lseq=414301-3_33","code":"1000003136"},{"title":"PHILIPPE MODEL","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647828661185_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003127&lseq=414301-3_34","code":"1000003127"},{"title":"프레드릭 콘스...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649748803811_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003104&lseq=414301-3_35","code":"1000003104"},{"title":"듀퐁","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647411926993_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003131&lseq=414301-3_36","code":"1000003131"}],[{"title":"UGG","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202209/1662345571622_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003945&lseq=414301-3_37","code":"1000003945"},{"title":"덱케","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646718768673_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003172&lseq=414301-3_38","code":"1000003172"},{"title":"닥터마틴","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647225828164_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003152&lseq=414301-3_39","code":"1000003152"}]],"groupBanner":{"bannrUrl":"http://www.gsshop.com/plan/shop/detail.gs?planseq=150401&lseq=413612","bannrImg":"https://image.gsshop.com//planprd/banner_MAINCORNER/585815348_01.jpg","bannrNm":"토리버치 공식"}},{"id":302,"largeId":null,"middleId":null,"name":"뷰티","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/39231383_02.png","groupMseq":"413759","jbpApi":"Y","jbpCd":"1000004352,1000004351,1000004007,1000003663,1000003630,1000003563,1000003461,1000003459,1000003458,1000003456,1000003442,1000003439,1000003437,1000003385,1000003384,1000003383,1000003380,1000003379,1000003220,1000003219,1000003218,1000003217,1000003216,1000003215,1000003214,1000003213,1000003212,1000003211,1000003210,1000003209,1000003208,1000003207,1000003205,1000003204,1000003203,1000003202,1000003201,1000003200,1000003198,1000003197,1000003196,1000003195,1000003194,1000003192,1000003191,1000003190,1000003186,1000003141,1000003139,1000003042,1000003041,1000003040","jbpNew":"","bannerCorner":"413611","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":1558551,"largeId":null,"middleId":null,"name":"명품화장품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1558551&lseq=414301-4&gsid=gnb-AU414301-AU414301-4","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1425746,"largeId":null,"middleId":null,"name":"스킨케어","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1425746&lseq=414301-4&gsid=gnb-AU414301-AU414301-4","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513104,"largeId":null,"middleId":null,"name":"선케어","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513104&lseq=414301-4&gsid=gnb-AU414301-AU414301-4","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513103,"largeId":null,"middleId":null,"name":"클렌징","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513103&lseq=414301-4&gsid=gnb-AU414301-AU414301-4","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1425804,"largeId":null,"middleId":null,"name":"베이스메이크업","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1425804&lseq=414301-4&gsid=gnb-AU414301-AU414301-4","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513102,"largeId":null,"middleId":null,"name":"헤어케어","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513102&lseq=414301-4&gsid=gnb-AU414301-AU414301-4","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1425860,"largeId":null,"middleId":null,"name":"바디케어","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1425860&lseq=414301-4&gsid=gnb-AU414301-AU414301-4","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513095,"largeId":null,"middleId":null,"name":"미용기기/헤어기기","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513095&lseq=414301-4&gsid=gnb-AU414301-AU414301-4","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513096,"largeId":null,"middleId":null,"name":"포인트메이크업","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513096&lseq=414301-4&gsid=gnb-AU414301-AU414301-4","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513094,"largeId":null,"middleId":null,"name":"향수","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513094&lseq=414301-4&gsid=gnb-AU414301-AU414301-4","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513093,"largeId":null,"middleId":null,"name":"네일케어/소품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513093&lseq=414301-4&gsid=gnb-AU414301-AU414301-4","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513099,"largeId":null,"middleId":null,"name":"마스크/팩","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513099&lseq=414301-4&gsid=gnb-AU414301-AU414301-4","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1519912,"largeId":null,"middleId":null,"name":"더마코스메틱","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1519912&lseq=414301-4&gsid=gnb-AU414301-AU414301-4","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513100,"largeId":null,"middleId":null,"name":"남성화장품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513100&lseq=414301-4&gsid=gnb-AU414301-AU414301-4","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":[[{"title":"SK-II","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1654142651815_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003190&lseq=414301-4_1","code":"1000003190"},{"title":"마녀공장","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649662002322_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003042&lseq=414301-4_2","code":"1000003042"},{"title":"센텔리안24","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649397189255_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003458&lseq=414301-4_3","code":"1000003458"},{"title":"참존","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1681806093080_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003196&lseq=414301-4_4","code":"1000003196"},{"title":"웰라쥬","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647415591174_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003439&lseq=414301-4_5","code":"1000003439"},{"title":"클럽클리오","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649727819485_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003379&lseq=414301-4_6","code":"1000003379"},{"title":"메이크업포에버","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647450134001_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003385&lseq=414301-4_7","code":"1000003385"},{"title":"오휘","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647410039433_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003218&lseq=414301-4_8","code":"1000003218"},{"title":"정샘물","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1648433289600_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003380&lseq=414301-4_9","code":"1000003380"},{"title":"AHC","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649396953479_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003461&lseq=414301-4_10","code":"1000003461"},{"title":"빌리프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647410799551_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003215&lseq=414301-4_11","code":"1000003215"},{"title":"한율","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649997339178_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003211&lseq=414301-4_12","code":"1000003211"}],[{"title":"아모레퍼시픽","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646818333914_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003202&lseq=414301-4_13","code":"1000003202"},{"title":"헤라","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646818160405_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003219&lseq=414301-4_14","code":"1000003219"},{"title":"설화수","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1679965843947_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003220&lseq=414301-4_15","code":"1000003220"},{"title":"닥터지","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646723965410_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003195&lseq=414301-4_16","code":"1000003195"},{"title":"프리메라","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202209/1662448319954_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003197&lseq=414301-4_17","code":"1000003197"},{"title":"실크테라피","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202205/1652677203452_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003442&lseq=414301-4_18","code":"1000003442"},{"title":"더 후","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647410188004_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003217&lseq=414301-4_19","code":"1000003217"},{"title":"닥터포헤어","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202205/1652675114455_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003459&lseq=414301-4_20","code":"1000003459"},{"title":"엘렌실라","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649405529836_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003383&lseq=414301-4_21","code":"1000003383"},{"title":"엘로엘","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1682473246758_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003041&lseq=414301-4_22","code":"1000003041"},{"title":"숨37º","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1679295070714_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003216&lseq=414301-4_23","code":"1000003216"},{"title":"바이탈뷰티","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649218502732_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003141&lseq=414301-4_24","code":"1000003141"}],[{"title":"김정문알로에","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202211/1667351739642_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003200&lseq=414301-4_25","code":"1000003200"},{"title":"이자녹스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650529752634_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003207&lseq=414301-4_26","code":"1000003207"},{"title":"에스트라","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649986936978_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003192&lseq=414301-4_27","code":"1000003192"},{"title":"CH6","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1680689442591_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004351&lseq=414301-4_28","code":"1000004351"},{"title":"달바","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649397254190_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003437&lseq=414301-4_29","code":"1000003437"},{"title":"해피바스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646291704831_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003210&lseq=414301-4_30","code":"1000003210"},{"title":"베리홉","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202210/1664862713906_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004007&lseq=414301-4_31","code":"1000004007"},{"title":"꼬달리","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1654768701914_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003198&lseq=414301-4_32","code":"1000003198"},{"title":"라네즈","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649986870633_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003213&lseq=414301-4_33","code":"1000003213"},{"title":"비오템","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202209/1664237984252_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003563&lseq=414301-4_34","code":"1000003563"},{"title":"JMW","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650612947307_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003204&lseq=414301-4_35","code":"1000003204"},{"title":"리엔케이","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1679902809601_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003194&lseq=414301-4_36","code":"1000003194"}],[{"title":"AK뷰티","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1682400524152_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003203&lseq=414301-4_37","code":"1000003203"},{"title":"LG프라엘","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202208/1660802619326_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003040&lseq=414301-4_38","code":"1000003040"},{"title":"로레알파리","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647496479496_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003205&lseq=414301-4_39","code":"1000003205"},{"title":"피지오겔","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650243443025_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003201&lseq=414301-4_40","code":"1000003201"},{"title":"마몽드","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649997352911_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003212&lseq=414301-4_41","code":"1000003212"},{"title":"랑콤","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1679536374357_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003630&lseq=414301-4_42","code":"1000003630"},{"title":"아이오페","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649986850118_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003214&lseq=414301-4_43","code":"1000003214"},{"title":"미쟝센","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646284561939_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003209&lseq=414301-4_44","code":"1000003209"},{"title":"려","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646285666607_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003208&lseq=414301-4_45","code":"1000003208"},{"title":"브이앤에이 뷰...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647323091909_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003139&lseq=414301-4_46","code":"1000003139"},{"title":"프라브아","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1680860001339_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004352&lseq=414301-4_47","code":"1000004352"},{"title":"르네휘테르","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1655687868189_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003663&lseq=414301-4_48","code":"1000003663"}],[{"title":"존슨앤존슨","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202211/1667788107880_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003456&lseq=414301-4_49","code":"1000003456"},{"title":"CEO퍼퓸","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647933071060_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003186&lseq=414301-4_50","code":"1000003186"},{"title":"사이오스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1648795014020_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003191&lseq=414301-4_51","code":"1000003191"},{"title":"베네피트","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1648182557740_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003384&lseq=414301-4_52","code":"1000003384"}]],"groupBanner":{"bannrUrl":"http://www.gsshop.com/deal/deal.gs?dealNo=68597041&lseq=413611","bannrImg":"https://image.gsshop.com//planprd/banner_MAINCORNER/582850288_01.jpg","bannrNm":"JMW BLDC 드라이기/고데기 BEST 특가+증정+추가적립"}},{"id":301,"largeId":null,"middleId":null,"name":"스포츠/레저","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/39231382_02.png","groupMseq":"404551","jbpApi":"Y","jbpCd":"1000004457,1000004434,1000004373,1000004331,1000004312,1000004311,1000004288,1000004250,1000004228,1000004148,1000004069,1000003665,1000003664,1000003584,1000003543,1000003507,1000003505,1000003418,1000003407,1000003363,1000003362,1000003359,1000003358,1000003299,1000003298,1000003296,1000003292,1000003284,1000003267,1000003258,1000003251,1000003238,1000003232,1000003229,1000003228,1000003224,1000003154,1000003068,1000003065,1000003064,1000003063,1000003061,1000003060,1000003058,1000003057,1000003056,1000003055,1000003054,1000003053,1000003052,1000003051,1000003050,1000003049,1000003048,1000003047,1000003046,1000003045,1000003038","jbpNew":"1000004457","bannerCorner":"413610","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":1378829,"largeId":null,"middleId":null,"name":"스포츠의류","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378829&lseq=414301-5&gsid=gnb-AU414301-AU414301-5","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513109,"largeId":null,"middleId":null,"name":"스포츠신발/용품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513109&lseq=414301-5&gsid=gnb-AU414301-AU414301-5","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378745,"largeId":null,"middleId":null,"name":"골프의류/용품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378745&lseq=414301-5&gsid=gnb-AU414301-AU414301-5","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378810,"largeId":null,"middleId":null,"name":"등산/아웃도어","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378810&lseq=414301-5&gsid=gnb-AU414301-AU414301-5","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378746,"largeId":null,"middleId":null,"name":"캠핑용품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378746&lseq=414301-5&gsid=gnb-AU414301-AU414301-5","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513098,"largeId":null,"middleId":null,"name":"낚시용품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513098&lseq=414301-5&gsid=gnb-AU414301-AU414301-5","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513108,"largeId":null,"middleId":null,"name":"구기/라켓","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513108&lseq=414301-5&gsid=gnb-AU414301-AU414301-5","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378800,"largeId":null,"middleId":null,"name":"수영/물놀이","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378800&lseq=414301-5&gsid=gnb-AU414301-AU414301-5","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378793,"largeId":null,"middleId":null,"name":"요가/헬스","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378793&lseq=414301-5&gsid=gnb-AU414301-AU414301-5","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378811,"largeId":null,"middleId":null,"name":"자전거/인라인","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378811&lseq=414301-5&gsid=gnb-AU414301-AU414301-5","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513106,"largeId":null,"middleId":null,"name":"스키/스노보드","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513106&lseq=414301-5&gsid=gnb-AU414301-AU414301-5","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":[[{"title":"데상트","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1685674819941_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003296&lseq=414301-5_1","code":"1000003296"},{"title":"엘로드","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1687920280476_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003046&lseq=414301-5_2","code":"1000003046"},{"title":"데상트 골프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1686634026037_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003055&lseq=414301-5_3","code":"1000003055"},{"title":"말본골프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1675760933916_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004228&lseq=414301-5_4","code":"1000004228"},{"title":"MLB","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202205/1653537849791_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003584&lseq=414301-5_5","code":"1000003584"},{"title":"아디다스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202209/1663825121977_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003224&lseq=414301-5_6","code":"1000003224"},{"title":"닥스골프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202207/1656923145558_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003664&lseq=414301-5_7","code":"1000003664"},{"title":"아식스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646980471168_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003154&lseq=414301-5_8","code":"1000003154"},{"title":"블랙야크","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1685596869015_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003251&lseq=414301-5_9","code":"1000003251"},{"title":"헤지스골프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1655340174215_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003665&lseq=414301-5_10","code":"1000003665"},{"title":"클리브랜드","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1684211865412_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003063&lseq=414301-5_11","code":"1000003063"},{"title":"AK골프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650003624405_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003068&lseq=414301-5_12","code":"1000003068"}],[{"title":"먼싱웨어","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1687158314205_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003053&lseq=414301-5_13","code":"1000003053"},{"title":"르꼬끄","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647407899368_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003284&lseq=414301-5_14","code":"1000003284"},{"title":"호원플래닛","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650261449567_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003363&lseq=414301-5_15","code":"1000003363"},{"title":"FIFA1904","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1686127014426_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004434&lseq=414301-5_16","code":"1000004434"},{"title":"르꼬끄 골프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1680847001543_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003054&lseq=414301-5_17","code":"1000003054"},{"title":"아레나","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202211/1667294571460_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004069&lseq=414301-5_18","code":"1000004069"},{"title":"디스커버리","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1651190456360_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003543&lseq=414301-5_19","code":"1000003543"},{"title":"밸롭","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1681087452154_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003299&lseq=414301-5_20","code":"1000003299"},{"title":"디아도라","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1676254526734_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004250&lseq=414301-5_21","code":"1000004250"},{"title":"스케쳐스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1681277036353_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003407&lseq=414301-5_22","code":"1000003407"},{"title":"이고진","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650260513609_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003359&lseq=414301-5_23","code":"1000003359"},{"title":"JDX","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202307/1688542164251_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003056&lseq=414301-5_24","code":"1000003056"}],[{"title":"컨버스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646978546006_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003298&lseq=414301-5_25","code":"1000003298"},{"title":"나이키","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1675729756586_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003292&lseq=414301-5_26","code":"1000003292"},{"title":"오니츠카타이거","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649055934434_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003238&lseq=414301-5_27","code":"1000003238"},{"title":"가민","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649316187895_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003362&lseq=414301-5_28","code":"1000003362"},{"title":"와이드앵글","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1676880287886_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003049&lseq=414301-5_29","code":"1000003049"},{"title":"네파","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1684223633811_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003267&lseq=414301-5_30","code":"1000003267"},{"title":"아이더","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1682558965830_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003505&lseq=414301-5_31","code":"1000003505"},{"title":"빈폴골프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1685940392343_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003061&lseq=414301-5_32","code":"1000003061"},{"title":"나이키골프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649387214416_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003038&lseq=414301-5_33","code":"1000003038"},{"title":"레노마골프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1685517605493_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003058&lseq=414301-5_34","code":"1000003058"},{"title":"코오롱스포츠","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1685428479806_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003507&lseq=414301-5_35","code":"1000003507"},{"title":"볼빅","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649643339930_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003060&lseq=414301-5_36","code":"1000003060"}],[{"title":"까스텔바작골프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647324162660_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003057&lseq=414301-5_37","code":"1000003057"},{"title":"다이나핏","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1686900444856_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003228&lseq=414301-5_38","code":"1000003228"},{"title":"언더아머","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1655949549525_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003229&lseq=414301-5_39","code":"1000003229"},{"title":"파리게이츠","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202209/1662525225709_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003050&lseq=414301-5_40","code":"1000003050"},{"title":"K2","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1682477534205_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003258&lseq=414301-5_41","code":"1000003258"},{"title":"왁","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1685587770679_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003047&lseq=414301-5_42","code":"1000003047"},{"title":"PXG","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1682406999142_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003045&lseq=414301-5_43","code":"1000003045"},{"title":"마스터바니","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650005838904_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003065&lseq=414301-5_44","code":"1000003065"},{"title":"엠에스알","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1678689572598_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004312&lseq=414301-5_45","code":"1000004312"},{"title":"웨스트우드","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1676595943815_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003418&lseq=414301-5_46","code":"1000003418"},{"title":"잭니클라우스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1684889038170_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003048&lseq=414301-5_47","code":"1000003048"},{"title":"테일러메이드...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1684483878685_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003064&lseq=414301-5_48","code":"1000003064"}],[{"title":"포트메인","description":"new","imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1688012563516_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004457&lseq=414301-5_49","code":"1000004457"},{"title":"PING","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202209/1663737461286_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003052&lseq=414301-5_50","code":"1000003052"},{"title":"하바이아나스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1682318610451_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004373&lseq=414301-5_51","code":"1000004373"},{"title":"팬텀","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1684809790180_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003051&lseq=414301-5_52","code":"1000003051"},{"title":"잠발란","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1678688997844_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004311&lseq=414301-5_53","code":"1000004311"},{"title":"휠라","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202207/1657156991618_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003232&lseq=414301-5_54","code":"1000003232"},{"title":"애시워스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1678326791780_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004331&lseq=414301-5_55","code":"1000004331"},{"title":"루이까스텔","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1681281428988_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004148&lseq=414301-5_56","code":"1000004148"},{"title":"클락스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1679915923781_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004288&lseq=414301-5_57","code":"1000004288"},{"title":"렉스파","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650247116757_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003358&lseq=414301-5_58","code":"1000003358"}]],"groupBanner":null},{"id":307,"largeId":null,"middleId":null,"name":"식품","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/39231397_02.png","groupMseq":"404554","jbpApi":"Y","jbpCd":"1000004451,1000004392,1000004374,1000004372,1000004360,1000004358,1000004355,1000004354,1000004334,1000004321,1000004320,1000004316,1000003524,1000003513,1000003511,1000003510,1000003509,1000003426,1000003377,1000003374,1000003373,1000003372,1000003371,1000003343,1000003339,1000003328,1000003326,1000003325,1000003318,1000003317,1000003316,1000003312,1000003301,1000003028,1000002276","jbpNew":"1000004451","bannerCorner":"413616","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":1596122,"largeId":null,"middleId":null,"name":"새벽배송","linkUrl":"https://www.gsshop.com/shop/module/moduleShop.gs?shopNumber=887&lseq=414301-6&gsid=gnb-AU414301-AU414301-6","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1584511,"largeId":null,"middleId":null,"name":"브레디크","linkUrl":"https://www.gsshop.com/shop/jbp/grandJbp.gs?jbpBrandCd=1000003524&lseq=414301-6&gsid=gnb-AU414301-AU414301-6","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1567180,"largeId":null,"middleId":null,"name":"신선연구소","linkUrl":"https://event.gsshop.com/event/s/freshfoodlab?lseq=414301-6&gsid=gnb-AU414301-AU414301-6","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378779,"largeId":null,"middleId":null,"name":"테이스티샵","linkUrl":"https://www.gsshop.com/shop/jbp/grandJbp.gs?jbpBrandCd=1000003603&lseq=414301-6&gsid=gnb-AU414301-AU414301-6","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1462660,"largeId":null,"middleId":null,"name":"농산물","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1462660&lseq=414301-6&gsid=gnb-AU414301-AU414301-6","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1462662,"largeId":null,"middleId":null,"name":"축산","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1462662&lseq=414301-6&gsid=gnb-AU414301-AU414301-6","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1462664,"largeId":null,"middleId":null,"name":"수산","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1462664&lseq=414301-6&gsid=gnb-AU414301-AU414301-6","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1462666,"largeId":null,"middleId":null,"name":"간편식/반찬","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1462666&lseq=414301-6&gsid=gnb-AU414301-AU414301-6","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1462668,"largeId":null,"middleId":null,"name":"가공식품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1462668&lseq=414301-6&gsid=gnb-AU414301-AU414301-6","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513101,"largeId":null,"middleId":null,"name":"과자/간식","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513101&lseq=414301-6&gsid=gnb-AU414301-AU414301-6","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1462672,"largeId":null,"middleId":null,"name":"건강식품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1462672&lseq=414301-6&gsid=gnb-AU414301-AU414301-6","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1462674,"largeId":null,"middleId":null,"name":"다이어트/뷰티","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1462674&lseq=414301-6&gsid=gnb-AU414301-AU414301-6","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1462670,"largeId":null,"middleId":null,"name":"커피/생수/음료","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1462670&lseq=414301-6&gsid=gnb-AU414301-AU414301-6","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1548269,"largeId":null,"middleId":null,"name":"주류","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1548269&lseq=414301-6&gsid=gnb-AU414301-AU414301-6","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":[[{"title":"내츄럴플러스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1651045353023_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003373&lseq=414301-6_1","code":"1000003373"},{"title":"비타민마을","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649401282364_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003374&lseq=414301-6_2","code":"1000003374"},{"title":"닥터린","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1683708411121_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004392&lseq=414301-6_3","code":"1000004392"},{"title":"종근당건강","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1681782057161_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003301&lseq=414301-6_4","code":"1000003301"},{"title":"CJ제일제당","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650877549305_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003326&lseq=414301-6_5","code":"1000003326"},{"title":"롯데칠성음료","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1681172092736_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004355&lseq=414301-6_6","code":"1000004355"},{"title":"동원","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1678949117051_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004334&lseq=414301-6_7","code":"1000004334"},{"title":"풀무원","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649408003981_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003325&lseq=414301-6_8","code":"1000003325"},{"title":"매일유업","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1680771507317_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004374&lseq=414301-6_9","code":"1000004374"},{"title":"티젠","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1680070619224_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004358&lseq=414301-6_10","code":"1000004358"},{"title":"스타벅스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650616543716_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003317&lseq=414301-6_11","code":"1000003317"},{"title":"엘루비","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1678347037551_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004316&lseq=414301-6_12","code":"1000004316"}],[{"title":"콴첼","description":"new","imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1688106105092_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004451&lseq=414301-6_13","code":"1000004451"},{"title":"프롬바이오","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650588900841_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003312&lseq=414301-6_14","code":"1000003312"},{"title":"덴마크유산균이...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649385938336_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003510&lseq=414301-6_15","code":"1000003510"},{"title":"천호엔케어","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649376472905_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003372&lseq=414301-6_16","code":"1000003372"},{"title":"에이치엘사이언...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202207/1658298578541_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003339&lseq=414301-6_17","code":"1000003339"},{"title":"비에날씬","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1678237956578_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000002276&lseq=414301-6_18","code":"1000002276"},{"title":"동서","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202209/1662013218300_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003513&lseq=414301-6_19","code":"1000003513"},{"title":"GNM자연의품격","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202207/1659083397016_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003328&lseq=414301-6_20","code":"1000003328"},{"title":"솔가","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649040142085_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003316&lseq=414301-6_21","code":"1000003316"},{"title":"브레디크","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650609869038_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003524&lseq=414301-6_22","code":"1000003524"},{"title":"에스더포뮬러","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1678148028123_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004321&lseq=414301-6_23","code":"1000004321"},{"title":"안국건강","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649401452063_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003509&lseq=414301-6_24","code":"1000003509"}],[{"title":"스키니랩","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647503567346_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003426&lseq=414301-6_25","code":"1000003426"},{"title":"셀티바","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1679627524745_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003371&lseq=414301-6_26","code":"1000003371"},{"title":"광동제약","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1680247391800_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004354&lseq=414301-6_27","code":"1000004354"},{"title":"CJ웰케어","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647854808898_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003343&lseq=414301-6_28","code":"1000003343"},{"title":"세노비스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650875632859_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003318&lseq=414301-6_29","code":"1000003318"},{"title":"대상웰라이프","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649311180872_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003377&lseq=414301-6_30","code":"1000003377"},{"title":"하이뮨","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1677832226096_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004320&lseq=414301-6_31","code":"1000004320"},{"title":"뉴온","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202304/1680771094909_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004372&lseq=414301-6_32","code":"1000004372"},{"title":"씨스팡","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1679993968083_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004360&lseq=414301-6_33","code":"1000004360"},{"title":"산과들에","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202207/1656899508571_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003511&lseq=414301-6_34","code":"1000003511"},{"title":"오뚜기","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649401784081_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003028&lseq=414301-6_35","code":"1000003028"}]],"groupBanner":null},{"id":305,"largeId":null,"middleId":null,"name":"출산/유아동","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/39231386_02.png","groupMseq":"404553","jbpApi":"Y","jbpCd":"1000004209,1000004168,1000004033,1000003878,1000003465,1000003417,1000003349,1000003348,1000003347,1000003344,1000003257,1000003256,1000003231,1000003222,1000003199,1000003143,1000003123,1000003092,1000003062,1000003031,1000001729","jbpNew":"","bannerCorner":"413614","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":1378774,"largeId":null,"middleId":null,"name":"임신/출산","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378774&lseq=414301-7&gsid=gnb-AU414301-AU414301-7","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378778,"largeId":null,"middleId":null,"name":"기저귀/물티슈/수유/이유","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378778&lseq=414301-7&gsid=gnb-AU414301-AU414301-7","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513097,"largeId":null,"middleId":null,"name":"목욕/위생용품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513097&lseq=414301-7&gsid=gnb-AU414301-AU414301-7","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378777,"largeId":null,"middleId":null,"name":"외출용품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378777&lseq=414301-7&gsid=gnb-AU414301-AU414301-7","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378783,"largeId":null,"middleId":null,"name":"신생아/유아의류","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378783&lseq=414301-7&gsid=gnb-AU414301-AU414301-7","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513107,"largeId":null,"middleId":null,"name":"주니어/키즈의류","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513107&lseq=414301-7&gsid=gnb-AU414301-AU414301-7","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1456167,"largeId":null,"middleId":null,"name":"유아가구/침구","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1456167&lseq=414301-7&gsid=gnb-AU414301-AU414301-7","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378789,"largeId":null,"middleId":null,"name":"유아동잡화","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378789&lseq=414301-7&gsid=gnb-AU414301-AU414301-7","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378790,"largeId":null,"middleId":null,"name":"장난감","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378790&lseq=414301-7&gsid=gnb-AU414301-AU414301-7","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":[[{"title":"꿈비","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1655796031087_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003062&lseq=414301-7_1","code":"1000003062"},{"title":"MLB키즈","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/201910/1571980397779_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000001729&lseq=414301-7_2","code":"1000001729"},{"title":"푸마키즈","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202211/1668561046645_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004033&lseq=414301-7_3","code":"1000004033"},{"title":"휠라키즈","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650961179264_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003231&lseq=414301-7_4","code":"1000003231"},{"title":"뉴발란스키즈","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202208/1660622652746_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003222&lseq=414301-7_5","code":"1000003222"},{"title":"스토케","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1684300476665_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004209&lseq=414301-7_6","code":"1000004209"},{"title":"부가부","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1655693699646_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003344&lseq=414301-7_7","code":"1000003344"},{"title":"영실업","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1654058012667_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003349&lseq=414301-7_8","code":"1000003349"},{"title":"레고","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650871878552_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003031&lseq=414301-7_9","code":"1000003031"},{"title":"내셔널지오그래...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1677826072962_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004168&lseq=414301-7_10","code":"1000004168"},{"title":"폴레드","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202209/1663034092371_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003878&lseq=414301-7_11","code":"1000003878"},{"title":"알집매트","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1654842122692_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003143&lseq=414301-7_12","code":"1000003143"}],[{"title":"오일릴리","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1648530633203_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003123&lseq=414301-7_13","code":"1000003123"},{"title":"네파키즈","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650605459886_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003417&lseq=414301-7_14","code":"1000003417"},{"title":"마이크로킥보드","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202205/1653464718176_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003347&lseq=414301-7_15","code":"1000003347"},{"title":"지오다노주니어","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650592144311_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003465&lseq=414301-7_16","code":"1000003465"},{"title":"모이몰른","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650877710839_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003257&lseq=414301-7_17","code":"1000003257"},{"title":"마미포코","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650941352714_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003092&lseq=414301-7_18","code":"1000003092"},{"title":"마미요","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650862245465_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003348&lseq=414301-7_19","code":"1000003348"},{"title":"아토팜","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202202/1645944227973_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003199&lseq=414301-7_20","code":"1000003199"},{"title":"꼬망스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650874979122_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003256&lseq=414301-7_21","code":"1000003256"}]],"groupBanner":null},{"id":306,"largeId":null,"middleId":null,"name":"가구/침구/홈데코","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/39239770_02.png","groupMseq":"404556","jbpApi":"Y","jbpCd":"1000004435,1000004431,1000004413,1000004229,1000004188,1000003724,1000003685,1000003629,1000003628,1000003386,1000003342,1000003336,1000003335,1000003333,1000003330,1000003101,1000003100,1000003097,1000003091,1000003090,1000003089,1000003086,1000003079,1000003036,1000003033,1000003032,1000003027","jbpNew":"","bannerCorner":"413615","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":1378814,"largeId":null,"middleId":null,"name":"거실가구","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378814&lseq=414301-8&gsid=gnb-AU414301-AU414301-8","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378815,"largeId":null,"middleId":null,"name":"침실가구","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378815&lseq=414301-8&gsid=gnb-AU414301-AU414301-8","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378821,"largeId":null,"middleId":null,"name":"사무/학생용가구","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378821&lseq=414301-8&gsid=gnb-AU414301-AU414301-8","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378822,"largeId":null,"middleId":null,"name":"주방가구","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378822&lseq=414301-8&gsid=gnb-AU414301-AU414301-8","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378763,"largeId":null,"middleId":null,"name":"침구","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378763&lseq=414301-8&gsid=gnb-AU414301-AU414301-8","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378766,"largeId":null,"middleId":null,"name":"커튼/카페트","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378766&lseq=414301-8&gsid=gnb-AU414301-AU414301-8","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378747,"largeId":null,"middleId":null,"name":"홈데코/인테리어소품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378747&lseq=414301-8&gsid=gnb-AU414301-AU414301-8","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378826,"largeId":null,"middleId":null,"name":"시공/DIY","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378826&lseq=414301-8&gsid=gnb-AU414301-AU414301-8","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378787,"largeId":null,"middleId":null,"name":"생활잡화/청소/수납","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378787&lseq=414301-8&gsid=gnb-AU414301-AU414301-8","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":[[{"title":"에몬스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1648797680559_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003089&lseq=414301-8_1","code":"1000003089"},{"title":"모던하우스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649134511926_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003033&lseq=414301-8_2","code":"1000003033"},{"title":"삼익가구","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649058082206_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003386&lseq=414301-8_3","code":"1000003386"},{"title":"우아미가구","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1656475536637_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003724&lseq=414301-8_4","code":"1000003724"},{"title":"바자르","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647828595205_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003036&lseq=414301-8_5","code":"1000003036"},{"title":"에싸","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1686706708722_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003336&lseq=414301-8_6","code":"1000003336"},{"title":"올리비아데코","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647245505242_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003100&lseq=414301-8_7","code":"1000003100"},{"title":"헬렌스타인","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647327626845_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003342&lseq=414301-8_8","code":"1000003342"},{"title":"포더홈","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202205/1653636161793_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003628&lseq=414301-8_9","code":"1000003628"},{"title":"레이디가구","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649063937459_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003032&lseq=414301-8_10","code":"1000003032"},{"title":"자코모","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202211/1667462423160_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003097&lseq=414301-8_11","code":"1000003097"},{"title":"카카오프렌즈","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650955710285_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003027&lseq=414301-8_12","code":"1000003027"}],[{"title":"maatila","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1687748046894_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004435&lseq=414301-8_13","code":"1000004435"},{"title":"시스디자인","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1655190251546_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003685&lseq=414301-8_14","code":"1000003685"},{"title":"까사미아","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1648535814363_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003335&lseq=414301-8_15","code":"1000003335"},{"title":"시몬스 침대","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649289664908_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003079&lseq=414301-8_16","code":"1000003079"},{"title":"아이데뉴","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202205/1653633842016_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003629&lseq=414301-8_17","code":"1000003629"},{"title":"한샘","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1648520940246_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003330&lseq=414301-8_18","code":"1000003330"},{"title":"지누스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1684229156744_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004413&lseq=414301-8_19","code":"1000004413"},{"title":"휴도","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202306/1686630508368_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004431&lseq=414301-8_20","code":"1000004431"},{"title":"템퍼","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1651196518780_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003086&lseq=414301-8_21","code":"1000003086"},{"title":"일룸","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1655164963129_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003091&lseq=414301-8_22","code":"1000003091"},{"title":"금성침대","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1648513355421_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003333&lseq=414301-8_23","code":"1000003333"},{"title":"SESA","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650938535730_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003101&lseq=414301-8_24","code":"1000003101"}],[{"title":"에이스 침대","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202208/1661308720582_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003090&lseq=414301-8_25","code":"1000003090"},{"title":"누하스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1676007356236_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004229&lseq=414301-8_26","code":"1000004229"},{"title":"크라우스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202301/1674636924752_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004188&lseq=414301-8_27","code":"1000004188"}]],"groupBanner":null},{"id":308,"largeId":null,"middleId":null,"name":"생활/주방","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/39239771_02.png","groupMseq":"404555","jbpApi":"Y","jbpCd":"1000004333,1000004169,1000003514,1000003454,1000003351,1000003102,1000003098,1000003096,1000003094,1000003070,1000003037","jbpNew":"","bannerCorner":"413617","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":1378780,"largeId":null,"middleId":null,"name":"주방용품/식기","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378780&lseq=414301-9&gsid=gnb-AU414301-AU414301-9","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378784,"largeId":null,"middleId":null,"name":"세제/세정/탈취제","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378784&lseq=414301-9&gsid=gnb-AU414301-AU414301-9","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378786,"largeId":null,"middleId":null,"name":"화장지/생리대","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378786&lseq=414301-9&gsid=gnb-AU414301-AU414301-9","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378787,"largeId":null,"middleId":null,"name":"생활잡화/청소/수납","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378787&lseq=414301-9&gsid=gnb-AU414301-AU414301-9","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378791,"largeId":null,"middleId":null,"name":"건강관리/실버","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378791&lseq=414301-9&gsid=gnb-AU414301-AU414301-9","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378824,"largeId":null,"middleId":null,"name":"자동차용품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378824&lseq=414301-9&gsid=gnb-AU414301-AU414301-9","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513105,"largeId":null,"middleId":null,"name":"자동차기기","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513105&lseq=414301-9&gsid=gnb-AU414301-AU414301-9","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1515981,"largeId":null,"middleId":null,"name":"공구/보안용품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1515981&lseq=414301-9&gsid=gnb-AU414301-AU414301-9","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378826,"largeId":null,"middleId":null,"name":"시공/DIY","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378826&lseq=414301-9&gsid=gnb-AU414301-AU414301-9","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378747,"largeId":null,"middleId":null,"name":"홈데코/인테리어소품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378747&lseq=414301-9&gsid=gnb-AU414301-AU414301-9","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1425860,"largeId":null,"middleId":null,"name":"바디케어","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1425860&lseq=414301-9&gsid=gnb-AU414301-AU414301-9","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1513102,"largeId":null,"middleId":null,"name":"헤어케어","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1513102&lseq=414301-9&gsid=gnb-AU414301-AU414301-9","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":[[{"title":"솔트레인","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1680251423927_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004333&lseq=414301-9_1","code":"1000004333"},{"title":"LG생활건강","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1678672445896_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003514&lseq=414301-9_2","code":"1000003514"},{"title":"WMF","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650866257817_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003098&lseq=414301-9_3","code":"1000003098"},{"title":"실리트","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650865181572_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003102&lseq=414301-9_4","code":"1000003102"},{"title":"쏘피 바디피트","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202303/1679988202959_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003094&lseq=414301-9_5","code":"1000003094"},{"title":"락앤락","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650868721487_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003037&lseq=414301-9_6","code":"1000003037"},{"title":"세라젬","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1651115349798_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003070&lseq=414301-9_7","code":"1000003070"},{"title":"베카","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202301/1673846930100_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004169&lseq=414301-9_8","code":"1000004169"},{"title":"센소다인","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202301/1672901093125_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003351&lseq=414301-9_9","code":"1000003351"},{"title":"테팔","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650865474757_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003096&lseq=414301-9_10","code":"1000003096"},{"title":"네퓨어","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1649400120160_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003454&lseq=414301-9_11","code":"1000003454"}]],"groupBanner":null},{"id":309,"largeId":null,"middleId":null,"name":"가전/디지털","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/39231390_02.png","groupMseq":"404557","jbpApi":"Y","jbpCd":"1000004437,1000003751,1000003419,1000003332,1000003331,1000003149,1000003148,1000003147,1000003088,1000003071,1000003044,1000003034,1000000268","jbpNew":"","bannerCorner":"413618","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":1378795,"largeId":null,"middleId":null,"name":"주방가전","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378795&lseq=414301-10&gsid=gnb-AU414301-AU414301-10","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378796,"largeId":null,"middleId":null,"name":"생활가전","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378796&lseq=414301-10&gsid=gnb-AU414301-AU414301-10","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378798,"largeId":null,"middleId":null,"name":"영상/음향가전","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378798&lseq=414301-10&gsid=gnb-AU414301-AU414301-10","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378797,"largeId":null,"middleId":null,"name":"공기청정/계절가전","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378797&lseq=414301-10&gsid=gnb-AU414301-AU414301-10","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378799,"largeId":null,"middleId":null,"name":"노트북/PC/게임","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378799&lseq=414301-10&gsid=gnb-AU414301-AU414301-10","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378805,"largeId":null,"middleId":null,"name":"카메라/캠코더","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378805&lseq=414301-10&gsid=gnb-AU414301-AU414301-10","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378803,"largeId":null,"middleId":null,"name":"휴대폰/태블릿","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378803&lseq=414301-10&gsid=gnb-AU414301-AU414301-10","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":[[{"title":"LG전자","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650611707813_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003071&lseq=414301-10_1","code":"1000003071"},{"title":"휴테크","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1651194597663_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003419&lseq=414301-10_2","code":"1000003419"},{"title":"Dyson","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202206/1655451081418_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003044&lseq=414301-10_3","code":"1000003044"},{"title":"필립스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202302/1677040931098_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000000268&lseq=414301-10_4","code":"1000000268"},{"title":"삼성 갤럭시","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202207/1658729782901_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003751&lseq=414301-10_5","code":"1000003751"},{"title":"위닉스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650846584842_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003147&lseq=414301-10_6","code":"1000003147"},{"title":"샤크","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202305/1685518019832_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000004437&lseq=414301-10_7","code":"1000004437"},{"title":"삼성전자","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202205/1651471244606_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003148&lseq=414301-10_8","code":"1000003148"},{"title":"드롱기","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202205/1653610219458_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003331&lseq=414301-10_9","code":"1000003331"},{"title":"캐리어","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202205/1653028313028_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003149&lseq=414301-10_10","code":"1000003149"},{"title":"SK매직","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202204/1650528334266_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003088&lseq=414301-10_11","code":"1000003088"},{"title":"네스프레소","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1646209619017_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003332&lseq=414301-10_12","code":"1000003332"}],[{"title":"발뮤다","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647324816890_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003034&lseq=414301-10_13","code":"1000003034"}]],"groupBanner":null},{"id":312,"largeId":null,"middleId":null,"name":"반려/도서/취미","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/39231393_02.png","groupMseq":"404560","jbpApi":"N","jbpCd":"","jbpNew":"","bannerCorner":"413621","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":1378807,"largeId":null,"middleId":null,"name":"강아지/고양이","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378807&lseq=414301-11&gsid=gnb-AU414301-AU414301-11","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"N","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378809,"largeId":null,"middleId":null,"name":"관상어/곤충/소동물","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378809&lseq=414301-11&gsid=gnb-AU414301-AU414301-11","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"N","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378820,"largeId":null,"middleId":null,"name":"도서/음반","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378820&lseq=414301-11&gsid=gnb-AU414301-AU414301-11","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"N","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378823,"largeId":null,"middleId":null,"name":"문구/사무용품","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378823&lseq=414301-11&gsid=gnb-AU414301-AU414301-11","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"N","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378801,"largeId":null,"middleId":null,"name":"악기","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378801&lseq=414301-11&gsid=gnb-AU414301-AU414301-11","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"N","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":null,"groupBanner":null},{"id":311,"largeId":null,"middleId":null,"name":"여행/티켓/보험","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/39231392_02.png","groupMseq":"404561","jbpApi":"N","jbpCd":"","jbpNew":"","bannerCorner":"413620","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":1378816,"largeId":null,"middleId":null,"name":"해외여행","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378816&lseq=414301-12&gsid=gnb-AU414301-AU414301-12","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"N","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378817,"largeId":null,"middleId":null,"name":"제주여행","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378817&lseq=414301-12&gsid=gnb-AU414301-AU414301-12","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"N","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378818,"largeId":null,"middleId":null,"name":"국내/레저 여행","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378818&lseq=414301-12&gsid=gnb-AU414301-AU414301-12","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"N","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378819,"largeId":null,"middleId":null,"name":"e티켓","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378819&lseq=414301-12&gsid=gnb-AU414301-AU414301-12","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"N","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1225483,"largeId":null,"middleId":null,"name":"GS보험샵","linkUrl":"https://insu.gsshop.com/index.jsp?media=ZK&lseq=414301-12&gsid=gnb-AU414301-AU414301-12","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"N","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1611797,"largeId":null,"middleId":null,"name":"상조","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1611797&lseq=414301-12&gsid=gnb-AU414301-AU414301-12","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"N","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":null,"groupBanner":{"bannrUrl":"http://insu.gsshop.com/event/2014_12/apply_Ligdirect.jsp?1=1&lseq=413620","bannrImg":"https://image.gsshop.com//planprd/banner_MAINCORNER/548815941_01.png","bannrNm":"KB다이렉트보험"}},{"id":113,"largeId":null,"middleId":null,"name":"렌탈샵","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/56064691_02.png","groupMseq":"404562","jbpApi":"N","jbpCd":"","jbpNew":"","bannerCorner":"413622","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":1178474,"largeId":null,"middleId":null,"name":"GS렌탈샵","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1178474&lseq=414301-13&gsid=gnb-AU414301-AU414301-13","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"N","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":null,"groupBanner":{"bannrUrl":"http://www.gsshop.com/prd/prd.gs?prdid=1032152493&lseq=null","bannrImg":"https://image.gsshop.com//planprd/banner_MAINCORNER/null","bannrNm":"코웨이[본사직영]렌탈 최고혜택_아이콘 시리즈"}},{"id":111,"largeId":null,"middleId":null,"name":"백화점","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/39231395_02.png","groupMseq":"404558","jbpApi":"Y","jbpCd":"1000003189,1000003188,1000003187,1000003182,1000003181,1000003180,1000003179,1000003039","jbpNew":"","bannerCorner":"413623","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":1556536,"largeId":null,"middleId":null,"name":"롯데백화점","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1556536&lseq=414301-14&gsid=gnb-AU414301-AU414301-14","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1556047,"largeId":null,"middleId":null,"name":"현대백화점","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1556047&lseq=414301-14&gsid=gnb-AU414301-AU414301-14","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1562941,"largeId":null,"middleId":null,"name":"AK백화점","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1562941&lseq=414301-14&gsid=gnb-AU414301-AU414301-14","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"Y","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":[[{"title":"록시땅","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202207/1656663187736_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003039&lseq=414301-14_1","code":"1000003039"},{"title":"발몽","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1648182740510_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003189&lseq=414301-14_2","code":"1000003189"},{"title":"클라랑스","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1648182130757_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003182&lseq=414301-14_3","code":"1000003182"},{"title":"샹테카이","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647450362126_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003188&lseq=414301-14_4","code":"1000003188"},{"title":"아쿠아 디 파르...","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647450651427_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003180&lseq=414301-14_5","code":"1000003180"},{"title":"코익퍼퓸","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202301/1673590701785_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003187&lseq=414301-14_6","code":"1000003187"},{"title":"트루동","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647450804903_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003179&lseq=414301-14_7","code":"1000003179"},{"title":"크리드","description":null,"imageUrl":"https://image.gsshop.com/jbp/jbpBrand/202203/1647450521834_1.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/jbp/main.gs?jbpBrandCd=1000003181&lseq=414301-14_8","code":"1000003181"}]],"groupBanner":null},{"id":112,"largeId":null,"middleId":null,"name":"테마관","linkUrl":null,"sectTypeCode":null,"count":null,"iconImg":"https://image.gsshop.com/planprd/banner_MOBILE/54560316_02.png","groupMseq":"419112","jbpApi":"N","jbpCd":"","jbpNew":"","bannerCorner":"","logo":"","largeSeq":null,"largeExposYn":"","childSectionList":[{"id":1584511,"largeId":null,"middleId":null,"name":"브레디크","linkUrl":"https://www.gsshop.com/shop/jbp/grandJbp.gs?jbpBrandCd=1000003524&lseq=414301-15&gsid=gnb-AU414301-AU414301-15","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"N","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null},{"id":1378752,"largeId":null,"middleId":null,"name":"해외직구","linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378752&lseq=414301-15&gsid=gnb-AU414301-AU414301-15","sectTypeCode":"L","count":null,"iconImg":null,"groupMseq":null,"jbpApi":"N","jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":null,"groupBanner":null}],"cmmItemList":null,"groupBanner":null}],[{"id":null,"largeId":null,"middleId":null,"name":"SHOP in GS SHOP","linkUrl":null,"sectTypeCode":"PARTNER","count":null,"iconImg":null,"groupMseq":null,"jbpApi":null,"jbpCd":null,"jbpNew":null,"bannerCorner":null,"logo":null,"largeSeq":null,"largeExposYn":null,"childSectionList":[],"cmmItemList":[[{"title":"GS프레시몰","description":null,"imageUrl":"https://image.gsshop.com//planprd/banner_NEW_ETC/57722182_01.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1453884","code":null},{"title":"와인25+","description":null,"imageUrl":"https://image.gsshop.com//planprd/banner_NEW_ETC/94899612_01.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/wine/main.gs","code":null},{"title":"어바웃펫","description":"#679aff","imageUrl":"https://image.gsshop.com//planprd/banner_NEW_ETC/78998381_01.jpg","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/sect/partners.gs?sectid=1547041","code":null},{"title":"GS가 구하다","description":null,"imageUrl":"https://image.gsshop.com//planprd/banner_NEW_ETC/77105942_01.jpg","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/sect/partners.gs?sectid=1550043","code":null},{"title":"브리치","description":null,"imageUrl":"https://image.gsshop.com//planprd/banner_NEW_ETC/56642874_01.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/sect/partners.gs?sectid=1515713","code":null},{"title":"SkinRX","description":null,"imageUrl":"https://image.gsshop.com//planprd/banner_NEW_ETC/56642885_01.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/sect/partners.gs?sectid=1472711","code":null},{"title":"1300K","description":null,"imageUrl":"https://image.gsshop.com//planprd/banner_NEW_ETC/56642662_01.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1056320","code":null},{"title":"텐바이텐","description":null,"imageUrl":"https://image.gsshop.com//planprd/banner_NEW_ETC/56642649_01.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1216230","code":null},{"title":"아트박스","description":null,"imageUrl":"https://image.gsshop.com//planprd/banner_NEW_ETC/56642667_01.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1298634","code":null},{"title":"알파문구","description":null,"imageUrl":"https://image.gsshop.com//planprd/banner_NEW_ETC/56640683_01.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1449132","code":null},{"title":"바보사랑","description":null,"imageUrl":"https://image.gsshop.com//planprd/banner_NEW_ETC/56640684_01.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1378767","code":null},{"title":"하프클럽","description":null,"imageUrl":"https://image.gsshop.com//planprd/banner_NEW_ETC/56642536_01.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/sect/sectL.gs?sectid=1248788","code":null},{"title":"패션플러스","description":null,"imageUrl":"https://image.gsshop.com//planprd/banner_NEW_ETC/56640686_01.png","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/sect/partners.gs?sectid=1490433","code":null},{"title":"모다아울렛","description":null,"imageUrl":"https://image.gsshop.com//planprd/banner_NEW_ETC/260440506_01.jpg","logoImageUrl":null,"imageType":null,"linkUrl":"https://www.gsshop.com/shop/sect/partners.gs?sectid=1585388","code":null}]],"groupBanner":null}]],"prdFlg":false,"compatibleBroswer":true}
</script>

		<script type="application/json" id="ga-data">
	{"uid":"","gender":"U","catvid":"0","wa_pcid":"LJKYgJ1gwjGIL7RLo4eFo","login":"X","gd":"U","age":"0"}
</script>


		<!-- 컨텐츠 영역 -->
		<div class="main_mainContents__GXYBn2">
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
								<a class="on" href="/shop/tv/tvShopMain.gs?lseq=409695"><span>ON
										AIR</span></a>
								<!-- 활성화 클래스 on -->
								<a href="/shop/tv/tvScheduleMain.gs?lseq=409696"><span>방송편성표</span></a>

								<a href="/shop/tv/phoneAlarm/phoneAlarmMain.gs?lseq=409697"><span>방송알림</span></a>
							</nav>

							<!-- pgm 레이어 -->
							<article id="modal-pgm" class="modal-layer">
								<header>
									<h1>TV쇼핑 스페셜 프로그램</h1>
								</header>
								<main>
									<ul>


										<li><a
											href="/shop/tveshop/pgminfo/specialPgm.gs?pgmId=11670&lseq=409698"><img
												src="//image.gsshop.com/planprd/banner_ETC/518134775_02.jpg"
												alt="쇼미더트렌드"></a></li>



										<li><a
											href="/shop/tveshop/pgminfo/specialPgm.gs?pgmId=13136&lseq=409698"><img
												src="//image.gsshop.com/planprd/banner_ETC/52893904_02.jpg"
												alt="더 컬렉션"></a></li>



										<li><a
											href="/shop/tveshop/pgminfo/specialPgm.gs?pgmId=13231&lseq=409698"><img
												src="//image.gsshop.com/planprd/banner_ETC/514808505_02.jpg"
												alt="뷰티시그널"></a></li>



										<li><a
											href="/shop/tveshop/pgminfo/specialPgm.gs?pgmId=13206&lseq=409698"><img
												src="//image.gsshop.com/planprd/banner_ETC/76363682_02.jpg"
												alt="최은경의 W"></a></li>



										<li><a
											href="/shop/tveshop/pgminfo/specialPgm.gs?pgmId=13284&lseq=409698"><img
												src="//image.gsshop.com/planprd/banner_ETC/51785875_02.jpg"
												alt="요즘핫픽"></a></li>



										<li><a
											href="/shop/tveshop/pgminfo/specialPgm.gs?pgmId=13287&lseq=409698"><img
												src="//image.gsshop.com/planprd/banner_ETC/514209773_02.jpg"
												alt="마이뷰티클럽"></a></li>



										<li><a
											href="/shop/tveshop/pgminfo/specialPgm.gs?pgmId=13313&lseq=409698"><img
												src="//image.gsshop.com/planprd/banner_ETC/75194295_02.jpg"
												alt="똑소리"></a></li>


									</ul>
								</main>
								<button class="close-btn g" onclick="closeLayer('#modal-pgm')">닫기</button>
							</article>

						</section>
					</header>



					<!-- 메인 컨텐츠 -->
					<section id="tv-index">
						<div id="on-air">
							<!-- 동영상 플레이어 -->
							<div id="on-air-player">
								<video id="videojs-player"
									class="video-js vjs-fluid placeholder" playsinline></video>
							</div>
							<div id="player-control" class="ready">
								<div id="player-control-inner">
									<div class="ctrlbox-A nav">
										<button class="play">
											<span class="blind">재생</span>
										</button>
										<p id="rtimeWrap" class="times">
											<span class="blind">남은시간</span><span id="rtime">00:00:00</span>
										</p>
									</div>
									<div class="ctrlbox-B nav">
										<button class="stop">
											<strong class="blind">일시정지</strong>
										</button>
									</div>
									<div class="ctrlbox-C">
										<button class="fullscreen">
											<span class="blind">전체화면</span>
										</button>

										<button class="go">
											<strong class="blind">상품보기</strong>
										</button>

										<button class="volume">
											<span class="blind">볼륨</span>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!--// on-air -->

						<!-- 현재 방송중인 상품 : 메인 페이지  on air와 같은 구조 -->
						<article id="on-air-prd"></article>
					</section>
					<!--// tv-index -->

					<!-- 이전/다음 방송 -->
					<article id="tv-schedule" class="item-module typeE"></article>

					<article class="item-module typeC tv-best">
						<h3 class="mod-tit">
							패션의류 Best
							<div class="more-detail">
								<a
									href="/shop/sect/sectM.gs?sectid&#x3D;1087057&amp;lseq&#x3D;424867">더보기</a>
							</div>
						</h3>
						<div class="outline-wrap">
							<section class="mod-stage">
								<ul>

									<li><a
										href="https://www.gsshop.com/deal/deal.gs?dealNo=1034842032&sectid=1087057&kwd=421220_1087057&gsid=cateshop-mresult&rank=1&ab=df&mseq=424781-1"
										class="prd-item" data-prdid="1034842032"
										onclick="PrdObject.setLatestViewedPrd(this);">
											<div class="prd-img">

												<img src="https://asset.m-gs.kr/prod/1034842032/1/370"
													onerror="this.src='//image.gsshop.com/mi13/img/etc/no_img_214.gif'"
													alt="상품이미지"> <span class="badge-abs"> </span> <span
													class="toggle-zzim" id="toggle-zzim_1034842032">찜완료</span>


												<button class="link-new-tab"
													onclick="PrdObject.openNewTab('https://www.gsshop.com/deal/deal.gs?dealNo=1034842032&sectid=1087057&kwd=421220_1087057&gsid=cateshop-mresult&rank=1&ab=df&mseq=424781-1'); return false;">
													<i class="sprite-new-tab"></i>새창 열기
												</button>



											</div>

											<dl class="prd-info">
												<dt class="prd-name">

													<span class="color-cyan">[TV상품]</span> [TV패션][29,900~]*썸머
													시즌오프~50%OFF* 무료배송+반품
												</dt>


												<dd class="price-info" data-exposPrcTypCd="4"
													data-exposPrdTypCd="P" data-consultProduct="false"
													data-rentPrc="0">




													<span class="price"> <span class="set-price">
															<strong>29,900</strong>원~
													</span>


													</span>
													<!-- //price -->
												</dd>





												<dd class="user-side"></dd>


												<dd class="advantage">
													<div>


														<span>무료배송</span>


													</div>
												</dd>
											</dl>
									</a></li>

									<li><a
										href="https://www.gsshop.com/prd/prd.gs?prdid=1029371908&sectid=1087057&kwd=421220_1087057&gsid=cateshop-mresult&rank=2&ab=df&mseq=424781-2"
										class="prd-item" data-prdid="1029371908"
										onclick="PrdObject.setLatestViewedPrd(this);">
											<div class="prd-img">

												<img src="https://asset.m-gs.kr/prod/1029371908/1/370"
													onerror="this.src='//image.gsshop.com/mi13/img/etc/no_img_214.gif'"
													alt="상품이미지"> <span class="badge-abs"> </span> <span
													class="toggle-zzim" id="toggle-zzim_1029371908">찜완료</span>


												<button class="link-new-tab"
													onclick="PrdObject.openNewTab('https://www.gsshop.com/prd/prd.gs?prdid=1029371908&sectid=1087057&kwd=421220_1087057&gsid=cateshop-mresult&rank=2&ab=df&mseq=424781-2'); return false;">
													<i class="sprite-new-tab"></i>새창 열기
												</button>



											</div>

											<dl class="prd-info">
												<dt class="prd-name">

													<span class="color-cyan">[TV상품]</span> [런칭가99,900원]스테파넬 썸머
													시티 셋업 2종 (린넨 라이크)
												</dt>


												<dd class="price-info" data-exposPrcTypCd="2"
													data-exposPrdTypCd="P" data-consultProduct="false"
													data-rentPrc="0">





													<span class="price"> <span class="set-price"><strong>69,900</strong>원</span>



													</span>
													<!-- //price -->
												</dd>





												<dd class="user-side"></dd>


												<dd class="advantage">
													<div>


														<span class="color-red">VIP할인</span> <span
															class="color-red">2회 적립금</span> <span>무료배송</span> <span>무이자</span>


													</div>
												</dd>
											</dl>
									</a></li>

									<li><a
										href="https://www.gsshop.com/prd/prd.gs?prdid=1029061671&sectid=1087057&kwd=421220_1087057&gsid=cateshop-mresult&rank=3&ab=df&mseq=424781-3"
										class="prd-item" data-prdid="1029061671"
										onclick="PrdObject.setLatestViewedPrd(this);">
											<div class="prd-img">

												<img src="https://asset.m-gs.kr/prod/1029061671/1/370"
													onerror="this.src='//image.gsshop.com/mi13/img/etc/no_img_214.gif'"
													alt="상품이미지"> <span class="badge-abs"> </span> <span
													class="toggle-zzim" id="toggle-zzim_1029061671">찜완료</span>


												<button class="link-new-tab"
													onclick="PrdObject.openNewTab('https://www.gsshop.com/prd/prd.gs?prdid=1029061671&sectid=1087057&kwd=421220_1087057&gsid=cateshop-mresult&rank=3&ab=df&mseq=424781-3'); return false;">
													<i class="sprite-new-tab"></i>새창 열기
												</button>



											</div>

											<dl class="prd-info">
												<dt class="prd-name">

													<span class="color-cyan">[TV상품]</span> [23SS최신상]나인식스뉴욕
													린넨블렌디드 셔츠블라우스 3종
												</dt>


												<dd class="price-info" data-exposPrcTypCd="2"
													data-exposPrdTypCd="P" data-consultProduct="false"
													data-rentPrc="0">





													<span class="price"> <span class="set-price"><strong>49,900</strong>원</span>



													</span>
													<!-- //price -->
												</dd>





												<dd class="user-side"></dd>


												<dd class="advantage">
													<div>


														<span class="color-red">2회 적립금</span> <span>무료배송</span>


													</div>
												</dd>
											</dl>
									</a></li>

									<li><a
										href="https://www.gsshop.com/prd/prd.gs?prdid=1029060864&sectid=1087057&kwd=421220_1087057&gsid=cateshop-mresult&rank=4&ab=df&mseq=424781-4"
										class="prd-item" data-prdid="1029060864"
										onclick="PrdObject.setLatestViewedPrd(this);">
											<div class="prd-img">

												<img src="https://asset.m-gs.kr/prod/1029060864/1/370"
													onerror="this.src='//image.gsshop.com/mi13/img/etc/no_img_214.gif'"
													alt="상품이미지"> <span class="badge-abs"> </span> <span
													class="toggle-zzim" id="toggle-zzim_1029060864">찜완료</span>


												<button class="link-new-tab"
													onclick="PrdObject.openNewTab('https://www.gsshop.com/prd/prd.gs?prdid=1029060864&sectid=1087057&kwd=421220_1087057&gsid=cateshop-mresult&rank=4&ab=df&mseq=424781-4'); return false;">
													<i class="sprite-new-tab"></i>새창 열기
												</button>



											</div>

											<dl class="prd-info">
												<dt class="prd-name">

													<span class="color-cyan">[TV상품]</span> [23SS최신상]나인식스뉴욕 코튼
													반팔 티셔츠 5종
												</dt>


												<dd class="price-info" data-exposPrcTypCd="2"
													data-exposPrdTypCd="P" data-consultProduct="false"
													data-rentPrc="0">





													<span class="price"> <span class="set-price"><strong>59,900</strong>원</span>



													</span>
													<!-- //price -->
												</dd>





												<dd class="user-side"></dd>


												<dd class="advantage">
													<div>


														<span class="color-red">VIP할인</span> <span
															class="color-red">2회 적립금</span> <span>무료배송</span> <span>무이자</span>


													</div>
												</dd>
											</dl>
									</a></li>

								</ul>
							</section>
						</div>
					</article>

					<article class="item-module typeC tv-best">
						<h3 class="mod-tit">
							식품 Best
							<div class="more-detail">
								<a
									href="/shop/sect/sectM.gs?sectid&#x3D;1087055&amp;lseq&#x3D;424867">더보기</a>
							</div>
						</h3>
						<div class="outline-wrap">
							<section class="mod-stage">
								<ul>

									<li><a
										href="https://www.gsshop.com/prd/prd.gs?prdid=1032636407&sectid=1087055&kwd=421220_1087055&gsid=cateshop-mresult&rank=1&ab=df&mseq=424781-1"
										class="prd-item" data-prdid="1032636407"
										onclick="PrdObject.setLatestViewedPrd(this);">
											<div class="prd-img">

												<img src="https://asset.m-gs.kr/prod/1032636407/1/370"
													onerror="this.src='//image.gsshop.com/mi13/img/etc/no_img_214.gif'"
													alt="상품이미지"> <span class="badge-abs"> </span> <span
													class="toggle-zzim" id="toggle-zzim_1032636407">찜완료</span>


												<button class="link-new-tab"
													onclick="PrdObject.openNewTab('https://www.gsshop.com/prd/prd.gs?prdid=1032636407&sectid=1087055&kwd=421220_1087055&gsid=cateshop-mresult&rank=1&ab=df&mseq=424781-1'); return false;">
													<i class="sprite-new-tab"></i>새창 열기
												</button>



											</div>

											<dl class="prd-info">
												<dt class="prd-name">

													<span class="color-cyan">[TV상품]</span> 알렉스 튀겨나온 돈까스 14팩(등심
													8,치즈 3,새우 3), 돈까스 소스 1병
												</dt>


												<dd class="price-info" data-exposPrcTypCd="2"
													data-exposPrdTypCd="P" data-consultProduct="false"
													data-rentPrc="0">


													<span class="price-discount"><span>2</span>%</span> <span
														class="price"> <del class="price-upper">40,900원</del>


														<span class="set-price"><strong>39,900</strong>원</span>



													</span>
													<!-- //price -->
												</dd>





												<dd class="user-side"></dd>


												<dd class="advantage">
													<div>


														<span class="color-red">2회 적립금</span> <span>무료배송</span>


													</div>
												</dd>
											</dl>
									</a></li>

									<li><a
										href="https://www.gsshop.com/prd/prd.gs?prdid=1021809053&sectid=1087055&kwd=421220_1087055&gsid=cateshop-mresult&rank=2&ab=df&mseq=424781-2"
										class="prd-item" data-prdid="1021809053"
										onclick="PrdObject.setLatestViewedPrd(this);">
											<div class="prd-img">

												<img src="https://asset.m-gs.kr/prod/1021809053/1/370"
													onerror="this.src='//image.gsshop.com/mi13/img/etc/no_img_214.gif'"
													alt="상품이미지"> <span class="badge-abs"> <span
													class="onair-info">07.06(목) 18:35 방송</span>
												</span> <span class="toggle-zzim" id="toggle-zzim_1021809053">찜완료</span>


												<button class="link-new-tab"
													onclick="PrdObject.openNewTab('https://www.gsshop.com/prd/prd.gs?prdid=1021809053&sectid=1087055&kwd=421220_1087055&gsid=cateshop-mresult&rank=2&ab=df&mseq=424781-2'); return false;">
													<i class="sprite-new-tab"></i>새창 열기
												</button>



											</div>

											<dl class="prd-info">
												<dt class="prd-name">

													<span class="color-cyan">[TV상품]</span> (종가집) 종가 전라도식 포기김치
													11kg (5.5kg X 2)
												</dt>


												<dd class="price-info" data-exposPrcTypCd="2"
													data-exposPrdTypCd="P" data-consultProduct="false"
													data-rentPrc="0">





													<span class="price"> <span class="set-price"><strong>79,900</strong>원</span>



													</span>
													<!-- //price -->
												</dd>





												<dd class="user-side"></dd>


												<dd class="advantage">
													<div>


														<span class="color-red">2회 적립금</span> <span>무료배송</span> <span>무이자</span>


													</div>
												</dd>
											</dl>
									</a></li>

									<li><a
										href="https://www.gsshop.com/prd/prd.gs?prdid=1021808629&sectid=1087055&kwd=421220_1087055&gsid=cateshop-mresult&rank=3&ab=df&mseq=424781-3"
										class="prd-item" data-prdid="1021808629"
										onclick="PrdObject.setLatestViewedPrd(this);">
											<div class="prd-img">

												<img src="https://asset.m-gs.kr/prod/1021808629/1/370"
													onerror="this.src='//image.gsshop.com/mi13/img/etc/no_img_214.gif'"
													alt="상품이미지"> <span class="badge-abs"> <span
													class="onair-info">07.06(목) 18:35 방송</span>
												</span> <span class="toggle-zzim" id="toggle-zzim_1021808629">찜완료</span>


												<button class="link-new-tab"
													onclick="PrdObject.openNewTab('https://www.gsshop.com/prd/prd.gs?prdid=1021808629&sectid=1087055&kwd=421220_1087055&gsid=cateshop-mresult&rank=3&ab=df&mseq=424781-3'); return false;">
													<i class="sprite-new-tab"></i>새창 열기
												</button>



											</div>

											<dl class="prd-info">
												<dt class="prd-name">

													<span class="color-cyan">[TV상품]</span> (종가집) 종가 중부식 포기김치
													11kg (5.5kg X 2)
												</dt>


												<dd class="price-info" data-exposPrcTypCd="2"
													data-exposPrdTypCd="P" data-consultProduct="false"
													data-rentPrc="0">





													<span class="price"> <span class="set-price"><strong>79,900</strong>원</span>



													</span>
													<!-- //price -->
												</dd>





												<dd class="user-side"></dd>


												<dd class="advantage">
													<div>


														<span class="color-red">2회 적립금</span> <span>무료배송</span> <span>무이자</span>


													</div>
												</dd>
											</dl>
									</a></li>

									<li><a
										href="https://www.gsshop.com/prd/prd.gs?prdid=1034210759&sectid=1087055&kwd=421220_1087055&gsid=cateshop-mresult&rank=4&ab=df&mseq=424781-4"
										class="prd-item" data-prdid="1034210759"
										onclick="PrdObject.setLatestViewedPrd(this);">
											<div class="prd-img">

												<img src="https://asset.m-gs.kr/prod/1034210759/1/370"
													onerror="this.src='//image.gsshop.com/mi13/img/etc/no_img_214.gif'"
													alt="상품이미지"> <span class="badge-abs"> </span> <span
													class="toggle-zzim" id="toggle-zzim_1034210759">찜완료</span>


												<button class="link-new-tab"
													onclick="PrdObject.openNewTab('https://www.gsshop.com/prd/prd.gs?prdid=1034210759&sectid=1087055&kwd=421220_1087055&gsid=cateshop-mresult&rank=4&ab=df&mseq=424781-4'); return false;">
													<i class="sprite-new-tab"></i>새창 열기
												</button>



											</div>

											<dl class="prd-info">
												<dt class="prd-name">

													<span class="color-cyan">[TV상품]</span> 미국 워싱턴 체리 2.0kg 내외
													(500g*4팩) 항공직송
												</dt>


												<dd class="price-info" data-exposPrcTypCd="2"
													data-exposPrdTypCd="P" data-consultProduct="false"
													data-rentPrc="0">





													<span class="price"> <span class="set-price"><strong>39,900</strong>원</span>



													</span>
													<!-- //price -->
												</dd>





												<dd class="user-side"></dd>


												<dd class="advantage">
													<div>


														<span class="color-red">2회 적립금</span> <span>무료배송</span>


													</div>
												</dd>
											</dl>
									</a></li>

								</ul>
							</section>
						</div>
					</article>



					<article class="item-module" id="prd-content">


						<h3 class="mod-tit">TV Best 상품</h3>

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


