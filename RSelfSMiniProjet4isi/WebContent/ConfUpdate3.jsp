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
<link rel="stylesheet" href="dist/css/restau.css" >
</head>
<body>

<br /><br /><br />
<div class="container" id="con">
<div class="card">
				
 <div class="card-header">
 		<div class="alert alert-success alert-dismissible">
                <i class="icon fas fa-check"></i> La modification de ce dessert a été bien faite !
                </div>
                
                
                <a  class="btn bg-gradient-primary btn-xs" id="btn-dishe" href="Searchd.php?key="">Vers tout les desserts</a>
                <a  class="btn bg-gradient-secondary btn-xs" id="btn-dishe" href="PageAdministration.jsp">Vers la page d'accueil</a>
               
                
                
 </div>
 <div class="card-body">

 <div class="form-group">
 <label class="control-label" style="color: blue;">ID :</label>
 <input type="text" name="id" class="form-control" value="${confDM.idDess}" disabled="disabled"/>
</div>

<div class="form-group">
 <label class="control-label" style="color: blue;">Nom : </label><br />
 <label class="control-label"><c:out value="${confDM.nomDess}"></c:out> </label>
 </div>
 
 <%-- <div class="form-group">
 <label class="control-label" style="color: blue;">Description : </label>
 <label class="control-label"><c:out value="${confDM.description}"></c:out></label>
 </div> --%>

 <div class="form-group">
 <label class="control-label" style="color: blue;">Prix : </label><br />
 <label class="control-label"><c:out value="${confDM.prixDess} DHS "></c:out> </label>
 </div>
 
 
 </div>

 </div>
</div>
</body>
</html>