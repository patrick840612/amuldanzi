
<%@ page contentType="text/html; charset=UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입 - 애물단지</title>




<!-- 부트스트랩 -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/chunks/css/7703396c6294b499.css" rel="stylesheet">
<link href="/chunks/css/3ca3804aef0f69b8.css" rel="stylesheet">
<link href="/chunks/css/c552b37c371c331c.css" rel="stylesheet">
<link href="/chunks/css/39c68523bb4928b9.css" rel="stylesheet">
<link href="/chunks/css/281067dbec461a13.css" rel="stylesheet">

<link href="/chunks/css/text.css" rel="stylesheet">


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b8a8315badb6e28366adcc9ec043dca2&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {

	// 위도 경도 불러올 api 연결
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소 텍스트 클릭 시 카카오api로 주소 검색
	$("#addr1").click(function(event){
		event.preventDefault();
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	            $("#addr1").val(data.address);
	            $("#userAddr").val(data.address);
	            $("#addr1").prop("readonly",true);
	            $("#sido").val(data.sido);
	            $("#sigungu").val(data.sigungu);
	            var juso =  $("#addr1").val();
	            var sido = data.sido; // 시,도
	        	geocoder.addressSearch(sido, callback);  
	        }
	    }).open()
	});

	// 위도 경도 가져오기
	var callback = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			$("input[name=lng]").val(result[0].x);
			$("input[name=lat]").val(result[0].y);
		}
	};
	
	// 상세주소 입력시 주소 합치기
	$('#addr2').blur(function(){
		var addr1 = $("#addr1").val();
		var addr2 = $("#addr2").val();
		$("#userAddr").val(addr1+" "+addr2);
	});

	
});
</script>
</head>

<jsp:include page="../main/header.jsp"></jsp:include>

<body>
	<div class="login_contents__1fQZs">
		<div class="login_loginImgWrapper__ETBnE">
			<img src="/images/logo1.png" class="login_loginImg__aI0wq">
		</div>
		<div class="account_signUpContainer__nL9LE">
			<div class="account_contents__E8DTc">
				<div class="account_signUpFormContainer__tTwFf">
					<div class="account_signUpDesc__FZLyl">이메일로 회원가입</div>
					<form action="/login/regist" method="post" id="regist">
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="email" name="userEmail" placeholder="이메일" value=""
								class="account_inputSignUp___sBwm">
							<button type="button" class="account_checkButton__wezDS"
								disabled="">중복체크</button>
						</div>
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="text" name="id" placeholder="아이디" value=""
								class="account_inputSignUp___sBwm">
							<button type="button" class="account_checkButton__wezDS"
								disabled="">중복체크</button>
						</div>
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="password" name="userPassword" placeholder="비밀번호"
								value="" class="account_inputSignUp___sBwm">
						</div>
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="password" name="rePassword" placeholder="비밀번호 확인"
								value="" class="account_inputSignUp___sBwm">
						</div>
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="tel" name="userTel" placeholder="전화번호"
								value="" class="account_inputSignUp___sBwm">
						</div>
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="tel" name="userName" placeholder="이름"
								value="" class="account_inputSignUp___sBwm">
						</div>
						
						<!-- 주소검색 -->
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="text" id="addr1" readonly="readonly" placeholder="주소입력" class="account_inputSignUp___sBwm" name="userAddr1">
						</div>
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="text" id="addr2" placeholder="상세주소" class="account_inputSignUp___sBwm"  name="userAddr2">
							<input type="hidden" id="lat" name="lat">
							<input type="hidden" id="lng" name="lng">
							<input type="hidden" id="sido" name="sido">
							<input type="hidden" id="sigungu" name="sigungu">
						</div>
						<input type="hidden" name="userAddr" id="userAddr">
						
						
						<div class="account_alertText__bGPQB"></div>
						<div class="account_loginCheckbox__FAhai">
							<div class="account_allChecked___ss8r">
								<div class="account_checkboxwrap__SLQoe">
									<input type="checkbox" name="all" id="all"><label
										for="all" class="account_checkLabel__7ESRF">모두 동의</label>
								</div>
							</div>
							<div class="account_loginfunction__TLCNR">
								<div class="account_checkboxwrap__SLQoe">
									<input type="checkbox" name="a" id="a"><label for="a"
										class="account_checkLabel__7ESRF">서비스 이용약관 동의</label>
								</div>
								<a class="account_description__zlB3V"
									href="https://corp.bemypet.kr/tos" target="_blank"
									rel="noopener noreferrer">내용보기</a>
							</div>
							<div class="account_loginfunction__TLCNR">
								<div class="account_checkboxwrap__SLQoe">
									<input type="checkbox" name="d" id="d"><label for="a"
										class="account_checkLabel__7ESRF">개인정보 수집 및 이용 동의</label>
								</div>
								<a class="account_description__zlB3V"
									href="https://corp.bemypet.kr/privacy-policy-summary"
									target="_blank" rel="noopener noreferrer">내용보기</a>
							</div>
							<div class="account_loginfunction__TLCNR">
								<div class="account_checkboxwrap__SLQoe">
									<input type="checkbox" name="b" id="b"><label for="b"
										class="account_checkLabel__7ESRF">만 14세 이상입니다</label>
								</div>
							</div>
							<div class="account_loginfunction__TLCNR">
								<div class="account_checkboxwrap__SLQoe">
									<input type="checkbox" name="c" id="c"><label for="a"
										class="account_checkLabel__7ESRF">(선택) 마케팅 정보 수신 동의</label>
								</div>
								<a class="account_description__zlB3V"
									href="https://corp.bemypet.kr/marketing-agreement/"
									target="_blank" rel="noopener noreferrer">내용보기</a>
							</div>
							<div class="account_alertText__bGPQB">필수 동의사항에 동의해야 회원가입이
								가능합니다</div>
						</div>
						<button type="submit" class="account_signUpButton__6SW9R">
							<!-- -->
							회원가입
						</button>
					</form>
				</div>
			</div>

			<div>
				<div class="login_loginSNSText__W8qP8">간편하게 SNS 회원가입</div>
				<div>
					<div class="login_btnWrapper__gPI6I">
						<div id="naverIdLogin" style="display: none;">
							<a id="naverIdLogin_loginButton" href="#"><img
								src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.0"
								height="45"></a>
						</div>
						<button class="login_loginNaver__HVe_U" id="n_login_btn">
							<img src="/images/Fill_naver.svg" class="login_logoNaver__A2sVP">네이버로
							로그인
						</button>
					</div>
					<div class="login_btnWrapper__gPI6I">
						<button class="login_loginKakao" id="k_login_btn">
							<img src="/images/icon_kakao.svg" class="login_loginKakao__TI4hn">카카오톡
							로그인
						</button>
					</div>
					<div class="login_btnWrapper__gPI6I">
						<button class="login_loginGoogle__g9yTZ" id="g_login_btn">
							<img src="/images/Fill_google.svg"
								class="login_logoGoogle__CAPsi">Google 로그인
						</button>
					</div>
				</div>
				<div class="login_loginBar__546og"></div>

				<div class="login_loginfunction__KPcAe">
					<div class="login_loginTab__9nBLa">비밀번호 찾기</div>
				</div>
			</div>
		</div>
	</div>

	</div>
</body>
</html>