<%@page import="com.samaspace.model.Admin"%>
<%@page import="com.samaspace.dao.AdminDAO_Impl"%>
<%@page import="com.samaspace.dao.IAdmin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<style>
  		
  		body {
	background-color: blue;
}
  
  
  </style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Ajouter un plat</title>
  

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <link rel="stylesheet" href="dist/css/restau.css">
  
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="dist/js/validation/Parsley.js/dist/parsley.min.js"></script>
<script src="dist/js/validation/Parsley.js/dist/i18n/fr.js"></script>



</head>

<body>
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
          <!-- /.col -->
          
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="push.io">Ajouter des plats</a></li>
             <!-- <li class="breadcrumb-item active">Menu</li> --> 
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
   
		<div class="card card-primary" id="form">
              <!-- /.card-header -->
              <!-- form start -->
              <form data-parsley-validate action="insert.io" method="post" enctype="multipart/form-data" autocomplete="off">
                <div class="card-body">
                  <div class="form-group">
                    <label for="nomPlat">Nom</label>
                    <input data-parsley-length="[10, 50]" type="text" class="form-control" id="Nom" name="nomPlat" id="nomPlat" placeholder="Nom du plat ?" required="required">
                  </div>
                  <!-- <div class="form-group">
                    <label for="desc">Description</label>
                    <textarea data-parsley-length="[15, 1000]" class="form-control" id="Desc" rows="4" name="desc" placeholder="Donner une description..." style="margin-top: 0px; margin-bottom: 0px; height: 81px;" required="required"></textarea>
                  </div> -->
                  
                  <div class="form-group">
                    <label for="prixPlat">Prix en DHS</label>
                    <input type="number" class="form-control" id="prixPlat" name="prix" placeholder="Le prix ?" required="required">
                  </div>
                  
                  
                  <div class="form-group">
                    <label for="img">Choisissez une image pour le plat</label>
                    <input  type="file" class="form-control" id="img" name="imgPlat" placeholder="Choisir une image" required="required">
                  </div>
                       
                <!-- /.card-body -->
				<button type="submit" id="add" class="btn btn-block btn-info btn-sm">Ajouter le plat</button>
              </form>
            </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

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

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
</body>
</html>
