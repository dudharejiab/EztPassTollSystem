<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="utf-8" />
<meta http-equiv="Page-Enter" content="blendTrans(Duration=0.2)">
<meta http-equiv="Page-Exit" content="blendTrans(Duration=0.2)">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description" />
<meta content="" name="author" />
<!-- Custom css -->
<style type="text/css">
.loadingBar {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	left: 0px;
	background: rgb(96, 108, 136);
	background: -moz-linear-gradient(top, rgba(96, 108, 136, 1) 0%,
		rgba(63, 76, 107, 1) 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(96,
		108, 136, 1)), color-stop(100%, rgba(63, 76, 107, 1)));
	background: -webkit-linear-gradient(top, rgba(96, 108, 136, 1) 0%,
		rgba(63, 76, 107, 1) 100%);
	background: -o-linear-gradient(top, rgba(96, 108, 136, 1) 0%,
		rgba(63, 76, 107, 1) 100%);
	background: -ms-linear-gradient(top, rgba(96, 108, 136, 1) 0%,
		rgba(63, 76, 107, 1) 100%);
	background: linear-gradient(to bottom, rgba(96, 108, 136, 1) 0%,
		rgba(63, 76, 107, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(                    
		                     startColorstr='#606c88', endColorstr='#3f4c6b',
		GradientType=0);
	opacity: 1;
	z-index: 1000000;
	display: table;
}

.loadingBarText {
	color: white;
	font-size: 30px;
	display: table-cell;
	vertical-align: middle;
	text-align: center;
	font-family: "PT Sans Narrow", sans-serif;
}

.lodingBarDashBoard {
	position: absolute;
	top: 0px;
	width: 100%;
	height: 650px;
	z-index: 1000;
	background: rgb(96, 108, 136);
	background: -moz-linear-gradient(top, rgba(96, 108, 136, 1) 0%,
		rgba(63, 76, 107, 1) 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(96,
		108, 136, 1)), color-stop(100%, rgba(63, 76, 107, 1)));
	background: -webkit-linear-gradient(top, rgba(96, 108, 136, 1) 0%,
		rgba(63, 76, 107, 1) 100%);
	background: -o-linear-gradient(top, rgba(96, 108, 136, 1) 0%,
		rgba(63, 76, 107, 1) 100%);
	background: -ms-linear-gradient(top, rgba(96, 108, 136, 1) 0%,
		rgba(63, 76, 107, 1) 100%);
	background: linear-gradient(to bottom, rgba(96, 108, 136, 1) 0%,
		rgba(63, 76, 107, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(                    
		                     startColorstr='#606c88', endColorstr='#3f4c6b',
		GradientType=0);
}

.lodingBarDashBoardText {
	color: white;
	font-size: 30px;
	display: table-cell;
	vertical-align: middle;
	text-align: center;
	font-family: "PT Sans Narrow", sans-serif;
	padding-top: 300px;
	padding-left: 250px;
}
</style>

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/assets/global/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/assets/global/plugins/simple-line-icons/simple-line-icons.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/assets/global/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css" />
<link
	href="<%=request.getContextPath()%>/assets/global/plugins/jasny-bootstrap/css/jasny-bootstrap.css"
	rel="stylesheet" />

<!--<link href="../../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>-->
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN THEME STYLES -->
<link
	href="<%=request.getContextPath()%>/assets/global/css/components.css"
	id="style_components" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/css/plugins.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/assets/admin/layout/css/layout.css"
	rel="stylesheet" type="text/css" />
<link id="style_color"
	href="<%=request.getContextPath()%>/assets/admin/layout/css/themes/default.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/assets/admin/layout/css/custom.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/global/plugins/select2/select2.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/global/plugins/jquery-tags-input/jquery.tagsinput.css" />


<!-- END THEME STYLES -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/assets/admin/layout/img/favicon.ico" />

</head>

<body
	class="page-header-fixed page-quick-sidebar-over-content page-sidebar-fixed page-sidebar-closed-hide-logo">
	<input id="contextPath" value="<%=request.getContextPath()%>"
		name="<%=request.getContextPath()%>" type="hidden" />

	<div class="loadingBar" id="loading"
		style="opacity: 0.5; display: none;">
		<div class="loadingBarText">
			<i class="fa fa-spinner fa-spin " style="font-size: 50px;"></i>
			&nbsp;&nbsp;&nbsp; Processing Your Request
		</div>
	</div>
	<!-- BEGIN HEADER -->
	<div class="page-header navbar navbar-fixed-top">
		<!-- BEGIN HEADER INNER -->
		<div class="page-header-inner">
			<!-- BEGIN LOGO -->
			<div class="page-logo">
				<a href="/CSCI6810/home.jsp"> <img
					src="<%=request.getContextPath()%>/assets/admin/layout/img/ezpasslogo.png"
					alt="logo" class="logo-default"
					style="margin-top: -0px; color: white;" />
				</a>
			</div>
			<div class="menu-toggler sidebar-toggler" style="float: left">
			</div>

			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="javascript:;" class="menu-toggler responsive-toggler"
				data-toggle="collapse" data-target=".navbar-collapse"> </a>
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
					<li class="dropdown dropdown-user"><a href="/CSCI6810/LoginServlet?log=true"
						class="dropdown-toggle" data-toggle="dropdown"
						data-hover="dropdown" data-close-others="true"> <img alt=""
							class="img-circle"
							src="<%=request.getContextPath()%>/assets/admin/layout/img/avatar.png" />
							<span class="username username-hide-on-mobile"><%=session.getAttribute("Username")%>>
						</span> <i class="fa fa-angle-down"></i>
					</a>
						<ul class="dropdown-menu dropdown-menu-default">
							<li><a href="/CSCI6810/LoginServlet?log=true"> <i class="icon-key"></i> Log Out
							</a></li>
						</ul></li>
					<!-- END USER LOGIN DROPDOWN -->
					<!-- BEGIN QUICK SIDEBAR TOGGLER -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<!-- END QUICK SIDEBAR TOGGLER -->
				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END HEADER INNER -->
	</div>
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar-wrapper">
			<div class="page-sidebar navbar-collapse collapse">
				<!-- BEGIN SIDEBAR MENU -->
				<ul class="page-sidebar-menu">
					<li id="navDashboard" class="adminMenu"><a id="Dashboard"
						href="/CSCI6810/home.jsp" class="adminMenu" title="Dashboard"><i
							class="icon-home" style="color: inherit"></i><span class="title">Dashboard</span></a></li>
					<li id="navProfile"><a id="profile"
						href="/CSCI6810/ProfileController" class="adminMenu"
						Title="PayToll"><i class="icon" style="color: inherit"></i><span
							class="title">My Profile</span></a></li>
					<li id="navPayToll"><a id="payToll"
						href="/CSCI6810/PayTollManuallyBO.jsp" class="adminMenu"
						Title="PayToll"><i class="icon" style="color: inherit"></i><span
							class="title">Pay Toll</span></a></li>
					<li id="navVehicles"><a id="Vehicles"
						href="/CSCI6810/VehicleController" class="adminMenu"
						Title="Vehicles"><i class="icon" style="color: inherit"></i><span
							class="title">Vehicles</span></a></li>
					<li id="navTransaction"><a id="transaction"
						href="/CSCI6810/TransactionController" class="adminMenu"
						Title="transaction"><i class="icon" style="color: inherit"></i><span
							class="title">Transaction</span></a></li>
				</ul>
			</div>
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN CONTENT -->
		<!-- <div class="page-content-wrapper">
			<div class="page-content">
				BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM
				/.modal
				<div id="container2">
					BEGIN DASHBOARD STATS
					<div class="row" style="padding-bottom: 12%"></div>
					END DASHBOARD STATS
					<div class="clearfix"></div>
					<div class="row"></div>

					<div class="col-md-4 col-sm-4">
						BEGIN PORTLET

					</div>

				</div>

				END PAGE CONTENT
			</div>
		</div> -->
		<div class="page-content-wrapper">
			<div class="page-content">
				<div id="container2">
					<dec:body></dec:body>
				</div>
			</div>
		</div>
		<!-- END CONTENT -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="page-footer">
		<div
			style="float: left; padding-left: 5px; color: #fff; margin-right: 100px; cursor: pointer;"
			onclick="getNoteOfTermsAndCondition()">BY CONTINUING PAST THIS
			PAGE, YOU AGREE TO OUR TERMS OF USE</div>
		<p>Copyright &copy; Groups.</p>
		<div class="scroll-to-top">
			<i class="icon-arrow-up"></i>
		</div>
	</div>
	<!-- END FOOTER -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->
	<!--[if lt IE 9]>
<script src="../../assets/global/plugins/respond.min.js"></script>
<script src="../../assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->

	<script
		src="<%=request.getContextPath()%>/assets/global/plugins/jquery.min.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/assets/global/plugins/jquery-migrate.min.js"
		type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script
		src="<%=request.getContextPath()%>/assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/assets/global/plugins/jquery.blockui.min.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/assets/global/plugins/jquery.cokie.min.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/assets/global/plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/global/plugins/select2/select2.min.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/global/plugins/datatables/media/js/jquery.dataTables.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/global/plugins/ckeditor/adapters/jquery.js">
		
	</script>

	<script
		src="<%=request.getContextPath()%>/assets/global/scripts/metronic.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/assets/admin/layout/scripts/layout.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/assets/global/plugins/fullcalendar/lib/moment.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/admin/layout/scripts/demo.js"
		type="text/javascript"></script>
	<script
		src="<%=request.getContextPath()%>/assets/global/plugins/jasny-bootstrap/js/jasny-bootstrap.js"
		type="text/javascript"></script>


	<script
		src="<%=request.getContextPath()%>/assets/global/plugins/jquery-tags-input/jquery.tagsinput.js"
		type="text/javascript"></script>

	<!-- <script>
		jQuery(document)
				.ready(
						function() {
							window.onbeforeunload = function(e) {
								$('#loading').fadeIn();
							}
							Metronic.init(); // init metronic core components
							Layout.init(); // init current layout
							Demo.init(); // init demo features

							//Login.init();
							$('.adminMenu')
									.click(
											function(e) {
												e.preventDefault();
												$('li').removeClass('active');
												$(this).parent('li').addClass(
														'active');
												$('#container2').html("");
												var url = $(this).attr("href");

												if (url == 'home.htm') {
													window.location.reload();
													return true;
												}
												$('title')
														.html(
																$(this)
																		.attr(
																				'title')
																		+ ' :: EZ PASS');
												$('#activeTabId').val(
														$(this).attr("id"));
												$('#activeTabUrl').val(url);
												$('#loading').fadeIn();
												$
														.ajax({
															async : true,
															cache : false,
															type : "POST",
															url : url,
															dataType : "html",
															success : function(
																	res) {
																try {
																	var tmp = res
																			.substring(
																					108,
																					134);
																	if (tmp
																			.indexOf("<title>Login Page</title>") != -1) {
																		window.location
																				.reload();
																		return false;
																	}
																	$(
																			'#container2')
																			.html(
																					res);
																} catch (err) {
																	console
																			.log(err);
																}
																$.browser.mozilla == true ? $(
																		'html')
																		.scrollTop(
																				0)
																		: $(
																				'body')
																				.scrollTop(
																						0);
																$('#loading')
																		.fadeOut();
															},
															error : function(
																	xhr,
																	ajaxOptions,
																	thrownError) {
																$('#container2')
																		.html(
																				'<h4>Could not load the requested content.</h4>');
																$.browser.mozilla == true ? $(
																		'html')
																		.scrollTop(
																				0)
																		: $(
																				'body')
																				.scrollTop(
																						0);
																$('#loading')
																		.fadeOut();
															}
														});
											});
							$('#li0').addClass('active');
						});
	</script> -->
	<script>
	function logout() {
		var url = '/CSCI6810/LoginServlet?log=true';
		$.ajax({
			async : true,
			cache : false,
			type : "POST",
			url : url,
			dataType : "html",
			success : function(res) {
				//alert("Successfully Loh");
			}
		});
	}
		jQuery(document).ready(function() {
			window.onbeforeunload = function(e) {
				$('#loading').fadeIn();
			}
			Metronic.init(); // init metronic core components
			Layout.init(); // init current layout
			Demo.init(); // init demo features

			$('.adminMenu').click(function(e) {
				// 				$('li').removeClass('active');
				// 				$(this).parent('li').addClass('active');
				// 				$('#container2').html("");
				var url = $(this).attr("href");
				if (url == 'home.jsp') {
					window.location.reload();
					return true;
				}
				$('title').html($(this).attr('title') + ' :: EZ Pass');
				// 				$('#activeTabId').val($(this).attr("id"));
				// 				$('#activeTabUrl').val(url);

			});

		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>