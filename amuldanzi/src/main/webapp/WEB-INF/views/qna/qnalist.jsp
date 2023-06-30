<%@ page contentType="text/html; charset=UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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

	<table class='table table-bordered'> 
          <thead>
            <tr>
              <th>번호</th>
              <th>질문</th>
              <th>답변</th>                           
            </tr>
          </thead>
          <tbody>
          	<c:forEach items="${list}" var="qnalist">
				<tr>					
					<td>${qnalist.no }</td>
					<td>${qnalist.question }</td>
					<!-- 상대경로 'answer -->
					<!-- 절대경로 '/qna/answer' -->
					<td><a href='/qna/answer?no=${qnalist.no}'>답변하기</a></td>											
				</tr>
			</c:forEach>
          </tbody>
    </table>



    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/js/bootstrap.min.js"></script>
  </body>
</html>