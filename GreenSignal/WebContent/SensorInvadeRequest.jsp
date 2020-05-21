<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.db.SensorDTO"%>
<%@page import="com.db.SensorDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
	
		if(id!=null){
		   SensorDAO dao = new SensorDAO();
		   
		   // 임시 아이디 값을 다시 넘겨줌 
		   String returns = dao.sensorInvadeCk(id);
		   
		   System.out.println(returns);

		   // 안드로이드로 전송
		   out.println(returns);
		   
	   }
	
	%>
</body>
</html>