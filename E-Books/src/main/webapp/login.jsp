<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login Page</title>
<%@include file="component/allcss.jsp"%>
</head>
<body style="background-color: #F0F1F2;">
	<%@include file="component/navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Login form</h3>
						<c:if test="${not empty errormsg}">

							<h5 class="text-center text-danger">${errormsg }</h5>
							<c:remove var="errormsg" scope="session" />
						</c:if>
						<c:if test="${not empty succmsg}">

							<h5 class="text-center text-success">${succmsg }</h5>
							<c:remove var="succmsg" scope="session" />
						</c:if>
						

						<form action="login" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									Address</label> <input type="email" class="form-control" name="email"
									required="required">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" name="password"
									required="required">
							</div>

							<div class="text-center mb-3">
								<button type="submit" class="btn btn-primary">Login</button>
								<br> <a href="registration.jsp">Create Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>