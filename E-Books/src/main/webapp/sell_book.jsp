<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="component/allcss.jsp"%>
<title>Sell Books</title>
<style type="text/css">
body
{
background-color: #F0F2F2;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h3 class="text-center text-primary">Sell Books</h3>
					<c:if test="${not empty succmsg}">

							<h5 class="text-center text-success">${succmsg }</h5>
							<c:remove var="succmsg" scope="session" />
						</c:if>
						<c:if test="${not empty errormsg}">

							<h5 class="text-center text-danger">${errormsg }</h5>
							<c:remove var="errormsg" scope="session" />
						</c:if>
						<form action="add_old_books" method="post" enctype="multipart/form-data">
						<input type="text" value="${userobj.email}"name="user">
							<div class="from-group">
								<label for="exampleInputEmail1" class="form-label">Book Name</label> 
								<input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" name="bname">
							</div>
							<div class="from-group">
								<label for="exampleInputPassword1" class="form-label">Author</label>
								<input type="text" class="form-control"
									id="exampleInputPassword1" name="author">
							</div>
							<div class="from-group">
								<label for="exampleInputPassword1" class="form-label">Price</label>
								<input type="number" class="form-control"
									id="exampleInputPassword1" name="price">
							</div>
							<div class="from-group ">
								<label for="exampleInputPassword1" class="form-label">Upload Photo</label>
								<input type="file" class="form-control-file"
									id="examplefromcontrolfile1" name="bimg">
							</div>
							<button type="submit" class="btn btn-primary mt-1">Sell</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>