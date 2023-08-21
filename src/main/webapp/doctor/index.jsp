<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@page import="com.conn.*" %>
<%@page import="com.dao.*" %>
<%@ page import="com.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page Is here</title>
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
		<%
		Doctor d = (Doctor)session.getAttribute("docObj");
		DoctorDao dao = new DoctorDao(DBConnection.getConnection());
		%>

	<p class="text-center fs-3">Doctor Dashboard</p>
		<div class="contaoner p-5">
			<div class="row">
				<div class="col-md-4 offset-md-2">
					<div class="card paint-card">
						<div class="card-body text-center text-success">
							<i class="fas fa-user-md fa-3x"></i><br>
							<p class="fs-4 text-center">Doctor</p><%=dao.countDoctor() %>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="card paint-card">
						<div class="card-body text-center text-success">
								<i class="fas fa-calendar-check fa-3x"></i><br>
							<p class="fs-4 text-center">Total Appointment</p><%=dao.countAppointmentByDoctotId(d.getId()) %>
						</div>
					</div>
				</div>
				
			</div>
		</div>
</body>
</html>