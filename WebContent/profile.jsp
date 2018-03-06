<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
.tooltip {
	display: none;
	position: fixed;
	border: 1px solid #333;
	background-color: #161616;
	border-radius: 5px;
	padding: 5px;
	color: #fff;
	font-size: 12px Arial;
}
</style>
</head>
<body class="page-header-fixed page-quick-sidebar-over-content">
	<input id="hiddenIsChangePassword" name="hiddenVendorConfigStatus"
		type="hidden" value="0" />
	<div class="row">
		<div class="col-md-12">
			<div class="form-horizontal form-row-seperated">
				<div class="portlet">
					<div class="portlet-body" id="divUserForm">
						<div class="tabbable">
							<ul id="tabExample1" class="nav nav-tabs" role="tablist">
								<li class="active" id="tab1"><a href="#general-info"
									role="tab" data-toggle="tab">Info</a></li>
								<li id="tab2"><a href="#assignDefult" role="tab"
									data-toggle="tab" id="tabConfigAssign">EZ Pass</a></li>
							</ul>
							<div class="tab-content no-space">
								<div class="tab-pane active" id="general-info">
									<div class="portlet-body form">
										<form method="post" class="col-md-8" id="userForm">
											<div class="form-body">
												<h3>User Detail</h3>
												<legend> </legend>
												<input id="hiddenUserId" name="hiddenUserId" type="hidden" />
												<div class="form-group">
													<label class="col-md-2 control-label">User Name:<span
														class="required"> * </span>
													</label>
													<div class="col-md-8">
														<div class="input-group">
															<span class="input-group-addon"> <i
																class="fa fa-user"></i> 
															</span> <input type="text" name="userName" id="userName"
																disabled="disabled" size="14" maxlength="14"
																class="form-control" value="${uinfo[1]}" />
														</div>
													</div>
													<div class="col-md-2" id="changePassword">
														<a onclick="showChangePasswordPanal()">Change Password</a>
													</div>
												</div>
												<div id="updatePassword" style="display: none;">
													<div class="form-group">
														<label class="col-md-2 control-label">Old
															Password:<span class="required"> * </span>
														</label>
														<div class="col-md-10">
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa fa-lock"></i>
																</span> <input class="form-control" type="password"
																	name="oldPassword" id="oldPassword" size="14"
																	maxlength="14" placeholder="old Password">
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="col-md-2 control-label">Password:<span
															class="required"> * </span>
														</label>
														<div class="col-md-10">
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa fa-lock"></i>
																</span> <input type="password" class="form-control"
																	type="password" name="password" id="password" size="14"
																	maxlength="14" placeholder="Password">
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="col-md-2 control-label">Repeat
															Password:<span class="required"> * </span>
														</label>
														<div class="col-md-10">
															<div class="input-group">
																<span class="input-group-addon"> <i
																	class="fa fa-lock"></i>
																</span> <input type="password" class="form-control"
																	type="password" name="repeatPassword"
																	id="repeatPassword" size="14" maxlength="14"
																	placeholder="Repeat Password">
															</div>
														</div>
													</div>
													<div class="form-actions">
														<button class="btn green-meadow" type="button"
															onclick="updatePassword()">
															<i class="fa fa-check"></i> Update Password
														</button>

													</div>
												</div>
												<h3>Personal Detail</h3>
												<legend> </legend>
												<div class="form-group row">
													<label class="col-md-2 control-label">Name:<span
														class="required"> * </span></label>
													<div class="controls col-md-10 ">
														<input type="text" name="name" id="name"
															class="form-control" placeholder="Name"
															value="${uinfo[2]}">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-2 control-label">Account
														Number:<span class="required"> * </span>
													</label>
													<div class="controls col-md-10 ">
														<input type="text" name="AccNo" id="AccNo" size="12"
															disabled="disabled" value="${uinfo[0]}" maxlength="12"
															class="form-control">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-md-2 control-label">Balance:<span
														class="required"> * </span>
													</label>
													<div class="controls col-md-10 ">
														<input type="text" name="bal" id="bal" size="12"
															value="${uinfo[3]}" maxlength="12" class="form-control">
													</div>
												</div>
												<!-- <div class="form-group">
													<label class="col-md-2 control-label">Active: </label>
													<div class="col-md-10">
														<select
															class="form-control input-medium input-medium select"
															name="adminActivated" id="adminActivated">
															<option value="1">Yes</option>
															<option value="0">No</option>
														</select>
													</div>
												</div> -->

											</div>
											<div class="form-actions">
												<button class="btn green-meadow" type="button"
													onclick="updateUser()">
													<i class="fa fa-check"></i> Save
												</button>

											</div>
										</form>
									</div>
								</div>
								<div class="tab-pane" id="assignDefult">
									<div class="col-md-5">
										<div class="form-group row">
											<label class="col-md-2 control-label">EZ:<span
												class="required"> * </span>
											</label>
											<div class="controls col-md-5 ">
												<input id="EZTag" name="EZTag" type="text" size="13"
													placeholder="EZ Tag" class="form-control" maxlength="13"
													onkeypress="return onlyNumbersWithDot(event);" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-2 control-label">Type: <span
												class="required"> * </span>
											</label>
											<div class="col-md-3">
												<select
													class="form-control input-medium input-medium select"
													name="type" id="type">
													<option value="Automatic">Automatic</option>
													<option value="Manual">Manual</option>
												</select>
											</div>
										</div>
										<div class="actions btn-set" style="margin-left: 17%">
											<button class="btn green-meadow" id="addEZTag"
												onclick="saveEZTag();">
												<i class="fa fa-check"></i> Add
											</button>
										</div>
									</div>
									<div class="col-md-5">
										<div>
											<table class="responsive table table-striped table-bordered"
												style="width: 100%; margin-bottom: 0;" id="datatable_EZTag">
												<thead>
													<tr>
														<th class="to_hide_phone  no_sort">EZ Tag</th>
														<th class="to_hide_phone  no_sort">Type</th>
														<th class="to_hide_phone  no_sort">Remove</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="data" items="${EZTag}">
														<tr>
															<td>${data[0]}</td>
															<td>${data[1]}</td>
															<td align="center">
																<button class="btn btn-sm red"
																	id="btnDeleteEZTag${data[0]}"
																	onclick="deleteEZTag('${data[0]}')">
																	<i class="fa fa-trash-o" id="deleteEZTag${data[0]}"></i>
																</button>
															</td>
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
	<script type="text/javascript">
		function updateUser() {
			var name = $("#name").val();
			var balance = $("#bal").val();
			if (balance != 0 && name != '') {
				var url = '/CSCI6810/ProfileController?name=' + name
						+ '&balance=' + balance;
				$.ajax({
					async : true,
					cache : false,
					type : "POST",
					url : url,
					dataType : "html",
					success : function(res) {
						alert("Details Updated Sucessfully!");
					}
				});
			}

		}
		function showChangePasswordPanal() {

			if (document.getElementById('hiddenIsChangePassword').value == "0") {
				// document.getElementById('updatePassword').style.display = '';
				$('#updatePassword').show('slow');
				document.getElementById('hiddenIsChangePassword').value = "1";
			} else {
				// document.getElementById('updatePassword').style.display = 'none';
				$('#updatePassword').hide('slow');
				document.getElementById('hiddenIsChangePassword').value = "0";
			}

		}
		function updatePassword() {
			var psw = $("#password").val();
			var oldpsw = $("#oldPassword").val();
			var rpsw = $("#repeatPassword").val();
			if (psw != rpsw) {
				alert("Password doesnt match!!!");
			} else if (psw == '' || rpsw == '') {
				alert("Please enter password details!");
			} else {
				var url = '/CSCI6810/ProfileController?oldPassword=' + oldpsw
						+ '&newPassword=' + psw;
				$.ajax({
					async : true,
					cache : false,
					type : "POST",
					url : url,
					dataType : "html",
					success : function(res) {
						alert("Successfully Updated");
						showChangePasswordPanal();
					}
				});
			}
		}

		function deleteEZTag(tagid) {
			var url = '/CSCI6810/ProfileController?delete=true&EZTag=' + tagid;
			$.ajax({
				async : true,
				cache : false,
				type : "POST",
				url : url,
				dataType : "html",
				success : function(res) {
					alert("Successfully Deleted");
				}
			});
		}
		function saveEZTag() {
			var type = $('#type :selected').text();
			var eztag = $('#EZTag').val();
			var url = '/CSCI6810/ProfileController?insert=true&EZTag=' + eztag
					+ '&type=' + type + '';
			$.ajax({
				async : true,
				cache : false,
				type : "POST",
				url : url,
				dataType : "html",
				success : function(res) {
					alert("Successfully Added");
				}
			});

		}
		jQuery(document)
				.ready(
						function() {
							$('#datatable_EZTag')
									.dataTable(
											{

												"sDom" : "<'row-fluid table_top_bar'<'span12'<'to_hide_phone' f>>>t<'row-fluid control-group full top' <'span4 to_hide_tablet'l><'span8 pagination'p>>",
												"bPaginate" : false,
												"bLengthChange" : false,
												"bJQueryUI" : false,
												"sScrollY" : "1000",
												"bDestroy" : true,
												"bSort" : true,
												"aaSorting" : [],
											});

							$('a[data-toggle="tab"]').on(
									'shown.bs.tab',
									function(e) {
										var table = $.fn.dataTable
												.fnTables(true);
										if (table.length > 0) {
											$(table).dataTable()
													.fnAdjustColumnSizing();
										}
									});
						});
	</script>
</body>
<!-- END BODY -->
</html>