$(function() {
	$('#myTable')
			.DataTable(
					{
						"ajax" : {
							url : '/project1/products/all',
							dataSrc : ''
						},
						columns : [
								{
									data : 'id'
								},
								{
									data : 'name'
								},
								{
									data : 'desc'
								},
								{
									data : 'brand'
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
										return '<img src="/project1/resources/images/p'
												+ row.id
												+ '.JPG" height="50" width="50">';
									}
								},
								{
									data : null,
									mRender : function(data, type, row) {
										return '<a class="btn btn-primary" href="/project1/products/showproduct/'
												+ data.id
												+ '">View Item</a> &nbsp;&nbsp;<a class="btn btn-primary" href="'
												+ data + '">Add To Cart</a> ';
									}
								} ]
					});
});