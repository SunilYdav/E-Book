<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="allcss.jsp"%>
<title>Admin orders</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h1 class="text-center">Hello Admin</h1>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<table class="table table-striped">
		<thead class="bg-dark text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
			<%BookOrderImpl dao = new BookOrderImpl(DBConnect.getconn());
				List<Book_Order> blist = dao.getAllBook();
				for (Book_Order b : blist) {
				%>
			<tr>
				<th><%=b.getOrderId()%></th>
				<td><%=b.getName()%></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFulladd()%></td>
				<td><%=b.getPhno()%></td>
				<td><%=b.getBookname()%></td>
				
				
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPayment()%></td>
			</tr>
			<%
				}
				%>
		</tbody>
	</table>
	<div style="margin-top: 290px">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>