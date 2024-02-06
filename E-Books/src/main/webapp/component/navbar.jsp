<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid" style="height: 10px; background-color: #303f9f;"></div>

<div class="container-fluid p-2 bg-light">
    <div class="row">
        <div class="col-md-3">
            <h3 class="text-success">
                <i class="fas fa-book"></i> E-Books 
            </h3>
        </div>
        <div class="col-md-6 text-center">
            <form class="d-flex" action="search.jsp" method="post">
                <input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search" name="ch">
                <button class="btn btn-primary" type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>
        </div>
        
        <c:if test="${not empty userobj }">
        
        <div class="col-md-3 text-end">
            <a href="login.jsp" class="btn btn-success" style="margin-right: 10px;">
                <i class="fas fa-user-plus" ></i> ${userobj.name}
            </a>
            <a href="logout" class="btn btn-primary">
                <i class="fas fa-sign-in-alt"></i> Logout
            </a>
            <a href="checkout.jsp" class="p-2"><i class="fa-solid fa-cart-plus fa-2x"></i></a>
        </div>
        
        </c:if>
        <c:if test="${empty userobj }">
        <div class="col-md-3 text-end">
            <a href="login.jsp" class="btn btn-success" style="margin-right: 10px;">
                <i class="fas fa-sign-in-alt" ></i> Login 
            </a>
            <a href="registration.jsp" class="btn btn-primary">
                <i class="fas fa-user-plus"></i> Register
            </a>
        </div>
        </c:if>
        
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0"> 
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i class="fa-solid fa-house"></i> Home</a></li>
				<li class="nav-item"><a class="nav-link active" href="all_recent_book.jsp"><i
						class="fa-solid fa-book"></i> Recent Book</a></li>
				<li class="nav-item"><a class="nav-link active" href="all_old_book.jsp"><i
						class="fa-solid fa-book"></i> Old Book</a></li>
				<li class="nav-item"><a class="nav-link active" href="all_new_book.jsp"><i
						class="fa-solid fa-book"></i> New Book</a></li>
			</ul>
			<form class="d-flex ml-auto">
				<a href="setting.jsp" class="btn btn-light" type="submit"
					style="margin-right: 10px;">
					<i class="fa-solid fa-gear"></i> Setting
				</a>
				<a href="contact.jsp" class="btn btn-light" type="submit">
					<i class="fa-solid fa-address-book"></i> Contact us
				</a>
			</form>
		</div>
	</div>
</nav>