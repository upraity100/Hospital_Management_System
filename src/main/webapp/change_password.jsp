<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password Page</title>
<style type="text/css">
.paint-card{
	box-shadow:0 0 10px 0 rgba(0,0,0,0.3);
}
</style>
<%@ include file="../Includes/allcss.jsp" %>
</head>
<body>

<c:if test="${empty userObj}">
	<c:redirect url="user_login.jsp"></c:redirect>
</c:if>

	<%@ include file="Includes/navbar.jsp" %>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
						
						<c:if test="${not empty sucMsg }">
							 <p class=" fs-4 text-center text-success fs-8">${sucMsg}</p>
					 		<c:remove var="sucMsg" scope="session"/>
					 	</c:if>
					 
					 	<c:if test="${not empty errMsg }">
					 		<p class=" fs-4 text-center text-danger fs-8">${errMsg}</p>
					 		<c:remove var="errMsg" scope="session"/>
					 	</c:if> 
						
						<div class="card-body">
							<form action="Change_Password" method="post">
								<div class="mb-3">
									<label>Enter New Password</label>
									<input type="text" name="newPassword" class="form-control" required>
								</div>
								
								<div class="mb-3">
									<label>Enter Old Password</label>
									<input type="text" name="oldPassword" class="form-control" required>
								</div>
								<input type="hidden" name="uid" value="${userObj.id }">
								<button type="submit" class="btn bg-success text-white col-md-12">Change Password</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

</body>
</html>