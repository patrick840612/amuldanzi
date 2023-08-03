<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>애물단지 장바구니</title>
<link href="https://www.lotteimall.com/common/ssl/css/common.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://static.lotteimall.com/htmlapps/css/ec_cms.css?d=1690941230052"
	rel="stylesheet" />
<script
	src="https://www.lotteimall.com/common/ssl/js/jquery-1.7.2.min.js"
	type="text/javascript">
	
</script>
<link
	href="https://www.lotteimall.com/common/ssl/imall_2021/css/common.css?d=20230801094"
	rel="stylesheet" type="text/css">
<link
	href="https://www.lotteimall.com/common/ssl/imall_2021/css/common_vue.css?d=20230801094"
	rel="stylesheet" type="text/css" />
<link
	href="https://www.lotteimall.com/common/ssl/imall_2021/css/planshop_vue.css?d=20230801094"
	rel="stylesheet" type="text/css" />
<link
	href="https://www.lotteimall.com/common/ssl/css/video-js.css?d=20230801094"
	rel="stylesheet" type="text/css" />
<script
	src="https://www.lotteimall.com/common/ssl/js/video.min.js?d=20230801094"
	type="text/javascript">
	
</script>
<script
	src="https://www.lotteimall.com/common/ssl/js/videojs-contrib-hls.min.js?d=20230801094"
	type="text/javascript">
	
</script>
<script
	src="https://www.lotteimall.com/common/ssl/imall_2021/js/pub/lib/swiper.min.js?d=20230801094"
	type="text/javascript">
	
</script>
<script
	src="https://www.lotteimall.com/common/ssl/js/ark/js/rn_ark_new.js?d=20230801094"
	type="text/javascript">
	
</script>
<script charset="utf-8"
	src="/resources/js/vue/dataset.polyfill.min.js?d=20230801094">
	
</script>
<script charset="utf-8"
	src="/resources/js/vue/axios.min.js?d=20230801094">
	
</script>
<script charset="utf-8" src="/resources/js/vue/vue.js?d=20230801094">
	
</script>
<script charset="utf-8"
	src="/resources/js/vue/vue-lazyload.js?d=20230801094">
	
</script>
<script charset="utf-8"
	src="/resources/js/vue/promise.polyfill.min.js?d=20230801094">
	
</script>
<script charset="utf-8"
	src="https://www.lotteimall.com/common/ssl/imall_2021/js/common.js?d=20230801094">
	
</script>
<script charset="utf-8"
	src="/resources/js/common/common.js?d=20230801094">
	
</script>
<link href="https://www.lotteimall.com/common/ssl/css/layout.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://www.lotteimall.com/common/ssl/imall_rn/css/rn2th_common_180126.css"
	rel="stylesheet" type="text/css" />
<link href="https://www.lotteimall.com/common/ssl/css/search_161107.css"
	rel="stylesheet" type="text/css" />
<script src="/livehome/common/js/json2.js" type="text/javascript">
	
</script>
<script src="https://www.lotteimall.com/common/ssl/js/top_group.js"
	type="text/javascript">
	
</script>
<script src="https://www.lotteimall.com/common/ssl/js/ui_common.js"
	type="text/javascript">
	
</script>
<!-- ///////////////////////////////////////////////////////////////////////////////////////////// -->
<link
	href="https://www.lotteimall.com/common/ssl/imall_rn/css/jquery.fancybox-1.3.4.css"
	media="screen" rel="stylesheet" type="text/css" />
<script
	src="https://www.lotteimall.com/common/ssl/imall_rn/js/jquery.fancybox-1.3.4.pack.js"
	type="text/javascript">
	
</script>
<!-- ///////////////////////////////////////////////////////////////////////////////////////////// -->
<link href="https://www.lotteimall.com/common/ssl/css/order.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://www.lotteimall.com/common/ssl/js/common.js?d=20230801094"
	type="text/javascript">
	
</script>
<script
	src="https://www.lotteimall.com/common/ssl/js/link.js?d=20230801094"
	type="text/javascript">
	
</script>
<script
	src="https://www.lotteimall.com/common/ssl/js/lotte.util.js?d=20230801094"
	type="text/javascript">
	
