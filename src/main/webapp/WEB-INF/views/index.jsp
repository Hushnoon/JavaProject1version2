<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>SMARTBABY.com</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- refering static resources -->
<s:url value="/resources/css" var="css" />
<s:url value="/resources/font" var="font" />
<s:url value="/resources/images" var="images" />

<!-- Links to custom stylesheet -->
<link rel="stylesheet" type="text/css" href="${css}/home.css">
<link rel="stylesheet" type="text/css" href="${css}/index.css">
</head>
<body>
	<div class="wrapper">
		<!-- navbar comes here -->
		<div class="header">
			<%@ include file="./shared/navbar.jsp"%>	
		</div>
		<!-- dynamic content will get added -->
		<div class="maincontent">
			<!-- Loading Home Page -->
			<c:if test="${userClickHome==true}">
				<%@ include file="./shared/carasouel.jsp"%>
				<br/>
				<%@ include file="./home.jsp"%>
			</c:if>
		</div>
		
		<!-- footer comes here -->
		<br/><br/>
		<%@ include file="./shared/footer.jsp"%>
	</div>
</body>
</html>