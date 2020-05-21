<%@page import="com.model.HelpDAO"%>
<%@page import="com.model.LoginDTO"%>
<%@page import="com.model.tentSensorDTO"%>
<%@page import="com.model.tentSensorDAO"%>
<%@page import="com.model.tentInfoDTO"%>
<%@page import="com.model.tentTimeDTO"%>
<%@page import="com.model.HelpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.tentTimeDAO"%>
<%@page import="com.model.tentInfoDAO"%>


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

  <title>그린 시그널 - 홈페이지</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-3.css" rel="stylesheet">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
  <style> .cursor_over {cursor: pointer;}  </style>
  
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
             
                <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800"> 캠핑 보안 시스템 </h1>
          </div>
      
               
                <!-- Content Row -->
                <div class="row ">
   
       <% 
       tentInfoDAO tidao = new tentInfoDAO();
       ArrayList<tentInfoDTO> list = tidao.selectIn();
       
       int html;
       String html2 = "", html3 = "";
       String mn1 = "", mn2 = "", mn3 = "", mn4 = "", mn5 = "", mn6 = ""; 
       String mt1 = "", mt2 = "", mt3 = "", mt4 = "", mt5 = "", mt6 = "";
       
       for(int i = 0; i < list.size(); i++){
           
           html = list.get(i).getDeck_num();
           html2 = list.get(i).getTel();
           html3 = list.get(i).getName();
           
           if(html == 1) {
                mn1 = html3;
                mt1 = html2.substring(0,3)+'-'+html2.substring(3,7)+'-'+html2.substring(7,11);
            } else if(html == 2) {
               mn2=html3;
               mt2=html2.substring(0,3)+'-'+html2.substring(3,7)+'-'+html2.substring(7,11);;
            } else if(html == 3) {
               mn3=html3;
               mt3=html2.substring(0,3)+'-'+html2.substring(3,7)+'-'+html2.substring(7,11);;
            } else if(html == 4) {
               mn4=html3;
               mt4=html2.substring(0,3)+'-'+html2.substring(3,7)+'-'+html2.substring(7,11);;
            } else if(html == 5) {
               mn5=html3;
               mt5=html2.substring(0,3)+'-'+html2.substring(3,7)+'-'+html2.substring(7,11);;
            } else if(html == 6) {
               mn6=html3;
               mt6=html2.substring(0,3)+'-'+html2.substring(3,7)+'-'+html2.substring(7,11);;
            }
        } 
       
       
       
       tentTimeDAO timedao = new tentTimeDAO();
       ArrayList<tentTimeDTO> listTime = timedao.selectTime();
       
       int t1 = 0, t2 = 0, t3 = 0, t4 = 0, t5 = 0, t6 = 0;
       int h1 = 0, h2 = 0, h3 = 0, h4 = 0, h5 = 0, h6 = 0;
       int va = 0, va2 = 0;
         
         for(int i = 0; i < list.size(); i++){
            va = listTime.get(i).getDeck_num();
            va2 = listTime.get(i).getLeft_time();
            
            if(va == 1){
                t1 = va2;
            } else if(va == 2) {
               t2 = va2;
            } else if(va == 3) {
               t3 = va2;
            } else if(va == 4) {
               t4 = va2;
            } else if(va == 5) {
               t5 = va2;
            } else if(va == 6) {
               t6 = va2;
            } 
         };
         
         
         tentSensorDAO sensdao = new tentSensorDAO();
         ArrayList<tentSensorDTO> listSens = sensdao.selectSen();
         
         int s1 = 0,s2 = 0,s3 = 0,s4 = 0,s5 = 0,s6 = 0;
         int inf1 = 0,inf2 = 0,inf3 = 0, d1 = 0,d2 = 0,d3 = 0,d4 = 0,d5 = 0,d6 = 0;
         int sf1 = 0,sf2 = 0,sf3 = 0,sf4 = 0,sf5 = 0,sf6 = 0;
      
            for(int i=0; i < listSens.size(); i++){
               
                   inf1=listSens.get(i).getDeck_num();
                   inf2=listSens.get(i).getInvade_ck();
                   inf3=listSens.get(i).getFire_ck();
                   
                   if(inf1 == 1){
                       d1=inf1;
                       s1=inf2;
                       sf1=inf3;
                   }else if(inf1 == 2){
                      d2=inf1;
                      s2=inf2;
                      sf2=inf3;
                   }else if(inf1 == 3){
                      d3=inf1;
                      s3=inf2;
                      sf3=inf3;
                   }else if(inf1 == 4){
                      d4=inf1;
                      s4=inf2;
                      sf4=inf3;
                   }else if(inf1 == 5){
                      d5=inf1;
                      s5=inf2;
                      sf5=inf3;
                   }else if(inf1 == 6){
                      d6=inf1;
                      s6=inf2;
                      sf6=inf3;
                   }
            }
         
            
         
            // 고객요청사항 데이터 불러오기
            HelpDAO helpdao = new HelpDAO();
            ArrayList<HelpDTO> listHelp = helpdao.select();
            
            String content1 = "", content2 = "", content3 = "", content4 = "", content5 = "", content6 = "";
            int info1 = 0, info2 = 0;
            String info3 = "", info4 = "", info5 = "", info6 = "";
                  
            for(int i = 0; i < listHelp.size(); i++){
                info1 = listHelp.get(i).getId();
                info2 = listHelp.get(i).getDeck_num();
                info3 = listHelp.get(i).getName();
                info4 = listHelp.get(i).getTel();
                info5 = listHelp.get(i).getDate();
                info6 = listHelp.get(i).getContent();
                 
                if(inf2 == 1){
                    content1 = info6;
                } else if(info2 == 2){
                   content2 = info6;
                } else if(info2 == 3){
                   content3 = info6;
                } else if(info2 == 4){
                   content4 = info6;
                } else if(info2 == 5){
                   content5 = info6;                           
                } else if(info2 == 6){
                   content6 = info6;
                }
              };          
         %>
                
                
                
                  <!-- 데크1 -->
                  <div class="col-lg-4 wide-right">
                    <div class="card mb-4 border-bottom-success" style="box-shadow:0 0px 0px rgba(34, 37, 42, 0.4)">
      
                      <!--  데크, 이름, 전화번호 -->
                      <div class="card-header bg-gray-200 text-gray-800">
                         <div class="row">
                            <div class="col px-md-2" style="">
                                <div class="p-1 card-text text-primary font-weight-bold" style="background-color: transparent;
                                   font-size:18px; text-align:left;" id="dec1">데크 1</div>
                                
                              </div>
                            <div class="col px-md-2">
                               <div class="p-1 card-text font-weight-bold" style="background-color: transparent;" id="d1_nt">
                                 <% out.print( mn1 + " " + mt1); %>
                                    
                               </div>
                            </div>
                         </div>
                      </div>
                      
                      <!--  센서 감지 -->
                      <div class="card-body" >
                        <div class="row" style="margin-top: 10px;">
                             <!-- 도난 감지 -->
                            <div class="col px-md-3">
                              <% if(d1 != 0){
                                 if(s1 == 1){
                              %>
                                 <h6 class="p-3 card bg-warning text-white" id="d1_invade">침입감지<br>(도난방지)</h6> 
                              <%  } else { %>
                                 <h6 class="p-3 card" id="d1_invade">침입감지<br>(도난방지)</h6>
                              <%  }
                                }
                              %>
                                     
                            </div>
                            
                            <!-- 화재 감지 -->
                            <div class="col px-md-3">
                             <% if(d1 != 0){
                                 if(sf1 > 700){
                            %>    <h6 class="p-3 card bg-danger text-white" id="d1_fire">화재감지<br>(CO2)</h6> 
                            <%       } else { %>
                                 <h6 class="p-3 card" id="d1_fire">화재감지<br>(CO2)</h6>
                               <%      }
                                }
                            %>
                            </div>
                        </div>
                      </div>
                       
                      <!-- 고객 요청사항 --> 
                      <div class="card-body" >
                          <%
                          if(content1 != ""){ %>
                             <h6 class="card bg-info text-white cursor_over" style="margin-bottom: 10px;" id="d1_help" onClick="help1()">
                                <br>고객 요청사항<br><br>
                         </h6>
                     <% } else { %>
                        <h6 class="card" style="margin-bottom: 10px;" id="d1_help" >
                           <br>고객 요청사항<br><br>
                         </h6>
                     <% } %>     
                       </div>
                   
                     <!-- 남은 시간 표시 -->
                     <div class="card-footer text-muted">
                          <h6 id="d1_time" style="margin-top: 10px; font-size:14px;">
                           <%
                           if(t1 != 0){             
                                h1 = (int) t1/60;
                                out.print(h1);%>시간 <% out.print((int) t1%60);%>분
                          <%} else { %>
                             남은시간(막대)
                          <%};  %>
                          </h6>
                     </div>
                    
                     </div>
                  </div>
                
                  <!-- 데크2 -->
                  <div class="col-lg-4 wide-right ">
                    <div class="card mb-4 border-bottom-success"  style="box-shadow:0 0px 0px rgba(34, 37, 42, 0.4)">
      
                      <!--  데크, 이름, 전화번호 -->
                      <div class="card-header bg-gray-200 text-gray-800">
                         <div class="row">
                            <div class="col px-md-2">
                                <div class="col- p-1 card-text text-primary font-weight-bold" style="background-color: transparent;
                                   font-size:18px; text-align:left;" id="dec2">데크 2</div>
                                
                              </div>
                            <div class="col px-md-2">
                               <div class="p-1 card-text font-weight-bold" style="background-color: transparent;" id="d2_nt">
                                   <% out.print( mn2 + " " + mt2); %>
                               </div>
                            </div>
                         </div>
                      </div>
                      
                      <!-- 연결됨 -->
                      <!-- <div class="card-body">
                        <h6 class="card-text"   id="d2_wifi">연결됨</h6>                  
                      </div> -->
                      
                      <!--  센서 감지 -->
                      <div class="card-body" >
                        <div class="row" style="margin-top: 10px;">
                             <!-- 도난 감지 -->
                            <div class="col px-md-3">
                              <% 
                                 if(d2 != 0){
                                 if(s2 == 1){
                              %>
                                 <h6 class="p-3 card bg-warning text-white" id="d2_invade">침입감지<br>(도난방지)</h6> 
                              <%  } else { %>
                                 <h6 class="p-3 card" id="d2_invade">침입감지<br>(도난방지)</h6>
                              <%  }
                                }
                              %>
                                     
                            </div>
                            
                            <!-- 화재 감지 -->
                            <div class="col px-md-3">
                            <% if(d2 != 0){
                                 if(sf2 > 700){
                            %>    <h6 class="p-3 card bg-danger text-white" id="d2_fire">화재감지<br>(CO2)</h6> 
                            <%       } else { %>
                                 <h6 class="p-3 card" id="d2_fire">화재감지<br>(CO2)</h6>
                               <%      }
                                }
                            %>
                            </div>
                        </div>
                      </div>
                       
                      <!-- HELP --> 
                      <div class="card-body" >
                          <%
                          if(content2 != ""){ %>
                             <h6 class="card bg-info text-white cursor_over" style="margin-bottom: 10px;" id="d2_help"  onClick="help2()">
                                <br>고객 요청사항<br><br>
                         </h6>
                     <% } else { %>
                        <h6 class="card" style="margin-bottom: 10px;" id="d2_help">
                           <br>고객 요청사항<br><br>
                         </h6>
                     <% } %>     
                       </div>
                   
                     <!-- 남은 시간 표시 -->
                     <div class="card-footer text-muted">
                          <h6 id="d2_time" style="margin-top: 10px; font-size:14px;">                          
                          <%
                           if(t2 != 0){             
                                h2 = (int) t2/60;
                                out.print(h2);%>시간 <% out.print((int) t2%60);%>분
                          <%} else { %>
                             남은시간(막대)
                          <%};  %>
                          </h6>
                     </div>
                    
                     </div>
                  </div>
                

                 <!-- 데크3 -->
                  <div class="col-lg-4 wide-right ">
                    <div class="card mb-4 border-bottom-success"  style="box-shadow:0 0px 0px rgba(34, 37, 42, 0.4)">
      
                      <!--  데크, 이름, 전화번호 -->
                      <div class="card-header bg-gray-200 text-gray-800">
                         <div class="row">
                            <div class="col px-md-2">
                                <div class="p-1 card-text text-primary font-weight-bold" style="background-color: transparent;
                                   font-size:18px; text-align:left;" id="dec3">데크 3</div>
                                
                              </div>
                            <div class="col px-md-2">
                               <div class="p-1 card-text  font-weight-bold" style="background-color: transparent;" id="d3_nt">
                                     <% out.print( mn3 + " " + mt3); %>
                               </div>
                            </div>
                         </div>
                      </div>
                      
                      <!-- 연결됨 -->
