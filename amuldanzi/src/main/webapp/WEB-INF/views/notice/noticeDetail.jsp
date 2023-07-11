
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





</head>

<jsp:include page="../main/header.jsp"></jsp:include>

<body>
	<div class="main_mainContents__GXYBn2">		
		<hr class="popper_popperMenuDivider__j1QQj">
		<br/>
		<p class="main_mainTitle__nxOQS">공지사항 상세보기</p>
		<hr class="popper_popperMenuDivider__j1QQj">
		<br/>
		<br/>
		
			
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="lightPink" width="600">제목 : ${notice.noticeTitle}</td>
				</tr>
				<tr>
					<td bgcolor="Pink">게시일 : ${notice.noticedate} 조회수 : ${notice.noticeReadCount}</td>
				</tr>
				<tr>
					<td bgcolor="white">내용 : ${notice.noticeContent}</td>
				</tr>
			</table>
			<br/>
			<a href="/notice/notice" class="btn btn-primary">공지사항 목록 가기</a>
		<br/>
		<br>
		<hr class="popper_popperMenuDivider__j1QQj">
		<br/>
		<br/>			
	</div>

</body>
</html>