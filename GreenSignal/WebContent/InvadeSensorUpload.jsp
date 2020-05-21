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
			System.out.println("침입 감지 업로드 성공");
		}else{
			System.out.println("업로드 실패");
		}
		
	}
	
	%>
</body>
</html>