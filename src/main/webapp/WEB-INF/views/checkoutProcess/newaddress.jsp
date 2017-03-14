<!DOCTYPE html>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<html>
	<head>
		<title>Sign In</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<s:url value="/resources/images" var="images"/>
		<s:url value="/resources/css" var="css"/>
		
		<link rel="stylesheet" type="text/css" href="${css}/singlePage.css">
	</head>
	<body background="${images}/background.jpg">
		<div class="container">
		<h2 class="page-header">FILL UP NEW SHIPPING ADDRESS</h2>
		<div class="jumbotron">
			<form:form modelAttribute="address" class="form-horizontal" method="post">
				<div class="form-group">
					<label class="control-label col-sm-2" for="line1">Address Line1:</label>
					<div class="col-sm-10">
						<form:input type="text" path="line1" class="form-control" id="line1"/>
						<div class="has-error">
							<form:errors path="line1" class="help-inline" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="line2">Address Line2:</label>
					<div class="col-sm-10">
						<form:input type="text" path="line2" class="form-control" id="line2"/>
						<div class="has-error">
							<form:errors path="line2" class="help-inline" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="state">State:</label>
					<div class="col-sm-10">
						<form:input type="text" path="state" class="form-control" id="state"/>
						<div class="has-error">
							<form:errors path="state" class="help-inline" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="city">City:</label>
					<div class="col-sm-10">
						<form:input type="text" path="city" class="form-control" id="city"/>
						<div class="has-error">
							<form:errors path="city" class="help-inline" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pincode">Pincode:</label>
					<div class="col-sm-10">
						<form:input type="text" path="pincode" class="form-control" id="pincode"/>
						<div class="has-error">
							<form:errors path="pincode" class="help-inline" />
						</div>
					</div>
				</div>
	
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input name="_eventId_back" type="submit" value="Back" /> 
						<input name="_eventId_add" type="submit" value="ADD" />
					</div>
				</div>
			</form:form>
		</div>
	</div>
	</body>
</html>