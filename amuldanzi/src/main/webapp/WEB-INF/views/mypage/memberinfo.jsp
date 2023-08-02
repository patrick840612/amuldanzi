<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 정보관리</title>
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

.socialSpace{
	justify-content: space-evenly !important;

}

</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b8a8315badb6e28366adcc9ec043dca2&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	let bloodTelCheck = '<c:out value="${member.bloodTel}" />';
	let secondChar = bloodTelCheck.charAt(1);
	let safeTelCheckbox = document.getElementById('safeTel');
	
	 if (bloodTelCheck === null) {
	 	 
	     //alert('bloodTelCheck 변수가 null입니다.');
	  } else if(bloodTelCheck === ''){
		  
		  //alert('bloodTelCheck 변수가 빈 문자열입니다.');
	  }else{
		  //console.log(typeof bloodTelCheck);
	    //alert('bloodTelCheck 변수의 값: ' + bloodTelCheck);
		    if (secondChar === '1') {
			    // 두 번째 문자가 '1'인 경우에 실행할 코드 작성
			  } else {
			    // 두 번째 문자가 '1'이 아닌 경우에 실행할 코드 작성
			        safeTelCheckbox.setAttribute('checked', 'checked');
			        $('#bloodTel').removeAttr('readonly');
			  }
	  }
	
	// 상세주소 숨기기
	$('#addr2').hide();

	// 주소 변경 클릭 시 카카오api로 주소 검색
	$("#addrbutton").click(function(event){
		event.preventDefault();
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	            $("#addr1").val(data.address);
	            $("#userAddr").val(data.address);
	            $("#addr1").prop("readonly",true);
	            $("#sido").val(data.sido);
	            $("#sigungu").val(data.sigungu);
	            $('#addr2').val('');
	            $('#addr2').show();
	            $("#userAddr").val(data.address);
	        }
	    }).open()
	});
	
	// 상세주소 입력시 주소 합치기
	$('#addr2').blur(function(){
		var addr1 = $("#addr1").val();
		var addr2 = $("#addr2").val();
		$("#userAddr").val(addr1+" "+addr2);
	});
  

	  // 모달사용 반려동물 관리
	  const abutton = document.querySelector("#abutton");
	  const dialog = document.querySelector("#dialog");
	  let petCount=${pets != null ? pets.size() : 0};
	
	  if(petCount == 0){
		  $('#bloodhidden').hide();
	  }
	  
	  abutton.addEventListener("click", () => {
        event.preventDefault();
	      dialog.showModal();
	  });
	  // 반려동물 등록(추가) 버튼 클릭시 1열 추가
	  $(document).on("click", "#add", function(event) {
		  event.preventDefault();

		  $('#addpet').last().append($('<div class="addpetDiv"></div>'));
		  $('.addpetDiv').last().append($('<input type="hidden" class="addpet" name="MemberPetId[]" value="0"/>'));
		  $('.addpetDiv').last().append($('<input type="text" class="addpet" name="petName[]" placeholder="반려동물 이름(필수)" required style="margin-right: 9px;"/>'));
		  $('.addpetDiv').last().append($('<input type="text" class="addpet" name="whichPet[]" placeholder="반려동물 종류(필수)" required style="margin-left: 5px; margin-right: 9px;"/>'));
		  $('.addpetDiv').last().append($('<input type="text" class="addpet" name="petBlood[]" placeholder="반려동물 혈액형(필수)" required style=" margin-left: 5px; margin-right: 9px;"/>'));
		  $('.addpetDiv').last().append($('<input type="text" class="addpet petgps" name="gps[]" placeholder="GPS 시리얼"  style=" margin-left: 5px; margin-right: 15px;"/>'));
		  $('.addpetDiv').last().append($('<input type="button" class="addpet" name="deletePet" value="삭제"/><br/><br/>'));
		  petCount += 1;
	  });
	  // 완료버튼 클릭시 모달 닫기
	  $('#confirm').on("click", (event) => {
		  event.preventDefault();
		  dialog.close();
	  });
	  // 삭제 버튼 클릭시 해당 반려동물 정보 삭제(db연동)
	  $(document).on("click", "input[name='deletePet']", function(event) {
		  event.preventDefault();
		  $(this).closest('.addpetDiv').remove();
		  petCount -= 1;
		  
		  let paramPetdelete = { memberPetId : $(this).prev().prev().prev().prev().prev().val() };
		  
	        $.ajax({
				type : 'post',
				url : '/mypage/deletePet',
				data : paramPetdelete,
	    	    success: function() {

		        },
		        error:function(e){
		            console.log("error : ", e);
		            alert('error');
		        }
			});
	  });
	  // 반려동물 등록 끝
	  
	  if(petCount == 0){
		  $('#bloodhidden').hide();
	  }
	  	// 혈액제공 동의시 선택 체크 여부
		$('#bloodGive').change(function () {
			if ($('#bloodGive').is(':checked')) {
			    // 체크되었을 때 실행할 코드
				$('#bloodhidden').show();
			    if($('#bloodTel')==""){
			    	$('#bloodTel').val($('#userTel').val());
			    }
			} else {
				const bloodisChecked = $('#bloodGive').checked;
			    // 체크되지 않았을 때 실행할 코드
				$('#bloodhidden').hide();
				$('#safeTel').prop('checked', false);
				$('#bloodMessage').val('');
				$('#addpet').empty();
				petCount = 0;		
				$('#safeTel').trigger('change');
				
			    let paramPetDel = { id : $('#id').val(), bloodGive : $("#bloodGive").prop("checked")};
			  
		        $.ajax({
					type : 'post',
					url : '/mypage/petDel',
					data : paramPetDel,
		    	    success: function() {

			        },
			        error:function(e){
			            console.log("error : ", e);
			            alert('error');
			        }
				});

			}
			
		});
	
		// 안심번호 사용 체크박스 변경시
		$('#safeTel').change(function () {
			if ($(this).is(':checked')) {
			    // 체크되었을 때 실행할 코드
				$('#bloodTel').removeAttr('readonly');
				$('#bloodTel').val('');			    
			} else {
			    // 체크되지 않았을 때 실행할 코드
				$('#bloodTel').attr('readonly', true);
				$('#bloodTel').val($('#userTel').val());
			}

		});
		
		// 안심번호 패턴 검사
		$('#bloodTel').blur(function(){
		    if ($('#safeTel').is(':checked')) {
		        const inputValue = $('#bloodTel').val();
		        const regex = /^\d{4}-\d{4}-\d{4}$/;
		        
		        if (!regex.test(inputValue) && $(this).val() != '') {
			          alert('안심번호 형식이 올바르지 않습니다. "0500-0000-0000" 형식으로 입력해주세요.');
			          $('#bloodTel').val($('#userTel').val());
			          $('#safeTel').prop('checked', false);
			          $('#safeTel').trigger('change');
		        } else if((!regex.test(inputValue) && $(this).val() == '')){
			          $('#bloodTel').val($('#userTel').val());
			          $('#safeTel').prop('checked', false);
			          $('#safeTel').trigger('change');
		        }
		      }
		});
		
		// 번호인증 클릭시 문자인증 팝업창 오픈
		$('#textbutton').on('click', function(event) {
			event.preventDefault();
			event.stopPropagation();
			window.open("/login/registerauth","문자인증 페이지 이동","width=800, height=600, left=600, top=200");
		});
		
		// 비밀번호 변경 클릭 시
		$('#findPassword').click(function(){
			location.href="/login/findPassword";
		});
	  
		// 구글 체크박스 활성화 시
		$("#google").click(function() {
		  if ($(this).prop("checked")) {
			  $(this).prop("checked", false);
		    getGoogleLoginUri(); // 체크될 때 실행할 함수
		  } else {
		    deleteGoogle(); // 체크가 해제될 때 실행할 함수
		  }
		});

		// 카카오 체크박스 활성화 시
		$("#kakao").click(function() {
		  if ($(this).prop("checked")) {
			  $(this).prop("checked", false);
		    getKakaoLoginUri(); // 체크될 때 실행할 함수
		  } else {
		    deleteKakao(); // 체크가 해제될 때 실행할 함수
		  }
		});
		
		// 구글 로그인 uri 가져오기
		const getGoogleLoginUri = ()=>{
			$.ajax({
				url : '/login/getGoogleLoginUri',
				success : function(result){
					location.href=result;
				},
				error : function(err){
					console.log(err);
					alert('Error');
				}
			});
		} // 구글 체크 함수 종료
		
		// 카카오 로그인 uri 가져오기
		const getKakaoLoginUri = () =>{
			$.ajax({
				url : '/login/getKakaoLoginUri',
				success : function(result){
					location.href=result;
				},
				error : function(err){
					console.log(err);
					alert('Error');
				}
			});
		} // 카카오 체크 함수 종료
		
		// 체크가 해제될 때 실행할 함수들 정의
		const deleteGoogle = () => {
			let paramSocial = { id : $('#id').val(), social : 'google' }
		  // 체크가 해제될 때 실행할 동작들을 여기에 작성
			$.ajax({
				url : '/mypage/deleteGoogle',
				data : paramSocial,
				success : function(){
					
				},
				error : function(err){
					console.log(err);
					alert('Error');
				}
			});
		}// 구글 정보 삭제

		const deleteKakao = () =>{
			let paramSocial = { id : $('#id').val(), social : 'kakao' }
		  // 체크가 해제될 때 실행할 동작들을 여기에 작성
			$.ajax({
				url : '/mypage/deleteKakao',
				data : paramSocial,
				success : function(){

				},
				error : function(err){
					console.log(err);
					alert('Error');
				}
			});
		} // 카카오 정보 삭제
		
	  
		  // 회원정보수정 클릭
		  $('#regist').submit(function(eve){
			  	eve.preventDefault();
			    const userEmailInput = document.getElementById('userEmail');
			    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			  
			    //if (!emailPattern.test(userEmailInput.value)) {
			    //    alert('올바른 이메일 주소를 입력해주세요');
			    //}else 
			    if($("#bloodGive").prop("checked") == true && petCount == 0){
			    	alert('혈액 나눔 동의시 반려동물을 등록해주세요');
			    }else if($('.addpetDiv input[required]').filter(function() {
			        return $(this).val().trim() === '';
			    }).length > 0){
			    	alert('반려동물 필수 정보를 입력해주세요');
			    }else if(petCount>0 || $("#bloodGive").prop("checked") == false){
					  $('.petgps').each(function() {
						    if ($(this).val() === '') {
						      $(this).val('없음');
						    }
					 });
					 //$(this).submit(); 
					 $(this).unbind('submit').submit();
			  }
		  });
		  
		  
		  // 변경사항 미저장 경고창
		/* window.addEventListener('beforeunload', function (e) {
			  e.preventDefault();
			  e.returnValue = '';  // Chrome, Firefox에는 이 속성이 필요합니다.
		});*/
});

