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
		   
		   // �ӽ� ���̵� ���� �ٽ� �Ѱ��� 
		   String returns = dao.sensorInvadeCk(id);
		   
		   System.out.println(returns);

		   // �ȵ���̵�� ����
		   out.println(returns);
		   
	   }
	
	%>
</body>
</html>