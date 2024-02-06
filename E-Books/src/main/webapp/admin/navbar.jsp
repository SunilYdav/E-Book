<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<div class="container-fluid" style="height: 10px; background-color: #303f9f;"></div>

<div class="container-fluid p-2 bg-light">
    <div class="row">
        <div class="col-md-3 m-1">
            <h3 class="text-success">
                <i class="fas fa-book"></i> E-Books 
            </h3>
        </div>
          <div class="col-md-3 ml-auto">
          <c:if test="${not empty userobj}">
           <a class="btn btn-success text-white" >
                <i class="fas fa-user" ></i> ${ userobj.name}</a>
                  <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary text-white">
                <i class="fas fa-sign-in-alt"></i> Logout
            </a>
          </c:if>
           <c:if test="${empty userobj}">
           <a href="login.jsp" class="btn btn-success" >
                <i class="fas fa-sign-in-alt" ></i> Login 
            </a>
            <a href="../registration.jsp" class="btn btn-primary">
                <i class="fas fa-user-plus"></i> Register
            </a>
          </c:if>
           
        </div>
    </div>
  
</div>
<!-- Logout modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="text-center">
        <h4>Do you want Logout</h4>
         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
        </div>
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0"> 
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.jsp"><i class="fa-solid fa-house"></i> Home</a></li>
			</ul>
		</div>
	</div>
</nav>