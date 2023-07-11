
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
		<p class="main_mainTitle__nxOQS">공지사항</p>
		<hr class="popper_popperMenuDivider__j1QQj">
		<br/>
		<br/>
		<table border="1">
			<tr>
				<th bgcolor="lightPink" width="100">공지번호</th>
				<th bgcolor="lightPink" width="200">제목</th>
				<th bgcolor="lightPink" width="150">게시일</th>
				<th bgcolor="lightPink" width="100">조회수</th>
			</tr>
			<c:forEach items="${noticeList}" var="notice">
				<tr>
					<td>${notice.noticeNo}</td>
					<td align="left"><a href="noticeDetail?noticeTitle=${notice.noticeTitle }">
							${notice.noticeTitle }</a></td>
					<td>${notice.noticedate }</td>
					<td>${notice.noticeReadCount }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<hr class="popper_popperMenuDivider__j1QQj">
		<br/>			
		</div>

</body>
</html>