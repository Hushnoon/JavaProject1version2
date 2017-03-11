<div class="row">
	<div class="container col-md-col-md-10 col-md-offset-2 jumbotron">
		<table id="productForUserTable"
			class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>PRODUCT IMAGE</th>
					<th>PRODUCT NAME</th>
					<th>UNIT PRICE</th>
					<th>QUANTITY</th>					
					<th>TOTAL PRICE</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cartItem" items="${cartItemList}">
					<tr>
						<td><img src="/javaproject1/resources/images/product/${cartItem.product.imageUrl}" height="80" width="80"></td>
						<td><c:out value="${cartItem.product.name}" /></td>
						<td><c:out value="${cartItem.product.price}" /></td>
						<td><c:out value="${cartItem.quantity}" /></td>
						<td><c:out value="${cartItem.totalPrice}" /></td>
						<td>
						<a href="/javaproject1/user/cartitem/plus/${cartItem.id}" class="btn btn-info"><span class="glyphicon glyphicon-plus-sign"></span>1</a>
						<a href="/javaproject1/user/cartitem/minus/${cartItem.id}" class="btn btn-danger"><span class="glyphicon glyphicon-minus-sign"></span>1</a>
						<br/>
						
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
