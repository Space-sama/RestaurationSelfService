<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation</title>
<link  href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<style type="text/css">

	#con{
	margin: 0 auto;
	width: 700px;
	display: flex;
	justify-content: space-between;
	
	}
	
	#btn-dishe {
		width: 150px;
		
	}
	
	#btn-dishe1{
		width: 150px;
		
	}
	
	
	
	
	
</style>
</head>
<body>

<br /><br /><br />
<div class="container" id="con">
<div class="card">
				
 <div class="card-header">
 		<div class="alert alert-success alert-dismissible">
                <i class="icon fas fa-check"></i> L'ajout de ce dessert a été ajouté avec succès !
                </div>
                
                
                <a  class="btn bg-gradient-primary btn-xs" id="btn-dishe" href="Searchd.php?key="">Vers tout les desserts</a>
                <a  class="btn bg-gradient-secondary btn-xs" id="btn-dishe" href="PageAdministration.jsp">Vers la page d'accueil</a>
               
                
                
 </div>
 <div class="card-body">

 <div class="form-group">
 <label class="control-label" style="color: blue;">ID :</label>
 <label class="control-label"><c:out value="${DessertFROMCD.idDess}"></c:out> </label>
</div>

<div class="form-group">
 <label class="control-label" style="color: blue;">Nom : &nbsp;&nbsp;&nbsp;</label>
<label class="control-label"><c:out value="${DessertFROMCD.nomDess}"></c:out> </label>
 </div>
 
 <%-- <div class="form-group">
 <label class="control-label" style="color: blue;">Description : </label>
 <label class="control-label"><c:out value="${DessertFROMCD.description}"></c:out> </label>
 </div> --%>

 <div class="form-group">
 <label class="control-label" style="color: blue;">Prix :&nbsp;&nbsp;&nbsp;</label>
 <label class="control-label"><c:out value="${DessertFROMCD.prixDess} DHS"></c:out> </label>
 </div>
 
 <div class="form-group">
 <label class="control-label" style="color: blue;">Date :&nbsp;&nbsp;&nbsp;</label>
 <label class="control-label"><c:out value="Le ${DessertFROMCD.datePub}"></c:out> </label>
 </div>
 

 </div>
</div>
</body>
</html>