<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<h2 class="page-header">ORDER SUMMARY</h2>
		<div class="jumbotron">
			<form:form modelAttribute="checkoutModel" class="form-horizontal" method="post">
					<h3>CUSTOMER DETAILS</h3>
					<div class="form-group">
						<label class="control-label col-sm-2">Customer Name:</label>
						<div class="col-sm-10 displayinfo">${checkoutModel.user.fullName}</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">Email:</label>
						<div class="col-sm-10 displayinfo">${checkoutModel.user.email}</div>
						
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="phone">Contact:</label>
						<div class="col-sm-10 displayinfo">${checkoutModel.user.contact}</div>
					</div>
					<h3>SHIPPING ADDRESS DETAILS</h3>
					<div class="form-group">
						<label class="control-label col-sm-2">Address Line1:</label>
						<div class="col-sm-10 displayinfo">${checkoutModel.address.line1}</div>
					</div>		
					<div class="form-group">
						<label class="control-label col-sm-2">Address Line2:</label>
						<div class="col-sm-10 displayinfo">${checkoutModel.address.line2}</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">State:</label>
						<div class="col-sm-10 displayinfo">${checkoutModel.address.state}</div>
					</div>		
					<div class="form-group">
						<label class="control-label col-sm-2">City:</label>
						<div class="col-sm-10 displayinfo">${checkoutModel.address.city}</div>
					</div>				
						<div class="form-group">
						<label class="control-label col-sm-2">State:</label>
						<div class="col-sm-10 displayinfo">${checkoutModel.address.state}</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">Pincode:</label>
						<div class="col-sm-10 displayinfo">${checkoutModel.address.pincode}</div>
					</div>					
					<h3>ITEM DETAILS</h3>
					<div class="form-group">
						<ul>
							<c:forEach items="${checkoutModel.cartItemList }" var="item">
								<li>
									<ul class="list-inline">
										<li class="col-sm-10 displayinfo">Name:${item.product.name}</li>
										<li class="col-sm-10 displayinfo">Quantity:${item.quantity}</li>
										<li class="col-sm-10 displayinfo">Unit Price:${item.product.price}</li>
									</ul>
								</li>
							</c:forEach>
							
						</ul>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2">Grand Total:</label>
						<div class="col-sm-10 displayinfo">${checkoutModel.cart.grandTotal}</div>
					</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input name="_eventId_submit" type="submit" value="Add" /> 
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>