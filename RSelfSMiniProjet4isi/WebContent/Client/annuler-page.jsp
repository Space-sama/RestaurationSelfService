<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmer?</title>
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
			<div class="animate__animated animate__bounceInUp">
			<div class="card border-primary mb-3 w-50 mx-auto my-auto">
			  <div class="card-header">Message</div>
			  <div class="card-body text-danger">
			    <h4 class="card-title"> Voulez-vous annuler le paiement?</h4>
			    
				<div class="mt-2 pt-2 border-top">
			      <a class="btn btn-success btn-md" href="paiement-page.jsp" >Non</a>
			      <a class="btn btn-secondary btn-md" href="${pageContext.request.contextPath}/EffacerPanier">Oui</a>
			    </div>
			  </div>
			</div>
			</div>
		
		</div>
	</div>
	
</body>
</html>