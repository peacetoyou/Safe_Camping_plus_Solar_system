<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.db.HelpDTO"%>
<%@page import="com.db.HelpDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	   request.setCharacterEncoding("UTF-8");
	   String id = request.getParameter("id");
	   String help = request.getParameter("help");
	
	   System.out.println(id);
	   System.out.println(help);
	   
	   if(id!=null && help !=null){
		   HelpDTO dto = new HelpDTO(id,help);
		   HelpDAO dao = new HelpDAO();
		   
		   // 임시 아이디 값을 다시 넘겨줌 
		   String returns = dao.insertRequest(dto);

		   System.out.println(returns+"요청전송이 성공했습니다");

		   // 안드로이드로 전송
		   out.println(returns);
	   }
	   
	%>
</body>
</html>