$(function() {
	console.log('')
	$('#productTable')
			.DataTable(
					{
						"ajax" : {
							url : '/javaproject1/admin/all/product',
							dataSrc : ''
						},
						columns : [
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
										console.log('hello');
										console.log(row.imageUrl);
										return '<img src="/javaproject1/resources/images/product/'+row.imageUrl+'" height="80" width="80">';
									}
								},
								{
									data : null,
									mRender : function(data, type, row) {
										return '<a class="btn btn-primary" href="/javaproject1/admin/show/product/'
												+ data.id
												+ '">&nbsp;&nbsp;Edit&nbsp;&nbsp;</a><br/><br/><a class="btn btn-primary" href="/javaproject1/admin/delete/product/'+data.id+'">Delete</a>';
									}
								}
								]
					});
});