<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.conn.DBConnection" %>
	<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@ include file="Includes/allcss.jsp" %>

<style type="text/css">
.paint-card{
	box-shadow:0 0 10px 0 rgba(0,0,0,0.3);
}
</style>
</head>
<body>
	<%@ include file="Includes/navbar.jsp"%>

	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		
		<div class="carousel-inner">
			<div class="carousel-item active">
			<img src="img/bg4.jpg" class="d-block w-100" alt="..." height="600px">
			</div>
			<div class="carousel-item">
			<img src="img/bg1.jpg" class="d-block w-100" alt="..." height="600px">
			</div>
			<div class="carousel-item">
			<img src="img/bg2.jpg" class="d-block w-100" alt="..." height="600px">
			</div>
		</div>
		
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> 
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	<br><br><br>
	<hr>
	
	<div class="container p-3">
		<p class="text-center fs-2">Key Features of our Hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Our and hospital and our Team very safe you all 100% belive me</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Our and hospital very clean environment you all 100% belive me</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p>
								<p>Our and hospital and our Team very safe you all 100%  friendly Doctors</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Our and hospital and our Team very safe and Medical Research</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<img class="d-block w-100" alt="..." src="img/doct4.jpg">
			</div>
			
		</div>
	</div>
	
<hr>
<div class="container p-2">
	<p class="text-center fs-2">Our Team</p>
	<div class="row">
		<div class="col-md-3">
			<div class="card paint-card">
				<div class="card-body text-center">
					<img class="d-block w-100" src="img/doct1.jpg" alt="">
					<p class="fw-blod fs-5">Radha Kumari</p>
					<p class="fs-7">(CEO & Chairman)</p>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="card paint-card">
				<div class="card-body text-center">
					<img class="d-block w-100" src="img/doct5.jpg" alt="">
					<p class="fw-blod fs-5">Dr Gaurav Upraity</p>
					<p class="fs-7">(Chief Doctor)</p>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="card paint-card">
				<div class="card-body text-center">
					<img class="d-block w-100" src="img/doct3.jpg" alt="">
					<p class="fw-blod fs-5">Dr Rahit soni</p>
					<p class="fs-7">(Chief Doctor)</p>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="card paint-card">
				<div class="card-body text-center">
					<img class="d-block w-100" src="img/doct2.jpg" alt="">
					<p class="fw-blod fs-5">Samuani Simi</p>
					<p class="fs-7">(Chief Doctor)</p>
				</div>
			</div>
		</div>
	</div>
</div>
<br><br>

<%@ include file="Includes/footer.jsp"%>

</body>
</html>