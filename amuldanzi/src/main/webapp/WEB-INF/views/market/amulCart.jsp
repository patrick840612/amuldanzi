<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	// ----------------------------------------------------------------------------------
	// 2015-08-17 : txs
	// 				AS-IS 화면 호환 하도록 가로 폭 조절 스크립트
	//				<div id="container"> 가 있으면 AS-IS 화면으로 간주 함.
	//				만약 AS-IS 화면인 경우 body 에 id=rn_imall_asis 로 지정 함.
	// ----------------------------------------------------------------------------------
	$(document).ready(function() {
		if ($("#container").length > 0) {
			$("body").attr("id", "rn_imall_asis");
		}
	});
</script>
</link>
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
								<a class="one" href="#"> 장바구니 </a>
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
								<!--<div class="none_div">
<p>장바구니가 비어있습니다.</p>
22-06-22 현행화
</div>
-->
								<div class="product_tit" style="top: 84px;" id="normalCartTit">
									<!-- s: 22-06-22 수정 -->
									<h3>
										<div class="c_item">
											<input type="checkbox" id="normalAllChk" name="normalAllChk"
												onclick="fn_chkCart('normal', '일반', this, true); fn_makeGaTraking('장바구니(PC)','장바구니(PC)_상품유닛','장바구니(PC)_상품유닛_전체선택');">
											<label for="normalAllChk" id="normalCartCountTxt">일반
												(0/0)</label>
										</div>
										<div class="btns_wrap">
											<a href="javascript://" class="btn_stype2"
												onclick="fn_deleteCartList('normal', this, false); fn_makeGaTraking('장바구니(PC)','장바구니(PC)_상품유닛','장바구니(PC)_상품유닛_선택상품삭제');">선택삭제</a>
										</div>
									</h3>
									<!-- e: 22-06-22 수정 -->
								</div>
								<div class="cart_list" id="normalCartList">
									<!-- 	묶음 처리 및 배송비 정책 로직 적용
