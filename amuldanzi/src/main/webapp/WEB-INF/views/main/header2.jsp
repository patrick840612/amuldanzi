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
<style type="text/css">
.yoonmiyoonmi{
 margin-left: 140px;

}

</style>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
<!-- 섬머노트 추가--> 
<link rel="stylesheet" href="/mypage/css/summernote/summernote-lite.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 섬머노트 추가 -->
<script src="/mypage/js/summernote/summernote-lite.js"></script>
<script src="/mypage/js/summernote/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#searchForm").submit(function(event) {
        event.preventDefault();
        var query = $("input[name='query']").val();
        searchAndDisplayResults(query);
    });

    $("#searchForm").mouseenter(function() {
        // 마우스를 검색 창 위에 올렸을 때 Elasticsearch로 커뮤니티 카테고리 전체 검색 결과를 요청합니다.
        // 필요에 따라 AJAX 요청을 사용하거나, Spring Boot에서 REST API를 호출하여 데이터를 가져올 수 있습니다.

        // 가져온 결과를 가지고 결과를 동적으로 표시합니다.
        // 예를 들어, 커뮤니티 카테고리 전체 검색 결과를 리스트로 표시할 수 있습니다.
        // 실제로는 적절한 방법으로 결과를 동적으로 추가합니다.
        var communitySearchResults = ["결과1", "결과2", "결과3"]; // 가상의 결과

        var searchResultsDiv = $("<div></div>");
        searchResultsDiv.text("커뮤니티 카테고리 전체 검색 결과: " + communitySearchResults.join(", "));
        $("#searchResults").empty().append(searchResultsDiv);
    });

    function searchAndDisplayResults(query) {
        // 검색 요청과 결과 표시는 이전 답변에서 설명한 방법을 따릅니다.
        // Elasticsearch로 검색 요청을 보내고 결과를 동적으로 표시하는 로직을 구현합니다.
        // 필요에 따라 HTML 템플릿을 사용하여 결과를 표시하거나, DOM 조작을 통해 결과를 동적으로 생성하는 방법을 사용할 수 있습니다.
    }
});


