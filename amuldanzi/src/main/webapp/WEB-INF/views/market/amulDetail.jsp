<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lte IE 9]>
    <html class="ie9">
    <![endif]-->
<html lang="ko">
<head>
<title>애물단지</title>
<link rel="image_src"
	href="https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/dl/v2/0/0/1/0/5/2/PZNEl/5995001052_148768660.jpg"
	onerror="this.src='https://cdn.011st.com/11dims/resize/600x600/quality/75/11src/img/product/no_image.gif'" />
<script
	src="//c.011st.com/js/rake/shuttle/Log11stClientSentinelShuttle-2.0.6-94.js"
	charset='EUC-KR'></script>

<link rel="stylesheet" type="text/css"
	href="//c.011st.com/css/common/general.css">
<link rel="stylesheet" type="text/css"
	href="//c.011st.com/css/product/product_view.css">
<script src="//c.011st.com/js/common/ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    $("#addCartBtn").click(function(){
        var commerceId = "${list.commerceId}"; // 상품 ID
        var id = "${id}"; // 사용자 ID

        $.ajax({
            url: 'http://localhost:8080/market/cartSave', // 데이터를 전송할 URL을 입력해주세요
            type: 'POST', // HTTP 메소드를 선택합니다 (POST, GET 등)
            data: { 'commerceId': commerceId, 'id': id }, // 서버로 전송할 데이터
            success: function(response) { // 서버로부터 응답을 받았을 때의 처리
                alert(response.message);
                var r = confirm("장바구니로 이동하시겠습니까?");
                if (r == true) {
                    window.location.href = "/market/amulCart";
                }
            },
            error: function(jqXHR, textStatus, errorThrown) { // 에러가 발생했을 때의 처리
                alert("데이터 전송 중 에러가 발생했습니다: " + textStatus);
            }
        });
        
    });
}); // end of $
</script>
<body class="l_body">

	<!--[if lte IE 7]>
