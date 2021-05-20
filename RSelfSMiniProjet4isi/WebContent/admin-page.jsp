<%@page import="com.samaspace.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin authentification</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" type="text/css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous" />
<link href="style.css" rel="stylesheet" type="text/css" />



</head>
<body>
	<div class="row mx-auto">
		<div class="col-md-12">
			<h1 class="text-center fontCentury">Page Admin</h1>
	
	
	<%-- <% int nm = Integer.parseInt(request.getAttribute("CloseAdmin").toString()); %> 
	<% if(nm == 1){ %>
		
		<h1>Votre compte a été désactivé veuillez contactez le SUPER ADMIN !</h1>
	<% }%> --%>
	
	
	
	
		</div>
	</div>
  <div class="row mx-3 border-r m-2">
                        <div class="col-md-8">
                        	<img class="img-fluid" src="./images/hamburger-cover-admin.jpg" />
                        </div>
                        
                        <div class="col-md-4 bg-maroon"> 
                            <div class="pb-5 mb-5"></div>
                                <h3 class="text-center text-shadow">Authentification</h3>
                            <div class="row mt-3 pt-3">
                         
                               
                          <form  action="Auth" method="post" autocomplete=off">
                                    
	                            <div class="form-group my-3">
	                                <input type="text" class="form-control border border-warning" name="email" placeholder="Votre email" required="required"/>
	                                
	                            </div>
	                            
	                            <div class="form-group my-3">
	                                <input type="password" class="form-control border border-warning" name="pwd" placeholder="Votre mot de passe" required="required"/>
	                            </div>
	
	                            <div class="form-group d-grid">
	                               <input class="btn btn-warning btn-block" type="submit" value="Se connecter"/>
	                            </div>
                                    
                           </form>
                               
                                 
                            </div> 
                        
                        </div>
                      
                    </div>
     <div class="row mx-3 border-r m-2">
     	<div class="col-md-12 g-2 d-grid">
     		<a href="${pageContext.request.contextPath}/Client/index.jsp" class="btn btn-warning border border-dark">Client</a>
     	</div>
     </div>
</body>

<
</html>