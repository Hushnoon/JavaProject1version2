<div class="row">
	<div class="container col-md-offset-2 col-md-col-md-8 jumbotron">
		<form:form action="/javaproject1/admin/add/category" method="POST" modelAttribute="category" class="form-horizontal" enctype="multipart/form-data">
			
			<form:hidden path="id" />
						
			<div class="form-group">
				<label class="col-md-2 control-lable" for="name">Category
					Name</label>
				<div class="col-sm-10">
					<form:input type="text" path="name" id="categoryname"
						class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="name" class="help-inline" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-lable" for="imageUrl">Upload
					Image</label>
				<div class="col-sm-10">
					<form:input type="file" path="file" id="imageUrl" class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="file" class="help-inline" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-success">Submit</button>
				</div>
			</div>
		</form:form>
	</div>
</div>
<div class="row">
	<div class="container col-md-col-md-8 col-md-offset-2 jumbotron">
		<table id="categoryTable" class="table table-hover">
			<thead>
				<tr>
					<th>Name</th>
					<th>Image</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
		</table>
	</div>
</div>