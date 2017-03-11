<div class="row">
	<div class="col-md-10 col-md-offset-1">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="logo" href="/javaproject1/">SMARTBABY.com</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right rightnav">

						<li><a href="/javaproject1/products">ALL PRODUCTS</a></li>
						<li><a href="#">ABOUT US</a></li>
						<li><a href="#">CONTACT US</a></li>
						<security:authorize access="hasAuthority('ADMIN')">
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">ADMIN <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/javaproject1/admin/category">CATEGORY</a></li>
									<li><a href="/javaproject1/admin/product">PRODUCT</a></li>
									<!-- <li><a href="#">Orders</a></li> -->
								</ul></li>
						</security:authorize>
						<security:authorize access="isAuthenticated()">
							<li><a href="/javaproject1/logout">LOGOUT</a></li>
						</security:authorize>
						<security:authorize access="isAnonymous()">
							<li><a href="/javaproject1/login"><span
									class="glyphicon glyphicon-user"></span> SIGN IN</a></li>
							<li><a href="/javaproject1/register"><span
									class="glyphicon glyphicon-log-in"></span> REGISTER</a></li>
						</security:authorize>
						<!-- <li><a href="/javaproject1/login"><span
								class="glyphicon glyphicon-user"></span> SIGN IN</a></li>
						<li><a href="/javaproject1/register"><span
								class="glyphicon glyphicon-log-in"></span> REGISTER</a></li> -->
					</ul>
				</div>
			</div>
		</nav>
	</div>
</div>