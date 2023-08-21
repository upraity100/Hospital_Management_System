<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<style type="text/css">
.paint-card{
	box-shadow:0 0 10px 0 rgba(0,0,0,0.3);
}
</style>

<%@ include file="Includes/allcss.jsp" %>
</head>
<body>

<%@ include file="Includes/navbar.jsp" %>

<div class="container p-5">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card paint-card">
				<div class="card-body">
					 <p class="fs-4 text-center ">User Register</p>
					 
					 <c:if test="${not empty sucMsg }">
					 <p class="text-center text-success fs-3">${sucMsg}</p>
					 <c:remove var="sucMsg" scope="session"/>
					 </c:if>
					 
					 <c:if test="${not empty errMsg }">
					 <p class="text-center text-danger fs-3">${errMsg}</p>
					 <c:remove var="errMsg" scope="session"/>
					 </c:if>
					
					<form action="user_register" method="post">
					<div class="mb-3">
							<label class="form-label">Full Name</label>
							<input name="fullname" type="text" class="form-control" required>
						</div>
					
						<div class="mb-3">
							<label class="form-label">Email Address</label>
							<input name="email" type="email" class="form-control" required>
						</div>
						
						<div class="mb-3">
							<label class="form-label">Password</label>
							<input name="password" type="password" class="form-control" required>
						</div>
						
						<button type="submit" class="btn bg-success text-white col-md-12">Register</button>
					</form>
					
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>