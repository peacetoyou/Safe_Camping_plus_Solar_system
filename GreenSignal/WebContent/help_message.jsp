<%@page import="java.util.ArrayList"%>
<%@page import="com.model.HelpDTO"%>
<%@page import="com.model.HelpDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>그린 시그널 - 고객 요청사항</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
   type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.css" rel="stylesheet">
</head>
<body class="bg-gradient-warning">


   <%
   
    HelpDAO dao = new HelpDAO();
    HelpDTO dto;
    String deck = request.getParameter("deck");
    System.out.println(deck + "덱");
    ArrayList<HelpDTO> list = new ArrayList<HelpDTO>();
    list = dao.select(deck);
    
   
    
   %>

   <div class="container" style="margin:auto;">
   
      <div class="card o-hidden border-0 shadow-lg fit"
         style="margin-top: 30px">
         <div class="card-body">

            <div class="col-lg-60">
               <div>

                  <!-- 데크 번호 -->
                  <div class="text-center text-primary font-weight-bold"
                     style="font-size: 18px" id="deck">
                                    
                 	 데크번호 <% out.print(list.get(0).getDeck_num()); %>
                  <br>                  
                  </div>
                  
                  
                  
                  <!-- 아이디, 이름, 전화번호-->                  
                  <div id="name_tel" class="text-right">
                  ID : <% out.print(list.get(0).getId()); %>
                  <br>
                  <% out.print(list.get(0).getName()); %> ( 
                  <% String tel = list.get(0).getTel(); 
                 
                  String tel_mod = tel.substring(0,3)+'-'+ tel.substring(3,7)+'-'+ tel.substring(7,11);
                  out.print(tel_mod);
                  %> )
                  </div>
                  <hr>


                  <!-- 요청 내용 -->
                  <div class="text-primary font-weight-bold">문의 내용</div>
                     <br>
                  <div id="content">
                     <% out.print(list.get(0).getContent()); %>
                     
                     <br> <br>
                  </div>
                  <hr>
                  
                  
                  <div class="align-text-bottom text-center">
                     <input id="confirm" type="button"
                        class="btn btn-primary btn-user btn-block" value="확인"
                        onClick="confirm()">

                  </div>
               </div>

            </div>
         </div>
      </div>
   </div>

   <script>
      

      var node1 = document.getElementById("deck");
      var node2 = document.getElementById("name_tel");
      var node3 = document.getElementById("content");
      
      /* node1.innerHTML = "데크 번호  " + deck;
      node2.innerHTML = "<strong>고객정보</strong> <br>" + name + "(" + tel + ")";
      node3.innerHTML = content;
 */      
      
      
      
   </script>
   
   
   
   <script>
   var confirm = function() {
      window.close();
   };
        
   </script>
   
   
</body>




</html>