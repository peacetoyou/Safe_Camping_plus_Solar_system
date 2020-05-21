<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.PrintWriter"%>
<%@page import="com.model.LoginDAO"%>
<%@page import="com.model.LoginDTO"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>그린 시그널 - 홈페이지</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">  

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
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800"> 태양광 에너지 생산 관리</h1>            
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- SunPower Realtime -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="font-weight-bold text-primary text-uppercase mb-1">실시간 전기 생산량</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div id="sun_realtime" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">0Wh</div>
                        </div>                        
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                          
                            <div id="pro_realtime" class="progress-bar bg-primary" role="progressbar" 
                            		style="width: 0%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                            
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-solar-panel fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

           
            <!-- SunPower Time -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class=" font-weight-bold text-info text-uppercase mb-1">오늘 전기 생산량(누적)</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div id="sun_day" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">0Wh</div>
                        </div>                        
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                            <div id="pro_day" class="progress-bar bg-info" role="progressbar" style="width: 0%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-solar-panel fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- SunPower Day -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class=" font-weight-bold text-success text-uppercase mb-1">이번달 전기 생산량(누적) </div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div id="sun_month" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">0Wh</div>
                        </div>                        
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                            <div id="pro_month" class="progress-bar bg-success" role="progressbar" style="width: 0%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-solar-panel fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Weather -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class=" font-weight-bold text-primary text-uppercase mb-1">오늘 날씨</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div id="now" class="h6 mb-0 mr-3 font-weight-bold text-gray-800">
                          	<span id="sky"></span>
                          	<span id="temp"></span>
                          	<span id="humid"></span>
                          </div>
                        </div>                       
                        
                      </div>
                    </div>
                    <div class="col-auto">
                       <i id="weather_image" class=""></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

  
          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">태양광 에너지 오늘 충전현황</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">조회 항목:</div>
                      <a class="dropdown-item" href="solar_pro.jsp" id="today">오늘 충전현황</a>
                      <a class="dropdown-item" href="solar_pro2.jsp" id="thisMonth">이번달 충전현황</a>                      
                    </div>
                  </div>
                </div>
                
                
                
                <!-- Card Body -->
                <div class="card-body">                
                  <div class="chart-area">                  
                    <canvas id="myAreaChart"></canvas>                    
                  </div>                  
                </div>                
                
                
              </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">배터리 충전현황</h6>  
                </div>
                
                
                <!-- Card Body -->
                <div class="card-body">  
                
                                                 
                  <div class="chart-pie pt-4 pb-2">
                    <canvas id="myPieChart"></canvas>
                  </div>
                  
                  
                  
                  <div class="mt-4 text-center small">                   
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> 충전
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-warning"></i> 방전
                    </span>
                  </div>
                </div>
                
                
                
              </div>
            </div>
            
            
            
            
          </div>
        </div>
            	
      
      <!-- End of Main Content -->

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

  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->  
  <script src="js/demo/chart-area-pro-time.js"></script>
  <script src="js/jquery-3.4.1.min.js"></script> 
  
  <script>
	$(document).ready(function(){
		
		$.ajax({
	          url : 'http://api.openweathermap.org/data/2.5/weather?id=1835848&units=metric&APPID=c0afd4af579a2b8b21c925642093a827',
	          dataType: 'json',
			  success : function(resData){
				  var sky = resData.weather[0].description;
					var sky = resData.weather[0].main;
					var temp = Math.round(resData.main.temp);
					var humid = resData.main.humidity;
					console.log(sky);
					console.log(temp);
					console.log(humid);
					
					$("#temp").html(temp + "℃ &nbsp");
					$("#humid").html(humid + "%(습도)");
					
					if(sky === "clear sky"){
						$("#sky").html("맑음" + "&nbsp");
						$("#sky").addClass("text-primary");
						$("#weather_image").addClass("fas fa-sun fa-3x text-gray-300");
					} else if(sky === "few clouds" || sky === "scattered clouds") {
						$("#sky").html("구름 조금" + "&nbsp");
						$("#sky").addClass("text-info");
						$("#weather_image").addClass("fas fa-cloud-sun fa-3x text-gray-300");
					} else if(sky === "broken clouds" || sky === "overcast clouds") {
						$("#sky").html("구름 많음" + "&nbsp");						
						$("#sky").addClass("text-danger");
						$("#weather_image").addClass("fas fa-cloud fa-3x text-gray-300");
					} else {
						$("#sky").html("흐림" + "&nbsp");						
						$("#sky").addClass("text-warning");
						$("#weather_image").addClass("fas fa-cloud fa-3x text-gray-300");
					}
					
					/* "fas fa-clipboard-list fa-2x text-gray-300" */
			  }
		});
	});
				
  </script>
  
  <script>  	
		$(document).ready(function(){
			
			$.ajax({
		          url : 'Electricity.do',
		          data : 'keyword=pro',
		          dataType: 'json',	
		          async: false,
				  success : function(resData){
					
					console.log(resData);
					    
					// 태양광 전력 생산량 출력
					
					function numberWithCommas(x) {
						return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					};

					var realtime = Number(resData.sun_realtime);
					var day = Number(resData.sun_day);
					var month = Number(resData.sun_month);
					
					
					$('#sun_realtime').html(numberWithCommas(realtime) + "W");
					$('#sun_day').html(numberWithCommas(day) + "Wh");
					$('#sun_month').html(numberWithCommas(month) + "Wh");	      	      			
					
	      			base_a = Number(1000);
	      			base_b = Number(24000);
	      			base_c = Number(2000000);
	      			
	      			a = Number(resData.sun_realtime);
					b = Number(resData.sun_day);
					c = Number(resData.sun_month);										
					
					progress_a = "width:" + (a/base_a * 100) + "%";
					progress_b = "width:" + (b/base_b * 100) + "%";
					progress_c = "width:" + (c/base_c * 100) + "%";
					
					$('#pro_realtime').attr("style", progress_a);					
					$('#pro_day').attr("style", progress_b);
					$('#pro_month').attr("style", progress_c);
			
					
					}
				});
			
			
			$.getScript('js/demo/chart-pie.js');
		});			
					
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
