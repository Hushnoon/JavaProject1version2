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
		
		<div class="jumbotron">
			<form:form class="form-horizontal" method="post">
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
							<h1>YOUR ORDER HAS BEEN PLACED SUCCESSFULLY!!!</h1>
							<h3>click here hoome</h3>
							<a class="btn btn-success" href="/javaproject1/">Home</a>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	</body>
</html>