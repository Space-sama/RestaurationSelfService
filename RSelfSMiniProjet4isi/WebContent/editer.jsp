<%@page import="com.samaspace.model.Admin"%>
<%@page import="com.samaspace.dao.AdminDAO_Impl"%>
<%@page import="com.samaspace.dao.IAdmin"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	AdminDAO_Impl Admin_DAO = new AdminDAO_Impl();
	Admin A = (Admin) session.getAttribute("sessAdmin");


%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Editer plat</title>
  <style type="text/css">
  		
  		#card{
  			margin: 20px;
  		}
  		
  		#form{
  			width: 650px;
  			margin-left: 190px;
  		}
  		
  		#add{
  			width: 150px;
  		}
  
  
  </style>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="dist/js/validation/Parsley.js/dist/parsley.min.js"></script>
<script src="dist/js/validation/Parsley.js/dist/i18n/fr.js"></script>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <jsp:include page="navbar.jsp"></jsp:include>

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
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
                <a href="#" class="nav-link">
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
              <li class="breadcrumb-item"><a href="edite.io?id=${PMfound.idPlat}">Modifier le plat</a></li>
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
              <form data-parsley-validate action="update.io" method="post" autocomplete="off">
                <div class="card-body">
                
                 <div class="form-group">
                    <label for="idp">ID</label>
                    <input type="text" class="form-control" name="id" id="idp" value="${PMfound.idPlat}" readonly="readonly">
                  </div>
                  
                  <div class="form-group">
                    <label for="dateb">Date</label>
                    <input type="text" class="form-control" name="datePub" id="dateb" value="${PMfound.datePub}" readonly="readonly">
                  </div>
                
                  <div class="form-group">
                    <label for="nomPlat">Nom</label>
                    <input data-parsley-length="[7, 50]" type="text" class="form-control" name="nomPlat" id="nomPlat" value="${PMfound.nomPlat}" placeholder="Nom du plat ?" required="required">
                  </div>
                  
                 <%--  <div class="form-group">
                    <label for="desc">Description</label>
                    <textarea data-parsley-length="[10, 1000]" class="form-control" rows="4" name="desc" style="margin-top: 0px; margin-bottom: 0px; height: 81px;" required="required">${PMfound.description}</textarea>
                  </div> --%>
                  
                  <div class="form-group">
                    <label for="prix">Prix en DHS</label>
                    <input type="number" class="form-control" id="prix" name="prix" value="${PMfound.prixPlat}" placeholder="Le prix ?" required="required">
                  </div>
                       
                <!-- /.card-body -->
				<button type="submit" id="add" class="btn btn-warning btn-sm">Modifier le plat</button>
				<a class="btn btn-primary btn-sm" href="Search.io?key=">Retour</a>
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

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2014-2019 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
</body>
</html>