<!--                       <div class="card-body">
                        <h6 class="card-text"   id="d3_wifi">연결됨</h6>                  
                      </div> -->
                      
                      <!--  센서 감지 -->
                      <div class="card-body">
                        <div class="row" style="margin-top: 10px;">
                             <!--  도난 감지 -->
                            <div class="col px-md-3">
                                <% 
                                 if(d3 != 0){
                                 if(s3 == 1){
                              %>
                                 <h6 class="p-3 card bg-warning text-white" id="d3_invade">침입감지<br>(도난방지)</h6> 
                              <%  } else { %>
                                 <h6 class="p-3 card" id="d3_invade">침입감지<br>(도난방지)</h6>
                              <%  }
                                }
                              %>
                            </div>
                            
                            <!-- 화재 감지 -->
                            <div class="col px-md-3">
                                <% if(d3 != 0){
                                    if(sf3 > 700){
                               %>    <h6 class="p-3 card bg-danger text-white" id="d3_fire">화재감지<br>(CO2)</h6> 
                               <%       } else { %>
                                    <h6 class="p-3 card" id="d3_fire">화재감지<br>(CO2)</h6>
                                  <%      }
                                   };
                               %>
                            </div>
                        </div>
                      </div>
                       
                      <!-- HELP --> 
                      <div class="card-body" >
                          <%
                          if(content3 != ""){ %>
                             <h6 class="card bg-info text-white cursor_over" style="margin-bottom: 10px;" id="d3_help"  onClick="help3()">
                                <br>고객 요청사항<br><br>
                         </h6>
                     <% } else { %>
                        <h6 class="card" style="margin-bottom: 10px;" id="d3_help">
                           <br>고객 요청사항<br><br>
                         </h6>
                     <% }; %>     
                       </div>
                   
                     <!-- 남은 시간 표시 -->
                     <div class="card-footer text-muted">
                          <h6 id="d3_time" style="margin-top: 10px; font-size:14px;">
                          <%
                           if(t3 != 0){             
                                h3 = (int) t3/60;
                                out.print(h3);%>시간 <% out.print((int) t3%60);%>분
                          <%} else { %>
                             남은시간(막대)
                          <%};  %>
                          </h6>
                     </div>
                    
                     </div>
                  </div>
                
              </div>

              <div class="row">
              
                 <!-- 데크4 -->
                  <div class="col-lg-4 wide-right">
                    <div class="card mb-4 border-bottom-warning"  style="box-shadow:0 0px 0px rgba(34, 37, 42, 0.4)">
      
                      <!--  데크, 이름, 전화번호 -->
                      <div class="card-header bg-gray-200 text-gray-800">
                         <div class="row">
                            <div class="col px-md-2">
                                <div class="p-1 card-text text-primary font-weight-bold" style="background-color: transparent;
                                   font-size:18px; text-align:left;" id="dec4">데크 4</div>
                                
                              </div>
                            <div class="col px-md-2">
                               <div class="p-1 card-text font-weight-bold" style="background-color: transparent;" id="d4_nt">
                                     <% out.print(mn4 + " " + mt4); %>
                               </div>
                            </div>
                         </div>
                      </div>
                      
                      
                      <!--  센서 감지 -->
                      <div class="card-body" >
                        <div class="row" style="margin-top: 10px;">
                             <!--  도난 감지 -->
                            <div class="col px-md-3">
                                <% 
                                 if(d4 != 0){                                    
                                 if(s4 == 1){
                              %>
                                 <h6 class="p-3 card bg-warning text-white" id="d4_invade">침입감지<br>(도난방지)</h6> 
                              <%  } else { %>
                                 <h6 class="p-3 card" id="d4_invade">침입감지<br>(도난방지)</h6>
                              <%  }
                                };
                              %>
                            </div>
                            
                            <!-- 화재 감지 -->
                            <div class="col px-md-3">
                               <% if(d4 != 0){
                                    if(sf4 > 700){
                               %>    <h6 class="p-3 card bg-danger text-white" id="d4_fire">화재감지<br>(CO2)</h6> 
                               <%       } else { %>
                                    <h6 class="p-3 card" id="d4_fire">화재감지<br>(CO2)</h6>
                                  <%      }
                                   }
                               %>
                            </div>
                        </div>
                      </div>
                       
                      <!-- HELP --> 
                      <div class="card-body" >
                          <%
                          if(content4 != ""){ %>
                             <h6 class="card bg-info text-white cursor_over" style="margin-bottom: 10px;" id="d4_help"  onClick="help4()">
                                <br>고객 요청사항<br><br>
                         </h6>
                     <% } else { %>
                        <h6 class="card" style="margin-bottom: 10px;" id="d4_help">
                           <br>고객 요청사항<br><br>
                         </h6>
                     <% }; %>     
                       </div>
                   
                     <!-- 남은 시간 표시 -->
                      <div class="card-footer text-muted">
                          <h6 id="d4_time" style="margin-top: 10px; font-size:14px;">
                          <%
                           if(t4 != 0){             
                                h4 = (int) t4/60;
                                out.print(h4);%>시간 <% out.print((int) t4%60);%>분
                          <%} else { %>
                             남은시간(막대)
                          <%};  %>
                          </h6>
                     </div>
                    
                     </div>
                  </div>
                

                <!-- 데크5 -->
                  <div class="col-lg-4 wide-right ">
                    <div class="card mb-4 border-bottom-warning"  style="box-shadow:0 0px 0px rgba(34, 37, 42, 0.4)">
      
                      <!--  데크, 이름, 전화번호 -->
                      <div class="card-header bg-gray-200 text-gray-800">
                         <div class="row">
                            <div class="col px-md-2">
                                <div class="p-1 card-text text-primary font-weight-bold" style="background-color: transparent;
                                   font-size:18px; text-align:left;" id="dec5">데크 5</div>
                                
                              </div>
                            <div class="col px-md-2">
                               <div class="p-1 card-text font-weight-bold" style="background-color: transparent;" id="d5_nt">
                                      <% out.print( mn5 + " " + mt5); %>
                               </div>
                            </div>
                         </div>
                      </div>
                      
                      <!-- 연결됨 -->