</script>
</head>

<jsp:include page="../main/header.jsp"></jsp:include>

<body>
<c:if test="${not empty selectCharacter}">
	<img class='cat' src='/character/images/${selectCharacter}' id="cat"/>
</c:if> 
	<div class="login_contents__1fQZs">
		<div class="account_signUpContainer__nL9LE">
			<div class="account_contents__E8DTc">
				<div class="account_signUpFormContainer__tTwFf">
					<div class="account_signUpDesc__FZLyl">${member.id}님정보 관리</div>
					<form action="/mypage/updateMemberInfo" method="post" id="regist"
						class="validation-form" name="frm-join" novalidate>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="email" name="userEmail" placeholder="이메일"
								value="${member.userEmail}"
								class="account_inputSignUp___sBwm form-control" id="userEmail"
								required>
							<div id="EmailCheckDup"></div>
							<div></div>
							<div class="invalid-feedback">이메일을 입력해주세요</div>
						</div>

						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="text" name="id" placeholder="아이디"
								value="${member.id}"
								class="account_inputSignUp___sBwm form-control" id="id" required
								readonly="readonly">
							<div id="idCheck"></div>
							<div id="idCheckDup"></div>
							<div class="invalid-feedback">아이디를 입력해주세요</div>
						</div>

						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="hidden" id="hiddenPhone" class="form-control" required
								value="${member.userTel}" /> <input type="tel" name="userTel"
								placeholder="전화번호"
								class="account_inputSignUp___sBwm form-control" id="userTel"
								readonly value="${member.userTel}">
							<div id="TelCheckDup"></div>
							<div></div>
							<div class="account_alertText__bGPQB"></div>
							<div class="account_signUpInputWrapper__kzyF3">
								<button type="button" class="account_checkButton__wezDS"
									id="textbutton">번호 변경</button>
							</div>
							<div class="invalid-feedback">휴대폰 번호를 인증해주세요</div>
						</div>

						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="tel" name="userName" placeholder="이름"
								value="${member.userName}"
								class="account_inputSignUp___sBwm form-control"
								pattern="^[ㄱ-ㅎ가-힣]+$" minlength="2" required>
							<div></div>
							<div></div>
							<div class="invalid-feedback">이름을 입력해주세요(한글 2글자 이상)</div>
						</div>

						<!-- 주소검색 -->
						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="text" id="addr1" readonly="readonly"
								placeholder="주소입력"
								class="account_inputSignUp___sBwm form-control" name="userAddr1"
								value="${member.userAddr}">
							<div class="account_alertText__bGPQB"></div>
							<div></div>
							<div></div>
							<div class="account_signUpInputWrapper__kzyF3">
								<button type="button" class="account_checkButton__wezDS"
									id="addrbutton">주소 변경</button>
							</div>
						</div>

						<div class="account_alertText__bGPQB"></div>
						<div class="account_signUpInputWrapper__kzyF3">
							<input type="text" id="addr2" placeholder="상세주소"
								class="account_inputSignUp___sBwm form-control" name="userAddr2">

							<input type="hidden" id="lat" name="lat"> <input
								type="hidden" id="lng" name="lng"> <input type="hidden"
								id="sido" name="sido" value="${member.sido}"> <input type="hidden" id="sigungu"
								name="sigungu" value="${member.sigungu}"> <input type="hidden" id="memberRole"
								name="memberRole" value="일반회원">
						</div>
						<input type="hidden" name="userAddr" id="userAddr"
							value="${member.userAddr}">

							<div class="account_alertText__bGPQB"></div>
							<div class="account_signUpInputWrapper__kzyF3">
								<button type="button" class="account_checkButton__wezDS"
									id="findPassword">비밀번호 변경</button>
							</div><br/>

						<div class="account_alertText__bGPQB"></div>
						<div class="account_loginCheckbox__FAhai">

							<div class="account_loginfunction__TLCNR">
								<div class="account_checkboxwrap__SLQoe">
									<input type="checkbox" name="marketingOk" id="marketingOk"
										<c:if test="${member.marketingOk == true}">checked="checked"</c:if>><label
										for="marketingOk" class="account_checkLabel__7ESRF">(선택)
										마케팅 정보 수신 동의</label>
								</div>
								<a class="account_description__zlB3V"
									href="https://corp.bemypet.kr/marketing-agreement/"
									target="_blank" rel="noopener noreferrer">내용보기</a>
							</div>
							<div class="account_loginfunction__TLCNR">
								<div class="account_checkboxwrap__SLQoe">
									<input type="checkbox" name="bloodGive" id="bloodGive"
										<c:if test="${member.bloodGive == true}">checked="checked"</c:if>><label
										for="bloodGive" class="account_checkLabel__7ESRF">(선택)
										반려동물 혈액 나눔 동의</label><br />
								</div>
							</div>

							<div id="bloodhidden">
								<div class="account_alertText__bGPQB"></div>
								<div style="color: red;">반려동물 혈액 나눔 동의 체크 해제시 반려동물 정보가 삭제됩니다</div>
								<div style="color: red;">혈액나눔에 동의하시면 동의한 회원들에게 노출번호가 공개됩니다</div>
								<div>혈액 나눔 노출번호 (*안심번호로 수정가능)</div>
								<div class="account_checkboxwrap__SLQoe">
									<input type="checkbox" name="safeTel" id="safeTel"><label
										for="safeTel" class="account_checkLabel__7ESRF">안심번호
										사용</label>
								</div>
								<br />
								<div class="account_signUpInputWrapper__kzyF3">
									<input type="tel" id="bloodTel" name="bloodTel"
										placeholder="0500-0000-0000"
										class="account_inputSignUp___sBwm" readonly
										value="${member.bloodTel}" />
								</div>
								<a class="account_description__zlB3V"
									href="https://i.etcc.co.kr/33" target="_blank"
									rel="noopener noreferrer"
									style="color: blue; text-decoration: underline;">안심번호 만드는
									방법 : 어플리케이션 (모바)</a>

								<div class="account_alertText__bGPQB"></div>
								<div style="color: green;">혈액 나눔 정보에 메세지를 남겨주세요</div>
								<div>혈액 나눔 메시지</div>
								<div class="account_signUpInputWrapper__kzyF3">
									<textarea
										style="resize: none; height: 100px; border: 1px solid black;"
										class="account_inputSignUp___sBwm" id="bloodMessage"
										name="bloodMessage" placeholder="예) 전화연락 말고 문자남겨주세요">${member.bloodMessage}</textarea>
								</div>
								<div class="account_alertText__bGPQB"></div>
								<div class="account_signUpInputWrapper__kzyF3">
									<button type="button" class="account_checkButton__wezDS"
										id="abutton">반려동물 목록</button>
								</div>
							</div>

							<dialog id="dialog"> 나의 반려동물을 등록해 보아요<br />
							<br />
							<div id="addpet">
								<c:forEach items="${pets}" var="pet">
									<div class="addpetDiv">
										<input type="hidden" class="addpet" name="MemberPetId[]" value="${pet.memberPetId}"/>	 
										<input type="text" class="addpet" name="petName[]"
											placeholder="반려동물 이름(필수)" required value="${pet.petName}" />
										<input type="text" class="addpet" name="whichPet[]"
											placeholder="반려동물 종류(필수)" required value="${pet.whichPet}" />
										<input type="text" class="addpet" name="petBlood[]"
											placeholder="반려동물 혈액형(필수)" required value="${pet.petBlood}" />
										<input type="text" class="addpet petgps" name="gps[]"
											placeholder="GPS 시리얼" value="${pet.gps}" />
										<input
											type="button" class="addpet" name="deletePet" value="삭제" /><br/>
										<br/>
									</div>
								</c:forEach>
							</div>
							<div>
								<button value="add" id="add">반려동물 등록(추가)</button>
								<br /> <br />
								<button value="confirm" id="confirm">완료</button>
							</div>
							</dialog>


						</div>


						<div>
							<div class="login_loginBar__546og"></div>
							<div class="login_loginSNSText__W8qP8">SNS 소셜연결</div>
							<div class="account_alertText__bGPQB"></div>
							<div class="account_loginCheckbox__FAhai">
								<div class="account_loginfunction__TLCNR socialSpace">
									<div class="account_checkboxwrap__SLQoe">
										<input type="checkbox" name="social" id="google"
											<c:if test="${google != null}">checked="checked"</c:if>><label
											for="google" class="account_checkLabel__7ESRF">구글</label>
									</div>
									<div class="account_checkboxwrap__SLQoe">
										<input type="checkbox" name="social" id="kakao"
											<c:if test="${kakao != null}">checked="checked"</c:if>><label
											for="google" class="account_checkLabel__7ESRF">카카오</label><br />
									</div>
								</div>
							</div>

							<div class="login_loginBar__546og"></div>
								<button type="submit" class="account_signUpButton__6SW9R"
									id="registConfirm">회원정보 수정</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>