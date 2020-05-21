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
				System.out.println("업로드 성공");
			}else{
				System.out.println("업로드 실패");
			}
			
		}
	
	%>
</body>
</html>