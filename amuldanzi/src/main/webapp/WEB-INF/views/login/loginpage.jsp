
<%@ page contentType="text/html; charset=UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인페이지 - 애물단지</title>




<!-- 부트스트랩 -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/chunks/css/c552b37c371c331c.css" rel="stylesheet">
<link href="/chunks/css/39c68523bb4928b9.css" rel="stylesheet">
<link href="/chunks/css/281067dbec461a13.css" rel="stylesheet">
<link href="/chunks/css/3ca3804aef0f69b8.css" rel="stylesheet">
<link href="/chunks/css/text.css" rel="stylesheet">
<style type="text/css">
dialog::backdrop{
	background-color : rgba(0,0,0,0.5);
	backdrop-filter: blur(1px);
}

dialog{
	box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
	border: 0;
	text-align: center;
	border-radius: 20px;
	padding: 30px 20px 30px 20px;
	background-color : navy;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	// Model에 id가 있으면(구글 또는 카카오 로그인확인하여 db에 데이터가 있을 경우) /main/login 으로 이동
	if(${not empty id}) location.href="/main/login?id=${id}";
	
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
	} // 구글 로그인 버튼 클릭 함수 종료
	
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
	} // 카카오 로그인 버튼 클릭 함수 종료
	
	// 회원가입 창 이동 함수
	const linkToRegist = () => location.href="/login/register";
	
	// 로그인 버튼 클릭시 이벤트 함수
	const loginCheck = (event) => {
		event.preventDefault();
		let paramsLoginCheck = {
				id : $('#id').val(),
				userPassword: $('#password').val()
		};
		
		$.ajax({
			type : 'post',
			data : paramsLoginCheck,
			url : '/login/loginCheck',
			success : function(result){
				if(result != "") location.href="/login/login?id="+result;
				else alert("로그인 실패");
			},
			error : function(err){
				console.log(err);
				alert('Error');
			}
		}); // ajax end
	} // end of loginCheck
	

	
	// 구글 로그인 버튼 클릭 시
	$("#g_login_btn").click(getGoogleLoginUri);
	// 카카오 로그인 버튼 클릭 시
	$("#k_login_btn").click(getKakaoLoginUri);
	// 회원가입 버튼 클릭 시
	$("#regist").click(linkToRegist);
	// 로그인 버튼 클릭 시
	$("#loginform_submit").click(loginCheck);
	
	
	// 관리자 회원가입 입장
	$("#mregist").click(function(){
		
		  // 모달사용법
		  const dialog = document.querySelector("#dialog");
		  dialog.showModal();
		  
		  $('#confirm').on("click", (event) => {
			  event.preventDefault();
			  dialog.close();
			  
			  if($('#pass').val() === 'admin1234'){
				  $('#pass').val('');
				  location.href="/login/mregister";
			  }else{
				  $('#pass').val('');
			  }
			});
	});

});
</script>

</head>

<jsp:include page="../main/header.jsp"></jsp:include>

<body>
							
						 	


	<div class="login_contents__1fQZs">
						<dialog  id="dialog">
								<input type="text" placeholder="관리자 비밀번호" required name = "pass" id="pass"/>
								<button value="confirm" id="confirm" class="mbutton">Confirm</button>
						</dialog>	
		<div class="login_loginImgWrapper__ETBnE">
			<img src="/images/logo1.png" class="login_loginImg__aI0wq">
		</div>
		<div class="login_loginText__KyIof">로그인</div><br/>
		
		<div class="login_loginFormContainer__rXt08">
	         <form action="/login/loginCheck" method="post">
	            <div>
	               <input type="text" placeholder="아이디" required=""
	                  class="login_inputLogin__iEQRu" value="" name = "id" id="id">
	            </div>
	            <div>
	               <input name="userPassword" type="password" placeholder="비밀번호"
	                  required="" class="login_inputLogin__iEQRu" value="" id ="password">
	            </div>
	            <button type = "submit" class="login_loginButton__8nq4e" id="loginform_submit">로그인</button>
	         </form>
		<div>		
			
		<div class="login_loginSNSText__W8qP8">간편하게 SNS 로그인</div>
		<div>
			<div class="login_btnWrapper__gPI6I">
				<button class="login_loginKakao" id="k_login_btn">
					<img src="/images/icon_kakao.svg" class="login_loginKakao__TI4hn">카카오톡 로그인
				</button>
			</div>
			<div class="login_btnWrapper__gPI6I">
				<button class="login_loginGoogle__g9yTZ" id="g_login_btn">
					<img src="/images/Fill_google.svg" class="login_logoGoogle__CAPsi">Google 로그인
				</button>
			</div>
		</div>
		<div class="login_loginBar__546og"></div>
	
			<div class="login_loginfunction__KPcAe">
				<div class="login_loginTab__9nBLa">비밀번호 찾기</div>
				<div class="login_loginfunctionBar__RYXDN"></div>
				<div class="login_loginTab__9nBLa" id="regist">회원가입</div>
				<div class="login_loginTab__9nBLa" id="mregist">관리자 회원가입</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>