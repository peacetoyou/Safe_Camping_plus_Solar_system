<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@page import="com.db.SensorDTO"%>
<%@page import="com.db.SensorDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String invade_sensor = request.getParameter("invade");

	if(invade_sensor!=null && id != null){
		SensorDAO dao = new SensorDAO();

		String ck = dao.invadeUpload(id,invade_sensor);
		
		if(ck.equals("success")){
			System.out.println("ħ�� ���� ���ε� ����");
		}else{
			System.out.println("���ε� ����");
		}
		
	}
	
	%>
</body>
</html>