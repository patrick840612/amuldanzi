
<%@ page contentType="text/html; charset=UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>문자인증 - 애물단지</title>


<!-- 부트스트랩 -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/chunks/css/7703396c6294b499.css" rel="stylesheet">
<link href="/chunks/css/3ca3804aef0f69b8.css" rel="stylesheet">
<link href="/chunks/css/c552b37c371c331c.css" rel="stylesheet">
<link href="/chunks/css/39c68523bb4928b9.css" rel="stylesheet">
<link href="/chunks/css/281067dbec461a13.css" rel="stylesheet">
<link href="/chunks/css/text.css" rel="stylesheet">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

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
	background-color : #ec879e;
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

.account_signUpInputWrapper__kzyF3 {
  display: flex;
}

.account_inputSignUp___sBwm {
  flex-grow: 1;
}

#EmailCheckDup{
	width: 200px;
	display: none;
    justify-content: center;
    align-items: center;
}

#idCheckDup{
	width: 200px;
	display: none;
    justify-content: center;
    align-items: center;
}

.idCheck{
	width: 200px;
	display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.account_checkButton__wezDS{
	width: 100px !important;
	height: 40px;
}

.account_signUpInputWrapper__kzyF3{
	justify-content: center;
}

input.addpet::placeholder {
  text-align: center;
}

.addpet{
	margin-right: 10px;
}

.account_signUpInputWrapper__kzyF3{

  display: flex;
  justify-content: flex-end;
  align-items: center;
}

.eventLabel_animalLabelContainer__J2NDN{

  width: 100px;
  margin-left: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.buttonContainer {
  display: flex;
  margin-left: 200px; /* Use flex for the button container */
}



</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {


	// customValidity 용 js변수 (jquery 작동안함)
	var userTelCheck = document.getElementById("phoneNumber");
	
	//*** 유효성검사
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');
	
      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
         /*  if ($("#userPass").val() != $("#userPass2").val()){
        	  event.preventDefault();
              event.stopPropagation();
          } */
          if (!form.checkValidity()) {
              event.preventDefault();
              event.stopPropagation();
              //alert('입력이 올바르지 않습니다');
            }

          form.classList.add('was-validated');
        }, false);
      });
    }, false); //*** 유효성검사 끝
    

		//**** userTel 전화번호 중복체크 시작
		$('#phoneNumber').on('keyup',function(){
			///입력한 userTel가져오기
			let userTel = $('#phoneNumber').val();
			let userId = "";
			//ajax로 userTel보내기 idCheckServiceCon
			$.ajax({
				url : '<c:url value='/login/idCheckServiceCon'/>',
				type : 'post',
				data : { id : userId, userTel : userTel },
				dataType : 'json',
				success : function(result){

					// 중복된 전화번호 없음
					if(result.resultTel == false){
						$('#TelCheckDup').text('');
						$('#TelCheckDup').removeClass('alert-danger d-flex align-items-center');
						userTelCheck.setCustomValidity("");
						//$('#phoneNumberButton').removeAttr('disabled');
					}else{
						// 중복전화번호
						$('#TelCheckDup').text('중복');
						$('#TelCheckDup').addClass('alert-danger d-flex align-items-center');
						userTelCheck.setCustomValidity("중복오류");
						//$('#phoneNumberButton').attr('disabled', true);
					}
				},
				error : function(err){
					alert('error');
					console.log(err);
				}
			}); // 비동기 통신 종료
		}); // Tel 중복체크(키업 이벤트) 종료
			    
	$('#phoneNumber').blur(function(){
		event.preventDefault();
	    const phoneNumber = $('#phoneNumber');
	    const phoneNumberValue = phoneNumber.val();

	    if (/^\d{11}$/.test(phoneNumberValue)) {

	      const formattedPhoneNumber = phoneNumberValue.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
	      phoneNumber.val(formattedPhoneNumber);
			let userTel = $('#phoneNumber').val();
			let userId = "";
			//ajax로 userTel보내기 idCheckServiceCon
			$.ajax({
				url : '<c:url value='/login/idCheckServiceCon'/>',
				type : 'post',
				data : { id : userId, userTel : userTel },
				dataType : 'json',
				success : function(result){

					// 중복된 전화번호 없음
					if(result.resultTel == false){
						$('#TelCheckDup').text('');
						$('#TelCheckDup').removeClass('alert-danger d-flex align-items-center');
						userTelCheck.setCustomValidity("");
						//$('#phoneNumberButton').removeAttr('disabled');
					}else{
						// 중복전화번호
						$('#TelCheckDup').text('중복');
						$('#TelCheckDup').addClass('alert-danger d-flex align-items-center');
						userTelCheck.setCustomValidity("중복오류");
						//$('#phoneNumberButton').attr('disabled', true);
					}
				},
				error : function(err){
					alert('error');
					console.log(err);
				}
			}); // 비동기 통신 종료
	    } else {

	    }

	});

	$('#selfclose').click(function(){
		// 원본페이지 이동 시키기 : opener.location.href="/login/loginpage";
		self.close();
	});	

	// 부모창 데이터 가져오기 : alert($(opener.document).find('#id').val());
	
	// 자식창 데이터 부모창으로 넘겨주기 : 
	$('#reauth').click(function(){
		location.reload();
	});	
	

	
});
</script>
</head>

