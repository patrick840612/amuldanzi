
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
	
<link type="text/css" rel="stylesheet" href="https://cdn.jsdelivr.net/npm/firebaseui@latest/dist/firebaseui.css" />

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
	
  display: flex;
  justify-content: flex-end;
  align-items: center;
  justify-content: center;
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

#phone{
	padding-top: 100px;
}

.duplicateCheck{
	width: 300px;
    height: 33px;
    border: none;
    font-size: 14px;
	color : green;
	font-weight: bold;
}

.duplicateCheck2{
	width: 300px;
    height: 33px;
    border: none;
    font-size: 14px;
	color : red;
	font-weight: bold;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {

	// 현재 URL의 쿼리 파라미터를 읽어옴
	let queryParams = new URLSearchParams(window.location.search);

	// 'socialKey'과 'social' 값을 변수에 저장
	let socialKey = queryParams.get('socialKey');
	let social = queryParams.get('social');
	$('#socialKey').val(socialKey);
	$('#social').val(social);
	
	// 새로고침
	$('#reauth').click(function(){
		location.reload();
	});	
	

	
					

	$('#regist').click(function(event){
		event.preventDefault();
		if($('#dupCheckButton').text() == '중복 체크' && $('#id').val().length == 0){
			$('#TelCheckDup').text('아이디 입력 및 중복 체크 해주세요');
			$('#TelCheckDup').removeClass('duplicateCheck').addClass('duplicateCheck2');
		}else if($('#dupCheckButton').text() == '중복 체크'){	
			$('#TelCheckDup').text('아이디 중복 체크를 해주세요');
			$('#TelCheckDup').removeClass('duplicateCheck').addClass('duplicateCheck2');
		}else if($('#userPassword').val().length == 0){
			$('#PassCheck').text('비밀번호를 입력해 주세요');
			$('#PassCheck').removeClass('duplicateCheck').addClass('duplicateCheck2');
		}else if($('#userPassword').val().length < 6 || $('#userPassword').val().length > 16){
			$('#PassCheck').text('비밀번호는 6자 이상 16자 이하로 입력해주세요');
			$('#PassCheck').removeClass('duplicateCheck').addClass('duplicateCheck2');
		}else{
			$('#socialRegist').submit();			
		}
	});	
	
    // 아이디 중복체크 버튼 토글 시작       	
    // 초기 아이디 중복 체크 버튼 상태
    let isButtonChecked = false;

    // 버튼 클릭 시 호출되는 함수
    function toggleButtonText() {
      if (isButtonChecked) {
        $('#dupCheckButton').text('중복 체크');
      } else {
        $('#dupCheckButton').text('다른 아이디 입력');
      }
      isButtonChecked = !isButtonChecked; // 버튼 상태를 토글합니다.
    }

    // 중복 체크 버튼에 클릭 이벤트 리스너 추가
    $('#dupCheckButton').on('click', function(event) {
      event.preventDefault();
      
      // 버튼의 텍스트가 "중복 체크"일 때
      if (!isButtonChecked) {
			//ajax로 userTel보내기 idCheckServiceCon
			$.ajax({
				url : '<c:url value='/login/idCheckServiceCon'/>',
				type : 'post',
				data : { id : $('#id').val() },
				dataType : 'json',
				success : function(result){
					
					// 중복된 id 없음
					if(result.resultId == false){
						if($('#id').val().length == 0){
							$('#TelCheckDup').text('아이디를 입력해 주세요');
							$('#TelCheckDup').removeClass('duplicateCheck').addClass('duplicateCheck2');
						}else if($('#id').val().length < 6 || $('#id').val().length > 16){
							$('#TelCheckDup').text('아이디는 6자 이상 16자 이하로 입력해주세요');
							$('#TelCheckDup').removeClass('duplicateCheck').addClass('duplicateCheck2');
						}else{
							$('#TelCheckDup').text('사용 가능한 아이디 입니다');
							$('#TelCheckDup').removeClass('duplicateCheck2').addClass('duplicateCheck');
							$('#id').attr('readonly', true);
							toggleButtonText();							
						}
					}else{
						// 중복아이디
						$('#TelCheckDup').text($('#id').val()+'아이디는 사용 불가능합니다');
						$('#TelCheckDup').removeClass('duplicateCheck').addClass('duplicateCheck2');
						$('#id').removeAttr('readonly');
						$('#id').val('');

					}
				},
				error : function(err){
					alert('error');
					console.log(err);
				}
	 		}); // 비동기 통신 종료

      } else { // 버튼의 텍스트가 "다른 아이디 입력"일 때
    	 $('#id').removeAttr('readonly');
    	 $('#id').val('');
    	 $('#TelCheckDup').text('');
         // 텍스트 변경 함수 호출
         toggleButtonText();
      }
    }); // 중복 체크 토글 끝
});
</script>
</head>

