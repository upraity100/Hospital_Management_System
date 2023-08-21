<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.conn.*" %>
    <%@ page import="com.dao.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.model.Appointment" %>
    <%@ page import="com.model.*" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View_Appointment page</title>
<style type="text/css">
.paint-card
{
	box-shadow:0 0 8px 0 rgba(0,0,0,0.3);
}
.backImg
{
	background: linear-gradient(rgba(0,0,0,.4),rgba(0,0,0,.4)),url("img/bg1.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<%@ include file="../Includes/allcss.jsp" %>
</head>
<body>

<c:if test="${empty userObj}">
	<c:redirect url="user_login.jsp"></c:redirect>
</c:if>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ include file="Includes/navbar.jsp" %>
	
	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
							<%
							User user = (User)session.getAttribute("userObj");
							
							DoctorDao dao2 = new DoctorDao(DBConnection.getConnection());
						
							AppointmentDao dao = new AppointmentDao(DBConnection.getConnection());
							List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
							for(Appointment ap:list)
							{
								 Doctor d = dao2.getDoctorById(ap.getDoctorId());
							%>
								
								<tr>
									<th><%=ap.getFullName() %></th>
									<td><%=ap.getGender() %></td>
									<td><%=ap.getAge() %></td>
									<td><%=ap.getAppointDate() %></td>
									<td><%=ap.getDiseases() %></td>
									<td><%=d.getFullName() %></td>
									<td>
										<%
											if("Pending".equals(ap.getStatus()))
											{%>
												<a href="#" class="btn btn-success btn-sm">Pending</a>
											<%}
											else
											{%>
												<%=ap.getStatus() %>
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
			<div class="col-md-3 p-3">
				<img alt="" src="img/doct4.jpg" height="400px">
			</div>
		</div>
	</div>

</body>
</html>