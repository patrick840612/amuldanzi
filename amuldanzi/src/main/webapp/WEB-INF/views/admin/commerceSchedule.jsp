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
			<div class="right_col" role="main" style="min-height: 1055px;">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>방송 일정</h3>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>방송일정 등록</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                  <form class="commerceScheduleSave" action="commerceScheduleSave" method="post">
                                        <span class="section">방송 정보</span>
                                        <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">방송 날짜<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input class="form-control" type="date" name="commerceDate" required="required"></div>
                                        </div>
                                        <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">방송 시작시간<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input class="form-control" type="time" name="commerceStart" required="required"></div>
                                        </div>
                                        <div class="field item form-group">
                                            <label class="col-form-label col-md-3 col-sm-3  label-align">방송 종료시간<span class="required">*</span></label>
                                            <div class="col-md-6 col-sm-6">
                                                <input class="form-control" type="time" name="commerceEnd" required="required"></div>
                                        </div>                         
                                        <div class="ln_solid">
                                            <div class="form-group">
                                                <div class="col-md-6 offset-md-3">
                                                    <button type="submit" class="btn btn-primary">등록</button>
                                                    <button type="reset" class="btn btn-success">리셋</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 ">
					<div class="x_panel">
					    <div class="container mt-4">
					        <h2>방송 일정리스트</h2>
					        <hr>
					        <!-- 재고 테이블 -->
					        <table class="table table-striped">
					        	<colgroup>
							        <col style="width: 15%;">
							        <col style="width: 25%;">
							        <col style="width: 20%;">
							        <col style="width: 20%;">
							        <col style="width: 10%;">
							        <col style="width: 10%;">
							    </colgroup>
					            <thead>
					                <tr>
					                    <th>번호</th>
					                    <th>방송 날짜</th>
					                    <th>방송 시작시간</th>
					                    <th>방송 종료시간</th>
					                    <th></th>
					                    <th></th>
					                </tr>
					            </thead>
									<tbody>
										<c:forEach items="${commScheduleList}" var="scheduleList">
										    <form class="scheduleForm" action="/admin/scheduleUpdate" method="post">
										        <tr>
										            <td>${scheduleList.scheduleId}</td>
										            <td class="editable">
										                <span>${scheduleList.commerceDate}</span>
										                <input type="date" name="commerceDate" value="${scheduleList.commerceDate}" style="display:none;">
										            </td>
										            <td class="editable">
										                <span>${scheduleList.commerceStart}</span>
										                <input type="time" name="commerceStart" value="${scheduleList.commerceStart}" style="display:none;">
										            </td>
										            <td class="editable">
										                <span>${scheduleList.commerceEnd}</span>
										                <input type="time" name="commerceEnd" value="${scheduleList.commerceEnd}" style="display:none;">
										            </td>
										            <td>
										                <input type="hidden" name="scheduleId" value="${scheduleList.scheduleId}">
										                <a href="#" class="edit-link">수정</a>
										                <button type="submit" style="display:none;">저장</button>
										                <button type="button" class="cancel-button" style="display:none;">취소</button>
										            </td>
										            <td>
										                <a href="scheduleDelete?scheduleId=${scheduleList.scheduleId}">삭제</a>
										            </td>
										        </tr>
										    </form>
										</c:forEach>  
									</tbody>
					        	</table>			        
					        <hr>
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
		
<script>
    $(document).ready(function() {
        // .edit-link 클래스를 가진 요소(버튼 또는 링크)가 클릭되었을 때 실행됩니다.
        $(".edit-link").click(function(event) {
            event.preventDefault(); // 기본 동작(예: 링크 이동)을 방지합니다.
            // 클릭된 요소의 부모 tr 요소를 찾습니다(버튼이 포함된 행).
            var row = $(this).closest("tr");
            // .editable 클래스를 가진 요소들 안의 span 요소를 숨깁니다.
            row.find(".editable span").hide();
            // .editable 클래스를 가진 요소들 안의 input 요소를 보여줍니다.
            row.find(".editable input").show();
            // .edit-link 클래스를 가진 버튼을 숨깁니다.
            row.find(".edit-link").hide();
            // 해당 행의 submit 버튼을 보여줍니다.
            row.find("button[type='submit']").show();
            // 해당 행의 취소 버튼을 보여줍니다.
            row.find(".cancel-button").show();
        });
        // .cancel-button 클래스를 가진 요소(버튼 또는 링크)가 클릭되었을 때 실행됩니다.
        $(".cancel-button").click(function(event) {
            event.preventDefault(); // 기본 동작(예: 링크 이동)을 방지합니다.
            // 클릭된 요소의 부모 tr 요소를 찾습니다(버튼이 포함된 행).
            var row = $(this).closest("tr");
            // .editable 클래스를 가진 요소들 안의 span 요소를 보여줍니다.
            row.find(".editable span").show();
            // .editable 클래스를 가진 요소들 안의 input 요소를 숨깁니다.
            row.find(".editable input").hide();
            // .edit-link 클래스를 가진 버튼을 보여줍니다.
            row.find(".edit-link").show();
            // 해당 행의 submit 버튼을 숨깁니다.
            row.find("button[type='submit']").hide();
            // 해당 행의 취소 버튼을 숨깁니다.
            row.find(".cancel-button").hide();
        });
    });
</script>

</body>
</html>