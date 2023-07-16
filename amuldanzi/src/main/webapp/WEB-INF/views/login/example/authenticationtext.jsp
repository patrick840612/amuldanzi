<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>socialLogin</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>

	<div id="recaptcha-container"></div>
    <form>
        핸드폰 번호 : <input id="phoneNumber"/>
        <button id="phoneNumberButton" disabled="disabled">핸드폰 번호 전송</button>
    </form>

    <form>
        확인 코드 : <input id="confirmCode"/>
        <button id="confirmCodeButton" disabled="disabled">확인 코드 전송</button>
    </form>
    

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

        window.recaptchaVerifier = new RecaptchaVerifier(auth, 'recaptcha-container', {
            'size': 'normal',
            'callback': (response) => {
                console.log(response)
                // reCAPTCHA가 해결되면 signInWithPhoneNumber을 허용합니다.
				$('#recaptcha-container').hide();
				$('#phoneNumberButton').removeAttr('disabled');         
            },
            'expired-callback': () => {
                console.log('error')
                // 응답이 만료되었습니다. 사용자에게 reCAPTCHA를 다시 풀도록 요청합니다.
				$('#recaptcha-container').show();
				$('#phoneNumberButton').attr('disabled', true);
            }
        });

        recaptchaVerifier.render().then((widgetId) => {
                    window.recaptchaWidgetId = widgetId;
                    const recaptchaResponse = grecaptcha.getResponse(recaptchaWidgetId);   
        });

        document.getElementById('phoneNumberButton').addEventListener('click', (event) => {
            event.preventDefault()
            const phoneNumber = document.getElementById('phoneNumber').value
            const appVerifier = window.recaptchaVerifier;

            signInWithPhoneNumber(auth, '+82'+phoneNumber, appVerifier)
                .then((confirmationResult) => {
                // SMS가 전송되었습니다. 사용자에게 메시지에서 코드를 입력하도록 요청하고, confirmationResult.confirm(code)로 사용자를 로그인합니다.
                window.confirmationResult = confirmationResult;
                console.log(confirmationResult)
                $('#recaptcha-container').hide();
				$('#confirmCodeButton').removeAttr('disabled');
                }).catch((error) => {
                    console.log(error)
                // 에러; SMS가 전송되지 않았습니다.
                $('#recaptcha-container').show();
				$('#confirmCodeButton').attr('disabled', true);
                });
        })

        document.getElementById('confirmCodeButton').addEventListener('click', (event) => {
            event.preventDefault()
            const code = document.getElementById('confirmCode').value
            confirmationResult.confirm(code).then((result) => {
                // 사용자가 성공적으로 로그인했습니다.
                const user = result.user;
                console.log(result)
                // ...
                }).catch((error) => {
                console.log(error)    
                // 사용자가 로그인하지 못했습니다 (유효하지 않은 인증 코드인 경우 등).
                // ...
                });
        })

      </script>
</body>
</html>