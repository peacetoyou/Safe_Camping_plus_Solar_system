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
	
		if( id != null){
			SensorDAO dao = new SensorDAO();

			String ck = dao.fireUpload(id,"0");
			
			if(ck.equals("success")){
				System.out.println("���ε� ����");
			}else{
				System.out.println("���ε� ����");
			}
			
		}
	
	%>
</body>
</html>