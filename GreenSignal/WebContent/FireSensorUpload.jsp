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
		String fire_sensor = request.getParameter("fire");
	
		if(fire_sensor!=null && id != null){
			SensorDAO dao = new SensorDAO();

			String ck = dao.fireUpload(id,fire_sensor);
			
			if(ck.equals("success")){
				System.out.println("ȭ�� ���ε� ����");
			}else{
				System.out.println("���ε� ����");
			}
			
		}
	
	%>
</body>
</html>