<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Contracts List</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<style type="text/css">
		.myrow-container {
			margin: 20px;
		}
	</style>
</head>
<body class=".container-fluid">
	<div class="container myrow-container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">
					<div align="left">
						<h4>Project ABC</h4>
					</div>
				</h3>
			</div>
			<div class="panel-body">
				<b>List of Contracts</b>
				<div id="messageDiv" class="text-success">${message}</div>
			</div>
			<div class="panel-body">
				<c:if test="${empty contractList}">
					<div class="text-info">There are no Contracts</div>
				</c:if>
				<c:if test="${not empty contractList}">

					<table class="table table-hover table-bordered">
						<thead style="background-color: #2eccfa;">
							<tr>
								<th>Code</th>
								<th>Description</th>
								<th>Budget ($)</th>
								<th>Committed Cost ($)</th>
								<th>Forecast ($)</th>
								<th>Paid ($)</th>
								<th>Completed (%)</th>
								<th>Vendor</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${contractList}" var="con">
								<tr>
									<td><c:out value="${con.code}" /></td>
									<td><c:out value="${con.description}" /></td>
									<td><c:out value="${con.budget}" /></td>
									<td><c:out value="${con.committedCost}" /></td>
									<td><c:out value="${con.forecast}" /></td>
									<td><c:out value="${con.paid}" /></td>
									<td><c:out value="${con.complete}" /></td>
									<td><c:out value="${con.vendor}" /></td>
									<th><a href="editContract?id=<c:out value='${con.id}'/>"><span
											class="glyphicon glyphicon-edit"></span></a></th>
									<th><a href="deleteContract?id=<c:out value='${con.id}'/>"><span
											class="glyphicon glyphicon-trash"></span></a></th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
		</div>
		<form action="createContract">
			<button type="submit" class="btn btn-primary  btn-md">New Contract</button>
		</form>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#messageDiv').delay(2000).fadeOut();
			});
		</script>
	</div>
</body>
</html>