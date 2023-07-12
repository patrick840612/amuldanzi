<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>socialLogin2</title>
</head>
<body>
    <button id="googleLogin">구글 아이디로 로그인</button>

    <form>
        핸드폰 번호 : <input id="phoneNumber"/>
        <button id="phoneNumberButton">핸드폰 번호 전송</button>
    </form>

    <form>
        확인 코드 : <input id="confirmCode"/>
        <button id="confirmCodeButton">확인 코드 전송</button>
    </form>
    <div id="recaptcha-container"></div>
  	
    <script src="https://www.gstatic.com/firebasejs/8.2.6/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.2.6/firebase-analytics.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.2.6/firebase-auth.js"></script>

    <script type="text/javascript">
	    // 웹 앱의 Firebase 구성 정보
	    // Firebase JS SDK v7.20.0 이상의 경우, measurementId는 선택 사항입니다.
        var firebaseConfig = {
          apiKey: "AIzaSyByApv-Y_LC3KFHvR8H9WM-iHtHCeHT6SQ",
          authDomain: "easylogin-32ddb.firebaseapp.com",
          projectId: "easylogin-32ddb",
          storageBucket: "easylogin-32ddb.appspot.com",
          messagingSenderId: "856131945500",
          appId: "1:856131945500:web:3d171e4ab73b9edf864bd9",
          measurementId: "G-5HSVVDRF57"
        };

     	// Firebase 초기화
        const app = firebase.initializeApp(firebaseConfig);
        const analytics = firebase.analytics(app);

        var provider = new firebase.auth.GoogleAuthProvider();
        var auth = firebase.auth();
        auth.languageCode = 'ko';

        document.getElementById('googleLogin').addEventListener('click', function () {
            firebase.auth().signInWithPopup(provider)
                .then(function(result) {
                	// 이것은 Google Access Token입니다. Google API에 액세스하는 데 사용할 수 있습니다.
                    var credential = result.credential;
                    var token = credential.accessToken;
                 	// 로그인한 사용자 정보
                    var user = result.user;
                    console.log(result);
                    // ...
                }).catch(function(error) {
                	// 에러 처리
                    var errorCode = error.code;
                    var errorMessage = error.message;
                	// 사용된 계정의 이메일
                    var email = error.email;
                	// 사용된 AuthCredential 유형
                    var credential = error.credential;
                    console.log('err', error)
                    // ...
                });
        })

        var recaptchaVerifier = new firebase.auth.RecaptchaVerifier('recaptcha-container', {
            'size': 'normal',
            'callback': function(response) {
                console.log(response)

                // reCAPTCHA가 해결되면 signInWithPhoneNumber을 허용합니다.
                // ...
            },
            'expired-callback': function() {
                console.log('error')
                // 응답이 만료되었습니다. 사용자에게 reCAPTCHA를 다시 풀도록 요청합니다.
                // ...
            }
        });

        recaptchaVerifier.render().then(function(widgetId) {
            window.recaptchaWidgetId = widgetId;
            var recaptchaResponse = grecaptcha.getResponse(recaptchaWidgetId);
        });

        document.getElementById('phoneNumberButton').addEventListener('click', function(event) {
            event.preventDefault();
            var phoneNumber = document.getElementById('phoneNumber').value;
            var appVerifier = recaptchaVerifier;

            firebase.auth().signInWithPhoneNumber('+82'+phoneNumber, appVerifier)
                .then(function(confirmationResult) {
               	// SMS가 전송되었습니다. 사용자에게 메시지에서 코드를 입력하도록 요청하고, confirmationResult.confirm(code)로 사용자를 로그인합니다.
                window.confirmationResult = confirmationResult;
                console.log(confirmationResult);
                // ...
                }).catch(function(error) {
                    console.log(error);
                // 에러; SMS가 전송되지 않았습니다.
                // ...
                });
        })

        document.getElementById('confirmCodeButton').addEventListener('click', function(event) {
            event.preventDefault();
            var code = document.getElementById('confirmCode').value;
            confirmationResult.confirm(code).then(function(result) {
            	// 사용자가 성공적으로 로그인했습니다.
                var user = result.user;
                console.log(result);
                // ...
                }).catch(function(error) {
                console.log(error);
             	// 사용자가 로그인하지 못했습니다 (유효하지 않은 인증 코드인 경우 등)
                // ...
            });
        })

    </script>
</body>
</html>