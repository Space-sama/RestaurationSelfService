<%@page import="com.samaspace.model.PlatsModel"%>
<%@page import="com.samaspace.dao.PlatsDAO_impl"%>
<%@page import="java.util.*"%>
<%@page import="com.samaspace.model.Admin"%>
<%@page import="com.samaspace.dao.AdminDAO_Impl"%>
<%@page import="com.samaspace.dao.IAdmin"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

		<%
			AdminDAO_Impl Admin_DAO = new AdminDAO_Impl();
			
			Admin A = (Admin) session.getAttribute("sessAdmin");
		
		%>

<!DOCTYPE html>

<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <link rel="stylesheet" href="dist/css/restau.css" >
  <title>Administration</title>
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <link rel="stylesheet" href="dist/css/styleMiniProjet.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">

<div class="wrapper">

 <jsp:include page="navbar.jsp"></jsp:include>

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="admin.io" class="brand-link">
      <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">ADMINISTRATION</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block"><%= A.getPseudo() %></a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Gestion d'application
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
               <li class="nav-item">
                <a href="statistiques.io" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Statistiques ...</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="Search.io?key=" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Gestion des Plats</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="Searchb.net?key=" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Gestion des Boissons</p>
                </a>
              </li>
              
               <li class="nav-item">
                <a href="Searchd.php?key=" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Gestion des Desserts</p>
                </a>
              </li>
            </ul>
          </li>
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          
          
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="Searchd.php?key=">Les Desserts</a></li>
               <!-- <li class="breadcrumb-item active">Menu</li> -->
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
   </div>
    <!-- /.content-header -->
    
			
    <div class="container">
    	<div class="row">
    	<a href="pushd.php" class="btn btn-primary btn-sm" id="btn-Ajouter">Ajouter Un Dessert</a>
    	</div>
    </div>
    
    <div class="container">
    	<div class="row">
    			 <!-- SEARCH FORM -->
    <form class="form-inline ml-3" action="Searchd.php" method="get">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" value="${dk.keyDishe}" name="key" id="inputSearch"  placeholder="Chercher un dessert ..." aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-danger" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>
    	</div>
    </div><br />
    
	<c:forEach var="d" items="${dk.listeDesserts}">
	
	<section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- Default box -->
            <div class="card" id="ch">
              <div class="card-header">
                <h3 class="card-title font-weight-bold titre">${d.nomDess}</h3>
                <h3 class="card-title ml-4  font-weight-bold  prix "><span class="arrow">➛</span> &nbsp;&nbsp;&nbsp;&nbsp;${d.prixDess} dhs</h3>
                <h3 class="card-title ml-4  font-weight-bold  prix "><span class="arrow">➛</span> &nbsp;&nbsp;&nbsp;&nbsp;${d.datePub}</h3>
          
                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                  <i class="fas fa-minus" style="color: red"></i></button>
                </div>
              </div>
              
              <%-- <div class="card-body desc" style="display: block;">
                ${d.description}
              </div> --%>
               
              
    
      		<br />
              <center>
	              <div class="col-12">
	              <img class="img" width="600px" height="280px" src="images/${d.imgDess}" alt="${d.imgDess}">
	              </div>
              
              </center>
              <br />
              
              <!-- /.card-body -->
              <div class="card-footer" style="display: block;">
             	<a href="edited.php?id=${d.idDess}" class="btn btn-secondary bg-gradient-secondary btn-xs">Modifier</a>
             	
             	
                <a onclick="return confirm('Vous voulez vraiment supprimer ${d.nomDess} ?')" 
             	href="supprimerd.php?id=${d.idDess}" class="btn btn-danger bg-gradient-danger btn-xs">Supprimer</a>
              </div>
              <!-- /.card-footer-->
            </div>
            <!-- /.card -->
          </div>
        </div>
      </div>
    </section>
		
	</c:forEach>
	

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
      <h5>Title</h5>
      <p>Sidebar content</p>
    </div>
  </aside>
  <!-- /.control-sidebar -->

<jsp:include page="footer.htm"></jsp:include>
</body>
</html>
