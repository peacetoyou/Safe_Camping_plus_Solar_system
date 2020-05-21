<%@page import="com.model.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - 404</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        
        
        <div class="sidebar-brand-text mx-3"> 그린 시그널 <sup>GS</sup></div>
        
        
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">
      
       <!-- Divider -->
      <hr class="sidebar-divider">
      
      <!-- Heading -->
      <div class="sidebar-heading">
           캠핑장 관리
      </div>

     <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item active">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCamp" aria-expanded="true" aria-controls="collapseCamp">
          <i class="fas fa-fw fa-campground"></i>
          <span>캠핑장 관리</span>
        </a>
        <div id="collapseCamp" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <!-- <h6 class="collapse-header">Custom Components:</h6> -->
            <a class="collapse-item" href="tents.jsp">캠핑 보안 시스템</a>
            <a class="collapse-item" href="javascript:showCCTV()">CCTV 보기</a>
          </div>
        </div>
      </li>
      
      <!-- Nav Item - 시설 전원관리 -->
      <li class="nav-item active">
        <a class="nav-link " href="lamps.jsp">
          <i class="fas fa-fw fa-power-off"></i>
          <span>시설 전원 관리</span>
        </a>        
      </li>
      
      <!-- Nav Item - 예약관리 -->
      <li class="nav-item active">
        <a class="nav-link" href="reservation.jsp">
          <i class="fas fa-fw fa-calendar-check"></i>
          <span>예약 관리</span>
        </a>
      </li>
                 

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
             전력 관리
      </div>

      <!-- 태양광 생산 대시보드 -->      
      <li class="nav-item active">
        <a class="nav-link" href="solar_pro.jsp">
          <i class="fas fa-fw fa-solar-panel"></i>
          <span>태양광 에너지 생산 관리</span></a>
      </li>
      
      <!-- 태양광 사용 대시보드 -->
      <li class="nav-item active">
        <a class="nav-link" href="solar_use.jsp">
          <i class="fas fa-fw fa-battery-full"></i>
          <span>태양광 에너지 사용 관리</span></a>
      </li>
      

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (사이드바 좁게 넓게) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

           <!-- Nav Item - Alerts -->
         <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
               <i class="fas fa-bell fa-fw"></i>
            
                  <!-- Counter - Alerts -->
               <span class="badge badge-danger badge-counter">2+</span>
            </a>
            
            <!-- Dropdown - Alerts -->
            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                        
               <h6 class="dropdown-header">알림</h6>
                     <a class="dropdown-item d-flex align-items-center" href="tents.html">
               <div class="mr-3">
                  <div class="icon-circle bg-primary">
                     <i class="fas fa-file-alt text-white"></i>
                  </div>
               </div>
               <div>
                  <div class="small text-gray-500">2020년 5월 11일</div>
                     <span class="font-weight-bold">2번 데크 화재 감지 경보!</span>
                  </div>
                     </a> <a class="dropdown-item d-flex align-items-center" href="tents.html">
                  <div class="mr-3">
                     <div class="icon-circle bg-success">
                        <i class="fas fa-donate text-white"></i>
                     </div>
                  </div>
                  <div>
                     <div class="small text-gray-500">2020년 5월 11일</div>
                        <span class="">1번 데크 고객님의 요청사항이 있습니다.</span>
                     </div>
                     </a>  <a class="dropdown-item text-center small text-gray-500"
                           href="#">Show All Alerts</a>
                  </div>
         </li>

         <!-- 구분선 -->
          <div class="topbar-divider d-none d-sm-block"></div>
           
            <!-- Nav Item - 사용자 정보(관리자) -->
            <li class="nav-item dropdown no-arrow">
             
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                     관리자 정보 수정
                  </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                      설정 페이지
                </a>                
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                     로그아웃
                </a>
              </div>
            </li>
            
          </ul>
          
        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- 404 Error Text -->
          <div class="text-center">
            <div class="error mx-auto" data-text="404">404</div>
            <p class="lead text-gray-800 mb-5">Page Not Found</p>
            <p class="text-gray-500 mb-0">It looks like you found a glitch in the matrix...</p>
            <a href="index.html">&larr; Back to Dashboard</a>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

</body>

</html>