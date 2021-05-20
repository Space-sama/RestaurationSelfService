<%@ page import="com.samaspace.model.Panier" %>
<%@ page import="com.samaspace.model.BoissModel" %>
<%@ page import="com.samaspace.model.PlatsModel" %>
<%@ page import="com.samaspace.model.DessModel" %>
<div class="animate__animated animate__bounceInUp">
	<div class="mycard bg-light mx-2 my-4 p-3">
		<h4 class="text-center text-dark fontCentury border py-1">Panier</h4>
		<img class="img-fluid p-1 mx-5 px-2" src="../images/cart.png" alt="pic"/>
		
		
		<div class="d-grid gap-1">
			<div class="mycard mx-2 my-3 p-3 text-left">
				<ul id="list-achat" class="list-group">
				<% if(Panier.liste_boisson!=null){ %>
				  <%for(BoissModel b:Panier.liste_boisson){ %>
				  	<li class="list-group-item d-flex justify-content-between align-items-center"><%=b.getNomBoiss() %> 
				  	<span class="badge bg-primary rounded-pill"><%=b.getPrixBoiss()%> DH</span></li>
				  <%}} %>
				  <% if(Panier.liste_plat!=null){ %>
				  <%for(PlatsModel p:Panier.liste_plat){ %>
				  	<li class="list-group-item d-flex justify-content-between align-items-center"><%=p.getNomPlat() %> 
				  	<span class="badge bg-primary rounded-pill"><%=p.getPrixPlat()%> DH</span></li>
				  <%}} %>
				  <% if(Panier.liste_dessert!=null){ %>
				  <%for(DessModel d:Panier.liste_dessert){ %>
				  	<li class="list-group-item d-flex justify-content-between align-items-center"><%=d.getNomDess()%> 
				  	<span class="badge bg-primary rounded-pill"><%=d.getPrixDess()%> DH</span></li>
				  <%}} %>
				</ul>
				<h3 class="float-left mx-2 my-2 d-flex justify-content-between">Total: <span class="badge bg-danger rounded-pill"><%=Panier.Total() %> DH</span></h3>
			</div> 
		</div>
		<div class="d-grid gap-2">
		<a class="btn btn-success border-r" href="paiement-page.jsp">Valider</a>
		<a class="btn btn-danger border-r" href="${pageContext.request.contextPath}/EffacerPanier">Effacer tout</a>
		</div>
</div>
</div>