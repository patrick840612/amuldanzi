
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

.account_signUpInputWrapper__kzyF3 {
  display: flex;
}

.account_inputSignUp___sBwm {
  flex-grow: 1;
}



.account_checkButton__wezDS{
	width: 100px !important;
	height: 40px;
}

.account_signUpInputWrapper__kzyF3{
	justify-content: center;
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

.account_noCheckButton__dNWQx{}

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
 
          if (!form.checkValidity()) {
              event.preventDefault();
              event.stopPropagation();
 
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

					}else{
						// 중복전화번호
						$('#TelCheckDup').text('중복');
						$('#TelCheckDup').addClass('alert-danger d-flex align-items-center');
						userTelCheck.setCustomValidity("중복오류");

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
	    const phoneRegex = /^(010|01[1|6|7|8|9])-?\d{3,4}-?\d{4}$/;

	    if (phoneRegex.test(phoneNumberValue)) {

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

					}else{
						// 중복전화번호
						$('#TelCheckDup').text('중복');
						$('#TelCheckDup').addClass('alert-danger d-flex align-items-center');
						userTelCheck.setCustomValidity("중복오류");

					}
				},
				error : function(err){
					alert('error');
					console.log(err);
				}
			}); // 비동기 통신 종료
	    } else if(phoneNumberValue == ""){
	    	
	    }else{
	    	alert("올바른 휴대폰 번호 형식을 입력하세요.\n예: '010-0000-0000' 또는 11자리 숫자");
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
	
	// 문자인증후 구글로 회원가입 or 로그인하기
	$('#socialauth').on('click',function(){
		
		let userTel = $('#userTel').val();
		let social = $('#social').val();
		let socialKey = $('#socialKey').val();
		//ajax로 userTel보내기 idCheckServiceCon
		$.ajax({
			url : '/login/socialgoogleAuth',
			type : 'post',
			data : { social : social, userTel : userTel, socialKey : socialKey },
			dataType : 'text',
			success : function(result){

	
			},
			error : function(err){
				alert('error');
				console.log(err);
			}
		}); // 비동기 통신 종료
	}); // Tel 중복체크(키업 이벤트) 종료

});
</script>
</head>

<body onload="window.resizeTo(800,600)" style="overflow: hidden;">
	
			<div class="account_contents__E8DTc"> 
				<div class="account_signUpFormContainer__tTwFf">
					<div class="account_signUpDesc__FZLyl">휴대폰 번호 인증</div>
					<form action="/login/socialgoogleAuth" method="get">
						<form>
							<div class="account_alertText__bGPQB"></div>
							<div class="account_signUpInputWrapper__kzyF3">
	
								<input id="userTel" name="userTel" class="account_inputSignUp___sBwm" placeholder="핸드폰 번호" readonly value="010-4711-3012"/>
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
									<button id="confirmCodeButton" class="account_noCheckButton__dNWQx" disabled="disabled">확인 코드 전송</button>
								</div>
							</div>
							<input type="text" value="${member.social}" name="social" id="social"/>
							<input type="text" value="${member.socialKey}" name="socialKey" id="socialKey"/>
								
						</form>
						<input type="button" value="서브밋" id="socialauth" class="eventLabel_animalLabelContainer__J2NDN"/>
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
			
  	<!-- <script type="module">
        // 필요한 SDK에서 필요한 함수 가져오기
        import { initializeApp } from "https://www.gstatic.com/firebasejs/10.0.0/firebase-app.js";
        import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.0.0/firebase-analytics.js";
        import { getAuth, signInWithPhoneNumber, RecaptchaVerifier } from "https://www.gstatic.com/firebasejs/10.0.0/firebase-auth.js";

     
        // Firebase JS SDK v7.20.0 이상의 경우, measurementId는 선택 사항입니다.
        /*const firebaseConfig = {
          apiKey: "AIzaSyByApv-Y_LC3KFHvR8H9WM-iHtHCeHT6SQ",
          authDomain: "easylogin-32ddb.firebaseapp.com",
          projectId: "easylogin-32ddb",
          storageBucket: "easylogin-32ddb.appspot.com",
          messagingSenderId: "856131945500",
          appId: "1:856131945500:web:3d171e4ab73b9edf864bd9",
          measurementId: "G-5HSVVDRF57"
        };*/

  //테스트용(나중에 지우기)
  const firebaseConfig = {
    apiKey: "AIzaSyAdgoCzIS8Ho9EbtznhlqXofYDlS6euKek",
    authDomain: "textauth-103f2.firebaseapp.com",
    projectId: "textauth-103f2",
    storageBucket: "textauth-103f2.appspot.com",
    messagingSenderId: "92681438318",
    appId: "1:92681438318:web:5a378658b05dd0cb27127f",
    measurementId: "G-JF04YXQZLZ"
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
			}else if(phoneNumberValue == ""){
				alert("전화번호를 입력해 주세요");
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
				$('#confirmCodeButton').attr('class', 'account_checkButton__wezDS');

                }).catch((error) => {
                    console.log(error);
					alert("잘못된 전화번호 입니다");
                // 에러; SMS가 전송되지 않았습니다.
                $('#recaptcha-container').show();
				$('#confirmCode').attr('readonly', true);
				$('#confirmCodeButton').attr('disabled', true);
				$('#phoneNumber').attr('readonly', true);
				$('#phoneNumber').val('');
				$('#confirmCodeButton').attr('class', 'account_noCheckButton__dNWQx');
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
      </script> -->


</body>
</html>