<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<%@ page import="com.javaweb.util.SecurityUtils" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Small Business - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/template/web/css/small-business.css' />" rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Start Bootstrap</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="<c:url value='/home' />">Home
							<span class="sr-only">(current)</span>
						</a>
					</li>
				<security:authorize access = "isAnonymous()">
					<li class="nav-item"><a class="nav-link" href="<c:url value='/login'/>">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Register</a></li>
				</security:authorize>
				<security:authorize access = "isAuthenticated()">
					<li class="nav-item"><a class="nav-link" href="#">Wellcome <%=SecurityUtils.getPrincipal().getFullName()%></a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/logout'/>">Logout</a></li>
				</security:authorize>
				</ul>
			</div>
		</div>
	</nav>

	
	<!-- Page Content -->
	<dec:body/>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value='template/web/vendor/jquery/jquery.min.js' />"></script>
	<script src="<c:url value='template/web/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>

</body>
</html>