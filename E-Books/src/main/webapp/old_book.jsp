<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.google.protobuf.Empty"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old Books</title>
<%@include file="component/allcss.jsp"%>

</head>
<body style="background-color: #F0F1F2;">
	<%@include file="component/navbar.jsp"%>
	<c:if test="${not empty succmsg}">
		<p class="text-center text-success">${succmsg }</p>
		<c:remove var="succmsg" scope="session" />
	</c:if>
	<c:if test="${not empty errormsg}">

		<p class="text-center text-danger">${errormsg }</p>
		<c:remove var="errormsg" scope="session" />
	</c:if>
	<div class="container p-5">
		<h3 class="text-center text-primary ">Your Order</h3>
		<table class="table table-striped mt-3">
			<thead class="text-white bg-primary ">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Categories</th>

					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getconn());
				List<BookDtls> list = dao.getBookByOld(email, "Old");
				for (BookDtls b : list) {
				%>
				<tr>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a
						href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>