1. 쿼리 결과가 묶음 수만큼 rnum 으로 집계되서 오므로 rnum 변경 여부와 배송비 정책으로 비교하여 묶음 적용
2. 다음 rnum 값을 체크하여 틀려질 경우 혹은 배송비 정책이 변경 될 경우 닫고 배송비 표시 -->
									<!--매장 전달메시지 있는지-->
									<!--선물메시지 있는지-->
									<!--선물포장 가능한지-->
									<!--  배송 단위 묶음 적용값  -->
									<!--값 세팅-->
									<!--상품금액합계  ( 세일가 합계 )-->
									<!--최대할인합계-->
									<!--배송비합계-->
									<!--롯데 포인트 총 적립예상금액-->
									<!--배송구분-->
									<!--일반 장바구니일 경우-->
									<!--소속상품  CART_SN-->
									<!--모든 소속상품 CART_SN-->
									<!--E-COUPON상품 CART_SN-->
									<!--유입전시번호-->
									<!--배송비 row단위 합치기를 위한변수-->
									<!--배송비 row단위 합치기를 위한변수-->
									<!--장바구니별 총 주문금액 정보-->
									<!--[2017.10.25 정영훈] 배송비 추가구매문구/버튼 노출을 위한 선작업-->
									<!--추가구매 버튼 처리를 위한 변수-->
									<!--추가구매 버튼 처리를 위한 변수-->
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
													<input type="hidden" name="cart_sn" id="normal_cart_sn0"
														value="1929708745" />
													<input type="hidden" name="goods_cmps_cd"
														id="normal_goods_cmps_cd0" value="50" />
													<input type="hidden" name="goods_no" id="normal_goods_no0"
														value="12774229" />
													<input type="hidden" name="item_no" id="normal_item_no0"
														value="1" />
													<input type="hidden" name="dlv_polc_no"
														id="normal_dlv_polc_no0" value="300" />
													<input type="hidden" name="goods_choc_desc"
														id="normal_goods_choc_desc0" value="" />
													<input type="hidden" name="conr_no" id="normal_conr_no0"
														value="0" />
													<input type="hidden" name="smp_vst_shop_no"
														id="normal_smp_vst_shop_no0" value="0" />
													<input type="hidden" name="smp_vst_rsv_dtime"
														id="normal_smp_vst_rsv_dtime0" value="" />
													<input type="hidden" name="max_lmt_qty"
														id="normal_max_lmt_qty0" value="20" />
													<!-- 최대구매수량 -->
													<input type="hidden" name="min_lmt_qty"
														id="normal_min_lmt_qty0" value="1" />
													<!-- 최소구매수량 -->
													<input type="hidden" name="pur_qty_lmt_yn"
														id="normal_pur_qty_lmt_yn0" value="Y" />
													<!-- 구매제한수량 여부 -->
													<input type="hidden" name="goods_nm" id="normal_goods_nm0"
														value="로젠토 남성 다이얼 아쿠아 트레킹화 " />
													<input type="hidden" name="inv_qty" id="normal_inv_qty0"
														value="99999" />
													<!-- 재고수량 -->
													<input type="hidden" name="dsp_psb_yn"
														id="normal_dsp_psb_yn0" value="N" />
													<input type="hidden" name="idne_yn" id="normal_idne_yn0"
														value="N" />
													<input type="hidden" name="entr_contr_no"
														id="normal_entr_contr_no0" value="035397" />
													<input type="hidden" name="ondemand_goods_yn"
														id="normal_ondemand_goods_yn0" value="N" />
													<input type="hidden" name="subd_goods_yn"
														id="normal_subd_goods_yn0" value="N" />
													<input type="hidden" name="byr_age_lmt_cd"
														id="byr_age_lmt_cd1929708745" value="0" />
													<!-- 상품등급 -->
													<input type="hidden" name="dawn_dlv_ex_comm_goods_yn"
														id="normal_dawn_dlv_ex_comm_goods_yn0" value="N" />
													<input type="hidden" name="dawn_dlv_ex_comm_entr_nm"
														id="normal_dawn_dlv_ex_comm_entr_nm0" value="" />
													<input type="hidden" name="dawn_dlv_ex_comm_no"
														id="normal_dawn_dlv_ex_comm_no0" value="" />
													<input type="hidden" name="gwangCleChkGoods0"
														id="gwangCleChkGoods1929708745" value="N" />
													<td class="img">
														<div class="c_item">
															<input type="checkbox" id="normal0" name="cartCheckbox"
																value="1929708745"
																onclick="fn_chkCart('normal', '일반', this, false); fn_makeGaTraking('장바구니(PC)','장바구니(PC)_상품유닛','장바구니(PC)_상품유닛_상품선택');"
																title="상품선택" /> <label for="normal0">
																<div class="img_dim">
																	<a href="#">
																		<img
																		src="https://image2.lotteimall.com/goods/29/42/77/12774229_EM.jpg"
																		onError="javascript:this.src='https://image2.lotteimall.com/goods/common/no_110.gif'"
																		width="86" height="86" alt="로젠토 남성 다이얼 아쿠아 트레킹화 " />
																	</a>
																</div>
															</label>
														</div>
													</td>
													<td class="tit">
														<p class="iptit1">
															<a href="#">
																[<span class="bran">로젠토</span>] <span class="name">로젠토
																	남성 다이얼 아쿠아 트레킹화 </span>
															<!-- 22-06-22 스마트픽 아이콘 추가 -->
															</a>
														</p> <!-- 옵션 -->
														<p class="ipoption" id="normal0_option"
															name="normal0_option" style="display: none">
															<!--선택형 or 추가구성형 or 일반상품-->
															<select id="normal0_selectbar" name="normal0_selectbar"
																onchange="fn_changeOption(this, '1');"
																style="width: 200px;" value="색상:블랙,사이즈:250mm">
															</select>
															<!-- 단품관리 여부 end -->
															<script type="text/javascript">
																fn_SearchOptionList(
																		'12774229',
																		'0',
																		'1929708745',
																		'1',
																		'5000037',
																		'1',
																		'Y',
																		'normal',
																		'', '',
																		'0',
																		'0',
																		'N',
																		'0');
															</script>
															<!-- //단품관리 여부 end -->
														</p> <input type="hidden" id="noint_1929708745"
														name="noint_1929708745" value="0" /> <input type="hidden"
														id="save_amt_1929708745" name="save_amt_1929708745"
														value="0" /> <input type="hidden"
														id="lt_pnt_rsrv_amt_1929708745"
														name="lt_pnt_rsrv_amt_1929708745" value="30" /> <input
														type="hidden" id="okcs_rsrv_amt_1929708745"
														name="okcs_rsrv_amt_1929708745" value="0" /> <!-- 혜택 정보 end-->
														<!--추가선택정보(배송희망일, 이니셜 등) start-->
														<div class="ipbene1 pay_add addOption"></div> <!--추가선택정보 end-->
													</td>
													<td class="cnt">
														<!-- s: 22-06-22 수정 -->
														<div class="count_wrap">
															<div class="number_area">
																<a href="javascript:void(0)" class="minus"
																	onclick="fn_max_qry_update('normal','minus','0');">-</a>
																<input type="text" class="txt" name="ord_qty"
																	id="normal_ord_qty0" maxlength="3" title="수량입력"
																	value="1"
																	onclick="fn_makeGaTraking('장바구니(PC)','장바구니(PC)_상품유닛','장바구니(PC)_상품유닛_수량인풋박스');"
																	onkeyup="fn_setNumberQty(this);" /> <a
																	href="javascript:void(0)" class="plus"
																	onclick="fn_max_qry_update('normal','plus','0');">+</a>
															</div>
															<span class="btns_wrap"> <a
																href="javascript:void(0)" class="btn_stype2"
																onclick="fn_qry_update('normal', '0','12774229','1'); fn_makeGaTraking('장바구니(PC)','장바구니(PC)_상품유닛','장바구니(PC)_상품유닛_수량수정');">수정</a>
															</span>
														</div> <!-- 상품가 --> <!--주문금액--> <!--최대 혜택가--> <!--즉석쿠폰할인--> <!--ARS할인-->
														<!--일시불할인--> <!--적립P--> <!--할인금액--> <!--주문수량과 관계없이 순수한 상품가격-->
														<!--묶음상품은 쿼리에서 소속상품 주문갯수만큼 *n개 해주어 대표상품에 sum해서 보여준다. 별도로 처리안해도됨-->
														<!--할인율 10:정액 20 : 정률--> <!--할인 금액/율--> <!--//[2023.02.08 이주형] 할인금액은 즉석쿠폰, 임직원 할인, ARS할인 중 큰 금액 적용1-->
														<div class="price_wrap">
															<input type="hidden" name="sale_prc"
																id="normal_sale_prc0" value="29800" /> <input
																type="hidden" name="dscnt_prc" id="normal_dscnt_prc0"
																value="0" />
															<!--즉석쿠폰/임직원 할인/ARS할인이 없는 경우(수정자:210014 이주형)-->
															<p class="price">
																<span>29,800</span>원
															</p>
															<button class="btn_popup"
																onclick="modal('/cart/popup/forward.pop_benefit_discount.lotte?cart_sn=1929708745&mbr_no=202308513287&sale_prc=29800&goods_no=12774229&item_no=1&ord_qty=1&staff_yn=N&site_no=1&chl_no=0&chl_dtl_no=&mc_yn=N'+'','380','','');">혜택자세히보기</button>
															<!-- 22-06-22 혜택자세히보기 버튼 추가 -->
															<!--즉석쿠폰이나 임직원 할인이 있는 경우-->
														</div> <!-- e: 22-06-22 수정 -->
													</td>
													<td class="btns_wrap"><a href="javascript://"
														class="btn_stype1"
														onclick="fn_order('normal', 'single', '1929708745', '0', '', undefined, undefined, '0'); fn_makeGaTraking('장바구니(PC)','장바구니(PC)_상품유닛','장바구니(PC)_상품유닛_바로구매');">바로구매</a>
														<a href="javascript://" class="btn_stype2"
														onclick="longTermItem('1929708745','N','0','normal'); fn_makeGaTraking('장바구니(PC)','장바구니(PC)_상품유닛','장바구니(PC)_상품유닛_계속담기');"
														id="longTermnormalBtn0">계속담기</a> <a href="javascript://"
														class="btn_stype2"
														onclick="fnChkLogin('','','','','','fn_addWishList({ goods_no:\'12774229\',item_no:\'1\',goods_choc_desc:\'\',goods_cmps_cd:\'\',conr_no:\'0\',smp_vst_shop_no:\'0\',smp_vst_rsv_dtime:\'\',master_goods_yn:\'Y\'})');fn_makeGaTraking('장바구니(PC)','장바구니(PC)_상품유닛','장바구니(PC)_상품유닛_찜하기');">찜하기</a>
														<a href="javascript://" class="btn_stype2"
														onclick="fn_deleteCartList('normal', this, true); fn_makeGaTraking('장바구니(PC)','장바구니(PC)_상품유닛','장바구니(PC)_상품유닛_삭제');">삭제</a>
													</td>
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
												<!-- 사은품 있을때 갯수카운트 disable class="disabled_table"-->
											</tbody>
										</table>
										
									</div>
								</div>
								<!--일반 장바구니 for문 end-->
								
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
												<a class="btn_type1" href="javascript:void(0)" onclick="">
													<strong id="orderBtn"> 주문하기 </strong> <span
													class="order_tot_wrap"> ( <span class="order_qty"
														id="totalResultCount"> 0건 </span> <span class="price_tot"
														id="totalResultPrc"> 0원 </span> )
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