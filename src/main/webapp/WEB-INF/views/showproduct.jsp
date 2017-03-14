<html>
<head>
<Title>Product Details</Title>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<s:url value="/resources/images/" var="imgs" />
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background-color: #F2EEE9;
	font: normal 13px/1.5 Georgia, Serif;
	color: #333;
}

.wrapper {
	width: 705px;
	margin: 20px auto;
	padding: 20px;
}

h1 {
	display: inline-block;
	background-color: #333;
	color: #fff;
	font-size: 20px;
	font-weight: normal;
	text-transform: uppercase;
	padding: 4px 20px;
	float: left;
}

.clear {
	clear: both;
}

.items {
	display: block;
	margin: 20px 0;
}

.item {
	background-color: #fff;
	float: left;
	margin: 0 10px 10px 0;
	width: 205px;
	padding: 10px;
	height: 290px;
}

.item img {
	display: block;
	margin: auto;
}

h3 {
	font-size: 16px;
	display: block;
	border-bottom: 1px solid #ccc;
	margin: 0 0 10px 0;
	padding: 0 0 5px 0;
}

span {
	float: right;
}

.shopping-cart {
	display: inline-block;
	background:
		url('http://cdn1.iconfinder.com/data/icons/jigsoar-icons/24/_cart.png')
		no-repeat 0 0;
	width: 24px;
	height: 24px;
	margin: 0 10px 0 0;
}
</style>
</head>

<body>
	<div class="container">

		<ul class="nav navbar-nav">

			<li><a href="${pageContext.request.contextPath}/home"><span
					class="glyphicon glyphicon-home"></span> Home</a></li>
			<li><img src="${imgs}pantaloonslogo3.jpg" width="100" height="60" />
			</li>
		</ul>
	</div>
	<div class="wrapper">
		<h1>${prd.name}</h1>
		<span><i class="shopping-cart"></i></span>

		<div class="clear"></div>
		<!-- items -->
		<div class="items">
			<!-- single item -->
			<img src="${imgs}${prd.imageURL}.png" class="image-responsive"
				width="400px" height="250px" />
			<!--  adjusting image with the layout -->
			<h2>Item 1</h2>
			<ul>
				<li><h3>Product Name:</h3>${prd.name}</li>
				<li><h3>Product Description:</h3>${prd.description}</li>
				<li><h3>Product Price:</h3>${prd.price}</li>
				<li><h3>Quantity:</h3>${prd.qty}</li>
			</ul>
			<a href="/LinkProject/cart/user/addtocart/${prd.id}"
				class="btn btn-primary btn-block" role=button><span
				class="glyphicon glyphicon-shopping-cart"></span>Add To Cart</a>
		</div>
	</div>
	<!--/ single item -->

	</div>
	<!--/ items -->
	</div>
	<!--/ wrapper -->


</body>
</html>