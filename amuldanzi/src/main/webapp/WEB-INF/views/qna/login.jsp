
<%@ page contentType="text/html; charset=UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>애물단지</title>




<!-- 부트스트랩 -->
<link href="/css/bootstrap.min.css" rel="stylesheet">



<link href="/chunks/css/c552b37c371c331c.css" rel="stylesheet">
<link href="/chunks/css/39c68523bb4928b9.css" rel="stylesheet">
<link href="/chunks/css/281067dbec461a13.css" rel="stylesheet">
<link href="/chunks/css/3ca3804aef0f69b8.css" rel="stylesheet">
<link href="/chunks/css/text.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
.value{
	margin-top: -5rem;
	font-size: 7rem;
	font-weight: 100;
	text-align: center;
	
}

</style>
</head>

<jsp:include page="./header.jsp"></jsp:include>

<body>
	<script type="text/javascript" src='/character.js'></script>
	<script type="text/javascript" src='/character2.js'></script>
	
	<div class="login_contents__1fQZs">
		<img class='cat' src='/icons8-cat-26.png'>
		<div class='value'>requestAnimationFrame</div>
		<div class="login_loginImgWrapper__ETBnE">
			<img src="/images/logo1.png" class="login_loginImg__aI0wq">
		</div>
		<div class="login_loginText__KyIof">로그인</div>
		<div class="login_loginSNSText__W8qP8">간편하게 SNS 로그인</div>
		<div>
			<div class="login_btnWrapper__gPI6I">
				<div id="naverIdLogin" style="display: none;">
					<a id="naverIdLogin_loginButton" href="#"><img
						src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.0"
						height="45"></a>
				</div>
				<button class="login_loginNaver__HVe_U">
					<img src="/images/Fill_naver.svg" class="login_logoNaver__A2sVP">네이버로
					로그인
				</button>
			</div>
			<div class="login_btnWrapper__gPI6I">
				<button class="login_loginKakao">
					<img src="/images/icon_kakao.svg" class="login_loginKakao__TI4hn">카카오톡 로그인
				</button>
			</div>
			<div class="login_btnWrapper__gPI6I">
				<button class="login_loginGoogle__g9yTZ">
					<img src="/images/Fill_google.svg" class="login_logoGoogle__CAPsi">Google
					로그인
				</button>
			</div>
		</div>
		<div class="login_loginBar__546og"></div>
		<div>			
			<div class="login_loginfunction__KPcAe">
				<div class="login_loginTab__9nBLa">비밀번호 찾기</div>
				<div class="login_loginfunctionBar__RYXDN"></div>
				<div class="login_loginTab__9nBLa">회원가입</div>
			</div>
		</div>
	</div>

</body>
</html>