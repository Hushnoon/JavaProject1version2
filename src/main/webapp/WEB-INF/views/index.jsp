<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "form" uri = "http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>SMARTBABY.com</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous"> -->

<!-- refering static resources -->
<s:url value="/resources/js" var="js" />
<s:url value="/resources/css" var="css" />
<s:url value="/resources/font" var="font" />
<s:url value="/resources/images" var="images" />
<%-- <s:url value="/resources/images/category/" var="categoryImage" /> --%>



<!-- Links to custom stylesheet -->
<link rel="stylesheet" type="text/css" href="${css}/home.css">
<link rel="stylesheet" type="text/css" href="${css}/index.css">
<link rel="stylesheet" type="text/css" href="${css}/dataTables.bootstrap.css">

</head>
<body background="${images}/background.jpg">
	<div class="wrapper">
		<!-- navbar comes here -->
		<div class="header">
			<%@ include file="./shared/navbar.jsp"%>	
		</div>
		<!-- dynamic content will get added -->
		<div class="maincontent">
			<!-- Loading home page -->
			<c:if test="${userClickHome==true}">
				<%@ include file="./shared/carasouel.jsp"%>
				<br/>
				<%@ include file="./home.jsp"%>
			</c:if>
			<!-- Loading admin page -->
			<c:if test="${userClickCategoryAdmin==true}">
				<%@ include file="./admin/adminCategory.jsp"%>

			</c:if>
			<!-- Loading admin page for product operations -->
			<c:if test="${userClickProductAdmin==true}">
				<%@ include file="./admin/adminProduct.jsp"%>
			</c:if>
			
			<!-- Loading all products page for everyone -->
			<c:if test="${userClickAllProducts==true}">
				<%@ include file="./allProducts.jsp"%>
			</c:if>
			
			<!-- Loading viewcart page for user -->
			<c:if test="${userViewCart==true}">
				<%@ include file="./viewCart.jsp"%>
			</c:if>
			
			<!-- Loading product page for users by category -->
			<c:if test="${userClickProducts==true}">
				<script>
					window.categoryId=${catid};
				</script>
				<%@ include file="./productsByCategory.jsp"%>
			</c:if>
		</div>
		
		<!-- footer comes here -->
		<br/><br/>
		<%@ include file="./shared/footer.jsp"%>
	</div>
	<!-- Reference to data table files -->
		<script src="${js}/category.js"></script>
		<script src="${js}/product.js"></script>
		<script src="${js}/ProductsByCategory.js"></script>
		<script src="${js}/jquery.dataTables.js"></script>
		<script src="${js}/dataTables.bootstrap.js"></script>
	
</body>
</html>