<!--                       <div class="card-body">
                        <h6 class="card-text"   id="d5_wifi">연결됨</h6>                  
                      </div> -->
                      
                      <!--  센서 감지 -->
                      <div class="card-body" >
                        <div class="row" style="margin-top: 10px;">
                             <!--  도난 감지 -->
                            <div class="col px-md-3">
                                <% 
                                 if(d5 != 0){
                                 if(s5 == 1){
                              %>
                                 <h6 class="p-3 card bg-warning text-white" id="d5_invade">침입감지<br>(도난방지)</h6> 
                              <%  } else { %>
                                 <h6 class="p-3 card" id="d5_invade">침입감지<br>(도난방지)</h6>
                              <%  }
                                }
                              %>
                            </div>
                            
                            <!-- 화재 감지 -->
                            <div class="col px-md-3">
                                <% if(d5 != 0){
                                    if(sf5 > 700){
                               %>    <h6 class="p-3 card bg-danger text-white" id="d5_fire">화재감지<br>(CO2)</h6> 
                               <%       } else { %>
                                    <h6 class="p-3 card" id="d5_fire">화재감지<br>(CO2)</h6>
                                  <%      }
                                   }
                               %>
                            </div>
                        </div>
                      </div>
                       
                      <!-- HELP --> 
                      <div class="card-body" >
                          <%
                          if(content5 != ""){ %>
                             <h6 class="card bg-info text-white cursor_over" style="margin-bottom: 10px;" id="d5_help"  onClick="help5()">
                                <br>고객 요청사항<br><br>
                         </h6>
                     <% } else { %>
                        <h6 class="card" style="margin-bottom: 10px;" id="d5_help">
                           <br>고객 요청사항<br><br>
                         </h6>
                     <% } %>     
                       </div>
                   
                     <!-- 남은 시간 표시 -->
                     <div class="card-footer text-muted">
                          <h6 id="d5_time" style="margin-top: 10px; font-size:14px;">
                          <%
                           if(t5 != 0){             
                                h5 = (int) t5/60;
                                out.print(h5);%>시간 <% out.print((int) t5%60);%>분
                          <%} else { %>
                             남은시간(막대)
                          <%};  %>
                          </h6>
                     </div>
                    
                     </div>
                  </div>
                


                <!-- 데크6 -->
                  <div class="col-lg-4 wide-right ">
                    <div class="card mb-4 border-bottom-warning"  style="box-shadow:0 0px 0px rgba(34, 37, 42, 0.4)">
      
                      <!--  데크, 이름, 전화번호 -->
                      <div class="card-header bg-gray-200 text-gray-800">
                         <div class="row">
                            <div class="col px-md-2">
                                <div class="p-1 card-text text-primary font-weight-bold" style="background-color: transparent;
                                   font-size:18px; text-align:left;" id="dec6">데크 6</div>
                                
                              </div>
                            <div class="col px-md-2">
                               <div class="p-1 card-text font-weight-bold" style="background-color: transparent;" id="d6_nt">
                                   <% out.print( mn6 + " " + mt6); %>
                               </div>
                            </div>
                         </div>
                      </div>
                      
                      <!-- 연결됨 -->
