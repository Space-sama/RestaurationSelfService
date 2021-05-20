<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>êtes-vous satisfait ?</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous" />
<link href="../style.css" rel="stylesheet" type="text/css" />
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
</head>
<body>
<div class="row my-auto py-5 mx-5 px-5">
	<div class="col-md-12">
	<div class="d-grid gap-2">
	<a class="btn btn-info" href="${pageContext.request.contextPath}/EffacerPanier">Retour</a>
	</div>
	</div>
</div>
<div class="row mx-auto">
	<div class="col-md-12">
		<div class="mx-auto my-auto">
		<div class="animate__animated animate__bounceInUp">
			<div class="d-grid gap-2">
				<h2 class="display-3 text-center my-2">Bon achat!</h2>
				<img class="img-fluid w-25 mx-auto" src="../images/smiley.gif">
			</div>
		</div>
		</div>
	</div>
</div>
</body>
</html>