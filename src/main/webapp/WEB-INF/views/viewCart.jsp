<div class="row">
	<div class="container col-md-col-md-10 col-md-offset-2 jumbotron">
		<table id="productForUserTable"
			class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>Product Image</th>
					<th>Product Name</th>
					<th>Description</th>
					<th>Unit Price</th>
					<th>Quantity</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cartItem" items="${cartItemList}">
					<tr>
						<td><c:out value="${cartItem.product.name}" /></td>
						<td><c:out value="${cartItem.product.price}" /></td>
						<td><c:out value="${cartItem.quantity}" /></td>
						<td><c:out value="${cartItem.totalPrice}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
