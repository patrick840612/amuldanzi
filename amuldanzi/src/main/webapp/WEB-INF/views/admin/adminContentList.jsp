<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="production/production/images/favicon.ico"
	type="image/ico" />

<title>애물단지</title>

<!-- Bootstrap -->
<link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link href="/admin/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="/admin/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="/admin/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="/admin/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<!-- Datatables -->

<link
	href="/admin/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="/admin/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="/admin/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="/admin/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
	rel="stylesheet">
<link
	href="/admin/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="/admin/build/css/custom.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#cateList").change(function() {
			var cateId = $(this).prop("selectedIndex");
			$.ajax({
				type : 'post',
				data : {
					cateId : cateId
				},
				url : 'http://localhost:8080/admin/adminContentCate',
				success : function(result) {
					
					
					$("#adminBoardList").empty();
					for(var i=0;i<result.length;i++){
						var list = '';
						var viewAddr = '/admin/adminContentView?cate='+result[i].boardCate.cateId+'&id='+result[i].id
						
						list += '<tr role="row" class="odd">';
						list += '<td class="sorting_1">'+result[i].id+'</td>';
						if(result[i].boardCate.cateId == 0){
						list += '<td class=""><a href="adminContentDetail?cateId=0&&id='+result[i].id+'">'+result[i].title+'</a></td>';
						}else if(result[i].boardCate.cateId == 2){
						list += '<td class=""><a href="adminContentDetail?cateId=2&&id='+result[i].id+'">'+result[i].title+'</a></td>';
						}else if(result[i].boardCate.cateId == 3){
						list += '<td class=""><a href="adminContentDetail?cateId=3&&id='+result[i].id+'">'+result[i].title+'</a></td>';
						}else{
						list += '<td class=""><a href="'+viewAddr+'">'+result[i].title+'</a></td>';
						}		
						list += '<td>'+result[i].regdate+'</td>';
						list += '<td>'+result[i].count+'</td>';
						if(result[i].boardCate.cateId == 0){
						list += '<td><a href="noticeDelete?id='+result[i].id+'">삭제</a></td>';
						}else if(result[i].boardCate.cateId == 2){
						list += '<td><a href="eduDelete?id='+result[i].id+'">삭제</a></td>';
						}else if(result[i].boardCate.cateId == 3){
						list += '<td><a href="careDelete?id='+result[i].id+'">삭제</a></td>';
						}else{
						list += '<td></td>';	
						}
						list += '</tr>';

						$("#adminBoardList").append(list);
					}
					
				},
				error : function(err) {
					// 에러 발생 시의 처리
					alert('error');
					console.log(err);
				}
			});

		});

	}); // end of $
