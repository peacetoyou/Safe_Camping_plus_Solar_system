<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.db.LiveDAO"%>
    <%@page import="com.db.LiveChargeDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
       <%
       		String watt = request.getParameter("watt");
    		String charge = request.getParameter("charge");
       		if(watt!=null){
       			LiveDAO live = new LiveDAO();
       			String result = live.uploadLive(watt);
       			if(result.equals("success")){
    				System.out.println(watt+"  ���� ���ε� ����");
    			}else{
    				System.out.println("���� ���ε� ����");
    			}
       		}
       		
    		if(charge!=null){
    			LiveChargeDAO live = new LiveChargeDAO();
    			String result = live.uploadLive(charge);
       			if(result.equals("success")){
    				System.out.println(charge+"  ���͸� �ܷ� ���ε� ����");
    			}else{
    				System.out.println("���͸� �ܷ� ���ε� ����");
    			}
    		}
       		
       %>
</body>
</html>