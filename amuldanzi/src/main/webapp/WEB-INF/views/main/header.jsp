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

  .searchResultsContainer {
    position: fixed;
    top: 30%;
    left: 80%;
    transform: translate(-50%, -50%);
    padding: 20px;
    background-color: white;
    border: 1px solid #ccc;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    max-width: 500px;
    width: 80%; /* Adjust the width as needed */
    border-radius: 5px;
    overflow: hidden;
    z-index: 999;
    display: none;
  }

  .searchResultsHeader {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
  }

  .searchResultsContent {
    max-height: 300px; /* Set the maximum height for the search results container */
    overflow-y: auto;
  }

  .communityResults,
  .noticeResults {
    list-style: none;
    padding: 0;
  }

  .communityResults li,
  .noticeResults li {
    font-size: 16px;
    margin-bottom: 5px;
    padding: 5px;
    border-radius: 3px;
    background-color: #f5f5f5;
  }

  .communityResults li a,
  .noticeResults li a {
    color: #333;
    text-decoration: none;
  }

  .communityResults li a:hover,
  .noticeResults li a:hover {
    color: #007bff;
  }
</style>
<!-- 섬머노트 추가--> 
<link rel="stylesheet" href="/mypage/css/summernote/summernote-lite.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/mypage/js/summernote/summernote-lite.js"></script>
<script src="/mypage/js/summernote/lang/summernote-ko-KR.js"></script>

<script type="text/javascript">
$(document).ready(function() {

    var searchResultsContainer = $("#searchResults");
    searchResultsContainer.hide();
    var searchInput = $("#searchForm input[type='text']");
    var isResultsVisible = false; // 검색 결과 컨테이너가 보이는지 여부를 저장할 변수

    // 검색 입력 상자에 마우스가 올라갔을 때 이벤트 리스너를 추가합니다
    searchInput.click(function() { 
		
        if (isResultsVisible) {
            searchResultsContainer.hide(); // 검색 결과를 숨깁니다
            isResultsVisible = false;
        } else {
            // ElasticSearch에 커뮤니티 검색 결과를 요청하는 AJAX 요청을 보냅니다
            $.ajax({
                url: "http://localhost:9200/community/_search", // 커뮤니티 인덱스에 대한 ElasticSearch 엔드포인트
                method: "GET",
                data: {
                    match_all: {}
                },
                success: function(response) {
                    // ElasticSearch 응답을 처리하고 커뮤니티 검색 결과를 동적으로 표시합니다
                    var results = response.hits.hits; 
                    displayCommunityResults(results);
                    
                },
                error: function(error) {
                    console.error("커뮤니티 검색 결과를 가져오는 중 오류가 발생했습니다:", error);
                }
            });

            // ElasticSearch에 공지글 검색 결과를 요청하는 AJAX 요청을 보냅니다
            $.ajax({
                url: "http://localhost:9200/notice/_search", // 공지글 인덱스에 대한 ElasticSearch 엔드포인트
                method: "GET",
                data: {
                    match_all: {}
                },
                success: function(response) {
                    // ElasticSearch 응답을 처리하고 공지글 검색 결과를 동적으로 표시합니다
                    var results = response.hits.hits; 
                    displayNoticeResults(results);
                },
                error: function(error) {
                    console.error("공지글 검색 결과를 가져오는 중 오류가 발생했습니다:", error);
                }
            }); 
            searchResultsContainer.show();
            isResultsVisible = true;
        }
    });

    // 커뮤니티 검색 결과를 화면에 표시하는 함수
    function displayCommunityResults(results) {
        var communityResultsContainer = $("<ul></ul>");

        results.sort(function(a, b) {
            return b._source.comm_no - a._source.comm_no;
        }); 
        
        for (var i = 0; i < Math.min(results.length, 3); i++) {
            var source = results[i]._source;
            var commNo = source.comm_no;
            var commTitle = source.comm_title;
            var resultItem = "<li>◎<a href='/community/communityDetail?comm_no=" + commNo + "' style='font-size: 25px;'>" + commTitle + "</a></li>";
            communityResultsContainer.append(resultItem);
        }
        // 검색 결과 컨테이너를 비우고 커뮤니티 검색 결과 추가
        searchResultsContainer.find(".communityResults").empty().append(communityResultsContainer);
        // 검색 결과를 보이도록 설정
        searchResultsContainer.show();
    }

    // 공지글 검색 결과를 화면에 표시하는 함수
    function displayNoticeResults(results) {
        var noticeResultsContainer = $("<ul></ul>");
        
        results.sort(function(a, b) {
            return b._source.id - a._source.id;
        });
        
        for (var i = 0; i < Math.min(results.length, 3); i++) {
            var source = results[i]._source;
            var noticeId = source.id;
            var noticeTitle = source.title;
            var resultItem = "<li>◎<a href='/notice/noticeDetail?title=" + noticeTitle + "' style='font-size: 25px;'>" + noticeTitle + "</a></li>";
            noticeResultsContainer.append(resultItem);
        }
 
        // 검색 결과 컨테이너에 공지글 검색 결과 추가
        searchResultsContainer.find(".noticeResults").empty().append(noticeResultsContainer);
        // 검색 결과를 보이도록 설정
        searchResultsContainer.show();
        
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
											<a rel="noopener noreferrer" href="/mypage/qnalist" class="popper_popperTab__LvzGS">
											<img src="/icons/shop/SHOP_CAT_BTN2.png"><div class="popper_popperMenu__8QpIV">1:1문의</div></a>
											<hr class="popper_popperMenuDivider__j1QQj">
											<a rel="noopener noreferrer" href="/mypage/orderlist" class="popper_popperTab__LvzGS">
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
								</div>  
							</div>
							  <div id="searchResults" class="searchResultsContainer">
						    <div class="searchResultsHeader">최신 글</div>
						    <div class="searchResultsContent">
						      <ul class="communityResults"></ul>
						      <ul class="noticeResults"></ul>
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