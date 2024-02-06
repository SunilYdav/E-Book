<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Books</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.card-hower:hover {
	background-color: #fcf7f7
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%User u=(User)session.getAttribute("userobj");%>
	<div class="container-fluid">
		<div class="row p-3">
		
					<%
					String ch=request.getParameter("ch");
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getconn());
			List<BookDtls> list2 = dao2.getByBooksSearch(ch);
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card card-hower  mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="height: 150px; width: 100px;" class="img-thumbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row ">
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-3"><%=b.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}
						
					else{ %>
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
						
						
						<%} %> <a href="view_books.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn-sm ml-2"> View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-2"> <%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					<% }%>
					</div>
				</div>
			</div>
			<%
			}
			%>
			</div>
		</div>

</body>
<%@include file="component/footer.jsp"%>
</html>