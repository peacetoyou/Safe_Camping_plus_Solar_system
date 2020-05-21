<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.db.CampDTO"%>
<%@page import="com.db.CampDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	 
	   String id = request.getParameter("id");
	   String pw = request.getParameter("pw");
	   
	   if(id!=null && pw !=null){
		   CampDTO dto = new CampDTO(id,pw);
		   CampDAO dao = new CampDAO();
		   
		   // 임시 아이디 값을 다시 넘겨줌 
		   String returns = dao.loginId(dto);

		   System.out.println(returns);

		   // 안드로이드로 전송
		   out.println(returns);
		   
	   }
	   
		
	   
	%>


</body>
</html>