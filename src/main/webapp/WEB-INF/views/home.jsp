<div class="row" style="margin: none;">
	<div class="col-md-offset-2 col-md-2"
		style="background-color: #E5E8E8;">
		<h4>Categories</h4>
		<ul class="list-group">
			<c:forEach items="${cat}" var="ct">
				<li class="list-group-item">${ct.name}</li>
			</c:forEach>
		</ul>
	</div>

	<div class="col-md-6"
		style="border-color: #E5E8E8; border-style: solid;">
		<h2 class="text-center shopfor">
			<u><b>SHOP FOR</b></u>
		</h2>
		<div class="row">

			<div class="col-md-10 col-md-offset-2">
				<img src="${images}/boy.JPG" class="img-rounded"
					style="height: 320px;" alt="Random Name"> <span>&nbsp;&nbsp;&nbsp;</span>
				<img src="${images}/girl.JPG" class="img-rounded"
					style="height: 320px;" alt="Random Name">
			</div>

		</div>
	</div>
</div>