</script>
</head>
<body>
	<div id="__next">							
		<div class="Header_headerArea__tufnp">
			<header class="Header_headerContainer__m5wGA">
				<div class="Header_contents__f5njA">
					<a href="/admin/adminMain"><img src="/images/logo1.png" class="Header_headerLogo__yE0Pv"></a>
					<nav class="Header_headerList__D3V50">
						<ul>
							<li class="Header_headerLi__6LLa5"><a
								class="Header_defaultMenu__cursorNone">나의 반려 동물</a>
								<div></div>
								<div class="Header_headerCircle__x9lE1"></div>
								<div class="Header_shopPopper__4_A07">
									<div class="popper_popperContainer__OLokH">
										<div class="popper_popperMenuList__Hk3b2">
											<a   rel="noopener noreferrer" href="../pet/gps"
												class="popper_popperTab__LvzGS"> <img
												src="/icons/shop/SHOP_CAT_BTN2.png">
												<div class="popper_popperMenu__8QpIV">위치찾기</div>
											</a>
											<hr class="popper_popperMenuDivider__j1QQj">
											<a   rel="noopener noreferrer" href="../pet/blood"
												class="popper_popperTab__LvzGS"> <img
												src="/icons/shop/SHOP_CAT_BTN2.png">
												<div class="popper_popperMenu__8QpIV">혈액나눔정보</div>
											</a>
											<hr class="popper_popperMenuDivider__j1QQj">
											<a   rel="noopener noreferrer" href="../pet/emotion"
												class="popper_popperTab__LvzGS"> <img
												src="/icons/shop/SHOP_CAT_BTN2.png">
												<div class="popper_popperMenu__8QpIV">표정맞추기</div>
											</a>
										</div>
									</div>
								</div></li>
							<li class="Header_headerLi__6LLa5"><a
								class="Header_defaultMenu__cursorNone">마켓</a>
								<div></div>
								<div class="Header_headerCircle__x9lE1"></div>
								<div class="Header_shopPopper__4_A07">
									<div class="popper_popperContainer__OLokH">
										<div class="popper_popperMenuList__Hk3b2">
											<a rel="noopener noreferrer" href="/market/gsHomeShop"
												class="popper_popperTab__LvzGS"><img
												src="/icons/shop/SHOP_CAT_BTN2.png">
												<div class="popper_popperMenu__8QpIV">라이브 커머스</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">
											<a rel="noopener noreferrer" href="/market/carrot"
												class="popper_popperTab__LvzGS"><img
												src="/icons/shop/SHOP_CAT_BTN2.png">
												<div class="popper_popperMenu__8QpIV">중고장터</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">
											<a   rel="noopener noreferrer" href="/market/carrotShop"
												class="popper_popperTab__LvzGS"><img
												src="/icons/shop/SHOP_CAT_BTN2.png">
												<div class="popper_popperMenu__8QpIV">쇼핑몰</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">
											<a   rel="noopener noreferrer" href="/market/dolbomiShop"
												class="popper_popperTab__LvzGS"><img
												src="/icons/shop/SHOP_CAT_BTN2.png">
												<div class="popper_popperMenu__8QpIV">돌보미</div></a>
										</div>
									</div>
								</div></li>
							<li class="Header_headerLi__6LLa5"><a
								class="Header_defaultMenu__cursorNone">게시판</a>
								<div class="Header_headerCircle__x9lE1"></div>
								<div class="Header_shopPopper__4_A07">
									<div class="popper_popperContainer__OLokH">
										<div class="popper_popperMenuList__Hk3b2">
											<a rel="noopener noreferrer" href="/notice/notice"
												class="popper_popperTab__LvzGS"><img
												src="/icons/shop/SHOP_CAT_BTN2.png">
												<div class="popper_popperMenu__8QpIV">공지사항</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">

											<a rel="noopener noreferrer" href="/clinic/clinicInfo"
												class="popper_popperTab__LvzGS"><img
												src="/icons/shop/SHOP_CAT_BTN2.png">
												<div class="popper_popperMenu__8QpIV">병원/마켓정보</div></a> 
											<hr class="popper_popperMenuDivider__j1QQj">
											<a class="popper_popperTab__LvzGS" href="/education/education"><img
												src="/icons/shop/SHOP_CAT_BTN2.png" >
												<div class="popper_popperMenu__8QpIV">교육정보</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">
											<a rel="noopener noreferrer" href="/care/care"
												class="popper_popperTab__LvzGS"><img
												src="/icons/shop/SHOP_CAT_BTN2.png">
												<div class="popper_popperMenu__8QpIV">케어정보</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">


										</div>
									</div>
								</div></li>
							<li class="Header_headerLi__6LLa5"><a
								class="Header_defaultMenu__cursor" href="/community/communityList">커뮤니티</a>
								<div></div></li>
							<li class="Header_headerLi__6LLa5">
							
							<!-- 비 로그인시 -->
							<c:if test="${memberRole == '' || memberRole == null}">
								<a class="Header_defaultMenu__cursor" href="/login/loginpage">로그인</a>
							</c:if>
							
							<c:if test="${memberRole == '관리자'}">
								<a class="Header_defaultMenu__cursor" href="/admin/adminMain">관리자</a>
							</c:if>
							
							<c:if test="${memberRole == '일반회원'}">
								<a class="Header_defaultMenu__cursorNone">마이페이지</a>
								<div class="Header_headerCircle__x9lE1"></div>
								<div class="Header_shopPopper__4_A07">
									<div class="popper_popperContainer__OLokH">
										<div class="popper_popperMenuList__Hk3b2">
											<a rel="noopener noreferrer" href="/mypage/memberinfo" class="popper_popperTab__LvzGS">
											<img src="/icons/shop/SHOP_CAT_BTN2.png"><div class="popper_popperMenu__8QpIV">회원정보관리</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">
											<a rel="noopener noreferrer" href="/mypage/sitter"	class="popper_popperTab__LvzGS">
											<img src="/icons/shop/SHOP_CAT_BTN2.png"><div class="popper_popperMenu__8QpIV">돌보미신청</div></a> 
											<hr class="popper_popperMenuDivider__j1QQj">
											<a class="popper_popperTab__LvzGS" href="/mypage/business">
											<img src="/icons/shop/SHOP_CAT_BTN2.png" ><div class="popper_popperMenu__8QpIV">사업자등록</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">
											<a rel="noopener noreferrer" href="/" class="popper_popperTab__LvzGS">
											<img src="/icons/shop/SHOP_CAT_BTN2.png"><div class="popper_popperMenu__8QpIV">1:1문의</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">
											<a rel="noopener noreferrer" href="/" class="popper_popperTab__LvzGS">
											<img src="/icons/shop/SHOP_CAT_BTN2.png"><div class="popper_popperMenu__8QpIV">구매내역</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">
										</div>
									</div>
								</div>
							</c:if>


								<div></div></li>
					</nav>
							<div class="main_contents__NGg5K">
								<div class="input_inputContainer__1ypW_">
									<c:if test="${!(memberRole == '' || memberRole == null)}">
										<a rel="noopener noreferrer" href="/login/logout" class="popper_popperTab__LvzGS yoonmiyoonmi">로그아웃</a>
									</c:if>
									<form id = "searchForm" action="/main/search" method="get">
									  <img src="/icons/ICON-24px-Search.svg" class="input_searchInputImg__T1BVk">
									  <input type="text" name="query" placeholder="통합 검색" maxlength="130" class="input_searchInput__SF1GC" enterkeyhint="search">
									</form>
									
									
									<div id = "searchResults">  
									
									
									</div>
							</div>
					
					
					
					
				</div>
				<div class="TopMenu_menuList__AMnXb">
					<div class="TopMenu_menuWrapper__L1uFn">
						<div class="TopMenu_headerLi__K58vU">
							<a class="TopMenu_defaultMenu__gPZP3" href="/"><div>나의 반려 동물</div></a>
						</div>
						<div class="TopMenu_headerLi__K58vU">
							<a class="TopMenu_defaultMenu__gPZP3" href="/"><div>마켓</div></a>
						</div>
						<div class="TopMenu_headerLi__K58vU">
							<a class="TopMenu_activeMenu__Vm4sT" href="/"><div>게시판</div></a>
						</div>
						<div class="TopMenu_headerLi__K58vU">
							<a class="TopMenu_defaultMenu__gPZP3" href="/"><div>커뮤니티</div></a>
						</div>
						<div class="TopMenu_headerLi__K58vU">
							<c:if test="${memberRole == '' || memberRole == null}">
								<a class="Header_defaultMenu__cursor" href="/login/loginpage">로그인</a>
							</c:if>
							
							<c:if test="${memberRole == '관리자'}">
								<a class="Header_defaultMenu__cursor" href="/admin/adminMain">관리자</a>
							</c:if>
							
							<c:if test="${memberRole == '일반회원'}">
								<a class="Header_defaultMenu__cursorNone">마이페이지</a>
								<div class="Header_headerCircle__x9lE1"></div>
								<div class="Header_shopPopper__4_A07">
									<div class="popper_popperContainer__OLokH">
										<div class="popper_popperMenuList__Hk3b2">
											<a rel="noopener noreferrer" href="/" class="popper_popperTab__LvzGS">
											<img src="/icons/shop/SHOP_CAT_BTN2.png"><div class="popper_popperMenu__8QpIV">회원정보관리</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">
											<a rel="noopener noreferrer" href="/"	class="popper_popperTab__LvzGS">
											<img src="/icons/shop/SHOP_CAT_BTN2.png"><div class="popper_popperMenu__8QpIV">돌보미신청</div></a> 
											<hr class="popper_popperMenuDivider__j1QQj">
											<a class="popper_popperTab__LvzGS" href="/">
											<img src="/icons/shop/SHOP_CAT_BTN2.png" ><div class="popper_popperMenu__8QpIV">사업자등록</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">
											<a rel="noopener noreferrer" href="/" class="popper_popperTab__LvzGS">
											<img src="/icons/shop/SHOP_CAT_BTN2.png"><div class="popper_popperMenu__8QpIV">1:1문의</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">
											<a rel="noopener noreferrer" href="/" class="popper_popperTab__LvzGS">
											<img src="/icons/shop/SHOP_CAT_BTN2.png"><div class="popper_popperMenu__8QpIV">구매내역</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">
										</div>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<br/>
			</header>
			</div>
		</div>
</body>
</html>