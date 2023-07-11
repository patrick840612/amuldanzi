
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
		<form action="updateBoard" method="post">
			<input name="seq" type="hidden" value="${board.seq}" />
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input name="title" type="text"
						value="${notice.noticeTitle}" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">게시일 / 조회수</td>
					<td align="left">${notice.noticedate } / ${notice.noticeReadCount }</td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left"><textarea name="content" cols="40" rows="10">
						${notice.noticeContent }</textarea></td>
					<td colspan="2" align="center"><input type="submit"
						value="목록" /></td>	
				</tr>

			</table>
		</form>
		<br>
		<hr class="popper_popperMenuDivider__j1QQj">
		<br/>
		<br/>			
		</div>

</body>
</html>