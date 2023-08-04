<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="light-theme">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<link rel="icon" href="/admin/production/images/favicon.ico" type="image/ico" />
<title>구매내역</title>

<link rel="stylesheet" href="/chunks/css/market/marketOld.css" media="all" />
<link rel="preload" href="/chunks/css/market/marketShop.css" as="style" />
<link rel="stylesheet" href="/chunks/css/market/marketShop.css" />
<link rel="preload" href="/chunks/css/market/marketShop2.css" as="style" />
<link rel="stylesheet" href="/chunks/css/market/marketShop2.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700&display=swap">

<style type="text/css">
.cat {
  position: absolute;
  left: 500px;
  top: 500px;
  z-index: 999;
}

._3nqg3y0 {
    height: 80rem !important;
    padding: 0 1rem;
}

/*탭팬 스타일*/
.tabs {
    display: flex;
    justify-content: center;
    padding: 10px;
    /* border-bottom: 1px solid #ccc; */
}

.tab {
	width: 200px;
	height: 60px;
    padding: 10px 20px;
    cursor: pointer;
    border: 1px solid #ccc;
    background-color: white;
}

.tab.active {
    background-color: #f1f1f1;
}

.tab-content {
    display: none;
    padding: 20px;
}

.tab-content.active {
    display: block;
}
/*탭팬 스타일 끝*/

.bold-text {
    font-weight: bold;
}

.gray-text {
    color: gray;
}

.h3class {
    color: #333 !important;
    margin-top: 25px !important;
    font-size: 20px;
    font-weight: bold;
    font-family: 'Pacifico', sans-serif;
}


.pclass {
    color: #555 !important;
    margin-bottom: 10px !important;
    font-size: 16px;
	font-family: 'Lato', sans-serif; 
}

.boxbox {
    background-color: #f0f8ff; /* 연한 파란색 배경 */
    padding: 10px; /* 각 박스의 내용을 더욱 구분하기 위해 패딩을 추가 */
    border-radius: 5px; /* 모서리를 둥글게 만듭니다. */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
}

/* 상품 정보를 담을 컨테이너 */
.product-container {
    display: flex;
    align-items: center;
    padding: 10px;
    border: 1px solid #ccc;
    margin-bottom: 10px;
    background-color: white;
}

/* 상품 이미지 스타일 */
.product-image {
    width: 100px;
    height: 100px;
    object-fit: cover;
    margin-right: 20px;
}

/* 상품 정보 스타일 */
.product-info {
    flex: 1;
    display: flex; /* 수평 정렬을 위해 추가 */
    flex-direction: column; /* 내부 컨텐츠를 수직으로 배치 */
    justify-content: center; /* 가운데 정렬을 위해 추가 */
}

.product-name {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 5px;
}

.product-price {
    font-size: 14px;
    color: #333; /* 가격은 검은색으로 표시 */
}

.product-cnacle {
    font-size: 14px;
    color: red; /* 결제취소 빨간색으로 표시 */
}

.product-confirm {
    font-size: 14px;
    font-weight: bold; /* 결제완료 굵게 표시 */
}

.product-quantity {
    font-size: 14px;
    color: #333; /* 수량은 회색으로 표시 */
    font-weight: bold;
}

.product-invoice {
    font-size: 14px;
    color: #333; /* 송장번호는 검은색으로 표시 */
    margin-top: auto; /* 수직 가운데 정렬을 위해 추가 */
    text-align: center; /* 가운데 정렬을 위해 추가 */
}

.product-orderdate{
    font-size: 12px;
    color: #777; /* 결제일은 회색으로 표시 */

}

/* 고객센터 */
  .costomerCenter {
    position: relative;
    display: inline-block;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    text-decoration: none;
    font-size: 16px;
    border-radius: 5px;
    overflow: hidden;
  }

  .costomerCenter::before {
    font-size: 36px;
    position: absolute;
	left: 8px;
    top: 50%;
    transform: translate(-50%, -50%) rotate(-45deg);
    z-index: -1;
  }

  .costomerCenter:hover {
    background-color: #45a049;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
  }
</style>

