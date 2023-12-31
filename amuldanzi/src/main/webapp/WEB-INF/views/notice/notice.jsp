
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
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

<style>
.table-bordred thead {
	background-color: pink;
}

.col-md-12 {
	margin-left: -90px;
}

.table-bordred td {
	/*width: 150px;  각 셀의 가로 크기를 150픽셀로 설정 */
	height: 50px; /* 각 셀의 세로 크기를 50픽셀로 설정 */
	padding: 10px; /* 각 셀의 내용과 테두리 사이의 여백(padding)을 설정 */
	text-align: center; /* 각 셀의 텍스트를 가운데 정렬 */
}

.notice-lable {
	color: red;
}
</style>



</head>

<jsp:include page="../main/header.jsp"></jsp:include>

<body>
	<div class="main_mainContents__GXYBn2">
		<hr class="popper_popperMenuDivider__j1QQj">
		<p class="main_mainTitle__nxOQS">
		<h1>
			<center>
				<strong>공지사항</strong>
			</center>
		</h1>
		</p>
		<br />
		<h4>
			<center>애물단지에서 알려드리는 공지사항입니다.</center>
		</h4>
		<br />
		<hr class="popper_popperMenuDivider__j1QQj">

		<br /> <br /> <br />
<!-- 공지사항 목록 테이블 -->
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="table">
						<table id="mytable" class="table table-bordred table-striped "
							style="margin: auto;">

							<thead>
								<th><center>공지번호</center></th>
								<th><center>제목</center></th>
								<th><center>게시일</center></th>
								<th><center>조회수</center></th>

							</thead>
							<tbody>
							<!-- 공지사항 목록 반복문 -->
								<c:forEach items="${noticeList}" var="notice" varStatus="loop">
									<tr>
									<!-- 두 개의 최신 공지사항은 "공지" 레이블 표시 -->
										<c:if test="${loop.index < 2 && currentPage == 1}">
											<td>
												<center>
													<span class="notice-lable">[공지]</span>
												</center>
											</td>
										</c:if>
										<!-- 이외의 공지사항은 번호 표시 -->
										<c:if test="${loop.index >= 2 || currentPage > 1}">
											<td>
												<center>${notice.id}</center>
											</td>
										</c:if>
										<!-- 공지사항 제목과 경로 -->
										<td align="left"><a
											href="/notice/noticeDetail?title=${notice.title}">
												<center>${notice.title}</center>
										</a></td>
										<!-- 공지사항 게시일 -->
										<td>
											<center>${notice.regdate}</center>
										</td>
										<!-- 공지사항 조회수 표시 -->
										<td>
											<center>${notice.count}</center>
										</td>
									</tr>
								</c:forEach>
							</tbody>


						</table>

						<div class="clearfix"></div>

						<ul class="pagination justify-content-center">
						<!-- 맨 처음 페이지로 가기 -->
							<li class="${currentPage == 1 ? 'disabled' : '' }"><a
								href="/notice/notice?page=1" aria-lable="처음 페이지로 이동"> <span
									class="glyphicon glyphicon-chevron-left"></span>
							</a></li>
							<!-- 이전 페이지로 가기 -->
							<li class="${currentPage == 1 ? 'disabled' : ''}"><a
								href="/notice/notice?page=${currentPage - 1}"
								aria-label="이전 페이지로 이동"> <span
									class="glyphicon glyphicon-chevron-left"></span>
							</a></li>
							<!-- 페이지 번호 반복문 -->
							<c:forEach begin="1" end="${totalPages}" var="pageNumber">
								<li class="${pageNumber == currentPage ? 'active' : ''}"><a
									href="/notice/notice?page=${pageNumber}"
									aria-label="페이지 ${pageNumber}로 이동">${pageNumber}</a></li>
							</c:forEach>
							<!-- 다음 페이지로 가기 -->
							<li class="${currentPage == totalPages ? 'disabled' : ''}">
								<a href="/notice/notice?page=${currentPage + 1}"
								aria-label="다음 페이지로 이동"> <span
									class="glyphicon glyphicon-chevron-right"></span>
							</a>
							</li>
							<!-- 맨 마지막 페이지로 가기 -->
							<li class="${currentPage == totalPages ? 'disabled' : ''}">
								<a href="/notice/notice?page=${totalPages}"
								aria-label="마지막 페이지로 이동"> <span
									class="glyphicon glyphicon-chevron-right"></span>
							</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="edit" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Edit Your
							Detail</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<input class="form-control " type="text" placeholder="Mohsin">
						</div>
						<div class="form-group">

							<input class="form-control " type="text" placeholder="Irshad">
						</div>
						<div class="form-group">
							<textarea rows="2" class="form-control"
								placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>
						</div>
					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-warning btn-lg"
							style="width: 100%;">
							<span class="glyphicon glyphicon-ok-sign"></span> Update
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>

		<div class="modal fade" id="delete" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">Delete this
							entry</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> Are you
							sure you want to delete this Record?
						</div>
					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-success">
							<span class="glyphicon glyphicon-ok-sign"></span> Yes
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> No
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
				
			</div>
			
			<!-- /.modal-dialog -->
		</div>
		
</body>
 
</html>