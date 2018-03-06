<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
function onlyNumbersWithDot(evt) {
	var e = evt || window.event; // for trans-browser compatibility
	var charCode = e.which || e.keyCode;

	if (charCode > 31 && ((charCode < 48 || charCode > 57) && charCode != 46))
		return false;
	return true;
}
	function checkIP() {
		var Prompts = "";
		EZTag = window.document.PayTollManuallyBO.EZTag.value;
		TollPlaza = window.document.PayTollManuallyBO.TollPlaza.value;
		Amount = window.document.PayTollManuallyBO.Amount.value;
		if (EZTag == "") {
			Prompts += "Please enter EZTag!\n";
		}
		if (TollPlaza == "")
			Prompts += "Please enter TollPlaza!\n";
		if (Amount == "")
			Prompts += "Please enter Amount!\n";
		if (EZTag.length != 13 && EZTag != "") {
			Prompts += "Please enter valid 13 digit EZTag code!\n";
		}
		if (Prompts != "") {
			window.alert(Prompts);
		} else {
			document.PayTollManuallyBO.submit();
		}
	}
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pay Toll</title>
</head>
<div id="errorAlert" class="modal hide fade" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">MESSAGE</h3>
	</div>
	<div class="modal-body" id="errorbody"></div>
	<div class="alert error" id="errorAlert" style="display: none;">
		<span class="icon"></span><strong>Error : </strong><span id="errorMsg"></span>
	</div>
</div>
<body class="page-header-fixed page-quick-sidebar-over-content">
	<!-- BEGIN HEADER -->
	<h3 class="page-title">Pay Toll</h3>
	<!-- END PAGE HEADER-->
	<!-- BEGIN PAGE CONTENT-->
	<div class="row">
		<div class="col-md-12">
			<div class="form-horizontal form-row-seperated">
				<div class="portlet">
					<div class="portlet-title"></div>
					<div class="form-body">
						<form method="post" class="form uniformForm validateForm"
							name="PayTollManuallyBO" ACTION="/CSCI6810/PayToll" METHOD="POST">

							<div class="form-group">
								<label class="col-md-2 control-label">EZ Tag: <span
									class="required"> * </span>
								</label>
								<div class="col-md-3">
									<input id="EZTag" name="EZTag" type="text" maxlength="13"
										onkeypress="return onlyNumbersWithDot(event);"
										class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label">Toll Plaza: <span
									class="required"> * </span>
								</label>
								<div class="col-md-3">
									<input id="TollPlaza" name="TollPlaza" type="text" size="44"
										maxlength="44" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label">Toll Amount: <span
									class="required"> * </span>
								</label>
								<div class="col-md-3">
									<input id="Amount" name="Amount" type="text"
										onkeypress="return onlyNumbersWithDot(event);"
										class="form-control" />
								</div>
							</div>
							<div class="actions btn-set" align="left">
								<button class="btn green-meadow" onclick="checkIP();">
									<i class="fa fa-check"></i> Save
								</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
		<!-- END PAGE CONTENT-->
	</div>
</body>
</html>