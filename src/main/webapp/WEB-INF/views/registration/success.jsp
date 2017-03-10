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
		<div class="col-md-offset-2 col-md-8">
			<h1>CONGRATULATION YOU ARE SUCCESSFULLY REGISTERD!!!</h1>
			<h3>Please login to SMART BABY  WORLD</h3>
			<a href="/javaproject1/" class="btn btn-success">Login</a>
		</div>
	</body>
</html>	