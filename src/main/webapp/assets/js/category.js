$(function() {
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
										return '<img src="${categoryImage}/"'+data.imageUrl+'" height="50" width="50">';
									}
								},
								{
									data : null,
									mRender : function(data, type, row) {
										return '<a class="btn btn-primary" href="/javaproject1/admin/show/category/'
												+ data.id
												+ '">Edit</a> &nbsp;&nbsp;<a class="btn btn-primary" href="/javaproject1/admin/delete/category/'+data.id+'">Delete</a> ';
									}
								} 
								]
					});
});