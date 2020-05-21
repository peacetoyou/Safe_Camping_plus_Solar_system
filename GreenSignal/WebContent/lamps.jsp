<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.model.LoginDAO"%>
<%@page import="com.model.LoginDTO"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>그린 시그널 - 시설 전원 관리</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
   type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link href="css/switch.css" rel="stylesheet">



</head>

<body id="page-top">
  <% LoginDTO info = (LoginDTO) session.getAttribute("info");
      %>
      
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
             
             
             <% if(info != null) { %>
             
             <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                     관리자님 환영합니다. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그아웃 
                </span>
              </a>
                     
         <%       
            }else{ 
            //로그인 안하면 로그인 페이지로 이동
             response.sendRedirect("login.jsp");  
          } %> 
          
          
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

         <!-- Page Heading -->
         <div
            class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">시설 전원 관리</h1>                  
         </div>

         <div class="row">

         <!-- 가로등 관리  -->                  
            <div class="col-xl-9 col-md-12 mb-4">
              <div class="card border-left-primary shadow h-100">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    
                    <div class="col mr-2">
                      <div class="text-lg font-weight-bold text-primary text-uppercase">가로등 전원 관리</div>
                      <div class="row no-gutters align-items-center">                                                         
                        <div class="col"> </div>
                      </div>
                    </div>
                                                          
                    <div class="col-auto">
                      <label class="switch">
                  <input type="checkbox" name="power_lamp" value="" checked>
                    <div class="slider round"></div>
                 </label>
                    </div>      
                                           
                  </div>
                </div>
              </div>
            </div>
         
         <div class="col-xl-8 col-md-12 mb-4">
            <img id="lamp1" src="img/street-light-on.png" width=100 height=100 style="margin-bottom:20px;">
            <img id="lamp2" src="img/street-light-on.png" width=100 height=100 style="margin-bottom:20px;">
            <img id="lamp3" src="img/street-light-on.png" width=100 height=100 style="margin-bottom:20px;">
            <img id="lamp4" src="img/street-light-on.png" width=100 height=100 style="margin-bottom:20px;">
            <img id="lamp5" src="img/street-light-on.png" width=100 height=100 style="margin-bottom:20px;">         
            <img id="lamp6" src="img/street-light-on.png" width=100 height=100 style="margin-bottom:20px;">
            <img id="lamp7" src="img/street-light-on.png" width=100 height=100 style="margin-bottom:20px;">
            <img id="lamp8" src="img/street-light-on.png" width=100 height=100 style="margin-bottom:20px;">
            <img id="lamp9" src="img/street-light-on.png" width=100 height=100 style="margin-bottom:20px;">
            <img id="lamp10" src="img/street-light-on.png" width=100 height=100 style="margin-bottom:20px;">
         </div>
         
         
         
         
         <!-- 화장실 관리  -->
         <div class="col-xl-9 col-md-12 mb-4">
            <div class="card border-left-warning shadow h-200 py-2 ">
               <div class="card-body">
                  <div class="row no-gutters align-items-center ">
                     
                     <div class="col mr-2">
                               <div class="text-lg font-weight-bold text-warning text-uppercase mb-1">화장실 전원 관리</div>
                               <div class="row no-gutters align-items-center">                                                         
                                 <div class="col"> </div>
                               </div>
                           </div>   
                           
                      <div class="col-auto">
                         <img id="toilet" src="img/toilet-on.png" width=50 height=50>
                         &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                               <label class="switch">
                           <input type="checkbox" name="power_toilet" value="" checked>
                             <div class="slider round"></div>
                       </label>
                          </div>                        
                     
                  </div>
               </div>
            </div>
         </div>
         
         <!-- 관리소 관리  -->
         <div class="col-xl-9 col-md-12 mb-4">
            <div class="card border-left-info shadow h-200 py-2 ">
               <div class="card-body">
                  <div class="row no-gutters align-items-center ">
                     
                     <div class="col mr-2">
                               <div class="text-lg font-weight-bold text-info text-uppercase mb-1">관리소 전원 관리</div>
                               <div class="row no-gutters align-items-center">                                                         
                                 <div class="col"> </div>
                               </div>
                           </div>   
                           
                      <div class="col-auto">
                        <img id="office" src="img/office-on.png" width=50 height=50>
                         &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                               <label class="switch">
                           <input type="checkbox" name="power_office" value="" checked>
                             <div class="slider round"></div>
                       </label>
                          </div>   
                     
                  </div>
               </div>
            </div>
         </div>
            
            
         </div>
            
      </div>
      <!-- End of Main Content -->



      </div>
      <!-- End of Content Wrapper -->
      
      <!-- Footer -->
      <footer class="sticky-footer bg-white">
         <div class="container my-auto">
            <div class="copyright text-center my-auto">
            <span>Copyright &copy; Green Signal 2020 all rights reserved.</span>
            </div>
         </div>
      </footer>
      <!-- End of Footer -->
   
   </div>
   <!-- End of Page Wrapper -->

      <!-- Scroll to Top Button-->
      <a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
      </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>        
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="sessionDel.jsp">로그아웃</a>
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

   
   <script>
      $(document).ready(function() {
         
         $.ajax({
                url : 'PowerCon.do',
                dataType : 'json',
              success : function(resData){                     
                  console.log(resData);
                  console.log(resData.powerLamp);
                  
               powerLamp = resData.powerLamp;
               powerToilet = resData.powerToilet;
               powerOffice = resData.powerOffice;                     
                                 
               $('input[name="power_lamp"]').attr("checked", powerLamp);
               $('input[name="power_toilet"]').attr("checked", powerToilet);
               $('input[name="power_office"]').attr("checked", powerOffice);
               
              }
         });
         
      });
   </script>
   <script>
      var powerCon = {         
         send(powerItem, powerState) {               
            $.ajax({
                url : 'PowerCon.do',
                data : {
                   'powerItem' : powerItem,
                   'powerState' : powerState,
                },                        
                success : function(resData){                     
                     console.log(resData);
                }
            });
         }
            
      };
   </script>
   
   <script>
      //스위치 버튼 눌렀을 떄 send() 메소드 실행 : PowerCon.do로 가서 DB 값 변경 시키기(각 시설 아두이노에서 DB 값 읽어서 실행)
   
      
      
      // 가로등 전원 온오프 함수
      function lampOff() {         
            document.getElementById("lamp1").src = "./img/street-light-off.png";
            document.getElementById("lamp2").src = "./img/street-light-off.png";
            document.getElementById("lamp3").src = "./img/street-light-off.png";
            document.getElementById("lamp4").src = "./img/street-light-off.png";
            document.getElementById("lamp5").src = "./img/street-light-off.png";
            document.getElementById("lamp6").src = "./img/street-light-off.png";
            document.getElementById("lamp7").src = "./img/street-light-off.png";
            document.getElementById("lamp8").src = "./img/street-light-off.png";
            document.getElementById("lamp9").src = "./img/street-light-off.png";
            document.getElementById("lamp10").src = "./img/street-light-off.png";
       }
      
      
      function lampOn() {
         document.getElementById("lamp1").src = "./img/street-light-on.png";
         console.log("lamp1 On");
       }      
      function lampOn2() {
         document.getElementById("lamp2").src = "./img/street-light-on.png";
         console.log("lamp2 On");
       }
      function lampOn3() {
         document.getElementById("lamp3").src = "./img/street-light-on.png";
         console.log("lamp3 On");
       }
      function lampOn4() {
         document.getElementById("lamp4").src = "./img/street-light-on.png";
         console.log("lamp4 On");
       }
      function lampOn5() {
         document.getElementById("lamp5").src = "./img/street-light-on.png";
         console.log("lamp5 On");
       }
      function lampOn6() {
         document.getElementById("lamp6").src = "./img/street-light-on.png";
         console.log("lamp6 On");
       }
      function lampOn7() {
         document.getElementById("lamp7").src = "./img/street-light-on.png";
         console.log("lamp7 On");
       }
      function lampOn8() {
         document.getElementById("lamp8").src = "./img/street-light-on.png";
         console.log("lamp8 On");
       }
      function lampOn9() {
         document.getElementById("lamp9").src = "./img/street-light-on.png";
         console.log("lamp9 On");
       }
      function lampOn10() {
         document.getElementById("lamp10").src = "./img/street-light-on.png";
         console.log("lamp10 On");
       }
      
      
      //화장실 전원 온오프 함수
      function toiletOn() {
         document.getElementById("toilet").src = "./img/toilet-on.png";
         console.log("toilet On");
       }   
      
      
      function toiletOff() {
         document.getElementById("toilet").src = "./img/toilet-off.png";
         console.log("toilet Off");
       }   

      
      //사무실 전원 온오프 함수
      function officeOn() {
         document.getElementById("office").src = "./img/office-on.png";
         console.log("office On");
       }   
      
      
      function officeOff() {
         document.getElementById("office").src = "./img/office-off.png";
         console.log("office Off");
       }   
      
      
      
      // 가로등 토글 스위치 기능 구현(전원 온오프)
      $('input[name=power_lamp]').on('click', function() {
         
         powerLamp = $('input[name="power_lamp"]').is(":checked")
         console.log(powerLamp);
         powerCon.send("powerLamp", powerLamp);
         
         if(powerLamp == true){
            setTimeout(lampOn, 500);            
            setTimeout(lampOn2, 1000);
            setTimeout(lampOn3, 1500);
            setTimeout(lampOn4, 2000);
            setTimeout(lampOn5, 2500);
            setTimeout(lampOn6, 3000);
            setTimeout(lampOn7, 3500);
            setTimeout(lampOn8, 4000);
            setTimeout(lampOn9, 4500);
            setTimeout(lampOn10, 5000);
         } else {
            lampOff();
         }
      });
      
      
      // 화장실 토글 스위치 기능 구현(전원 온오프)
      $('input[name=power_toilet]').on('click', function() {
         powerToilet = $('input[name="power_toilet"]').is(":checked")
         console.log(powerToilet);
         powerCon.send("powerToilet", powerToilet);
         if(powerToilet == true){
            toiletOn();
         } else {
            toiletOff();
         }
      });
      
      
      // 사무실 토글 스위치 기능 구현(전원 온오프)
      $('input[name=power_office]').on('click', function() {
         powerOffice = $('input[name="power_office"]').is(":checked")
         console.log(powerOffice);
         powerCon.send("powerOffice", powerOffice);
         if(powerOffice == true){
            officeOn();
         } else {
            officeOff();
         }
      });
      
   </script>
      
   <script>
         
     function popup(){     
        if(sessionStorage.getItem("id") !== null){
           console.log(sessionStorage.getItem("content"));
            var url = "help_message.jsp";
            var name = "";
            var option = "newWindow, width = 400, height = 400, top = 200, left = 500, location = no, scroll-bar=yes";
            window.open(url, name, option);
        } else {
           alert("메세지가 없습니다.");
        };
     }
   </script>
       
  <script>
     function showCCTV(){
         var url = "cctv.jsp";
         var name = "";
         var option = "width = 700, height = 650, top = 50, left = 100, location = no"
         window.open(url, name, option);
     }
   </script>
      
</body>

</html>