<script src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base-4b55f04bb2798d1f6aa4e078c0ad3504ef4993ad4123005ec35dde545e5788bd.js"></script>
<script type="text/javascript">
$(function(){
	showTab(1);
});

// 탭팬 호출
/*function showTab(tabNumber) {
    // 모든 탭과 탭 내용을 비활성화
    var tabs = document.getElementsByClassName('tab');
    var tabContents = document.getElementsByClassName('tab-content');
    for (var i = 0; i < tabs.length; i++) {
        tabs[i].classList.remove('active');
        tabContents[i].classList.remove('active');
    }

    // 선택한 탭과 해당 탭 내용을 활성화
    var selectedTab = document.getElementById('tab' + tabNumber + '-content');
    selectedTab.classList.add('active');
    tabs[tabNumber - 1].classList.add('active');
}*/


</script>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body class="hoian-kr">
<c:if test="${not empty selectCharacter}">
	<img class='cat' src='/character/images/${selectCharacter}' id="cat"/>
</c:if> 
	<div class="__margin-top120px" >
		<section class="_3nqg3y0">
			<div class="_3nqg3y1 _1ff3f302">
			    <div class="tabs">
			        <div class="tab" onclick="showTab(1)"><div class="bold-text">주문내역</div><div class="gray-text">주문/배송안내</div></div>
			        <div class="tab" onclick="showTab(2)"><div class="bold-text">0</div><div class="gray-text">준비중</div></div>
			        <div class="tab" onclick="showTab(3)"><div class="bold-text">0</div><div class="gray-text">배송중</div></div>
			        <div class="tab" onclick="showTab(4)"><div class="bold-text"><c:out value="${orderOlistSize}"/></div><div class="gray-text">배송완료</div></div>
			        <div class="tab" onclick="showTab(5)"><div class="bold-text"><c:out value="${orderXlistSize}"/></div><div class="gray-text">결제취소</div></div>
			    </div>
			
			    <div class="tab-content" id="tab1-content">
			        <!-- Tab 1 내용 --><br/><br/>
			        <div class="boxbox"><br/>
				        <span class="h3class">유의사항</span><br/><br/>
				        <p class="pclass">＊배송조회는 택배사로 상품전달 후 조회 가능합니다.</p>
				        <p class="pclass">＊주문한 상품이 품절될 경우 해당 상품은 자동 취소 신청됩니다.</p><br/>
			        </div><br/>
			        <div class="boxbox"><br/>
			        	<span class="h3class">카드결제(간편결제,법인카드 포함) 취소 안내</span><br/><br/>
				        <p class="pclass">＊카드결제 취소 기간 안내</p>
				        <p class="pclass"> -전체취소 : 당일 취소/환불 처리</p>			        
				        <p class="pclass"> -부분취소 : 영업일 기준 3~5일 소요(당일 취소 포함)</p>
				        <p class="pclass">＊카드사 정책에 따라 주문당일 부분취소한 경우 당일 취소 및 환불 불가합니다.</p>
				        <p class="pclass">＊부분취소한 경우 카드사 승인 취소는 약 3~5일 소요됩니다.</p>
				        <p class="pclass">＊주문취소시 오류가 발생하거나 환불이 정상 처리되지 않을 경우 1:1로 문의 주시기 바랍니다.</p><br/>
			        </div>			        			        			        			        
			    </div>
			
			    <div class="tab-content" id="tab2-content">
			        <!-- Tab 2 내용 -->
			        <br/><br/><h3>준비중인 상품이 없습니다</h3><br/><br/><br/><br/>
			        <h3>상품을 주문해 주세요^^</h4>
			    </div>
			
			    <div class="tab-content" id="tab3-content">
			        <!-- Tab 3 내용 -->
			        <br/><br/><h3>배송중인 상품이 없습니다</h3><br/><br/><br/><br/>
			        <h3>상품을 주문해 주세요~~ㅇ!!</h4>
			    </div>
			
			    <div class="tab-content" id="tab4-content">
			        <!-- Tab 4 내용 -->
    				<!-- 리스트의 현재 페이지에 해당하는 상품 목록을 가져오기 -->
	    			<c:forEach var="product" items="${orderOList}">        
							<div class="product-container">
							    <div class="product-info">
							        <div class="product-name">${product.commerceName}(<span class="product-confirm"> 배송완료 </span>)</div>
							        <div class="product-invoice">송장번호: ${product.trackingNumber}</div>					        
							        <div class="product-price">${String.format("%.0f", product.price / product.count)}(원) * ${product.count}(개)</div><br/>
							        <div class="product-quantity">총 주문금액 : ${product.price}원</div><br/>
							        <div class="product-orderdate">결제일: ${product.payDate}</div><br/>
							        <div><a href="#" class="costomerCenter">고객센터 채팅연결</a></div>
							        
							    </div>
							    <img class="product-image" src="/images/commerce/${product.img}" alt="상품 이미지">					    
							</div>
					</c:forEach>
					<!-- 리스트의 현재 페이지에 해당하는 상품 목록을 가져오기 끝-->
					<!-- 페이징 -->
				    <c:choose>
				        <c:when test="${totalPages1 > 1}">
				            <ul class="pagination">
				                <c:forEach var="i" begin="1" end="${totalPages1}">
				                    <li class="${currentPage1 == i ? 'active' : ''}">
				                        <a href="#" onclick="loadTabContent(4, ${i}, ${currentPage2})">${i}</a>
				                    </li>
				                </c:forEach>
				            </ul>
				        </c:when>
				    </c:choose>	
				    <!-- 페이징 끝-->				
			    </div>
			
			    <div class="tab-content" id="tab5-content">
			        <!-- Tab 5 내용 -->
     				<!-- 리스트의 현재 페이지에 해당하는 상품 목록을 가져오기 -->
	    			<c:forEach var="product" items="${orderXList}">      
							<div class="product-container">
							    <div class="product-info">
							        <div class="product-name">${product.commerceName}( <span class="product-cnacle"> 결제취소 </span>)</div>
							        <div class="product-invoice">송장번호: ${product.trackingNumber}</div>					        
							        <div class="product-price">${String.format("%.0f", product.price / product.count)}(원) * ${product.count}(개)</div><br/>
							        <div class="product-quantity">총 환불금액 : ${product.payDate}원</div><br/>
							        <div class="product-orderdate">결제일: </div><br/>
							        <div><a href="#" class="costomerCenter">고객센터 채팅연결</a></div>
							        
							    </div>
							    <img class="product-image" src="/images/commerce/${product.img}" alt="상품 이미지">					    
							</div>
					</c:forEach>
					<!-- 리스트의 현재 페이지에 해당하는 상품 목록을 가져오기 끝-->
					<!-- 페이징 -->
				    <c:choose>
				        <c:when test="${totalPages2 > 1}">
				            <ul class="pagination">
				                <c:forEach var="i" begin="1" end="${totalPages2}">
				                    <li class="${currentPage2 == i ? 'active' : ''}">
				                        <a href="#" onclick="loadTabContent(5, ${currentPage1}, ${i})">${i}</a>
				                    </li>
				                </c:forEach>
				            </ul>
				        </c:when>
				    </c:choose>	
				    <!-- 페이징 끝-->	
			    </div>
			    			
			</div>
		</section>
	</div>
<script type="text/javascript">
function loadTabContent(tabNumber, page1, page2) {
    $.ajax({
        type: 'GET',
        url: '/mypage/orderlistPage',
        data: {
            tabNumber: tabNumber,
            page1: page1,
            page2: page2
        },
        dataType : 'html',
        success: function (data) {
        	console.log(data)
            $('#tab' + tabNumber + '-content').html(data);
        },
        error: function (error) {
            console.error(error);
        }
    });
}

function showTab(tabNumber) {
    // 모든 탭 컨텐츠를 숨깁니다.
    $('.tab-content').hide();

    // 선택한 탭 컨텐츠를 표시합니다.
    $('#tab' + tabNumber + '-content').show();

    // 선택한 탭에 active 클래스를 추가합니다.
    $('.tab').removeClass('active');
    $('.tab:eq(' + (tabNumber - 1) + ')').addClass('active');

    // 선택한 탭의 컨텐츠를 가져와 첫 번째 페이지를 표시합니다.
    //loadTabContent(tabNumber, 1, 1);
}
</script>	
</body>
</html>