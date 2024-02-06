<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="allcss.jsp"%>
<title>Admin: addbook</title>
<style type="text/css">
body {
	background-color: #F0F2F2;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-primary">Edit Books</h3>
			
						<%
				
					    String idParam = request.getParameter("id");
					    int id = (idParam != null && !idParam.isEmpty()) ? Integer.parseInt(idParam) : 0;
					    // Rest of your code

						BookDAOImpl dao = new BookDAOImpl(DBConnect.getconn());
						BookDtls b = dao.getBookById(id);
						%>




						<form action="../editbooks" method="post" ><input type="hidden" name="id" value="<%=b.getBookId()%>">
						 
							<div class="from-group">
								<label for="exampleInputEmail1" class="form-label">Book
									Name</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="bname" value="<%=b.getBookName()%>">
							</div>
							<div class="from-group">
								<label for="exampleInputPassword1" class="form-label">Author</label>
								<input type="text" class="form-control"
									id="exampleInputPassword1" name="author"
									value="<%=b.getAuthor()%>">
							</div>
							<div class="from-group">
								<label for="exampleInputPassword1" class="form-label">Price</label>
								<input type="number" class="form-control"
									id="exampleInputPassword1" name="price"
									value="<%=b.getPrice()%>">
							</div>
							<div class="from-group">
								<label for="inputstate" class="form-label">Book Status</label> <select
									id="inputstate" class="form-control" name="status">
									<%
									if ("Active".equals(b.getStatus()))
									{%>
									<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
									<%}else{%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%}
									%>
									
									
								</select>
							</div>
							<button type="submit" class="btn btn-primary mt-1">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>