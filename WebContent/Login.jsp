<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login Page</title>

<!-- ------------------------------------------------------------------------------------------ -->
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
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link
	href="<%=request.getContextPath()%>/assets/admin/pages/css/login.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME STYLES -->
<link
	href="<%=request.getContextPath()%>/assets/global/css/components.css"
	id="style_components" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/assets/global/css/plugins.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/assets/admin/layout/css/layout.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/assets/admin/layout/css/themes/default.css"
	rel="stylesheet" type="text/css" id="style_color" />
<link
	href="<%=request.getContextPath()%>/assets/admin/layout/css/custom.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	height: 100%;
}

div#wrapper {
	height: 860px;
}
</style>
<script
	src="<%=request.getContextPath()%>/assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/assets/global/plugins/jquery-migrate.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap/js/bootstrap.min.js"
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
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script
	src="<%=request.getContextPath()%>/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
	type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script
	src="<%=request.getContextPath()%>/assets/global/scripts/metronic.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/assets/admin/layout/scripts/layout.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/assets/admin/layout/scripts/demo.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/assets/admin/pages/scripts/login.js"
	type="text/javascript"></script>
<script src="https://www.google.com/jsapi" type="text/javascript"></script>
<!-- END JAVASCRIPTS -->

</head>
<body class="login">
	<div class="logo">
		<a href=""> <img
			src="<%=request.getContextPath()%>/assets/admin/layout/img/ezpasslogo.png"
			alt="" />
		</a>
	</div>
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->
	<div class="content" id="login_user" align="center">
		<!-- BEGIN LOGIN FORM -->
		<div id="signIn">
			<form method="post" class="login-form"
				action="/CSCI6810/LoginServlet" name="myForm">
				<h3 class="form-title">Sign In</h3>
				<div style="color: #898989; float: left; font-size: 15px"></div>
				<div class="form-group">
					<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
					<label class="control-label visible-ie8 visible-ie9">Username</label>
					<input class="form-control form-control-solid placeholder-no-fix"
						type="text" autocomplete="off" placeholder="UserName"
						name="Username" id="Username" value="" />
				</div>
				<div class="form-group">
					<label class="control-label visible-ie8 visible-ie9">Password</label>
					<input class="form-control form-control-solid placeholder-no-fix"
						type="password" autocomplete="off" placeholder="UserName"
						id="Password" value="" name="Password" />
				</div>
				<div class="form-actions">
					<button type="submit"
						class="submit_button btn btn-success uppercase">Login</button>
				</div>
				<div class="form-group" id="changePassword" align="center">
					<a onclick="showSignUpPanal()">New User SignUp</a>
				</div>
			</form>
		</div>
		<input id="hiddenIsChangePassword" name="hiddenVendorConfigStatus"
			type="hidden" value="0" />
		<div id="updatePassword" style="display: none;">
			<form method="post" class="login-form"
				action="/CSCI6810/OnlineSignUpServlet" name="SignUpPage">
				<h3 class="form-title">Signup</h3>
				<div style="color: #898989; float: left; font-size: 15px"></div>
				<div class="form-group">
					<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
					<label class="control-label visible-ie8 visible-ie9">Username</label>
					<input class="form-control form-control-solid placeholder-no-fix"
						type="text" autocomplete="off" placeholder="UserName"
						name="UsernameField" id="UsernameField" value="" />
				</div>
				<div class="form-group">
					<label class="control-label visible-ie8 visible-ie9">Password</label>
					<input class="form-control form-control-solid placeholder-no-fix"
						type="password" autocomplete="off" placeholder="Password"
						id="PasswordField" value="" name="PasswordField" />
				</div>
				<div class="form-group">
					<label class="control-label visible-ie8 visible-ie9">Repeat
						Password</label> <input
						class="form-control form-control-solid placeholder-no-fix"
						type="password" autocomplete="off"
						placeholder="Confirm Password" id="RePasswordField" value=""
						name="RePasswordField" />
				</div>
				<div class="form-group">
					<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
					<label class="control-label visible-ie8 visible-ie9">Full
						Name</label> <input
						class="form-control form-control-solid placeholder-no-fix"
						type="text" autocomplete="off" placeholder="Full Name"
						name="NameField" id="NameField" value="" />
				</div>
				<div class="form-group">
					<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
					<label class="control-label visible-ie8 visible-ie9">Balance</label>
					<input class="form-control form-control-solid placeholder-no-fix"
						type="text" autocomplete="off" placeholder="Balance"
						name="balance" id="balance" value="" />
				</div>
				<div class="form-actions">
					<button type="button" onclick="checkInputs()"
						class="submit_button btn btn-success uppercase">SignUp</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		function showSignUpPanal() {

			if (document.getElementById('hiddenIsChangePassword').value == "0") {
				// document.getElementById('updatePassword').style.display = '';
				$('#updatePassword').show('slow');
				$('#signIn').hide('slow')
				document.getElementById('hiddenIsChangePassword').value = "1";
			} else {
				$('#signIn').show('slow');
				$('#updatePassword').hide('slow');
				document.getElementById('hiddenIsChangePassword').value = "0";
			}

		}

		function checkInputs() {
			var Prompts = "";
			Username = window.document.SignUpPage.UsernameField.value;
			Password = document.SignUpPage.PasswordField.value;
			RePassword = SignUpPage.RePasswordField.value;
			Name = SignUpPage.NameField.value;
			if (Username == "" || Password == "" || RePassword == ""
					|| Name == "") {
				if (Username == "")
					Prompts += "Please enter your username!\n";
				if (Password == "")
					Prompts += "Please enter your password!\n";
				if (RePassword == "")
					Prompts += "Please re-enter your password!\n";
				if (Name == "")
					Prompts += "Please enter your name!\n";
				if (Prompts != "")
					window.alert(Prompts);
			} else if (RePassword != Password) {
				window
						.alert("Your entered passwords are not same. Please enter the same one!");
			} else {
				document.SignUpPage.submit();
			}
		}
		jQuery(document).ready(function() {
			Metronic.init(); // init metronic core components
			Layout.init(); // init current layout
			Login.init();
			Demo.init();
		});
	</script>
</body>
</html>