<script type="text/javascript" src="//www.11st.co.kr/js/lib/json2.min.js" charset='EUC-KR'></script>
<![endif]-->

	<script type="text/javascript"
		src="//www.11st.co.kr/js/lib/jquery/jquery-1.5.min.js"
		charset='EUC-KR'></script>

	<script src="//v.011st.com/latest/pc.polyfills.js" nomodule
		charset="UTF-8"></script>
	<script src="//v.011st.com/latest/pc.util_l.js" charset="UTF-8"></script>
	<script src="//v.011st.com/latest/pc.common.js" charset="UTF-8"></script>
	<script src="//www.11st.co.kr/js/ver/5e5c55f/swiper.js"></script>
	<script src="//www.11st.co.kr/js/ver/5e5c55f/bluebird.js"></script>
	<script type="text/javascript"
		src="//www.11st.co.kr/js/rake/RakeData.js"></script>
	<script type="text/javascript"
		src="//www.11st.co.kr/js/ver/5e5c55f/productReviewWrap.js"></script>



	<!-- header -->

	<!--// 본문 내용 시작 //-->
	<div id="wrapBody">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<script type="text/javascript"
			src="//www.11st.co.kr/html/nc/deal/inc_shockingDeal_header_data_v6.js"
			charset="euc-kr"></script>
		<script type="text/javascript"
			src="//www.11st.co.kr/js/service/shockingdeal/v6/shockingdeal.gnb.js"
			charset="euc-kr"></script>
		<script type="text/javascript">
			shockingDeal.gnb.render();
		</script>

		<div id="layBodyWrap">
			<div class="l_content" role="main">
				<div class="s_product s_product_detail">
					<div class="l_product_store_wrap"></div>


					<div class="l_product_cont_wrap" style="margin-top: 120px">
						<div class="l_product_cont">

							<div class="l_product_summary" data-log-actionid-area="atf">
								<h2 class="skip">상품 요약 정보</h2>
								<div class="l_product_side_view">
									<div class="c_product_view_img">
										<div id="productImg">
											<div class="img_full">
												<img src="/images/commerce/${list.img}" alt=""
													onerror="this.src='/images/error/xlogin.jpg'" width="410px"
													height="410px">
											</div>
										</div>
									</div>
								</div>

								<!-- 제목부분 -->
								<div class="l_product_side_info">
									<div class="c_product_info_title">

										<em class="title_sub"> <!-- 서브 타이틀 -->남은재고 :
											${list.commerceStock}개
										</em>

										<h1 class="title">
											<!-- 타이틀 -->
											${list.commerceName}
										</h1>

									</div>
									<div class="b_product_info_price b_product_info_price_style2">
										<div class="c_prd_price c_product_price_style1">
											<div class="price_block">
												<!-- 할인율 -->
												<dl class="rate">
													<dt>할인율</dt>
													<dd>
														<span class="value">${list.commercePer }</span><span class="unit">%</span>
													</dd>
												</dl>

												<ul class="price_wrap">
													<li>
														<!-- 할인가 -->
														<dl class="price">
															<dt>할인가</dt>
															<dd>
																<strong> <span class="value">${price }</span><span
																	class="unit">원</span>
																</strong>
															</dd>
														</dl> <!-- 판매가 -->
														<dl class="price_regular">
															<dt>판매가</dt>
															<dd>
																<span class="value">${list.commercePrice}</span><span
																	class="unit">원</span>
															</dd>
														</dl>
													</li>
												</ul>
												<div class="button-group">
													<button class="add-to-cart" id="addCartBtn">장바구니에 추가</button>
												</div>
												<style>
												.button-group {
													display: flex;
													gap: 10px;
												}
												
												.add-to-cart {
													background-color: pink;
													border: none;
													padding: 10px;
													cursor: pointer;
													color: black; /* 글씨 색을 흰색으로 설정 */
    												font-weight: bold; /* 글씨를 bold 처리 */
												}
												
												</style>
											</div>
										</div>
									</div>

									<!-- 배송부분 -->
									<dl class="b_product_info_merit">
										<div class="delivery">
											<dt>
												<div class="c_product_tooltip_wrap c_product_tooltip_style3">
													<button type="button"
														class="c_product_btn c_product_btn_more5"
														aria-expanded="false" aria-controls="ar-layerDelivery02"
														aria-labelledby="ar-layerTitleDelivery02">
														<strong>무료배송</strong>
													</button>
												</div>
											</dt>
										</div>

										<!-- [D]원산지 -->
										<div class="origin">
											<dt>원산지</dt>
											<dd>각 상품별 원산지는 상세설명 참조</dd>
										</div>

									</dl>
								</div>
							</div>
							<div id="recommend_top"></div>

							<div id="recommend_viewedTogether"></div>

							<input type="hidden" id="likeIt" value="false" />



							<h2 class="skip">상세 정보</h2>
							<div class="l_product_detail_wrap" id="tabDetail">
								<ul role="tablist" class="c_product_tab_list">
									<li role="presentation" class="tab_menu">
										<button type="button" role="tab" aria-selected="true"
											aria-controls="tabpanelDetail1" data-log-actionid-area="tab"
											data-log-actionid-label="tab"
											data-log-body='{"current_product_no" : 5995001052, "btn_name" : "상품정보", "send_impression" : "Y"}'
											id="tabMenuDetail1">상품정보</button>
									</li>
									<li role="presentation" class="tab_menu">
										<button type="button" role="tab" aria-selected="false"
											aria-controls="tabpanelDetail2" data-log-actionid-area="tab"
											data-log-actionid-label="tab"
											data-log-body='{"current_product_no" : 5995001052, "btn_name" : "리뷰", "send_impression" : "Y"}'
											id="tabMenuDetail2">
											리뷰 <i>(0)</i>
										</button>
									</li>
									<li role="presentation" class="tab_menu">
										<button type="button" role="tab" aria-selected="false"
											aria-controls="tabpanelDetail3" data-log-actionid-area="tab"
											data-log-actionid-label="tab"
											data-log-body='{"current_product_no" : 5995001052, "btn_name" : "Q&A", "send_impression" : "Y"}'
											id="tabMenuDetail3">
											<span class="text_en">Q&amp;A</span> <i>(0) </i>
										</button>
									</li>
									<li role="presentation" class="tab_menu">
										<button type="button" role="tab" aria-selected="false"
											aria-controls="tabpanelDetail4" data-log-actionid-area="tab"
											data-log-actionid-label="tab"
											data-log-body='{"current_product_no" : 5995001052, "btn_name" : "판매자정보", "send_impression" : "Y"}'
											id="tabMenuDetail4">
											판매자정보 <i class="text">(반품/교환)</i>
										</button>
									</li>
								</ul>

								<!-- 리뷰/후기 -->
								<img src="/images/commerceDetail/${list.detailImg}" alt=""
									onerror="this.src='/images/error/xlogin.jpg'" width="1240px">
								<!-- D:수정 -->
								<script type="text/javascript"
									src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

								<!--// 본문 내용 끝 //-->
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
