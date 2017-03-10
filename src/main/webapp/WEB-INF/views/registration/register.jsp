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
		<h2 class="page-header">REGISTER TO PAMPER YOUR LITTLE ONE!!!</h2>
		<div class="jumbotron">
			<form:form  class="form-horizontal" method="post" modelAttribute="user">
				<div class="form-group">
					<label class="control-label col-sm-2" for="fullName">Full
						Name:</label>
					<div class="col-sm-10">
						<form:input type="text" path="fullName" class="form-control" id="fullName" placeholder="Enter Your Name"/>
						<div class="has-error">
							<form:errors path="fullName" class="help-inline" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">Email:</label>
					<div class="col-sm-10">
						<form:input type="email" path="email" class="form-control" id="email" placeholder="Enter email"/>
						<div class="has-error">
							<form:errors path="email" class="help-inline" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="phone">Contact:</label>
					<div class="col-sm-10">
						<form:input type="text" path="contact" class="form-control" id="phone" placeholder="Enter contact number"/>
						<div class="has-error">
							<form:errors path="contact" class="help-inline" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="phone">Registration Type:</label>
					<div class="col-sm-10">
						<form:radiobutton path="role" value="CUSTOMER"/>Customer
						<form:radiobutton path="role" value="SUPPLIER"/>Supplier
						<div class="has-error">
							<form:errors path="role" class="help-inline" />
						</div>
					</div>
				</div>				
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">Password:</label>
					<div class="col-sm-10">
						<form:input type="password" path="password" class="form-control" id="pwd" placeholder="Enter password"/>
						<div class="has-error">
							<form:errors path="password" class="help-inline" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cpwd">Confirm
						Password:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="cpwd" placeholder="Re-Enter password"/>
					</div>
				</div>
	
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input name="_eventId_submit" type="submit" value="Submit" />
					</div>
				</div>
			</form:form>
		</div>
	</div>
	</body>
</html>