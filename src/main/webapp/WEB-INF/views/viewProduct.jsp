<div class="row">
	<div class="col-md-offset-2 col-md-8 jumbotron viewproductstyle">
		<table>
			<tr>
				<div class="row">
					<div class="col-md-4">
					<td><img
					src="/javaproject1/resources/images/product/${product.imageUrl}" />

				</td>
				</div>
				<td>
					<div class="col-md-6">
						<h1>Product Details</h1>
						<ul>
							<li><h3><b>${product.name}</b></h3></li>
							<li><b>PRODUCT DESCRIPTION:</b> ${product.description}</li>
							<li><b>PRODUCT PRICE:</b> ${product.price}</li>
							<li><b>AVAILABLE QUANTITY:</b> ${product.qty}</li>
							<a class="btn btn-info"
								href="/javaproject1/user/add/product/toCart/${product.id}"><span
								class="glyphicon glyphicon-shopping-cart"></span>Add To Cart</a>
						</ul>
					</div>
				</td>
				</div>
			</tr>
		</table>
	</div>
</div>