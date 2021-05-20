<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Acceuil</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous" />
<link href="../style.css" rel="stylesheet" type="text/css" />
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
</head>
<body>

	<div class="row mx-2 my-2">
		<div class="col-md-8 my-5 py-5">
			<div class="row my-5">
				<div class="col-md-4">
				<div class="animate__animated animate__bounceInLeft c-animate-boisson h-100">
					<div class="mycard myshadow mx-2 my-2 h-100">
						  <img class="img-fluid p-1" src="../images/drinks.svg" alt="pic"/>
						  <a href="boisson-page.jsp"><h3 class="text-center text-dark fontCentury py-1">Boisson</h3></a>
					</div>
					</div>
				</div>
				<div class="col-md-4">
				<div class="animate__animated animate__bounceInDown c-animate-plat h-100">	
					<div class="mycard myshadow mx-2 my-2 py-3 h-100">
						  <img class="img-fluid p-1 mb-4 mt-3 " src="../images/plat.svg" alt="pic"/>
						  <a href="plat-page.jsp"><h3 class="text-center text-dark fontCentury mt-4">Plat</h3></a>
					</div>
					</div>	
				</div>
				<div class="col-md-4">
					<div class="animate__animated animate__bounceInRight c-animate-dessert h-100">
					<div class="mycard myshadow mx-2 my-2 h-100">
						  <img class="img-fluid p-1 mb-2" src="../images/dessert.svg" alt="pic"/>
							<a href="dessert-page.jsp"><h3 class="text-center text-dark fontCentury py-1">Dessert</h3></a>
					</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-4 d-grid">
		<a href="${pageContext.request.contextPath}/admin-page.jsp" class="btn btn-light btn-default">Admin</a>
			<div class="row">
				<div class="col-md-12">
						<jsp:include page="panier-page.jsp"/>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="./js/myanimate.js"></script>
</body>
</html>