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
		   
		   // �ӽ� ���̵� ���� �ٽ� �Ѱ��� 
		   String returns = dao.loginId(dto);

		   System.out.println(returns);

		   // �ȵ���̵�� ����
		   out.println(returns);
		   
	   }
	   
		
	   
	%>


</body>
</html>