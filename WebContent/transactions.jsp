<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8" />
<title>EZ Pass : Transactions</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<!-- BEGIN HEADER -->
	<h3 class="page-title">User's Transaction</h3>
	<!-- END PAGE HEADER-->
	<!-- BEGIN PAGE CONTENT-->
	<div class="row">
		<div class="col-md-12">
			<div class="form-horizontal form-row-seperated">
				<div class="portlet">
					<div class="portlet-title">
						
					</div>
					<div id="divDinnerCategory">
						<div class="portlet-body">
							<table class="table table-striped table-bordered table-hover"
								id="datatable_example">
								<thead>
									<tr role="row" class="heading">
										<th class="to_hide_phone  no_sort">Transaction Id</th>
										<th class="to_hide_phone  no_sort">Date</th>
										<th class="to_hide_phone">Amount</th>
										<th class="to_hide_phone">Type</th>
										<th class="to_hide_phone">EZ Tag</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="data" items="${trans}">
										<tr>
											<td>${data[0]}</td>
											<td>${data[1]}</td>
											<td>${data[2]}</td>
											<td>${data[3]}</td>
											<td>${data[4]}</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- END PAGE CONTENT-->
	</div>
	<!-- END CONTENT -->
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
		jQuery(document)
				.ready(
						function() {
							$('.checkbox').uniform();
							$('.select').select2();
							var dontSort = [];
							$('#datatable_example thead th').each(function() {
								if ($(this).hasClass('no_sort')) {
									dontSort.push({
										"bSortable" : true,
										"bSearchable" : true
									});
								} else {
									dontSort.push({
										"bSortable" : false,
										"bSearchable" : false
									});
								}
							});

							$('#datatable_example')
									.dataTable(
											{
												"sDom" : "<'row-fluid table_top_bar'<'span12'<'to_hide_phone' f>>>t<'row-fluid control-group full top' <'span4 to_hide_tablet'l><'span8 pagination'p>>",
												"aaSorting" : [ [ 0, "asc" ] ],
												"bPaginate" : true,
												"bLengthChange" : false,
												"iDisplayLength" : 20,
												"bJQueryUI" : false,
												"aoColumns" : dontSort,

											});
							$.extend($.fn.dataTableExt.oStdClasses, {
								"s`" : "dataTables_wrapper form-inline"
							});
						});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>