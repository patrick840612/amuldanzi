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

<style type="text/css">
.cat {
  position: absolute;
  left: 500px;
  top: 500px;
  z-index: 999;
}

._3nqg3y0 {
    height: 50rem !important;
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
</style>

<script src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base-4b55f04bb2798d1f6aa4e078c0ad3504ef4993ad4123005ec35dde545e5788bd.js"></script>
<script type="text/javascript">
$(function(){});

// 탭팬 호출
function showTab(tabNumber) {
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
}


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
			        <div class="tab" onclick="showTab(4)"><div class="bold-text">0</div><div class="gray-text">배송완료</div></div>
			        <div class="tab" onclick="showTab(5)"><div class="bold-text">0</div><div class="gray-text">결제취소</div></div>
			    </div>
			
			    <div class="tab-content" id="tab1-content">
			        <!-- Tab 1 내용 -->
			        <h3>Tab 1 Content</h3>
			        <p>This is the content of Tab 1.</p>
			    </div>
			
			    <div class="tab-content" id="tab2-content">
			        <!-- Tab 2 내용 -->
			        <h3>Tab 2 Content</h3>
			        <p>This is the content of Tab 2.</p>
			    </div>
			
			    <div class="tab-content" id="tab3-content">
			        <!-- Tab 3 내용 -->
			        <h3>Tab 3 Content</h3>
			        <p>This is the content of Tab 3.</p>
			    </div>
			
			    <div class="tab-content" id="tab4-content">
			        <!-- Tab 4 내용 -->
			        <h3>Tab 4 Content</h3>
			        <p>This is the content of Tab 4.</p>
			    </div>
			
			    <div class="tab-content" id="tab5-content">
			        <!-- Tab 5 내용 -->
			        <h3>Tab 5 Content</h3>
			        <p>This is the content of Tab 5.</p>
			    </div>			
			</div>
		</section>
		

	</div>
</body>
</html>