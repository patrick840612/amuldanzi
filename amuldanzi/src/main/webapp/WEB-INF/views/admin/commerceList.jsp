<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link
	href="/admin/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="/admin/build/css/custom.min.css" rel="stylesheet">
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
			<div class="right_col" role="main">
				<div class="col-md-12 col-sm-12 ">
					<div class="x_panel">
					    <div class="container mt-4">
					        <h2>상품 관리</h2>
					        <hr>
					        <!-- 재고 테이블 -->
					        <table class="table table-striped">
					        	<colgroup>
							        <col style="width: 20%;">
							        <col style="width: 15%;">
							        <col style="width: 15%;">
							        <col style="width: 10%;">
							        <col style="width: 30%;">
							        <col style="width: 10;">
							    </colgroup>
					            <thead>
					                <tr>
					                    <th>상품명</th>
					                    <th>재고량</th>
					                    <th>가격</th>
					                    <th>할인률</th>
					                    <th>상품이미지</th>
					                    <th>삭제</th>
					                </tr>
					            </thead>
									<tbody>
									    <c:forEach items="${commerceList}" var="commerceList">        
									        <tr>        	
									            <td class="align-middle"><a href="commerceDetail?commerceId=${commerceList.commerceId }">${commerceList.commerceName}</a></td>
									            <td class="align-middle">${commerceList.commerceStock}</td>
									            <td class="align-middle">${commerceList.commercePrice}</td>
									            <td class="align-middle">${commerceList.commercePer} %</td>
									            <td class="align-middle"><img src="/images/commerce/${commerceList.img}" decode="async" alt="image" onerror="this.src='/admin/images/noimage.jpg';" alt="상품 이미지" width= 200 height= 150></td>
									            <td class="align-middle"><a class="btn btn-danger btn-sm" href="commerceDelete?commerceId=${commerceList.commerceId }">삭제</a></td>
									        </tr>
									    </c:forEach> 
									</tbody>
					        	</table>
					        <!-- 상품 추가 버튼 -->
					        <hr>
					        <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#addCommerceModal">상품 추가</button>
					    </div>
					
					    <!-- 재고 추가 모달 -->
					    <div class="modal fade" id="addCommerceModal" tabindex="-1" role="dialog" aria-labelledby="addCommerceModal" aria-hidden="true">
					        <div class="modal-dialog" role="document">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <h5 class="modal-title" id="addCommerceModalLabel">상품 추가</h5>
					                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                        <span aria-hidden="true">&times;</span>
					                    </button>
					                </div>
					                <div class="modal-body">
					                    <!-- 재고 추가 폼 -->
					                    <form id="commerceSave" action="commerceSave" method="post" enctype="multipart/form-data">
					                        <div class="form-group">
					                            <label for="productName">상품명</label>
					                            <input type="text" class="form-control" id="commerceName" name="commerceName" required>
					                        </div>
					                        <div class="form-group">
					                            <label for="quantity">재고량</label>
					                            <input type="number" class="form-control" id="commerceStock" min="0"  name="commerceStock" required>
					                        </div>
					                        <div class="form-group">
					                            <label for="price">가격</label>
					                            <input type="number" class="form-control" id="commercePrice" min="0"  name="commercePrice" required>
					                        </div>
					                        <div class="form-group">
					                            <label for="price">할인률</label>
					                            <input type="number" class="form-control" id="commercePer" min="0"  max="100" name="commercePer" required>
					                        </div>
					                        <div class="form-group">
					                            <label for="image">상품 이미지</label>
					                            <input type="file" class="form-control-file" name="file" id="uploadFile" accept="image/*" onchange="previewImage(event)">
					                            <img id="imagePreview" src="#" alt="미리보기 이미지" width="200" style="display:none;">
					                        </div>
					                        <div class="form-group">
					                            <label for="detailImage">상품 상세 이미지</label>
					                            <input type="file" class="form-control-file" name="detailFile" id="uploadDetailFile" accept="image/*">
					                        </div>
					                        <button type="submit" class="btn btn-primary">추가</button>
					                    </form>
					                </div>
					            </div>
					        </div>
					    </div>
    				</div>
   				 </div>
    		</div>    
			<!-- /page content -->
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
	<script
		src="/admin/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="/admin/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
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
	

<script>
function previewImage(event) {
    var imagePreview = document.getElementById('imagePreview');
    imagePreview.style.display = 'block';
    imagePreview.src = URL.createObjectURL(event.target.files[0]);
}
</script>


</body>
</html>