<!--                       <div class="card-body">
                        <h6 class="card-text"  style="margin-top: 5px;" id="d6_wifi">연결됨</h6>                  
                      </div> -->
                      
                      <!--  센서 감지 -->
                      <div class="card-body" >
                        <div class="row" style="margin-top: 10px;">
                             <!--  도난 감지 -->
                            <div class="col px-md-3">
                               <% 
                                 if(d6 != 0){
                                 if(s6 == 1){
                              %>
                                 <h6 class="p-3 card bg-warning text-white" id="d6_invade">침입감지<br>(도난방지)</h6> 
                              <%  } else { %>
                                 <h6 class="p-3 card" id="d6_invade">침입감지<br>(도난방지)</h6>
                              <%  }
                                }
                              %>
                            </div>
                            
                            <!-- 화재 감지 -->
                            <div class="col px-md-3">
                                <% if(d6 != 0){
                                    if(sf6 > 700){
                               %>    <h6 class="p-3 card bg-danger text-white" id="d6_fire">화재감지<br>(CO2)</h6> 
                               <%       } else { %>
                                    <h6 class="p-3 card" id="d6_fire">화재감지<br>(CO2)</h6>
                                  <%      }
                                   }
                               %>
                            </div>
                        </div>
                      </div>
                       
                      <!-- HELP --> 
                      <div class="card-body" >
                          <%
                          if(content6 != ""){ %>
                             <h6 class="card bg-info text-white cursor_over" style="margin-bottom: 10px;" id="d6_help"  onClick="help6()">
                                <br>고객 요청사항<br><br>
                         </h6>
                     <% } else { %>
                        <h6 class="card" style="margin-bottom: 10px;" id="d6_help">
                           <br>고객 요청사항<br><br>
                         </h6>
                     <% } %>     
                       </div>
                   
                     <!-- 남은 시간 표시 -->
                     <div class="card-footer text-muted">
                          <h6 id="d6_time" style="margin-top: 10px; font-size:14px;">
                          <%
                           if(t6 != 0){             
                                h6 = (int) t6/60;
                                out.print(h6);%>시간 <% out.print((int) t6%60);%>분
                          <%} else { %>
                             남은시간(막대)
                          <%};  %>
                          </h6>
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
  
  <script>
      
      function help1(){   
         var d1 = "";
         if(d1 != null){
             var url = "help_message.jsp?deck=1";
             var name = "";
             var option = "newWindow, width = 400, height = 300, top = 100, left = 600, location = no, scrollBar=no";
             window.open(url, name, option);
             $('#d1_help').attr("class", "card");
             $('#d1_help').attr("onClick", "");
         };
      };
      
      function help2(){   
         var d2 = "";
         if(d2 != null){
             var url = "help_message.jsp?deck=2";
             var name = "";
             var option = "newWindow, width = 400, height = 300, top = 100, left = 600, location = no, scrollBar=no";
             window.open(url, name, option);
             $('#d2_help').attr("class", "card");
             $('#d2_help').attr("onClick", "");
         };
      };
      
      function help3(){   
         var d3 = "";
         if(d3 != null){
             var url = "help_message.jsp?deck=3";
             var name = "";
             var option = "newWindow, width = 400, height = 300, top = 100, left = 600, location = no, scrollBar=no";
             window.open(url, name, option);
             $('#d3_help').attr("class", "card");
             $('#d3_help').attr("onClick", "");
         };
      };
      
      function help4(){   
         var d4 = "";
         if(d4 != null){
             var url = "help_message.jsp?deck=4";
             var name = "";
             var option = "newWindow, width = 400, height = 300, top = 100, left = 600, location = no, scrollBar=no";
             window.open(url, name, option);
             $('#d4_help').attr("class", "card");
             $('#d4_help').attr("onClick", "");
         };
      };
      
      function help5(){   
         var d5 = "";
         if(d5 != null){
             var url = "help_message.jsp?deck=5";
             var name = "";
             var option = "newWindow, width = 400, height = 300, top = 100, left = 600, location = no, scrollBar=no";
             window.open(url, name, option);
             $('#d5_help').attr("class", "card");
             $('#d5_help').attr("onClick", "");
         };
      };
      
      function help6(){   
         var d6 = "";
         if(d6 != null){
             var url = "help_message.jsp?deck=6";
             var name = "";
             var option = "newWindow, width = 400, height = 300, top = 100, left = 600, location = no, scrollBar=no";
             window.open(url, name, option);
             $('#d6_help').attr("class", "card");
             $('#d6_help').attr("onClick", "");
         };
      };

  </script>
  
  <script>
    function showCCTV(){
        var url = "cctv.jsp";
        var name = "";
        var option = "width = 500, height = 480, top = 50, left = 100, location = no"
        window.open(url, name, option);
    }
  </script>


</body>

</html>