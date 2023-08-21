<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <%@ page import="com.conn.*" %>
     <%@ page import="com.dao.*" %>
      <%@ page import="java.util.*" %>
       <%@ page import="com.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment Page</title>
<style type="text/css">
.paint-card
{
	box-shadow:0 0 8px 0 rgba(0,0,0,0.3);
}
.backImg
{
	background: linear-gradient(rgba(0,0,0,.4),rgba(0,0,0,.4)),url("img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<%@ include file="../Includes/allcss.jsp" %>
</head>
<body>
	<%@ include file="Includes/navbar.jsp" %>
	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="" src="img/doct4.jpg" height="500px">
			</div>
			
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						
						<c:if test="${not empty sucMsg }">
							 <p class=" fs-4 text-center text-success fs-8">${sucMsg}</p>
					 		<c:remove var="sucMsg" scope="session"/>
					 	</c:if>
					 
					 	<c:if test="${not empty errMsg }">
					 		<p class=" fs-4 text-center text-danger fs-8">${errMsg}</p>
					 		<c:remove var="errMsg" scope="session"/>
					 	</c:if>
					 	
					 	<form action="appointment" method="post" class="row g-3">
					 	
					 		<input type="hidden" name="userId" value="${userObj.id }">
					 		
					 		<div class="col-md-6">
					 			<label for="inputEmail4" class="form-label">Full Name</label>
					 			<input required type="text" class="form-control" name="fullname">
					 		</div>
					 		
					 		<div class="col-md-6">
					 			<label>Gender</label>
					 			<select class="form-control" name="gender" required>
					 				<option value="male">Male</option>
					 				<option value="female">Female</option>
					 			</select>
					 		</div>
					 		
					 		<div class="col-md-6">
					 			<label for="inputEmail4" class="form-label">Age</label>
					 			<input required type="number" class="form-control" name="age">
					 		</div>
					 		
					 		<div class="col-md-6">
					 			<label for="inputEmail4" class="form-label">Appointment Date</label>
					 			<input type="date" class="form-control" required name="appointDate">
					 		</div>
					 		
					 		<div class="col-md-6">
					 			<label for="inputEmail4" class="form-label">Email</label>
					 			<input required type="email" class="form-control" name="email">
					 		</div>
					 		
					 		<div class="col-md-6">
					 			<label for="inputEmail4" class="form-label">Phone No.</label>
					 			<input required type="number" class="form-control" name="phno" maxlength="10">
					 		</div>
					 		
					 		<div class="col-md-6">
					 			<label for="inputEmail4" class="form-label">Diseases</label>
					 			<input required type="text" class="form-control" name="diseases">
					 		</div>
					 		
					 		<div class="col-md-6">
					 			<label for="inputPassword4" class="form-label">Doctor</label>
					 			<select required class="form-control" name="doctorId">
					 				<option value="">--select--</option>
					 				<%
					 				DoctorDao d = new DoctorDao(DBConnection.getConnection());
					 				List<Doctor> list = d.getAllDoctor();
					 				for(Doctor d1: list)
					 				{%>
					 					<option value="<%=d1.getId()%>"><%=d1.getFullName()%>(<%=d1.getSpecialist() %>)</option>
					 				<%}
					 				%>
					 				
					 			</select>
					 		</div>
					 		
					 		<div class="col-md-12">
					 			<label>Full Address</label>
					 			<textarea required name="address" class="form-control" rows="3" cols="">
					 			</textarea>
					 		</div>
					 		
					 		<c:if test="${empty userObj }">
					 			<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
					 		</c:if>
					 		
					 		<c:if test="${not empty userObj }">
					 			<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
					 		</c:if>
					 	</form>
					 	
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>