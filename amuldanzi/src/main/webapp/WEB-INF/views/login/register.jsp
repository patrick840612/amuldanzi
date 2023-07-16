
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
	
	// HTML 요소 선택
	const allCheckbox = document.getElementById("all");
	const checkboxes = document.querySelectorAll("input[type='checkbox']:not(#all)");
	const checkLabels = document.querySelectorAll(".account_checkLabel__7ESRF");
	const allCheckNeed = document.getElementById("allCheckNeed"); 
	const custom_control_input = document.querySelectorAll(".custom-control-input");

	// 모두 동의 체크박스 이벤트 처리
	allCheckbox.addEventListener("change", function () {
	  const isChecked = allCheckbox.checked;

	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = isChecked;
	  });
	  
	  // 혈액 나눔 체크박스 트리거 설치
	  $('#bloodGive').prop('checked', isChecked).trigger('change');

	  if (isChecked) {
	    checkLabels.forEach((label) => {
	      allCheckNeed.style.color = "green";
	    });
	  } else {
	    checkLabels.forEach((label) => {
	      allCheckNeed.style.color = "";
	    });
	  }
	});

	// 필수 동의사항 체크박스 이벤트 처리
	custom_control_input.forEach((checkbox) => {
	  checkbox.addEventListener("change", function () {
	    const isAllChecked = [...custom_control_input].every((checkbox) => checkbox.checked);

	    allCheckbox.checked = isAllChecked;

	    if (isAllChecked) {
	      checkLabels.forEach((label) => {
	          allCheckNeed.style.color = "green";
	      });
	    } else {
	      checkLabels.forEach((label) => {
	          allCheckNeed.style.color = "";
	      });
	    }
	  });
	});
	
	// 개별 동의사항 체크박스 이벤트 처리
	checkboxes.forEach((checkbox) => {
		  checkbox.addEventListener("change", function () {
		    const isAllChecked = [...checkboxes].every((checkbox) => checkbox.checked);
		    allCheckbox.checked = isAllChecked;
		  });
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
					$('#idCheck').addClass('alert-primary');
					$('#idCheck').addClass('idCheck');
					$('#idCheckDup').text('');
					$('#idCheckDup').removeClass('alert-danger d-flex align-items-center');
					userIdCheck.setCustomValidity(""); 
				}else{
					// 중복아이디 및 사용불가한 아이디
					if(userId.length <= 5 && userId.length >= 1){
						$('#idCheckDup').text('더 길게');
						$('#idCheckDup').addClass('alert-danger d-flex align-items-center');
						userIdCheck.setCustomValidity("중복오류");
					}else if(userId.length == 0){
						$('#idCheckDup').text('');
						$('#idCheckDup').removeClass('alert-danger d-flex align-items-center');
						userIdCheck.setCustomValidity("중복오류");

					}else if(userId.length >= 15){
						$('#idCheckDup').text('더 짧게');
						$('#idCheckDup').addClass('alert-danger d-flex align-items-center');
						userIdCheck.setCustomValidity("중복오류");
					}else{
						$('#idCheckDup').text('중복');
						$('#idCheckDup').addClass('alert-danger d-flex align-items-center');
						userIdCheck.setCustomValidity("중복오류");
					}
					
					$('#idCheck').text('');
					$('#idCheck').removeClass('alert-primary');
					$('#idCheck').removeClass('idCheck');
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
					$('#EmailCheckDup').removeClass('alert-danger d-flex align-items-center');
					userEmailCheck.setCustomValidity("");
				}else{
					// 중복이메일
					$('#EmailCheckDup').text('이메일 중복');
					$('#EmailCheckDup').addClass('alert-danger d-flex align-items-center');
					userEmailCheck.setCustomValidity("중복오류");
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

				// 중복된 전화번호 없음
				/*if(result.resultEmail == false){
					$('#EmailCheckDup').text('');
					$('#EmailCheckDup').removeClass('duplicateCheck2');
					userEmailCheck.setCustomValidity(""); 
				}else{
					// 중복전화번호
					if(userEmail.length == 0){
						$('#EmailCheckDup').text('필수 입력');
					}else{
						$('#EmailCheckDup').text('중복');
					}
					$('#EmailCheckDup').addClass('duplicateCheck2');
					userEmailCheck.setCustomValidity("중복오류");
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
          }
          if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
            //alert('입력이 올바르지 않습니다');
          }
          if (petCount == 0 && $('#bloodGive').is(':checked') == true){
        	  event.preventDefault();
              event.stopPropagation();
              alert('혈액제공에 동의하면 반려동물 목록에서 등록을 해야합니다');
          }
          form.classList.add('was-validated');
        }, false);
      });
    }, false); //*** 유효성검사 끝
    
	//*** 비밀번호 customVaildity setting
	let password = document.getElementById("userPass")
    ,confirm_password = document.getElementById("userPass2");
    
    function validatePassword(){
    	if(password.value != confirm_password.value){ // 만일 두 인풋 필드값이 같지 않을 경우
    		  // setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
    	      confirm_password.setCustomValidity("Passwords Don't Match"); 
    	}else{// 만일 두 인풋 필드값이 같을 경우
    	      // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 
    	      //오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
    	      // 따라서 빈값을 주어 submit 처리되게 한다.
    	      confirm_password.setCustomValidity('');
    	}	
    }
    password.onkeyup = validatePassword;
    confirm_password.onkeyup = validatePassword;

	  // 모달사용 반려동물 등록 만들기
	  const abutton = document.querySelector("#abutton");
	  const dialog = document.querySelector("#dialog");
	  let petCount=0;
	
	  abutton.addEventListener("click", () => {
          event.preventDefault();
	      dialog.showModal();
	  });

	  $(document).on("click", "#add", function(event) {
		  event.preventDefault();

		  $('#addpet').append($('<div class="addpetDiv"></div>'));
		  $('.addpetDiv').last().append($('<input type="text" class="addpet" name="petName[]" placeholder="반려동물 이름(필수)" required/>'));
		  $('.addpetDiv').last().append($('<input type="text" class="addpet" name="whichPet[]" placeholder="반려동물 종류(필수)" required/>'));
		  $('.addpetDiv').last().append($('<input type="text" class="addpet" name="petBlood[]" placeholder="반려동물 혈액형(필수)" required/>'));
		  $('.addpetDiv').last().append($('<input type="text" class="addpet petgps" name="gps[]" placeholder="GPS 시리얼"/>'));
		  $('.addpetDiv').last().append($('<input type="button" class="addpet" name="deletePet" value="삭제"/><br/><br/>'));
		  petCount += 1;
		});
	
	  $('#confirm').on("click", (event) => {
		  event.preventDefault();
		  dialog.close();
	  });
	  
	  $(document).on("click", "input[name='deletePet']", function(event) {
		  event.preventDefault();
		  $(this).closest('.addpetDiv').remove();
		  petCount -= 1;
		  console.log(petCount);
	  });
	  // 반려동물 등록 끝
	  
	  // 회원가입
	  $('#regist').submit(function(){
		  $('.petgps').each(function() {
			    if ($(this).val() === '') {
			      $(this).val('없음');
			    }
		  });
	  }); // 회원가입 완료
	  

	  
	  // 혈액제공 동의시 선택 체크 여부
	  $('#bloodhidden').hide();
	  
		$('#bloodGive').change(function () {
			if ($('#bloodGive').is(':checked')) {
			    // 체크되었을 때 실행할 코드
				$('#bloodhidden').show();
			    
			} else {
			    // 체크되지 않았을 때 실행할 코드
				$('#bloodhidden').hide();
			}
			
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
					<div class="account_signUpDesc__FZLyl">회원가입</div>
					<form action="/login/regist" method="post" id="regist" class="validation-form" name="frm-join" novalidate> 
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="email" name="userEmail" placeholder="이메일" value=""
								class="account_inputSignUp___sBwm form-control" id="userEmail" required>
							<div id="EmailCheckDup"></div><div></div>
							<div class="invalid-feedback">이메일을 입력해주세요</div>
						</div>
						
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="text" name="id" placeholder="아이디" value=""
								class="account_inputSignUp___sBwm form-control" id="id" required>
							<div id="idCheck" ></div><div id="idCheckDup"></div>
							<div class="invalid-feedback"> 아이디를 입력해주세요</div>
						</div>
							
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="password" name="userPassword" placeholder="비밀번호"
								value="" class="account_inputSignUp___sBwm form-control" id="userPass" minlength="6" maxlength="16" required><div></div><div></div>
							<div class="invalid-feedback">비밀번호를 입력해주세요</div>
						</div>
						
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="password" name="rePassword" placeholder="비밀번호 확인"
								value="" class="account_inputSignUp___sBwm form-control" id="userPass2" required><div></div><div></div>
							<div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>
						</div>



						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="tel" id="hiddenPhone" class="form-control" required/>	
							<input type="tel" name="userTel" placeholder="전화번호"
								class="account_inputSignUp___sBwm" id="userTel" readonly>
														
							<div class="account_alertText__bGPQB"></div>
							<div class="account_signUpInputWrapper__kzyF3">
								<button type="button" class="account_checkButton__wezDS" id="textbutton">번호인증</button>
								<div id="recaptcha-container"></div>
							</div>								
							<div class="invalid-feedback">휴대폰 번호를 인증해주세요</div>
						</div>
						
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="tel" name="userName" placeholder="이름"
								value="" class="account_inputSignUp___sBwm form-control" pattern="^[ㄱ-ㅎ가-힣]+$" minlength="2" required><div></div><div></div>
							<div class="invalid-feedback">이름을 입력해주세요(한글 2글자 이상)</div>
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
							<input type="hidden" id="memberRole" name="memberRole" value="일반회원">
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
							<div class="account_loginfunction__TLCNR ">
								<div class="account_checkboxwrap__SLQoe custom-control custom-checkbox">
									<input type="checkbox" name="a" id="a" class="custom-control-input" required><label for="a"
										class="account_checkLabel__7ESRF custom-control-label">서비스 이용약관 동의</label>
								</div>
								<a class="account_description__zlB3V"
									href="https://corp.bemypet.kr/tos" target="_blank"
									rel="noopener noreferrer">내용보기</a>
							</div>
							<div class="account_loginfunction__TLCNR">
								<div class="account_checkboxwrap__SLQoe custom-control custom-checkbox">
									<input type="checkbox" name="d" id="d" class="custom-control-input" required><label for="d"
										class="account_checkLabel__7ESRF custom-control-label">개인정보 수집 및 이용 동의</label>
								</div>
								<a class="account_description__zlB3V"
									href="https://corp.bemypet.kr/privacy-policy-summary"
									target="_blank" rel="noopener noreferrer">내용보기</a>
							</div>
							<div class="account_loginfunction__TLCNR">
								<div class="account_checkboxwrap__SLQoe custom-control custom-checkbox">
									<input type="checkbox" name="b" id="b" class="custom-control-input" required><label for="b"
										class="account_checkLabel__7ESRF custom-control-label">반려동물을 사랑합니다</label>
								</div>
							</div>
							<div class="account_loginfunction__TLCNR">
								<div class="account_checkboxwrap__SLQoe">
									<input type="checkbox" name="marketingOk" id="marketingOk"><label for="marketingOk"
										class="account_checkLabel__7ESRF">(선택) 마케팅 정보 수신 동의</label>
								</div>
								<a class="account_description__zlB3V"
									href="https://corp.bemypet.kr/marketing-agreement/"
									target="_blank" rel="noopener noreferrer">내용보기</a>
							</div>
							<div class="account_loginfunction__TLCNR">
								<div class="account_checkboxwrap__SLQoe">
									<input type="checkbox" name="bloodGive" id="bloodGive"><label for="bloodGive"
										class="account_checkLabel__7ESRF">(선택) 반려동물 혈액 나눔 동의</label><br/>
								</div>
							</div>
							
							<div id="bloodhidden">
							<div class="account_alertText__bGPQB"></div>
								<div style="color : red;">혈액나눔에 동의하시면 동의한 회원들에게 노출번호가 공개됩니다</div>
								<div>혈액 나눔 노출번호 (*안심번호로 수정가능)</div>
								<div class="account_checkboxwrap__SLQoe"><input type="checkbox" name="safeTel" id="safeTel"><label for="safeTel" class="account_checkLabel__7ESRF">안심번호 사용</label></div>
								<div class="account_signUpInputWrapper__kzyF3">
								<input type="tel" id="bloodTel" name="bloodTel" placeholder="0500-0000-0000" class="account_inputSignUp___sBwm"/>
							</div>
								<a class="account_description__zlB3V"
									href="https://i.etcc.co.kr/33"
									target="_blank" rel="noopener noreferrer">안심번호 만드는 방법 : 어플리케이션 (모바)</a>
							
							<div class="account_alertText__bGPQB"></div>
								<div style="color : green;">혈액 나눔 정보에 메세지를 남겨주세요</div>
								<div>혈액 나눔 메시지</div>
								<div class="account_signUpInputWrapper__kzyF3">
								<textarea style="resize:none; height: 100px; border: 1px solid black;" class="account_inputSignUp___sBwm" id="bloodMessage" name="bloodMessage" placeholder="예) 전화연락 말고 문자남겨주세요"></textarea>
							</div>
							</div>
							
							<div class="account_alertText__bGPQB"></div>
								<div class="account_signUpInputWrapper__kzyF3">
									<button type="button" class="account_checkButton__wezDS" id="abutton">반려동물 목록</button>
							</div>
							<dialog  id="dialog"> 나의 반려동물을 등록해 보아요<br/><br/>
								<div id="addpet"></div>
								<div>
								<button value="add" id="add">반려동물 등록</button><br/><br/>
								<button value="confirm" id="confirm">완료</button>
								</div>
							</dialog>
							
							<div class="account_alertText__bGPQB" id="allCheckNeed">필수 동의사항에 동의해야 회원가입이
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
							<dialog  id="textdialog"> 로봇이 아님을 증명해 주세요 <br/><br/>
							    <form>
							        핸 드 폰 번 호 : <input id="phoneNumber"/>
							        <button type="tel" id="phoneNumberButton" disabled="disabled">전화 번호 전송</button>
							    </form>
								<br/>
							    <form>
							        문자인증코드 : <input id="confirmCode"/>
							        <button id="confirmCodeButton" disabled="disabled">확인 코드 전송</button>
							    </form>
								<br/>
								<button id="back">회원가입 페이지 돌아가기</button>
							</dialog>

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
		
		// 문자인증 받기
	  	const textdialog = document.querySelector("#textdialog");
	  	const textbutton = document.querySelector("#textbutton");
	  
	 	 $('#hiddenPhone').hide();
	  
	 	 $('#back').click(function(){
			  textdialog.close();
		  });

		// 로봇인증 확인여부
		let recaptchaResolved = false;

		$('#textbutton').on('click', function(event) {
			event.preventDefault();
			event.stopPropagation();
			if (!recaptchaResolved){
				alert("로봇이 아님을 인증해 주세요");				
			}else{
				textdialog.showModal();
			}
		});

        window.recaptchaVerifier = new RecaptchaVerifier(auth, 'recaptcha-container', {
            'size': 'normal',
            'callback': (response) => {
                // console.log(response)
                // reCAPTCHA가 해결되면 signInWithPhoneNumber을 허용합니다.
				$('#recaptcha-container').hide();
				$('#phoneNumberButton').removeAttr('disabled');
				// $('#textbutton').removeAttr('disabled');
				// $('#textbutton').attr('class', 'account_checkButton__wezDS');
				textdialog.showModal();  
      
                // reCAPTCHA가 해결되었으므로 변수 값을 true로 설정합니다.
                recaptchaResolved = true;
            },
            'expired-callback': () => {
                console.log('error')
                // 응답이 만료되었습니다. 사용자에게 reCAPTCHA를 다시 풀도록 요청합니다.
				$('#recaptcha-container').show();
				$('#phoneNumberButton').attr('disabled', true);
				// $('#textbutton').attr('class', 'account_noCheckButton__dNWQx');
				// $('#textbutton').attr('disabled', true);
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
            const phoneNumber = document.getElementById('phoneNumber').value
            const appVerifier = window.recaptchaVerifier;

            signInWithPhoneNumber(auth, '+82'+phoneNumber, appVerifier)
                .then((confirmationResult) => {
                // SMS가 전송되었습니다. 사용자에게 메시지에서 코드를 입력하도록 요청하고, confirmationResult.confirm(code)로 사용자를 로그인합니다.
                window.confirmationResult = confirmationResult;
                // console.log(confirmationResult)
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
				const phoneNumber = result.user.phoneNumber;
                console.log(phoneNumber);
				$('#userTel').val(formatPhoneNumber(phoneNumber));
				$('#hiddenPhone').val(formatPhoneNumber(phoneNumber));
				$('#bloodTel').val(formatPhoneNumber(phoneNumber));
				textdialog.close();

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