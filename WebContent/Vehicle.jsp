<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<meta charset="utf-8" />
<title>Email Setting</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
</head>
<div class="modal fade" id="errorAlert" style="padding-top: 200px;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">
					<strong>MESSAGE</strong>
				</h4>
			</div>
			<div class="modal-body" id="errorbody"></div>
			<div class="modal-footer" id="errorfooter"></div>
		</div>
	</div>
</div>
<body class="page-header-fixed page-quick-sidebar-over-content">
	<h3 class="page-title">Vehicles</h3>
	<!-- END PAGE HEADER-->
	<!-- BEGIN PAGE CONTENT-->
	<div class="row">
		<div class="col-md-12">
			<div class="form-horizontal form-row-seperated">
				<div class="portlet">
					<div class="portlet-title">
						<div class="caption">
							<button class="btn red-intense" onclick="showAddVehicle()">Add
								Vehicle</button>
						</div>
					</div>
					<div id="divVehicle">
						<div class="portlet-body">
							<table class="table table-striped table-bordered table-hover"
								id="datatable_example">
								<thead>
									<tr role="row" class="heading">
										<th class="to_hide_phone  no_sort">Vehicle Id</th>
										<th class="to_hide_phone  no_sort">Model</th>
										<th class="to_hide_phone  ">EZ Tag</th>
										<th class="to_hide_phone  ">Year</th>
										<th class="to_hide_phone  ">Delete</th>
									</tr>
								</thead>
								<tbody>
									<tr role="row" class="filter">
										<c:forEach var="data" items="${vehicles}">
											<tr id="row${data[0]}">
												<td>${data[4]}</td>
												<td>${data[1]}</td>
												<td>${data[2]}</td>
												<td>${data[3]}</td>
												<td align="center">
													<button class="btn btn-sm red"
														id="btnDeleteVehicle${data[0]}"
														onclick="deleteVehicle('${data[0]}')">
														<i class="fa fa-trash-o" id="delete${
														data[0]}"></i>
													</button>
												</td>
											</tr>
										</c:forEach>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="form-body" style="display: none" id="addVehicleForm">
						<form method="post"class="form uniformForm validateForm"
							action="/CSCI6810/VehicleController?insert=true"
							id="vehicleForm">
							<input id="hiddenVehicleId" name="hiddenVehicleId" type="hidden"
								value="" />
							<div class="form-group">
								<label class="col-md-2 control-label">Vehicle Number:<span
									class="required"> * </span>
								</label>
								<div class="col-md-3">
									<input id="VehicleNumber" name="VehicleNumber" type="text" size="10"
										placeholder="EX. NYC1000" class="form-control" maxlength="13" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label">Model: <span
									class="required"> * </span>
								</label>
								<div class="col-md-3">
									<input type="text" class="form-control" name="model" id="model"
										placeholder="model">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label">EZ Tag:<span
									class="required"> * </span>
								</label>
								<div class="col-md-3">
									<input id="EZTag" name="EZTag" type="text" size="13"
										placeholder="EZ Tag" class="form-control" maxlength="13"
										onkeypress="return onlyNumbersWithDot(event);" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label">Year:<span
									class="required"> * </span>
								</label>
								<div class="col-md-3">
									<div class="input-group">
										<input id="year" name="year" type="text" size="4"
											class="form-control" maxlength="4" placeholder="Year"
											onkeypress="return onlyNumbersWithDot(event);" />
									</div>
								</div>
							</div>
							<div class="actions btn-set" align="center">
								<button class="btn green-meadow" onclick="saveVehicle()"
									type="submit">
									<i class="fa fa-check"></i> Save
								</button>
								&nbsp;&nbsp;
								<button class="btn red filter-cancel" type="button"
									onclick="cancelVehicleAction()">
									<i class="fa fa-undo"></i> Back To List
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- END PAGE CONTENT-->
	</div>
	<SCRIPT LANGUAGE="JavaScript">
	function onlyNumbersWithDot(evt) {
		var e = evt || window.event; // for trans-browser compatibility
		var charCode = e.which || e.keyCode;

		if (charCode > 31 && ((charCode < 48 || charCode > 57) && charCode != 46))
			return false;
		return true;
	}
	function deleteVehicle(vehicleId){
		var url= '/CSCI6810/VehicleController?delete='+ vehicleId;
		$
		.ajax({
			async : true,
			cache : false,
			type : "GET",
			url : url,
			dataType : "html",
			success : function(res){
				location.reload();
				}
			});
		
	}
	function showAddVehicle(){
		document.getElementById('divVehicle').style.display = 'none';
		document.getElementById('addVehicleForm').style.display = 'block';
		$('#EZTag').val('');
		$('#year').val('');
		$('#model').val('');
	}
	function cancelVehicleAction(){
		document.getElementById('divVehicle').style.display = 'block';
		document.getElementById('addVehicleForm').style.display = 'none';
		$('#EZTag').val('');
		$('#year').val('');
		$('#model').val('');
	}
	function saveVehicle(){
		var eztag,year,model;
		eztag=$("#EZTag").val();
		year=$("#year").val();
		model=$("#model").val();
		if(eztag != "" && year != "" && model != "" && eztag.length==13 && year.length == 4){
			document.vehicleForm.submit();
		}else{
			$('#errorbody').html("");
			$('#errorfooter').html("");
			var alertResult = '<div class="row">';
			alertResult += '<div class="col-md-12">';
			alertResult += '<label style="color:red;">Please Enter Valid Data!</label>';
			alertResult += '</div>';
			alertResult += '<div class="col-md-12">';
			alertResult += '</div>';
			alertResult += '</div>';
			$('#errorbody').html(alertResult);
			//$('#errorAlert').modal();
			alert("Please Enter Valid Data!");
			return null;
		}
	}
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>