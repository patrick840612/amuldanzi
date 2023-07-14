
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
<style>
dialog::backdrop{
	background-color : rgba(0,0,0,0.3);
	backdrop-filter: blur(1px);
}

dialog{
	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
	border: 0;
	text-align: center;
	border-radius: 20px;
	padding: 20px 50px 10px 50px;
	background-color : tomato;
}

.duplicateCheck{
	width: 300px;
    height: 33px;
    border: none;
    border-bottom: 1px solid #e4e4e6;
    font-size: 14px;
	color : green;
	font-weight: bold;
}

.duplicateCheck2{
	width: 300px;
    height: 33px;
    border: none;
    border-bottom: 1px solid #e4e4e6;
    font-size: 14px;
	color : red;
	font-weight: bold;
}
</style>

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
	
	// customValidity 용 js변수 (jquery 작동안함)
	var userEmailCheck = document.getElementById("userEmail");
	var userIdCheck = document.getElementById("id");
	var userTelCheck = document.getElementById("userTel");

	//**** userId 아이디 중복체크 시작
	$('#id').on('keyup',function(){
		///입력한 userId가져오기
		let userId = $('#id').val();
		let userEmail = $('#userEmail').val();
		let userTel = $('#userTel').val();
		
		//ajax로 userId보내기 idCheckServiceCon
		$.ajax({
			url : '<c:url value='/login/idCheckServiceCon'/>',
			type : 'post',
			data : { id : userId, userEmail : userEmail, userTel : userTel },
			dataType : 'json',
			success : function(result){
				// 중복된 아이디 없음
				if(result.resultId == false && userId.length > 5 && userId.length <= 15){
					$('#idCheck').text('사용 가능');
					$('#idCheck').addClass('duplicateCheck');
					$('#idCheckDup').text('');
					$('#idCheckDup').removeClass('duplicateCheck2');
					//userIdCheck.setCustomValidity(""); 
				}else{
					// 중복아이디 및 사용불가한 아이디
					if(userId.length <= 5 && userId.length >= 1){
						$('#idCheckDup').text('더 길게');
						//userIdCheck.setCustomValidity("중복오류");
					}else if(userId.length == 0){
						$('#idCheckDup').text('필수 입력');
					}else if(userId.length >= 15){
						$('#idCheckDup').text('더 짧게');
					}else{
						$('#idCheckDup').text('중복');
						//userIdCheck.setCustomValidity("중복오류");
					}
					$('#idCheckDup').addClass('duplicateCheck2');
					$('#idCheck').text('');
					$('#idCheck').removeClass('duplicateCheck');
				}
			},
			error : function(err){
				alert('error');
				console.log(err);
			}
		}); // 비동기 통신 종료
	}); // id 중복체크(키업 이벤트) 종료 
	
	//**** userEmail 이메일 중복체크 시작
	$('#userEmail').on('keyup',function(){
		///입력한 userEmail가져오기
		let userId = $('#id').val();
		let userEmail = $('#userEmail').val();
		let userTel = $('#userTel').val();
		
		//ajax로 user이메일보내기 idCheckServiceCon
		$.ajax({
			url : '<c:url value='/login/idCheckServiceCon'/>',
			type : 'post',
			data : { id : userId, userEmail : userEmail, userTel : userTel },
			dataType : 'json',
			success : function(result){
				// 중복된 이메일 없음
				if(result.resultEmail == false){
					$('#EmailCheckDup').text('');
					$('#EmailCheckDup').removeClass('duplicateCheck2');
					//userEmailCheck.setCustomValidity(""); 
				}else{
					// 중복이메일
					if(userEmail.length == 0){
						$('#EmailCheckDup').text('필수 입력');
					}else{
						$('#EmailCheckDup').text('중복');
					}
					$('#EmailCheckDup').addClass('duplicateCheck2');
					//userEmailCheck.setCustomValidity("중복오류");
				}
			},
			error : function(err){
				alert('error');
				console.log(err);
			}
		}); // 비동기 통신 종료
	}); // Email 중복체크(키업 이벤트) 종료
	
	//**** userTel 전화번호 중복체크 시작
	$('#userTel').on('keyup',function(){
		///입력한 userTel가져오기
		let userId = $('#id').val();
		let userEmail = $('#userEmail').val();
		let userTel = $('#userTel').val();
		
		//ajax로 userTel보내기 idCheckServiceCon
		$.ajax({
			url : '<c:url value='/login/idCheckServiceCon'/>',
			type : 'post',
			data : { id : userId, userEmail : userEmail, userTel : userTel },
			dataType : 'json',
			success : function(result){
				console.log(result.resultTel);
				// 중복된 전화번호 없음
				/*if(result.resultEmail == false){
					$('#EmailCheckDup').text('');
					$('#EmailCheckDup').removeClass('duplicateCheck2');
					//userEmailCheck.setCustomValidity(""); 
				}else{
					// 중복이메일
					if(userEmail.length == 0){
						$('#EmailCheckDup').text('필수 입력');
					}else{
						$('#EmailCheckDup').text('중복');
					}
					$('#EmailCheckDup').addClass('duplicateCheck2');
					//userEmailCheck.setCustomValidity("중복오류");
				}*/
			},
			error : function(err){
				alert('error');
				console.log(err);
			}
		}); // 비동기 통신 종료
	}); // Tel 중복체크(키업 이벤트) 종료
	
	//*** 유효성검사
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');
	
      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if ($("#userPass").val() != $("#userPass2").val()){
        	  event.preventDefault();
              event.stopPropagation();
              alert('비밀번호가 일치하지 않습니다');
          }
          if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
            alert('입력이 올바르지 않습니다');
          }
          form.classList.add('was-validated');
        }, false);
      });
    }, false); //*** 유효성검사 끝
			
	  /*// 모달사용법
	  const idbutton = document.querySelector("#idbutton");
	  const iddialog = document.querySelector("#iddialog");
	
	  idbutton.addEventListener("click", () => {
	    iddialog.showModal();
	  });

	  iddialog.addEventListener("close", () => {
	    console.log(iddialog.returnValue);
	  });
	  
	  $('#close').on("click", (event) => {
		  event.preventDefault();
		  iddialog.close();
		});
	
	  $('#confirm').on("click", (event) => {
		  event.preventDefault();
		  iddialog.close();
		});*/
	  
	
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
					<form action="/login/regist" method="post" id="regist" class="validation-form">
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="email" name="userEmail" placeholder="이메일" value=""
								class="account_inputSignUp___sBwm" id="userEmail" required>
							<div id="EmailCheckDup"></div>
						</div>
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="text" name="id" placeholder="아이디" value=""
								class="account_inputSignUp___sBwm" id="id" required>
							<!-- <button type="button" class="account_checkButton__wezDS"
								 id="idbutton">중복체크</button>
						 	<dialog  id="iddialog"> 사용 가능한 아이디 입니다
									<button value="close" id="close">Close</button>
									<button value="confirm" id="confirm">Confirm</button>
							</dialog> -->	
							<div id="idCheck" ></div><div id="idCheckDup"></div>
							
						</div>
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="password" name="userPassword" placeholder="비밀번호"
								value="" class="account_inputSignUp___sBwm" id="userPass" required>
						</div>
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="password" name="rePassword" placeholder="비밀번호 확인"
								value="" class="account_inputSignUp___sBwm" id="userPass2" required>
						</div>
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="tel" name="userTel" placeholder="전화번호"
								value="" class="account_inputSignUp___sBwm" id="userTel">
						</div>
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="tel" name="userName" placeholder="이름"
								value="" class="account_inputSignUp___sBwm" pattern="^[ㄱ-ㅎ가-힣]+$" required>
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
						<button class="login_loginKakao" id="k_login_btn">
							<img src="/images/icon_kakao.svg" class="login_loginKakao__TI4hn">카카오톡
							회원가입
						</button>
					</div>
					<div class="login_btnWrapper__gPI6I">
						<button class="login_loginGoogle__g9yTZ" id="g_login_btn">
							<img src="/images/Fill_google.svg"
								class="login_logoGoogle__CAPsi">Google 회원가입
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