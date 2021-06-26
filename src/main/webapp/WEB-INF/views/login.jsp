<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<div class="container">
		<!-- <h1 class="form-heading">login Form</h1> -->
		<div class="login-form">
			<div class="main-div">
				<c:if test="${param.incorrectAccount != null}">
					<div class="alert alert-danger">
							Username or Password incorrect!
					</div>
				</c:if>
				<c:if test="${param.accessDenied != null}">
					<div class="alert alert-danger">
							You not Authorize!
					</div>
				</c:if>
				<form action="j_spring_security_check" id="formLogin" method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="userName" name="j_username"
							placeholder="Username">
					</div>

					<div class="form-group">
						<input type="password" class="form-control" id="password" name="j_password"
							placeholder="Password">
					</div>
					<!-- <input type="hidden" value="login" name="action"/> -->
					<button type="submit" class="btn btn-primary" >Login</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>