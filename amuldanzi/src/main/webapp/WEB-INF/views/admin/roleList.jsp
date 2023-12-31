<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="production//production/images/favicon.ico"
	type="image/ico" />

<title>애물단지</title>

<!-- Bootstrap -->
<link href="/admin/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="/admin/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="/admin/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="/admin/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<!-- bootstrap-progressbar -->
<link
	href="/admin/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link href="/admin/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link href="/admin/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="/admin/build/css/custom.min.css" rel="stylesheet">


<link href="/admin/chunks/css/c552b37c371c331c.css" rel="stylesheet">
<link href="/admin/chunks/css/39c68523bb4928b9.css" rel="stylesheet">
<link href="/admin/chunks/css/281067dbec461a13.css" rel="stylesheet">
<link href="/admin/chunks/css/3ca3804aef0f69b8.css" rel="stylesheet">
<link href="/admin/chunks/css/text.css" rel="stylesheet">

</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="/main/index" class="site_title">
							<i class="fa fa-paw"></i>
							<span>애물단지</span>
						</a>
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
										<li><a href="/admin/roleList">역할관리</a></li>
										<li><a href="/admin/qnaList">문의관리</a></li>
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
										<li><a href="/admin/commerceSchedule">방송 일정</a></li>
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
							href="/login/logout"> <span class="glyphicon glyphicon-off"
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
									<a	class="dropdown-item" href="/login/logout"><i
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
									<h2>돌보니 신청 리스트</h2>
					                    <ul class="nav navbar-right panel_toolbox">
					                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					                      </li>
					                    </ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="row">
										<div class="col-sm-12">
											<div>
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
																			style="width: 40px;" aria-sort="descending">아이디</th>
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
																			aria-label="Start date: activate to sort column ascending"
																			style="width: 50px;">승인여부</th>
																		<th class="sorting" tabindex="0"
																			aria-controls="datatable" rowspan="1" colspan="1"
																			aria-label="Start date: activate to sort column ascending"
																			style="width: 50px;"></th>	
																	</tr>
																</thead>
																
																<tbody id="sList">
																<c:forEach items="${sitterList }" var="sList">
																		<tr role="row" class="odd">
																			<td class="sorting_1">${sList.id }</td>
																			<td><a href="sitterDetail?id=${sList.id }">${sList.sitterTitle }</a></td>
																			<td>${sList.sitterRegdate }</td>
																			<td>${sList.sitter }</td>																																																				
																			<td><a href="sitterUpdate?id=${sList.id }">승인하기</a></td>
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
						<div class="col-md-12 col-sm-12 ">
			                <div class="x_panel">
			                  <div class="x_title">
			                    <h2>사업자 신청 리스트</h2>
			                    <ul class="nav navbar-right panel_toolbox">
			                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
			                      </li>
			                    </ul>
			                    <div class="clearfix"></div>
			                  </div>
			                  <div class="x_content">
			                      <div class="row">
			                          <div class="col-sm-12">
			                            <div class="card-box table-responsive">
												<div id="datatable-fixed-header_wrapper"
													class="dataTables_wrapper container-fluid dt-bootstrap no-footer">
													<div class="row">
														<div class="col-sm-12">
															<table id="datatable-fixed-header"
																class="table table-striped table-bordered dataTable no-footer"
																style="width: 100%;" role="grid"
																aria-describedby="datatable-fixed-header_info">
																<thead>
																	<tr role="row">
																		<th class="sorting_desc" tabindex="0"
																			aria-controls="datatable-fixed-header" rowspan="1"
																			colspan="1"
																			aria-label="Name: activate to sort column ascending"
																			aria-sort="descending" style="width: 118px;">상호/대표자명</th>
																		<th class="sorting" tabindex="0"
																			aria-controls="datatable-fixed-header" rowspan="1"
																			colspan="1"
																			aria-label="Position: activate to sort column ascending"
																			style="width: 189px;">사업자/주민등록 번호</th>
																		<th class="sorting" tabindex="0"
																			aria-controls="datatable-fixed-header" rowspan="1"
																			colspan="1"
																			aria-label="Office: activate to sort column ascending"
																			style="width: 88px;">업종</th>
																		<th class="sorting" tabindex="0"
																			aria-controls="datatable-fixed-header" rowspan="1"
																			colspan="1"
																			aria-label="Age: activate to sort column ascending"
																			style="width: 80px;">작성일자</th>
																		<th class="sorting" tabindex="0"
																			aria-controls="datatable-fixed-header" rowspan="1"
																			colspan="1"
																			aria-label="Start date: activate to sort column ascending"
																			style="width: 80px;">승인여부</th>
																		<th class="sorting" tabindex="0"
																			aria-controls="datatable-fixed-header" rowspan="1"
																			colspan="1"
																			aria-label="Salary: activate to sort column ascending"
																			style="width: 66px;"></th>
																	</tr>
																</thead>




																<tbody id="bList">																
																	<c:forEach items="${businessList }" var="bList">
																		<tr role="row" class="odd">
																			<td class="sorting_1">${bList.businessName }</td>
																			<td>${bList.businessNumber }</td>
																			<td>${bList.businessSector }</td>
																			<td>${bList.businessRegdate }</td>
																			<td>${bList.businessOk }</td>																																	
																			<td><a href="businessUpdate?businessNumber=${bList.businessNumber }">승인하기</a></td>
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
	<!-- iCheck -->
	<script src="/admin/vendors/iCheck/icheck.min.js"></script>
	<!-- Datatables -->
	<script src="/admin/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="/admin/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script src="/admin/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script src="/admin/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script src="/admin/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script
		src="/admin/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
	<script src="/admin/vendors/jszip/dist/jszip.min.js"></script>
	<script src="/admin/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script src="/admin/vendors/pdfmake/build/vfs_fonts.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="/admin/build/js/custom.min.js"></script>

</body>
</html>