<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.samaspace.model.Panier" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Page paiement</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous" />
<link href="../style.css" rel="stylesheet" type="text/css" />
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
</head>
<body>
	<div class="row my-5">
		<div class="col-md-12">
		<div class="animate__animated animate__bounceInDown">
		<h2 class="display-3 text-center m-2">Paiement</h2>
			<div class="d-grid gap-1">
			<div class="mycard mx-2 my-3 p-3 text-left">
				<h3 class="float-left mx-2 my-2 d-flex justify-content-between">Total achats: <span class="badge bg-info rounded-pill"><%=Panier.Total() %> DH</span></h3>
				<h3 class="float-left mx-2 my-2 d-flex justify-content-between">TVA: <span class="badge bg-info rounded-pill"><%=Panier.Total()/5 %> DH (20%)</span></h3>
				<h3 class="float-left mx-2 my-2 d-flex justify-content-between">Total à payer: <span class="badge bg-success rounded-pill"><%=Panier.Total()+Panier.Total()/5 %> DH</span></h3>
				
				<select class="form-select my-4 border border-danger border-r" aria-label="Mode paiement">
				  <option selected>Mode paiement</option>
				  <option value="1">Liquide</option>
				  <option value="2">Carte crédit</option>
				</select>
				<div class="d-grid gap-1">
				<a class="btn btn-success border-r my-2" href="merci-page.jsp">Payer</a>
				<a class="btn btn-danger border-r my-2" href="annuler-page.jsp">Annuler</a>
				</div>
			</div>
			</div>
		</div>
		</div>
	</div>
</body>
</html>