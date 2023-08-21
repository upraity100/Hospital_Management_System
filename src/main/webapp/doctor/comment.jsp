<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ page import="com.conn.*" %>
    <%@ page import="com.dao.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.model.Appointment" %>
    <%@ page import="com.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comment Page</title>
<style type="text/css">
.paint-card{
	box-shadow:0 0 10px 0 rgba(0,0,0,0.3);
}
</style>
<%@ include file="../Includes/allcss.jsp" %>
</head>
<body>
<c:if test="${empty docObj}">
	<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>
	<%@ include file="navbar.jsp"%>
	
	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white">
	</div>
	<div class="container p-3">
		<div class="row">
			
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Comment</p>
						
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDao dao = new AppointmentDao(DBConnection.getConnection());		
						Appointment ap = dao.getAppointmentById(id);
						%>
						
						<form action="../update_status" class="row" method="post">
							<div class="col-md-6">
								<label>Patient Name</label>
								<input type="text" readonly value="<%=ap.getFullName() %>" class="form-control">
							</div>
							
							<div class="col-md-6">
								<label>Age</label>
								<input type="text" readonly value="<%=ap.getAge() %>" class="form-control">
							</div>
							
							<div class="col-md-6">
								<label>Mob No</label>
								<input type="text" readonly value="<%=ap.getPhNo() %>" class="form-control">
							</div>
							
							<div class="col-md-6">
								<label>Diseases</label>
								<input type="text" readonly value="<%=ap.getDiseases() %>" class="form-control">
							</div>
							
							<div class="col-md-12">
								<label>Comment</label>
								<textarea rows="2" cols="3" required name="comm" class="form-control"></textarea>
							</div>
							
							<input type="hidden" name="id" value="<%=ap.getId() %>">
							<input type="hidden" name="doctorId" value="<%=ap.getDoctorId() %>">
							
							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>