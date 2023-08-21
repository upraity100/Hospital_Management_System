<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Doctor Page</title>
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
			
			<div class="col-md-4 offset-md-4">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Edit Doctor</p>
				<c:if test="${not empty sucMsg }">
					 <p class="text-center text-success fs-8">${sucMsg}</p>
					 <c:remove var="sucMsg" scope="session"/>
				</c:if>
					 
				<c:if test="${not empty errMsg }">
					 <p class="text-center text-danger fs-8">${errMsg}</p>
					 <c:remove var="errMsg" scope="session"/>
				</c:if>
				<%
					String sid = request.getParameter("id");
					int id = Integer.parseInt(sid);
					DoctorDao dao = new DoctorDao(DBConnection.getConnection());
					Doctor d = dao.getDoctorById(id);
				%>
				<form action="../update_doctor" method="post">
					<div class="mb-3">
						<label class="form-label">Full Name</label>
						<input type="text" required name="fullName" class="form-control" value="<%=d.getFullName() %>">
					</div>
					
					<div class="mb-3">
						<label class="form-label">DOB</label>
						<input type="date" required name="dob" class="form-control" value="<%=d.getDob() %>">
					</div>
					
					<div class="mb-3">
						<label class="form-label">Qualification</label>
						<input type="text" required name="qualification" class="form-control" value="<%=d.getQualification() %>">
					</div>
					
					<div class="mb-3">
						<label class="form-label">Specialist</label>
						<select name="specialist" required class="form-control">
						<option><%=d.getSpecialist() %></option>
							<%
								SpecalistDao dao1 = new SpecalistDao(DBConnection.getConnection());
								List<Specalist> list = dao1.getAllSpecalist();
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
						<input type="text" required name="email" class="form-control" value="<%=d.getEmail() %>">
					</div>
					
					<div class="mb-3">
						<label class="form-label">Mob No</label>
						<input type="text" required name="mobno" class="form-control" value="<%=d.getMobno() %>">
					</div>
					
					<div class="mb-3">
						<label class="form-label">Password</label>
						<input type="password" required name="passsword" class="form-control" value="<%=d.getPassword() %>">
					</div>
					
					<div class="text-center">
						<input type="hidden" name="id" value="<%=d.getId() %>">
						<button type="submit" class="btn btn-primary col-md-12">Updated</button>
					</div>
				</form>
			</div>
		</div>
	</div>
			
			
		</div>
	</div>

</body>
</html>