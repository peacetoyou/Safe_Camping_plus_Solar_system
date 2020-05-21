<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.db.LiveChargeDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String charge = request.getParameter("charge");
		if(charge!=null){
			LiveChargeDAO live = new LiveChargeDAO();
			String result = live.uploadLive(charge);
   			if(result.equals("success")){
				System.out.println("전력 업로드 성공");
			}else{
				System.out.println("전력 업로드 실패");
			}
		}
	
	
	%>
</body>
</html>