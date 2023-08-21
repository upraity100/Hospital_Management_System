<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="com.dao.*" %>
<%@ page import="com.conn.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile Page</title>
<style type="text/css">
.paint-card
{
	box-shadow:0 0 8px 0 rgba(0,0,0,0.3);
}
</style>
<%@ include file="../Includes/allcss.jsp" %>
</head>
<body>

	<c:if test="${empty docObj}">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	
	<%@ include file="navbar.jsp" %>
	
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4">
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
							<form action="../doctor_password_change" method="post">
								<div class="mb-3">
									<label>Enter New Password</label>
									<input type="text" name="newPassword" class="form-control" required>
								</div>
								
								<div class="mb-3">
									<label>Enter Old Password</label>
									<input type="text" name="oldPassword" class="form-control" required>
								</div>
								<input type="hidden" name="uid" value="${docObj.id }">
								<button type="submit" class="btn bg-warning text-white col-md-12">Change Password</button>
							</form>
						</div>
					</div>
				</div>
				
				<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
				<p class="text-center fs-3">Edit Profile</p>
				<div class="card-body">
					<form action="../edit_doctor_profile" method="post">
					<div class="mb-2">
						<label class="form-label">Full Name</label>
						<input type="text" required name="fullName" class="form-control" value="${docObj.fullName}">
					</div>
					
					<div class="mb-2">
						<label class="form-label">DOB</label>
						<input type="date" required name="dob" class="form-control" value="${docObj.dob}">
					</div>
					
					<div class="mb-2">
						<label class="form-label">Qualification</label>
						<input type="text" required name="qualification" class="form-control" value="${docObj.qualification}">
					</div>
					
					<div class="mb-2">
						<label class="form-label">Specialist</label>
						<select name="specialist" required class="form-control" >
						<option>${docObj.specialist}</option>
							<%
								SpecalistDao dao = new SpecalistDao(DBConnection.getConnection());
								List<Specalist> list = dao.getAllSpecalist();
								for(Specalist s:list)
								{%>
									<option><%=s.getSpecalistName() %></option>
								<%
								}
							%>
						</select>
					</div>
					
					<div class="mb-2">
						<label class="form-label">Email</label>
						<input type="text" readonly required name="email" class="form-control" value="${docObj.email}">
					</div>
					
					<div class="mb-2">
						<label class="form-label">Mob No</label>
						<input type="text" required name="mobno" class="form-control" value="${docObj.mobno}">
					</div>
					
					<div class="text-center">
					<input type="hidden" name="uid" value="${docObj.id}">
						<button type="submit" class="btn btn-warning text-white col-md-12">Update</button>
					</div>
				</form>
				</div>
				</div>
				</div>
				
			</div>
		</div>

</body>
</html>