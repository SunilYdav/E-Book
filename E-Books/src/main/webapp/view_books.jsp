<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View books</title>
<%@include file="component/allcss.jsp"%>

</head>
<body style="background-color: #F0F1F2;">
	<%@include file="component/navbar.jsp"%>
	<%
	int bid=Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao=new BookDAOImpl(DBConnect.getconn());
	BookDtls b=dao.getBookById(bid);
	%>
	<div class="container p-3">
		<div class="row ">
			<div class="col-md-6 p-5 text-center border bg-white">
				<img alt="" src="book/<%=b.getPhotoName() %>" style="height: 150px; width: 100px"><br>
				<h4 class="mt-3">Book Name:<span class="text-success"> <%=b.getBookName() %></span></h4>
				<h4>Author Name: <span class="text-success"><%=b.getAuthor() %></span></h4>
				<h4>Categories: <span class="text-success"><%=b.getBookCategory() %></span></h4>

			</div>
			<div class="col-md-6 text-center border p-5 bg-white">
				<h2><%=b.getBookName() %></h2>
				<%
				if(b.getBookCategory().equals("Old"))
				{
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary"><i class="fa-solid fa-envelope"></i> Email:<%=b.getEmail() %></h5>
				<%} %>
				
				<div class="row mt-2">
					<div class="col-md-4 text-danger p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger p-2">
						<i class="fas fa-arrow-rotate-left fa-2x"></i>
						<p>Return & Exchange</p>
					</div>
					<div class="col-md-4 text-danger p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Delivery</p>
					</div>
				</div>
				<%
				if(b.getBookCategory().equals("Old")){
				%>
				<div class="text-center p-3">
				<a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-shopping"></i>Continue Shopping</a>
				<a href="" class="btn btn-danger">200 <i class="fa-solid fa-indian-rupee-sign"></i></a>
				</div>
				<%}else
					{%>
					<div class="text-center p-3">
				<a href="" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
				<a href="" class="btn btn-danger">200 <i class="fa-solid fa-indian-rupee-sign"></i></a>
				</div>
					<%} %>
				
			</div>
			
		</div>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>