<body style="overflow: hidden;">
	
			<div class="account_contents__E8DTc" id="phone"> 
				<div class="account_signUpFormContainer__tTwFf">
					<div class="account_signUpDesc__FZLyl">휴대폰 번호 인증</div>
						<form>
							<div class="account_alertText__bGPQB"></div>
							<div class="account_signUpInputWrapper__kzyF3">
	
								<input type="tel" name="phoneNumber" id="phoneNumber" class="account_inputSignUp___sBwm" placeholder="핸드폰 번호" />
								<div></div><div></div>								
								<div class="account_alertText__bGPQB"></div>
								<div class="account_signUpInputWrapper__kzyF3">
									<button id="phoneNumberButton" class="account_checkButton__wezDS">전화 번호 전송</button>
								</div>
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
						</form>

				</div>	
					<br/>
					<form action="/login/socialRegist" method="post" id="socialRegist">
						<div class="account_signUpFormContainer__tTwFf" id="require">
							<div class="account_signUpDesc__FZLyl">필수 입력 사항</div>	
							<div class="account_signUpInputWrapper__kzyF3">
								<input placeholder="아이디" id="id" name="id" class="account_inputSignUp___sBwm" minlength="6" maxlength="16" required />
								<div></div><div></div>
								<div class="account_alertText__bGPQB"></div>
								<div class="account_signUpInputWrapper__kzyF3">
										<button id="dupCheckButton" class="account_checkButton__wezDS">중복 체크</button>
								</div>
							</div>
								<div class="account_signUpInputWrapper__kzyF3">
									<div id="TelCheckDup" class="duplicateCheck"></div>
								</div>
							<br/>
							<div class="account_signUpInputWrapper__kzyF3">
								<input type="password" placeholder="비밀번호" id="userPassword" name="userPassword" class="account_inputSignUp___sBwm" minlength="6" maxlength="16" required/>
								<div></div><div></div>
								<div class="account_alertText__bGPQB"></div>
								<div class="account_signUpInputWrapper__kzyF3">
									<button id="passViewButton" class="account_checkButton__wezDS">비번보기</button>
								</div>
							</div>
							<div class="account_signUpInputWrapper__kzyF3">
									<div id="PassCheck" class="duplicateCheck"></div>
							</div>
							<input type="text" name="social" id="social"/>
							<input type="text" name="socialKey" id="socialKey"/>
							<input type="text" name="userTel" id="userTel"/>
							
						</div>							
					<br/><br/>
					<div class="account_signUpFormContainer__tTwFf">
					<div class="account_signUpInputWrapper__kzyF3">
						<div class="buttonContainer">
							<input type="button" value="다시 인증하기" id="reauth" class="eventLabel_animalLabelContainer__J2NDN"/>	
							<input type="submit" value="가입하기" id="regist" class="eventLabel_animalLabelContainer__J2NDN" disabled="disabled"/>
						</div>
					</div>
					</div>
					</form>
					
			</div>

