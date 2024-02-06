<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook indexpage</title>
<style type="text/css">
.back-img {
	background-image: url("img/Book1.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.card-hower:hover {
	background-color: #fcf7f7
}

h3 {
	text-align: center;
	color: black;
}
</style>
<%@include file="component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
<%User u=(User)session.getAttribute("userobj");%>
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h1 class="text-center pt-5 text-danger">
			<i class="fa-solid fa-book-open "></i> E-Book Management System
		</h1>

	</div>
	<!-- start recent book -->
	<div class="container">
		<h3>Recent Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getconn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card card-hower">
					<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhotoName()%>"
							style="height: 200px; width: 150px;" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row ">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}

						else {
						%>
						Categories:
						<%=b.getBookCategory()%>

						<div class="row ">
						<%
						if(u==null)
						{%>
						<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
							
						<%} else{%>
						<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %> " class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
						
						
						<%} %>
							 <a
								href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ">View Details</a> <a href=""
								class="btn btn-danger btn-sm "><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp" class="btn-sm btn btn-danger">View
				All</a>
		</div>
	</div>
	<!-- end recent book -->
	<!-- start new book -->
	<div class="container">
		<h3>New Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getconn());
			List<BookDtls> list = dao.getNewBooks();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card card-hower">
					<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhotoName()%>"
							style="height: 200px; width: 150px;" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>

						<div class="row">
						<%
						if(u==null)
						{%>
						<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
							
						<%} else{%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %> " class="btn btn-danger btn-sm"><i
								class="fa-solid fa-cart-plus"></i>Add Cart</a>
						<%} %>
						
							 <a
								href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm">View Details</a> <a href=""
								class="btn btn-danger btn-sm"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn-sm btn btn-danger">View All</a>
		</div>
	</div>
	<!-- end new book -->
	<!-- start old book -->
	<div class="container">
		<h3>Old Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getconn());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card card-hower">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="height: 200px; width: 150px;" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>

						<div class="row text-start">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn-sm btn btn-danger">View All</a>
		</div>
	</div>
	<!-- end old book -->
	<%@include file="component/footer.jsp"%>
</body>
</html>