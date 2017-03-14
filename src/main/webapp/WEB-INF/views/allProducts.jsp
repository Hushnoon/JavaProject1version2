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
					<th></th>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		console.log('')
		$('#productForUserTable')
				.DataTable(
						{
							"ajax" : {
								url : '/javaproject1/all/product',
								dataSrc : ''
							},
							columns : [
									{
										data : null,
										mRender : function(data, type, row) {
											console.log('hello');
											console.log(row.imageUrl);
											return '<img src="/javaproject1/resources/images/product/'+row.imageUrl+'" height="80" width="80">';
										}
									},

									{
										data : 'name'
									},
									{
										data : 'description'
									},
									{
										data : 'price'
									},
									{
										data : 'qty'
									},
									{
										data : null,
										mRender : function(data, type, row) {
											return '<a class="btn btn-info" href="/javaproject1/view/product/'
												+ data.id
												+ '">View Item</a>';
										}
									},
									{
										data : null,
										mRender : function(data, type, row) {
											return '<a class="btn btn-info" href="/javaproject1/user/add/product/toCart/'
												+ data.id
												+ '"><span class="glyphicon glyphicon-shopping-cart"></span>Add To Cart</a>';
										}
									} ]
						});
	});
</script>