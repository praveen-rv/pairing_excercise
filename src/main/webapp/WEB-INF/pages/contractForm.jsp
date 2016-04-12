<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Contract Information</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css" />
	
	<style type="text/css">
	.myrow-container {
		margin: 20px;
	}
	
	.required {
		color: red;
	}
</style>
</head>
<body class=".container-fluid">
	<div class="container myrow-container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Contract Details</h3>
			</div>
			<div class="panel-body">
				<form:form id="contractRegisterForm" cssClass="form-horizontal"
					modelAttribute="contract" method="post" action="saveContract">

					<div class="form-group">
						<div class="control-label col-xs-3">
							<form:label path="code">Code</form:label>
						</div>
						<div class="col-xs-4">
							<form:hidden path="id" value="${contractObject.id}" />
							<form:hidden path="code" value="${contractObject.code}" />
							<form:input cssClass="form-control" path="code" disabled="true"
								value="${contractObject.code}" />
						</div>
					</div>

					<div class="form-group">
						<div class="control-label col-xs-3">
							<form:label path="description">Description <b class="required">*</b></form:label>
						</div>
						<div class="col-xs-4">
							<form:input cssClass="form-control" path="description" maxlength="50"
								value="${contractObject.description}" />
						</div>
					</div>

					<div class="form-group">
						<div class="control-label col-xs-3">
							<form:label path="budget">Budget ($) <b class="required">*</b></form:label>
						</div>
						<div class="col-xs-4">
							<form:input cssClass="form-control numeric" path="budget" maxlength="8"
								value="${contractObject.budget}" />
						</div>
					</div>
					
					<div class="form-group">
						<div class="control-label col-xs-3">
							<form:label path="committedCost">Committed Cost ($) <b class="required">*</b></form:label>
						</div>
						<div class="col-xs-4">
							<form:input cssClass="form-control numeric" path="committedCost" maxlength="8" 
								onchange="checkCost();" value="${contractObject.committedCost}" />
						</div>
					</div>
					
					<div class="form-group">
						<div class="control-label col-xs-3">
							<form:label path="forecast">Forecast ($) <b class="required">*</b></form:label>
						</div>
						<div class="col-xs-4">
							<form:input cssClass="form-control numeric" path="forecast" maxlength="8" 
								onchange="checkForecast();" value="${contractObject.forecast}" />
						</div>
					</div>
					
					<div class="form-group">
						<div class="control-label col-xs-3">
							<form:label path="paid">Paid ($) <b class="required">*</b></form:label>
						</div>
						<div class="col-xs-4">
							<form:input cssClass="form-control numeric" path="paid" maxlength="8" 
								onchange="checkPaid();" value="${contractObject.paid}" />
						</div>
					</div>
					
					<div class="form-group">
						<div class="control-label col-xs-3">
							<form:label path="complete">Completed (%) <b class="required">*</b></form:label>
						</div>
						<div class="col-xs-4">
							<form:input cssClass="form-control numeric" path="complete" maxlength="3"
								value="${contractObject.complete}" />
						</div>
					</div>

					<div class="form-group">
						<div class="control-label col-xs-3">
							<form:label path="vendor">Vendor <b class="required">*</b></form:label>
						</div>
						<div class="col-xs-4">
							<form:input cssClass="form-control" path="vendor" maxlength="30"
								value="${contractObject.vendor}" />
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-9 col-md-offset-3">
							<div id="messages"></div>
						</div>
					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-xs-3"></div>
							<div class="col-xs-4">
								<input type="submit" id="saveContract" class="btn btn-primary" value="Save" />
								<input type="button" class="btn btn-default" 
									onclick="location.href='getAllContracts';" value="Cancel" />
							</div>
						</div>
					</div>

				</form:form>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script
	    src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"> </script>

	<script type="text/javascript">
			
		$(document).ready(function() {
		    $('.numeric').keypress(function(e) {
		    	var verified = (e.which == 8 || e.which == undefined || e.which == 0) ? null : String.fromCharCode(e.which).match(/[^0-9]/);
		        if (verified) {e.preventDefault();}
		    });
		});
		
		$(document).ready(function() {
		    $('#contractRegisterForm').bootstrapValidator({
		        container: '#messages',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            description: {
		                validators: {
		                    notEmpty: {
		                        message: 'Description is required and cannot be empty'
		                    }
		                }
			        },
		            budget: {
		                validators: {
		                    notEmpty: {
		                        message: 'Budget is required and cannot be empty'
		                    }
		                }
			        },
		            committedCost: {
		                validators: {
		                    notEmpty: {
		                        message: 'Committed Cost is required and cannot be empty'
		                    }
		                }
			        },
		            forecast: {
		                validators: {
		                    notEmpty: {
		                        message: 'Forecast is required and cannot be empty'
		                    }
		                }
			        },
		            paid: {
		                validators: {
		                    notEmpty: {
		                        message: 'Paid is required and cannot be empty'
		                    }
		                }
			        },
		            complete: {
		                validators: {
		                    notEmpty: {
		                        message: 'Completed is required and cannot be empty'
		                    },
		                    lessThan: {
		                    	value: 101,
		                    	message : 'Completed cannot be more than 100'
		                    }
		                }
			        },
		            vendor: {
		                validators: {
		                    notEmpty: {
		                        message: 'Vendor is required and cannot be empty'
		                    }
		                }
			        }
		        }
		    });
		});
		
		function checkCost() {
			var budget = parseInt($('#budget').val());
			var committedCost = parseInt($('#committedCost').val());
			if (committedCost > budget) {
				alert('Committed cost should be within budget.');
				$('#committedCost').val('${contractObject.committedCost}');
				if ($('#committedCost').val() == '') {
					$('#committedCost').val(0);
				}
			}
		}
		function checkForecast() {
			var committedCost = parseInt($('#committedCost').val());
			var forecast = parseInt($('#forecast').val());
			if (forecast > committedCost) {
				alert('Forecast should be within committed cost.');
				$('#forecast').val('${contractObject.forecast}');
				if ($('#forecast').val() == '') {
					$('#forecast').val(0);
				}
			}
		}
		function checkPaid() {
			var forecast = parseInt($('#forecast').val());
			var paid = parseInt($('#paid').val());
			if (paid > forecast) {
				alert('Paid should be within forecast.');
				$('#paid').val('${contractObject.paid}');
				if ($('#paid').val() == '') {
					$('#paid').val(0);
				}
			}
		}
		
	</script>
</body>
</html>