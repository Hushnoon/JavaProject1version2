$(function() {
	console.log('')
	$('#categoryTable')
			.DataTable(
					{
						"ajax" : {
							url : '/javaproject1/admin/all/category',
							dataSrc : ''
						},
						columns : [
								{
									data : 'name'
								},
								{
									data : 'imageUrl'
								},
								{
									data : null,
									mRender : function(data, type, row) {
										console.log('hello');
										console.log(row.imageUrl);
										return '<img src="/javaproject1/resources/images/category/'+row.imageUrl+'" height="60" width="60">';
									}
								},
								{
									data : null,
									mRender : function(data, type, row) {
										return '<a class="btn btn-primary" href="/javaproject1/admin/show/category/'
												+ data.id
												+ '">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-primary" href="/javaproject1/admin/delete/category/'+data.id+'">Delete</a> ';
									}
								} 
								]
					});
});