</script>
<!-- LUX - iMall UI/UX 리뉴얼 프로젝트 추가 [시작] -->
<!-- GNB 메뉴 관련 CSS -->
<script src="https://www.lotteimall.com/common/ssl/imall_rn/js/swipe.js"
	type="text/javascript">
	
</script>
<script
	src="https://www.lotteimall.com/common/ssl/imall_rn/js/jquery.bxslider.js"
	type="text/javascript">
	
</script>
<link
	href="https://www.lotteimall.com/common/ssl/imall_rn/css/rn2th_common_180126.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://www.lotteimall.com/common/ssl/imall_rn/js/rn_common.js"
	type="text/javascript">
	
</script>
<script
	src="https://www.lotteimall.com/common/ssl/imall_rn/js/rn2th_common.js"
	type="text/javascript">
	
</script>
<!-- LUX - iMall UI/UX 리뉴얼 프로젝트 추가 [끝] -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		if ($("#container").length > 0) {
			$("body").attr("id", "rn_imall_asis");
		}

		$(document).on('click', '#orderBt', function() {
			
			var IMP = window.IMP; // Iamport 객체를 가져옴
		    IMP.init("imp30255621"); // Iamport에 등록한 본인의 가맹점 식별코드를 사용

		 // 결제 창을 호출
		    IMP.request_pay({
		        pg : "kakaopay",
		        pay_method : "card",
		        merchant_uid : "merchant_" + new Date().getTime(),
		        name : "주문명:결제테스트",
		        amount : $("#totalResultPrc").text(),
		        buyer_email : "${member.userEmail}",
		        buyer_name : "${member.userName}",
		        buyer_tel : "${member.userTel}",
		        buyer_addr : "${member.userAddr}",
		        buyer_postcode : "123-456"
		    }, function(rsp) {
		        if ( rsp.success ) {
		        	var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			
	    			alert(msg);

		        } else {
		            // 결제 실패 시 로직
		            alert("결제에 실패하였습니다.");
		        }
		    });
		});

		// 개별 체크박스 클릭 이벤트
	    $('input[name="cartCheckbox"]').on('change', function() {
	        var total = $('input[name="cartCheckbox"]').length;
	        var checked = $('input[name="cartCheckbox"]:checked').length;
	        // 전체 선택 체크박스 상태 업데이트
	        $('#normalAllChk').prop('checked', total === checked);
	        // 선택된 체크박스 수 업데이트
	        $('#checkedCount').text(checked);

	        updateTotalPriceAndItems();
	    });

	    // 전체 선택 체크박스 클릭 이벤트
	    $('#normalAllChk').on('change', function() {
	        var isChecked = $(this).is(':checked');
	        // 모든 체크박스 상태 업데이트
	        $('input[name="cartCheckbox"]').prop('checked', isChecked).trigger('change');
	    });

	});

	$(document).on('click', '.minus', function() {
        var input = $(this).next('input');
        var count = parseInt(input.val()) - 1;
        if (count < 1) {
            alert("애물단지 상품은 최소 1개 이상 주문이 가능하니 1개 이상의 상품으로 수정해주세요.");
        } else {
            input.val(count);
        }
    });

    $(document).on('click', '.plus', function() {
        var input = $(this).prev('input');
        var count = parseInt(input.val()) + 1;
        input.val(count);
    });

    $(document).on('click', '.btn_stype2', function() {
        var _this = $(this); // 'this'를 '_this' 변수에 할당
        var input = _this.closest('.cnt').find('input.txt');
        var count = input.val();
        var commerceId = _this.siblings('input[name="commerceId"]').val();
        var id = "${id}"; // JSP에서 id값을 가져옵니다.

        $.ajax({
            url: 'http://localhost:8080/market/updateCartCount', 
            type: 'POST',
            data: { 
                count: count,
                commerceId: commerceId,
                id: id
            },
            success: function(response) {
                var commercePrice = parseFloat(_this.data('price')); // data-price 속성에서 상품 가격 가져오기
                var commercePer = parseFloat(_this.data('per')); // data-per 속성에서 상품 할인율 가져오기
                var updatedPrice = Math.round((commercePrice - commercePrice / commercePer) * count);

                // 상품 가격 업데이트
                _this.parent().parent().next('.price_wrap').find('.price span').text(updatedPrice);

                // 체크박스의 data-price 속성 업데이트
                _this.closest('tr').find('input[name="cartCheckbox"]').data('price', updatedPrice);

                alert('상품 수정이 완료되었습니다.');

                updateTotalPriceAndItems();
            },
            error: function(error) {
                alert('상품 수정에 실패했습니다.');
            }
        });
    });

    

    function updateTotalPriceAndItems() {
        var totalItems = 0;
        var totalPrice = 0;

        // 체크된 체크박스를 찾아서 순회
        $("input[name='cartCheckbox']:checked").each(function() {
            totalItems++;
            // 가격 정보를 찾아서 더함 (data-price 속성에서 가격 정보를 찾음)
            totalPrice += parseFloat($(this).data('price'));
        });

        // 결과를 화면에 업데이트
        $('#totalResultCount').text(totalItems + '건');
        $('#totalResultPrc').text(totalPrice.toLocaleString() + '원');
        $('#total_sale_prc').text(totalPrice.toLocaleString());
    }

    $(document).on('click', '#selectDelete', function() {
        var cartIds = [];
        $('input[name="cartCheckbox"]:checked').each(function() {
            cartIds.push($(this).data('id'));
        });

        $.ajax({
            url: 'http://localhost:8080/market/cartDelete',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                // JSON 형식에 맞게 객체 형태로 래핑하여 보냄
                cartIds: cartIds
            }),
            success: function(response) {
                alert('선택한 항목이 삭제되었습니다.');
                location.reload();
            },
            error: function(error) {
                alert('선택한 항목을 삭제하는 데 실패했습니다.');
                console.log(JSON.stringify({ cartIds: cartIds }));
            }
        });
    });
    
