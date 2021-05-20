<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.samaspace.model.Menu" %>
    <%@ page import="com.samaspace.model.PlatsModel" %>
    <%@ page import="com.samaspace.dao.PlatsDAO_impl"%>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Page plats</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous" />
<link href="../style.css" rel="stylesheet" type="text/css" />
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
</head>
<body>
<%
PlatsDAO_impl pdao=new PlatsDAO_impl();
Menu.liste_plat=pdao.allDishes();
%>
	<div class="row mx-2 my-2">
		<div class="col-md-8 my-5 py-5">
			<div class="row my-3">
			<div class="container">
				<div class="row row-cols-2 row-cols-lg-4 g-2 g-lg-3">
				<%for(PlatsModel p:Menu.liste_plat){ %>
				    <div class="col">
				      	<div class="animate__animated animate__bounceInLeft h-100">
							<div class="mycard myshadow card-bg-gold h-100 mx-2 my-4 p-1">
							  <img class="img-fluid p-1" style="border-radius: 20px" width="225px" height="225" src="../images/<%=p.getImgPlat() %>" alt="pic"/>
							  <h5 class="text-center text-dark fontCentury py-1"><%=p.getNomPlat() %></h5>
							  <h6 class="text-center text-dark fontCentury">Prix: <%=p.getPrixPlat() %> DH</h6>
							  <div class="d-grid gap-1">
							 <a class="btn btn-danger"
							  href='${pageContext.request.contextPath}/AjouterPlatPanier?id=<%=p.getIdPlat()%>&nom=<%=p.getNomPlat()%>&prix=<%=p.getPrixPlat()%>&img=<%=p.getImgPlat()%>'>Ajouter</a>
							  </div>
							</div>
						</div>
				    </div>
				    <%} %>
				</div>
			</div>
			</div>
			</div>
		<div class="col-md-4">
			<div class="d-grid gap-2 mx-auto">
				<a class="btn btn-light btn-default" href="index.jsp">Retour</a>
				<a href="${pageContext.request.contextPath}/admin-page.jsp" class="btn btn-light btn-default">Admin</a>
				<div class="row">
					<div class="col-md-12">
 						<jsp:include page="panier-page.jsp"/> 
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>