</script>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="/admin/adminMain" class="site_title"><i class="fa fa-paw"></i>
							<span>애물단지</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img src="/admin/production/images/img.jpg" alt="..."
								class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>환영합니다</span>
							<h2>관리자님</h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<h3>General</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-user"></i> 회원관리<span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="form.html">역할관리</a></li>
										<li><a href="form_advanced.html">문의관리</a></li>
									</ul></li>
								<li><a><i class="fa fa-edit"></i> 게시판<span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="/admin/adminContentInsert">글 추가</a></li>
										<li><a href="/admin/adminContentList">기존 글 관리</a></li>
										<li><a href="/admin/blamedList">신고 글 관리</a></li>
									</ul></li>
								<li><a><i class="fa fa-video-camera"></i> 라이브 커머스 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="/admin/commerce">방송 일정</a></li>
										<li><a href="/admin/commerceList">상품 관리</a></li>
									</ul></li>
								<li><a><i class="fa fa-tags"></i> 광고 <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="/admin/adInsert">광고 등록</a></li>
										<li><a href="/admin/adList">광고 관리</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<div class="sidebar-footer hidden-small">
						<a data-toggle="tooltip" data-placement="top" title="Settings">
							<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="FullScreen">
							<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <span
							class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Logout"
							href="login.html"> <span class="glyphicon glyphicon-off"
							aria-hidden="true"></span>
						</a>
					</div>
					<!-- /menu footer buttons -->
				</div>
			</div>


			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<div class="nav toggle">
						<a id="menu_toggle"><i class="fa fa-bars"></i></a>
					</div>
					<nav class="nav navbar-nav">
						<ul class=" navbar-right">
							<li class="nav-item dropdown open" style="padding-left: 15px;">
								<a href="javascript:;" class="user-profile dropdown-toggle"
								aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown"
								aria-expanded="false">관리자
							</a>
								<div class="dropdown-menu dropdown-usermenu pull-right"
									aria-labelledby="navbarDropdown">
									<a	class="dropdown-item" href="login.html"><i
										class="fa fa-sign-out pull-right"></i> Log Out</a>
								</div>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main" style="min-height: 857px;">
				<div class="">
					<div class="clearfix"></div>
					<div class="row" style="display: block;">
						<div class="clearfix"></div>
						<div class="col-md-12 col-sm-12 ">
							<div class="x_panel">
								<div class="x_title">
									<h2>게시글 리스트</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="row">
										<div class="col-sm-12">
											<div>
												<div class="col-sm-6">
													<label><select name="datatable_length"
														aria-controls="datatable" class="form-control input-sm"
														id="cateList">
															<option id="notipication" value="notipication"
																selected="selected">공지</option>
															<option id="hosInfo" value="hosInfo">병원정보</option>
															<option id="eduInfo" value="eduInfo">교육정보</option>
															<option id="careInfo" value="careInfo">케어정보</option>
															<option id="marketInfo" value="marketInfo">마켓정보</option>

													</select></label>
												</div>
												<div id="datatable_wrapper"
													class="dataTables_wrapper container-fluid dt-bootstrap no-footer">
													<div class="row">
														<div class="col-sm-12">
															<table id="datatable"
																class="table table-striped table-bordered dataTable no-footer"
																style="width: 100%;" role="grid"
																aria-describedby="datatable_info">
																<thead>
																	<tr role="row">
																		<th class="sorting_desc" tabindex="0"
																			aria-controls="datatable" rowspan="1" colspan="1"
																			aria-label="Name: activate to sort column ascending"
																			style="width: 40px;" aria-sort="descending">ID</th>
																		<th class="sorting" tabindex="0"
																			aria-controls="datatable" rowspan="1" colspan="1"
																			aria-label="Position: activate to sort column ascending"
																			style="width: 250px;">제목</th>
																		<th class="sorting" tabindex="0"
																			aria-controls="datatable" rowspan="1" colspan="1"
																			aria-label="Office: activate to sort column ascending"
																			style="width: 95px;">작성일자</th>
																		<th class="sorting" tabindex="0"
																			aria-controls="datatable" rowspan="1" colspan="1"
																			aria-label="Age: activate to sort column ascending"
																			style="width: 40px;">조회수</th>
																		<th class="sorting" tabindex="0"
																			aria-controls="datatable" rowspan="1" colspan="1"
																			aria-label="Start date: activate to sort column ascending"
																			style="width: 50px;"></th>
																	</tr>
																</thead>


																<tbody id="adminBoardList">
																
																	<!-- 첫 접속시 공지 내용 불러오기 -->
																	<c:forEach items="${list}" var="list">
																		<tr role="row" class="odd">
																			<td class="sorting_1">${list.id }</td>
																			<td><a href="/admin/adminContentDetail?cateId=0&&id=${list.id}">${list.title }</a></td>
																			<td>${list.regdate }</td>
																			<td>${list.count }</td>
																			<td><a href="noticeDelete?id=${list.id }">삭제</a></td>
																		</tr>
																	</c:forEach>

																</tbody>
																
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<div class="pull-right">
					Gentelella - Bootstrap Admin Template by <a
						href="https://colorlib.com">Colorlib</a>
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="/admin/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="/admin/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- FastClick -->
	<script src="/admin/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="/admin/vendors/nprogress/nprogress.js"></script>
	<!-- bootstrap-progressbar -->
	<script src="/admin/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="/admin/vendors/iCheck/icheck.min.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="/admin/vendors/moment/min/moment.min.js"></script>
	<script src="/admin/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap-wysiwyg -->
	<script src="/admin/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
	<script src="/admin/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
	<script src="/admin/vendors/google-code-prettify/src/prettify.js"></script>
	<!-- jQuery Tags Input -->
	<script src="/admin/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
	<!-- Switchery -->
	<script src="/admin/vendors/switchery/dist/switchery.min.js"></script>
	<!-- Select2 -->
	<script src="/admin/vendors/select2/dist/js/select2.full.min.js"></script>
	<!-- Parsley -->
	<script src="/admin/vendors/parsleyjs/dist/parsley.min.js"></script>
	<!-- Autosize -->
	<script src="/admin/vendors/autosize/dist/autosize.min.js"></script>
	<!-- jQuery autocomplete -->
	<script src="/admin/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
	<!-- starrr -->
	<script src="/admin/vendors/starrr/dist/starrr.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="/admin/build/js/custom.min.js"></script>

	<div id="torrent-scanner-popup" style="display: none;"></div>
</body>
</html>