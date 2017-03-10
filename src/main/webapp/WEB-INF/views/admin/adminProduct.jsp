<div class="row">
	<div class="container col-md-offset-2 col-md-col-md-9 jumbotron">
		<form:form action="/javaproject1/admin/add/product" method="POST"
			modelAttribute="product" class="form-horizontal"
			enctype="multipart/form-data">

			<form:hidden path="id" />

			<div class="form-group">
				<label class="col-md-2 control-lable" for="productname">Product
					Name</label>
				<div class="col-sm-10">
					<form:input type="text" path="name" id="productname"
						class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="name" class="help-inline" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-lable" for="description">Product
					Description</label>
				<div class="col-sm-10">
					<form:input type="text" path="description" id="description"
						class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="description" class="help-inline" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-lable" for="category">Category</label>
				<div class="col-sm-10">
					<form:select path="category.id">
						<form:options items="${categoryList}" itemValue="id"
							itemLabel="name" />
					</form:select>
					<div class="has-error">
						<form:errors path="category" class="help-inline" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-lable" for="imageUrl">Upload
					Image</label>
				<div class="col-sm-10">
					<form:input type="file" path="file" id="imageUrl"
						class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="file" class="help-inline" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-lable" for="price">Product
					Price</label>
				<div class="col-sm-10">
					<form:input type="text" path="price" id="price"
						class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="price" class="help-inline" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-lable" for="qty">Quantity</label>
				<div class="col-sm-10">
					<form:input type="text" path="qty" id="qty"
						class="form-control input-sm" />
					<div class="has-error">
						<form:errors path="qty" class="help-inline" />
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
	<div class="container col-md-col-md-9 col-md-offset-2 jumbotron">
		<table id="productTable" class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>Product Name</th>
					<th>Description</th>
					<th>Unit Price</th>
					<th>Quantity</th>
					<th>Image</th>
					<th></th>
				</tr>
			</thead>
		</table>
	</div>
</div>