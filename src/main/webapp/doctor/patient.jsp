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
<title>Patient Page</title>
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
	<div class="container p-3">
		<div class="row">
		
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Patient Details</p>
						<c:if test="${not empty sucMsg }">
							 <p class=" fs-4 text-center text-success fs-8">${sucMsg}</p>
					 		<c:remove var="sucMsg" scope="session"/>
					 	</c:if>
					 
					 	<c:if test="${not empty errMsg }">
					 		<p class=" fs-4 text-center text-danger fs-8">${errMsg}</p>
					 		<c:remove var="errMsg" scope="session"/>
					 	</c:if>
					 	
					 	<table class="table">
					 		<thead>
					 			<tr>
					 				<th scope="col">Full Name</th>
					 				<th scope="col">Gender</th>
					 				<th scope="col">Age</th>
					 				<th scope="col">Appointment Date</th>
					 				<th scope="col">Email</th>
					 				<th scope="col">Mob No</th>
					 				<th scope="col">Diseases</th>
					 				<th scope="col">Status</th>
					 				<th scope="col">Action</th>
					 			</tr>
					 		</thead>
					 		<tbody>
					 		<%
					 		Doctor d = (Doctor)session.getAttribute("docObj");
					 		AppointmentDao dao = new AppointmentDao(DBConnection.getConnection());
					 		List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
							
							for(Appointment ap:list)
							{%>
								<tr>
					 				<th><%=ap.getFullName() %></th>
					 				<td><%=ap.getGender() %></td>
					 				<td><%=ap.getAge() %></td>
					 				<td><%=ap.getAppointDate() %></td>
					 				<td><%=ap.getEmail() %></td>
					 				<td><%=ap.getPhNo() %></td>
					 				<td><%=ap.getDiseases() %></td>
					 				<td><%=ap.getStatus() %></td>
					 				<td>
					 				
					 				<%
					 				if(" Pending ".equals(ap.getStatus()))
					 				{%>
					 					
					 					<a href="comment.jsp?id=<%=ap.getId()%>" class="btn btn-success btn-sm"><i class="fa-regular fa-comment"></i> Comment</a>
					 				<%}
					 				else
					 				{%>
					 					<a href="#" class="btn btn-success btn-sm disabled"><i class="fa-solid fa-comment-slash"></i> Commented</a>
					 				<%}
					 				
					 				%>
					
					 				</td>
					 			</tr>
							<%
							}	
					 		%>
					 
					 		</tbody>
					 	</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>