<div id="recaptcha-container"></div>

    <!-- Firebase UI 라이브러리 추가 -->
	<script src="https://cdn.jsdelivr.net/npm/firebaseui@latest/dist/firebaseui.js"></script>
  	
    <script src="https://www.gstatic.com/firebasejs/8.2.6/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.2.6/firebase-analytics.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.2.6/firebase-auth.js"></script>

    <script type="text/javascript">
	    // 웹 앱의 Firebase 구성 정보
	    // Firebase JS SDK v7.20.0 이상의 경우, measurementId는 선택 사항입니다.
        /*var firebaseConfig = {
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

        //$('#require').hide();///////////////////////////////////////      주석 풀기
        $('#regist').removeAttr('disabled'); //////////////////////////     삭제하기 테스트용
        
        // 필수 입력사항 보일 때 전화번호와 아이디 체크
        $('#require').on('showEvent', function() {
		    // 이벤트가 발생했을 때 실행될 작업을 여기에 작성합니다.
		  		let userId = "";
		  		
				//ajax로 userTel보내기 
				$.ajax({
					url : '<c:url value='/login/socialCheckServiceCon'/>',
					type : 'post',
					data : { id : userId, userTel : $('#userTel').val() },
					dataType : 'json',
					success : function(result){
						
						// 중복된 전화번호 없음
						if(result.member.userTel == null || result.member.userTel == ""){
							$('#TelCheckDup').text('아이디와 비밀번호를 입력해 주세요');
							$('#id').removeAttr('readonly');

						}else{
							// 중복전화번호
							$('#TelCheckDup').text('아이디와 연결합니다');
							$('#id').val(result.member.id);
							$('#id').attr('readonly', true);
							
							setTimeout(() => {
								$('#socialRegist').submit();
							}, 300);
						}
					},
					error : function(err){
						alert('error');
						console.log(err);
					}
		 		}); // 비동기 통신 종료
		  }); // 필수 입력사항 보일 때 전화번호와 아이디 체크 끝
        
     	// Firebase 초기화
        const app = firebase.initializeApp(firebaseConfig);
        const analytics = firebase.analytics(app);

        var auth = firebase.auth();
        auth.languageCode = 'ko';

        // reCAPTCHA가 자동 인증
        const recaptchaContainer = document.getElementById('recaptcha-container');
        window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier(recaptchaContainer, {
            'size': 'invisible',
            'callback': (response) => {
              //onSignInSubmit();
            }
        });
        
        document.getElementById('phoneNumberButton').addEventListener('click', function(event) {
            event.preventDefault();
            var phoneNumber = document.getElementById('phoneNumber').value;
            var appVerifier = window.recaptchaVerifier;
            const phoneRegex = /^(010|01[1|6|7|8|9])-?\d{4}-?\d{4}$/;
            
			if (phoneNumber == ""){
				alert("전화번호를 입력해 주세요");				
			}else if(!phoneRegex.test(phoneNumber)){
				alert("전화번호 형식이 잘못되었습니다");	
			}else{
	            firebase.auth().signInWithPhoneNumber('+82'+phoneNumber, appVerifier)
                .then(function(confirmationResult) {
               	// SMS가 전송되었습니다. 사용자에게 메시지에서 코드를 입력하도록 요청하고, confirmationResult.confirm(code)로 사용자를 로그인합니다.
                window.confirmationResult = confirmationResult;
                console.log(confirmationResult);
				$('#confirmCodeButton').removeAttr('disabled');
				$('#confirmCodeButton').attr('class', 'account_checkButton__wezDS');
				$('#confirmCode').removeAttr('readonly');
				
                }).catch(function(error) {
                    console.log(error);
    				$('#confirmCodeButton').attr('disabled', true);
    				$('#phoneNumber').val('');
    				$('#confirmCodeButton').attr('class', 'account_noCheckButton__dNWQx');
    				$('#confirmCode').attr('readonly', true);
                // 에러; SMS가 전송되지 않았습니다.
    				alert('SMS가 전송되지 않았습니다.');
                });
			}
        })

        document.getElementById('confirmCodeButton').addEventListener('click', function(event) {
            event.preventDefault();
            var code = document.getElementById('confirmCode').value;
            confirmationResult.confirm(code).then(function(result) {
            	// 사용자가 성공적으로 로그인했습니다.
                var user = result.user;
                console.log(result);
                const phoneNumber = result.user.phoneNumber;
				$('#userTel').val(formatPhoneNumber(phoneNumber));
				//$('#require').show();
				$('#require').show().trigger('showEvent');
				$('#regist').removeAttr('disabled');
				$('#confirmCode').attr('readonly', true);
	            $('#confirmCodeButton').attr('disabled', true);
				$('#phoneNumber').attr('readonly', true);
	            $('#phoneNumberButton').attr('disabled', true);

            }).catch(function(error) {
                console.log(error);
             	// 사용자가 로그인하지 못했습니다 (유효하지 않은 인증 코드인 경우 등)
                alert('인증코드가 틀렸습니다');
                $('#require').hide();
                $('#regist').attr('disabled', true);
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
        
        function showPopup() {
        	  // 현재 확장 프로그램 내의 파일의 경로를 가져오기 위해 runtime.getURL 사용
        	  const popupUrl = chrome.runtime.getURL('popup.html');
        	}

       	$('recaptcha-container').onclick = function() {
       	  showPopup();
       	};
        
        // 비번 보기 숨기기
        // 초기 비번 안보일 때
        let isPassButtonChecked = false;

        // 버튼 클릭 시 호출되는 함수
        function toggleButtonPass() {
          if (isPassButtonChecked) {
            $('#passViewButton').text('비번보기');
          } else {
            $('#passViewButton').text('비번숨기기');
          }
          isPassButtonChecked = !isPassButtonChecked; // 버튼 상태를 토글합니다.
        }

        // 비번 체크 버튼에 클릭 이벤트 리스너 추가
        $('#passViewButton').on('click', function(event) {
          event.preventDefault();
          
          // 버튼의 텍스트가 "비번보기"일 때
          if (!isPassButtonChecked) {

        	  $('#userPassword').attr('type', 'text');
        	  
          } else { // 버튼의 텍스트가 "비번숨기기"일 때
        	  $('#userPassword').attr('type', 'password');
          }

          // 텍스트 변경 함수 호출
          toggleButtonPass();
        }); // 중복 체크 토글 끝
        

       	
    </script>			

</body>
</html>