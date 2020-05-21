<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
			String id = request.getParameter("id");
			if(id!=null&&id.equals("10")){
				
				String loginId = null;
		   		PreparedStatement pst=null;
		   	 	ResultSet rs=null;
		    	int cnt = -1;
		    	Class.forName("org.mariadb.jdbc.Driver");
		    	String dburl = "jdbc:mariadb://172.30.1.29:3306/sound";
		    	String dbid = "hr";
		    	String dbpw = "hr";
		    
		   	 	Connection conn = DriverManager.getConnection(dburl,dbid,dbpw);
		    	String sql= "update btnSound set no=1";
		    	pst = conn.prepareStatement(sql);
		    	cnt = pst.executeUpdate();
		    	if(cnt >0){
		       		out.println("성공");
		    	}else{
		       		out.println("실패");
		    	}
			
			}
		
			
		
	
	%>
</body>
</html>