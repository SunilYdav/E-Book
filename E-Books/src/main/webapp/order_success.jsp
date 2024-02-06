<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Success page</title>
<%@include file="component/allcss.jsp"%>


</head>
<body style="background-color: #F0F1F2;">
<%@include file="component/navbar.jsp"%>
<div class="container text-center mt-3">
<i class="fa-solid fa-circle-check fa-5x text-success"></i>
<h1>Thank You</h1>
<h2>Your Order Successfully</h2>
<h5>with in 7 days your order will be delivered in your address</h5>\
<a href="index.jsp"  class="btn btn-primary mt-3">Home</a>
<a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
</div>
<%@include file="component/footer.jsp"%>
</body>
</html>