<body onload="window.resizeTo(800,600)" style="overflow: hidden;">
	
			<div class="account_contents__E8DTc"> 
				<div class="account_signUpFormContainer__tTwFf">
					<div class="account_signUpDesc__FZLyl">휴대폰 번호 인증</div>
					
					<form>
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">

							<input id="phoneNumber" class="account_inputSignUp___sBwm" placeholder="핸드폰 번호" readonly/>
							<div id="TelCheckDup"></div><div></div>								
							<div class="account_alertText__bGPQB"></div>
							<div class="account_signUpInputWrapper__kzyF3">
								<button id="phoneNumberButton" class="account_checkButton__wezDS">전화 번호 전송</button>
							</div>
							<div class="invalid-feedback">휴대폰 번호를 인증해주세요</div>
						</div>
					</form>
					<br/>
					<form>					
						<div class="account_signUpInputWrapper__kzyF3">
							<input placeholder="문자인증코드" id="confirmCode" class="account_inputSignUp___sBwm" readonly/>
							<div></div><div></div>								
							<div class="account_alertText__bGPQB"></div>
							<div class="account_signUpInputWrapper__kzyF3">
								<button id="confirmCodeButton" class="account_checkButton__wezDS" disabled="disabled">확인 코드 전송</button>
							</div>
						</div>
					</form>
					<br/>
					<div id="recaptcha-container"></div><br/><br/><br/>

					<div class="account_signUpInputWrapper__kzyF3">
						<div class="buttonContainer">
							<input type="button" value="다시 인증하기" id="reauth" class="eventLabel_animalLabelContainer__J2NDN"/>	
							<input type="button" value="닫 기" id="selfclose" class="eventLabel_animalLabelContainer__J2NDN"/>
						</div>
					</div>
				</div>
			</div>
			
  	<script type="module">
        // 필요한 SDK에서 필요한 함수 가져오기
        import { initializeApp } from "https://www.gstatic.com/firebasejs/10.0.0/firebase-app.js";
        import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.0.0/firebase-analytics.js";
        import { getAuth, signInWithPhoneNumber, RecaptchaVerifier } from "https://www.gstatic.com/firebasejs/10.0.0/firebase-auth.js";

     
        // Firebase JS SDK v7.20.0 이상의 경우, measurementId는 선택 사항입니다.
        const firebaseConfig = {
          apiKey: "AIzaSyByApv-Y_LC3KFHvR8H9WM-iHtHCeHT6SQ",
          authDomain: "easylogin-32ddb.firebaseapp.com",
          projectId: "easylogin-32ddb",
          storageBucket: "easylogin-32ddb.appspot.com",
          messagingSenderId: "856131945500",
          appId: "1:856131945500:web:3d171e4ab73b9edf864bd9",
          measurementId: "G-5HSVVDRF57"
        };
      
        // Firebase 초기화
        const app = initializeApp(firebaseConfig);
        const analytics = getAnalytics(app);

        const auth = getAuth();
        auth.languageCode = 'ko';
		
		// 로봇인증 확인여부
		let recaptchaResolved = false;

        window.recaptchaVerifier = new RecaptchaVerifier(auth, 'recaptcha-container', {
            'size': 'normal',
            'callback': (response) => {
                // console.log(response)
                // reCAPTCHA가 해결되면 signInWithPhoneNumber을 허용합니다.
				$('#recaptcha-container').hide();
				$('#phoneNumber').removeAttr('readonly');
     
                // reCAPTCHA가 해결되었으므로 변수 값을 true로 설정합니다.
                recaptchaResolved = true;
            },
            'expired-callback': () => {
                console.log('error')
                // 응답이 만료되었습니다. 사용자에게 reCAPTCHA를 다시 풀도록 요청합니다.
				$('#recaptcha-container').show();
				$('#phoneNumber').attr('readonly', true);

                // reCAPTCHA가 만료되었으므로 변수 값을 false로 설정합니다.
                recaptchaResolved = false;
            }
        });

        recaptchaVerifier.render().then((widgetId) => {
                    window.recaptchaWidgetId = widgetId;
                    const recaptchaResponse = grecaptcha.getResponse(recaptchaWidgetId);   
        });

        document.getElementById('phoneNumberButton').addEventListener('click', (event) => {
            event.preventDefault()
			const phoneNumber = $('#phoneNumber');
	    	const phoneNumberValue = phoneNumber.val();

			if (!recaptchaResolved){
				alert("로봇이 아님을 인증해 주세요");				
			}else if(recaptchaResolved && $('#TelCheckDup').text() == '중복'){
				alert("전화번호가 가입되어 있습니다");
			}else{

            const phoneNumber = document.getElementById('phoneNumber').value
            const appVerifier = window.recaptchaVerifier;

            signInWithPhoneNumber(auth, '+82'+phoneNumber, appVerifier)
                .then((confirmationResult) => {
                // SMS가 전송되었습니다. 사용자에게 메시지에서 코드를 입력하도록 요청하고, confirmationResult.confirm(code)로 사용자를 로그인합니다.
                window.confirmationResult = confirmationResult;
                // console.log(confirmationResult.confirm);
                $('#recaptcha-container').hide();
				$('#confirmCode').removeAttr('readonly');
				$('#confirmCodeButton').removeAttr('disabled');

                }).catch((error) => {
                    console.log(error);
					alert("잘못된 전화번호 입니다");
                // 에러; SMS가 전송되지 않았습니다.
                $('#recaptcha-container').show();
				$('#confirmCode').attr('readonly', true);
				$('#confirmCodeButton').attr('disabled', true);
				$('#phoneNumber').attr('readonly', true);
				$('#phoneNumber').val('');
                });
			}
        })



        document.getElementById('confirmCodeButton').addEventListener('click', (event) => {
            event.preventDefault()
            const code = document.getElementById('confirmCode').value
            confirmationResult.confirm(code).then((result) => {
                // 사용자가 성공적으로 로그인했습니다.
                const user = result.user;
				const phoneNumber = result.user.phoneNumber;
                console.log(phoneNumber);
				opener.$('#userTel').val(formatPhoneNumber(phoneNumber));
				opener.$('#hiddenPhone').val(formatPhoneNumber(phoneNumber));
				opener.$('#bloodTel').val(formatPhoneNumber(phoneNumber));

				recaptchaResolved = false;
				$('#confirmCode').attr('readonly', true);
				$('#phoneNumber').attr('readonly', true);
				$('#recaptcha-container').show();
				self.close();

                }).catch((error) => {
                console.log(error)    
                // 사용자가 로그인하지 못했습니다 (유효하지 않은 인증 코드인 경우 등).
                alert('인증코드가 틀렸습니다');
                });
        })

  // 전화번호를 변환하는 함수
  function formatPhoneNumber(phoneNumber) {
    var formattedNumber = phoneNumber.replace(/\D/g, ''); // 숫자가 아닌 문자 모두 제거

    if (formattedNumber.startsWith('82')) {
      formattedNumber = '0' + formattedNumber.slice(2); // 앞에 "0" 한 개를 붙이고 "82"는 잘라냄
    }

    formattedNumber = formattedNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3'); // 하이픈(-) 추가
    return formattedNumber;
  }
      </script>


</body>
</html>