<%@page contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>부트스트랩 101 템플릿</title>

    <!-- 부트스트랩 -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

  </head>
  <body>
  <!--  #############################  -->
    <div class="jumbotron">
	  	<h1>Hello, world!</h1>
	</div>
	
		<form action="/qna/answer" method='post' class='form'>  
	        <div class='form-group'>
	        	<label for="name">작성자이름</label>
	        	<input type="text" class='form-control' name="writer" id='name' readonly="readonly" value="${qna.writer}"/> 
	        </div>
	        <div class='form-group'>
	        	<label for="email">문의사항</label>
	        	<textarea class='form-control'name="question" readonly="readonly">${qna.question }</textarea>     	  
	        </div>
	        <input type="hidden" name="manager" value="관리자"/>
	        <input type="hidden" name="no" value="${qna.no}"/>
	        <div class='form-group'>
	        	<label for="answer">답변</label>
	        	<textarea class='form-control' name="answer" placeholder="답변을 작성하세요"></textarea>	        	  
	        </div>
	        
	        <div class='form-group'>
	        	<button type="submit" > 답변하기</button>
	        </div>      
	    </form>	

	
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/js/bootstrap.min.js"></script>
  </body>
</html>