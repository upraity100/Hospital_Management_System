<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Page</title>
<%@ include file="../Includes/allcss.jsp"%>
<%@ page import="com.dao.*" %>
<%@ page import="com.conn.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.model.*" %>


<style type="text/css">
.paint-card 
	{
		box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	}
</style>
</head>


<body>
	<%@include file="navbar.jsp"%>
	
	<div class="container-fulid p-3">
		<div class="row">
			
			<div class="col-md-4">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Add Doctor</p>
				<hr>
				<c:if test="${not empty sucMsg }">
					 <p class="text-center text-success fs-8">${sucMsg}</p>
					 <c:remove var="sucMsg" scope="session"/>
				</c:if>
					 
				<c:if test="${not empty errMsg }">
					 <p class="text-center text-danger fs-8">${errMsg}</p>
					 <c:remove var="errMsg" scope="session"/>
				</c:if>
				
				<form action="../add_doctor" method="post">
					<div class="mb-3">
						<label class="form-label">Full Name</label>
						<input type="text" required name="fullName" class="form-control">
					</div>
					
					<div class="mb-3">
						<label class="form-label">DOB</label>
						<input type="date" required name="dob" class="form-control">
					</div>
					
					<div class="mb-3">
						<label class="form-label">Qualification</label>
						<input type="text" required name="qualification" class="form-control">
					</div>
					
					<div class="mb-3">
						<label class="form-label">Specialist</label>
						<select name="specialist" required class="form-control">
						<option>--select--</option>
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
					
					<div class="mb-3">
						<label class="form-label">Email</label>
						<input type="text" required name="email" class="form-control">
					</div>
					
					<div class="mb-3">
						<label class="form-label">Mob No</label>
						<input type="text" required name="mobno" class="form-control">
					</div>
					
					<div class="mb-3">
						<label class="form-label">Password</label>
						<input type="password" required name="password" class="form-control">
					</div>
					
					<div class="text-center">
						<button type="submit" class="btn btn-primary col-md-12">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="col-md-8">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Doctor Details</p>
				<hr>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">FullName</th>
							<th scope="col">DOB</th>
							<th scope="col">Qualification</th>
							<th scope="col">Specialist</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
							DoctorDao ddao = new DoctorDao(DBConnection.getConnection());
							List<Doctor> dlist = ddao.getAllDoctor();
							for(Doctor d:dlist)
							{%>
								<tr>
									<td><%=d.getFullName() %></td>
									<td><%=d.getDob() %></td>
									<td><%=d.getQualification() %></td>
									<td><%=d.getSpecialist() %></td>
									<td><%=d.getEmail() %></td>
									<td><%=d.getMobno() %></td>
									<td>
										<a href="editdoctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-primary">Edit</a>
										<a href="../delete_doctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
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