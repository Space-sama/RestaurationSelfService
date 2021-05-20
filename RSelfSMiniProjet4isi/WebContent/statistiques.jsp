<%@page import="com.samaspace.model.Admin"%>
<%@page import="com.samaspace.dao.AdminDAO_Impl"%>
<%@page import="com.samaspace.dao.DessertDAOImpl"%>
<%@page import="com.samaspace.dao.BoissonsDAO_Impl"%>
<%@page import="com.samaspace.dao.PlatsDAO_impl"%>
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
  <style type="text/css">
  		
  		#card{
  			margin: 20px;
  			
  		
  		}
  
  
  </style>

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
                <a href="Boissons.jsp" class="nav-link">
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
              <li class="breadcrumb-item"><a href="statistiques.io">Statistiques</a></li>
               <!-- <li class="breadcrumb-item active">Menu</li> -->
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
         
        <div class="row">
          
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-6">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i style="color:blue;" class="fas fa-user-shield"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Nombre des Admins</span>
                <span class="info-box-number"><div id="nbr_admin"><%=Admin_DAO.nbrAdmin() %></div></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

		<div class="col-12 col-sm-6 col-md-6">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i style="color:brown;" class="fas fa-mug-hot"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Nombre des boissons</span>
                <span class="info-box-number"><div id="nbr_boisson">
                  <%=b_dao.nbrDrinks() %></div>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          </div>
          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>
			<div class="row">
          <div class="col-12 col-sm-6 col-md-6">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i style="color:gold;" class="fas fa-hamburger"></i></span>
									<%int NbrDishes = pdao.NbrOfDishes(); %>			
									
              <div class="info-box-content">
                <span class="info-box-text">Nombre des plats</span>
                <% if(NbrDishes > 0){ %>
                
                <span class="info-box-number"><div id="nbr_plat"><%= NbrDishes %></div></span>
                
               <% } %> 
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-6">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-warning elevation-1"><i style="color:turquoise;" class="fas fa-ice-cream"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Nombre du desserts</span>
                <span class="info-box-number"><div id="nbr_dessert"><%=d_dao.nbrDesserts() %></div></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
        </div>
    
    <div class="row">
    	<div class="col-md-12">
    		 <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Graphe bare</h3>

              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="mychart1" style="min-height: 250px; height: 500px; max-height: 450px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
    	</div>
    	
<!-- End Chart -->
    </div>
          <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
<!--/.content-wrapper -->

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
<script src="plugins/chart.js/Chart.js"></script>
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<script>
var ctx1 = $('#mychart1');
var nbr_dessert=document.getElementById('nbr_dessert').innerHTML;
var nbr_plat=document.getElementById('nbr_plat').innerHTML;
var nbr_boisson=document.getElementById('nbr_boisson').innerHTML;
var nbr_admin=document.getElementById('nbr_admin').innerHTML;
var myChart = new Chart(ctx1, {
    type: 'bar',
    data: {
        labels: ['Admin', 'Boissons', 'Plats', 'Desserts'],
        datasets: [{
            label: 'Nombres',
            data: [nbr_admin, nbr_boisson,nbr_plat, nbr_dessert],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});


</script>
</body>
</html>
