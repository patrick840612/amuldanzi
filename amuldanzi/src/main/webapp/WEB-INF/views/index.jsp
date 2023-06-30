<%@page contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>부트스트랩 101 템플릿</title>

    <!-- 부트스트랩 -->
    <!-- href="css/bootstrap.min.css" 상대경로일 경우 내 위치에 따라 css가 안잡힘 -->
    <!-- href="/css/bootstrap.min.css" 그래서 절대 경로를 주는 경우가 많음 -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">


  </head>
  <body>
  <!--  #############################  -->
    <div class="jumbotron">
  	<h1>Hello, world!</h1>
  	<p>...</p>
  	<p>  	
  	
  	<a class="btn btn-primary btn-lg" href="/qna/write" role="button">글쓰기</a>
  	<a class="btn btn-primary btn-lg" href="/qna/qnalist" role="button">목록보기</a>
  	<a class="btn btn-primary btn-lg" href="/qna/header" role="button">헤더보기</a>
  	<a class="btn btn-primary btn-lg" href="/qna/main" role="button">메인보기</a>
	<a class="btn btn-primary btn-lg" href="/qna/login" role="button">로그인보기</a>
	<a class="btn btn-primary btn-lg" href="/qna/mainSearch" role="button">메인검색</a>
  	</p>
	</div>

  <!--  #############################  -->
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <!-- js/bootstrap.min.js 상대경로일 경우 내 위치에 따라 js가 안잡힘 -->
    <!-- /js/bootstrap.min.js 그래서 절대 경로를 주는 경우가 많음 -->
    <script src="/js/bootstrap.min.js"></script>
  </body>
</html>