</script>

<style type="text/css">
#checkedCount {
	color: #444444;
	text-decoration: none;
	margin-left: 2px;
	line-height: 22px;
	font-size: 15px;
}
</style>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
	<div id="wrap">
		<!-- SSO 고도화 자바스크립트 -->
		<script
			src="https://members.lpoint.com/api/js/serialize.object.js?20230802"
			type="text/javascript">
			
		</script>
		<script src="https://members.lpoint.com/api/js/json2.js?20230802"
			type="text/javascript">
			
		</script>
		<script
			src="https://members.lpoint.com/api/js/lotte.sso.api.js?20230802"
			type="text/javascript">
			
		</script>
		<input id="sso_return_url" name="sso_return_url" type="hidden"
			value="/member/goLogin.lotte?auth=SSO&amp;ret=/cart/searchCartList.lotte?tlog=00100_16" />
		<div id="allthat"></div>
		<div class="rn_layer_zzim">
			<div class="dim"></div>
			<div class="box">
				<p class="msg_alarm complete">
					<span class="ico"> </span> <span class="txt"> 찜 완료 </span> <a
						class="btn_link" href="/mypage/searchWishListList.lotte"
						target="_blank"> 목록보기 <span class="ico_link"> </span>
					</a>
				</p>
				<p class="msg_alarm cancel">
					<span class="ico"> </span> <span class="txt"> 찜 취소 </span>
				</p>
				<button class="btn_msg_close"
					onclick="hideToastMsgLayer('rn_layer_zzim');" type="button">
				</button>
			</div>
		</div>
		<div id="rn2th_container">
			<div class="rn_container_con" style="margin-top: 120px">
				<script charset="UTF-8" src="/common/js/netfunnel.js"
					type="text/javascript">
					
				</script>
				<script charset="UTF-8" src="/common/js/test_skin.js"
					type="text/javascript">
					
				</script>
				<script
					src="https://www.lotteimall.com/common/ssl/js/imall_cart_html.js"
					type="text/javascript">
					
				</script>
				<script src="https://www.lotteimall.com/common/ssl/js/imall_cart.js"
					type="text/javascript">
					
				</script>
				<script src="https://www.lotteimall.com/common/ssl/js/calendar.js"
					type="text/javascript">
					
				</script>
				<form action="/cart/updateCart.lotte" id="cartForm" method="post"
					name="cartForm">
					<div id="cartTemp"></div>
					<input id="tab_flag_info" name="tab_flag_info" type="hidden"
						value="tabBasic"> </input>
				</form>
				<form id="netFunnelFrm" method="post" name="netFunnelFrm">
					<div id="netFunnelTemp"></div>
				</form>
				<div id="container">
					<div id="contents">
						<div class="location">
							<a class="home" href="/main/index"> 홈 </a>
							<div class="his addClassOn">
								<a class="one" href="gsHomeShop"> 라이브커머스 </a>
							</div>
							<div class="his addClassOn">
								<a class="one" href="/market/amulRecip"> 장바구니 </a>
							</div>
						</div>
						<div class="cart_tit">
							<h3>
								<img alt="장바구니"
									src="https://image.lotteimall.com/imall_ec/site/images/order/h3_cart.gif" />
							</h3>
							<p class="step">
								<img alt="장바구니 페이지입니다"
									src="https://image.lotteimall.com/imall_ec/site/images/order/step_01.gif" />
							</p>
						</div>
						<div class="login_box cart_re">
							<p>애물단지 라이브커머스 쇼핑 장바구니 입니다!</p>
						</div>
						<div class="cart_renewal order_form" id="cartListArea">
							<div class="lft">
								<c:if test="${cartSize}">
									<div class="none_div">
										<p>장바구니가 비어있습니다.</p>
									</div>
								</c:if>
								<div class="product_tit" style="top: 84px;" id="normalCartTit">
									<!-- s: 22-06-22 수정 -->
									<h3>
										<div class="c_item">
											<input type="checkbox" id="normalAllChk" name="normalAllChk">
											<label for="normalAllChk">일반 (<span id="checkedCount"
												class="checked-count">0</span>/${cartCount})
											</label>
										</div>
										<div class="btns_wrap">
											<a href="javascript://" class="btn_stype" id="selectDelete">선택삭제</a>
										</div>
									</h3>
									<!-- e: 22-06-22 수정 -->
								</div>
								<c:if test="${cartList ne null}">
									<c:forEach items="${cartList }" var="list" varStatus="status">
										<div class="cart_list" id="normalCartList">
											<div class="iplist">
												<table
													summary="장바구니 목록을 상품명, 혜택, 수량 주문금액, 배송비, 구매/보관으로 정보를 제공하는 표"
													style="width: 100%;">
													<caption>장바구니 목록</caption>
													<colgroup>
														<!-- 22-06-22 col 넓이 수정 -->
														<col style="width: 18%">
														<col style="width: 36%">
														<col style="width: 32%">
														<col style="width: 14%">
													</colgroup>
													<thead>
													</thead>
													<tbody>
														<tr>
															<input type="hidden" name="cart_type" value="normal" />
															<input type="hidden" name="cart_name" value="일반" />
															<!-- 구매제한수량 여부 -->
															<input type="hidden" name="goods_nm"
																id="normal_goods_nm0" value="애물단지" />
															<td class="img">
																<div class="c_item">
																	<input type="checkbox" id="normal${status.count}"
																		name="cartCheckbox" value="value${status.count}"
																		data-price="${Math.round((list.commerce.commercePrice-list.commerce.commercePrice/list.commerce.commercePer)*list.count)}"
																		data-id="${list.cartId}" title="상품선택" /> <label
																		for="normal${status.count}">
																		<div class="img_dim">
																			<a href="#"> <img
																				src="/images/commerce/${list.commerce.img }"
																				onError="/images/error/xlogin.jpg'" width="86"
																				height="86" alt="" />
																			</a>
																		</div>
																	</label>
																</div>
															</td>
															<td class="tit">
																<p class="iptit1">
																	<a href="#"> <span class="name">${list.commerce.commerceName}</span>
																		<!-- 22-06-22 스마트픽 아이콘 추가 -->
																	</a>
																</p> <!-- 옵션 -->
															</td>
															<td class="cnt">
																<!-- s: 22-06-22 수정 -->
																<div class="count_wrap">
																	<div class="number_area">
																		<a href="javascript:void(0)" class="minus">-</a> <input
																			type="text" class="txt" name="ord_qty"
																			id="normal_ord_qty${status.count}" maxlength="3"
																			title="수량입력" value="${list.count}" onclick="" /> <a
																			href="javascript:void(0)" class="plus">+</a>
																	</div>
																	<span class="btns_wrap"> <input type="hidden"
																		name="commerceId" value=${list.commerce.commerceId } />
																		<a href="javascript:void(0)" class="btn_stype2"
																		data-price="${list.commerce.commercePrice}"
																		data-per="${list.commerce.commercePer}">수정</a>
																	</span>
																</div>
																<div class="price_wrap">
																	<input type="hidden" name="sale_prc"
																		id="normal_sale_prc0" value="29800" /> <input
																		type="hidden" name="dscnt_prc" id="normal_dscnt_prc0"
																		value="0" />
																	<!--즉석쿠폰/임직원 할인/ARS할인이 없는 경우(수정자:210014 이주형)-->
																	<p class="price">
																		<span>${Math.round((list.commerce.commercePrice-list.commerce.commercePrice/list.commerce.commercePer)*list.count)}</span>원
																	</p>

																</div> <!-- e: 22-06-22 수정 -->
															</td>
															<td class="btns_wrap"> <a
																href="/market/cartDelete?cartId=${list.cartId }"
																class="btn_stype2">삭제</a></td>
														</tr>
														<!-- 옵션정보문구 case 1~10 -->
														<!-- 배송비 -->
														<!-- 배송정보 case -->
														<tr class="option_box delivery">
															<td colspan="4">
																<div class="option_box_text">
																	<p>
																		<span class="text_bold">무료배송</span>
																	</p>
																</div>
															</td>
														</tr>
													</tbody>
												</table>

											</div>
										</div>
										<!--일반 장바구니 for문 end-->
									</c:forEach>
								</c:if>
							</div>
							<!-- 3. product. //product list area -->
							<div class="rht">
								<div class="pay_box">
									<div class="box">
										<div class="inner">
											<h4>결제예정 금액</h4>
											<table
												summary="결제예정금액을 총주문금액, 할인내역, 배송비, 최종결제금액으로 정보를 제공하는 표">
												<caption>결제예정 금액</caption>
												<colgroup>
													<col style="width: 48%" />
													<col style="width: 53%" />
												</colgroup>
												<tbody>
													<tr>
														<th scope="row">상품금액</th>
														<td>
															<p class="row1">
																<span id="total_sale_prc"> 0 </span> 원
															</p>
														</td>
													</tr>
													<tr id="deli_btn">
														<th id="deli_display" scope="row">배송비</th>
														<td id="dispTotalDeliPrc">(+) <span id="totalDeliPrc">
																0 </span> 원 <span class="loading" style="display: none">
														</span>
														</td>
														<td id="dispDeliPrcBtn" style="display: none"><a
															class="go_deliy" href="javascript:void(0)" onclick="">
																배송비 확인 </a></td>
													</tr>
												</tbody>
											</table>
											<div class="btns_wrap type1">
												<a class="btn_type1" href="javascript:void(0)" id="orderBt">
													<strong> 주문하기 </strong> <span class="order_tot_wrap">
														( <span class="order_qty" id="totalResultCount"> 0건
													</span> <span class="price_tot" id="totalResultPrc"> 0원 </span> )
												</span>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="https://www.lotteimall.com/common/ssl/js/makePCookie.js"
			type="text/javascript">
</script>
		<!-- div id="vue" 닫힘 -->
	</div>
	<script charset="utf-8"
		src="/resources/js/common/common.js?d=20230801094">
</script>
	<script charset="utf-8"
		src="/resources/js/common/ajax.js?d=20230801094">
</script>
	<script charset="utf-8"
		src="/resources/js/common/util.js?d=20230801094">
</script>

</body>
</html>
<br />
<div style="color: white;">EMPTY</div>