<%@page import="com.samaspace.dao.DessertDAOImpl"%>
<%@page import="com.samaspace.dao.BoissonsDAO_Impl"%>
<%@page import="com.samaspace.dao.PlatsDAO_impl"%>
<%@page import="com.samaspace.model.Admin"%>
<%@page import="com.samaspace.dao.AdminDAO_Impl"%>
<%@page import="com.samaspace.dao.IAdmin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	AdminDAO_Impl Admin_DAO = new AdminDAO_Impl();
	Admin A = (Admin) session.getAttribute("sessAdmin");
	
	BoissonsDAO_Impl b_dao= new BoissonsDAO_Impl();
	PlatsDAO_impl pdao = new PlatsDAO_impl();
	DessertDAOImpl d_dao= new DessertDAOImpl();

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

  <title>Administartion</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <link rel="stylesheet" href="dist/css/restau.css">
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
                <a href="Searchb.net?key" class="nav-link">
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
<div class="progress">
  <div class="progress-bar progress-bar-striped progress-bar-animated bg-secondary" role="progressbar" style="width: 100%;"  aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 75%;"></div>
</div>

<div class="progress">
  <div class="progress-bar progress-bar-striped progress-bar-animated bg-secondary" role="progressbar" style="width: 100%;"  aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 75%;"></div>
</div>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6" id="bonjour">
            <h1 class="m-0 text-dark"><span class="bm">Bonjour Monsieur</span> <span class="admin_name"><%= A.getPseudo() %></span></h1>
          </div><!-- /.col -->
          
          
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <br /><br />
    <!-- /.content-header -->

    <!-- Main content -->
    
    
    <!-- /.content -->
    
        
        
        <div class="row">
          
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i style="color:blue;" class="fas fa-user-shield"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Nombre des Admins</span>
                <span class="info-box-number"><%=Admin_DAO.nbrAdmin() %></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

		<div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i style="color:brown;" class="fas fa-mug-hot"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Nombre des boissons</span>
                <span class="info-box-number">
                  <%=b_dao.nbrDrinks() %>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i style="color:gold;" class="fas fa-hamburger"></i></span>
									<%int NbrDishes = pdao.NbrOfDishes(); %>
										
											
										
									
									
              <div class="info-box-content">
                <span class="info-box-text">Nombre des plats</span>
                <% if(NbrDishes > 0){ %>
                
                <span class="info-box-number"><%= NbrDishes %></span>
                
               <% } %> 
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-warning elevation-1"><i style="color:turquoise;" class="fas fa-ice-cream"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Nombre des desserts</span>
                <span class="info-box-number"><%=d_dao.nbrDesserts() %></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
        </div>
    
    
     <center>
    		<canvas id="canvas" width="400" height="400"
				style="background-color:#fffff">
			</canvas>
    </center>
    
  </div>

  
 <div class="progress">
  <div class="progress-bar progress-bar-striped progress-bar-animated bg-secondary" role="progressbar" style="width: 100%;"  aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 75%;"></div>
</div>
<div class="progress">
  <div class="progress-bar progress-bar-striped progress-bar-animated bg-secondary" role="progressbar" style="width: 100%;"  aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 75%;"></div>
</div>
  <!-- /.content-wrapper -->

  

  <jsp:include page="footer.htm"></jsp:include>
<script src="dist/js/clock.js"></script>
</body>
</html>
