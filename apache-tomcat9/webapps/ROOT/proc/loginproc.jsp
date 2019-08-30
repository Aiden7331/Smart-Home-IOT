<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.net.URLEncoder" %>
    <%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% String id= request.getParameter("ID");
   String pw= request.getParameter("PW");
   
   //db connection part
   
    Connection conn=null;
    Class.forName("com.mysql.jdbc.Driver"); 
    String url="jdbc:mysql://localhost:3306/UserWeb";
    conn= DriverManager.getConnection(url,"root","IOT123");
    String sql="select * from userInfo where id='"+id+"'";
    PreparedStatement pstmt=conn.prepareStatement(sql);
    ResultSet tableP=pstmt.executeQuery();

    String DBid=null,DBpw=null,userName=null,adminAuth=null,Enable=null;
    while(tableP.next()){
    	DBid=tableP.getString("id");
    	DBpw=tableP.getString("pw");
    	userName=tableP.getString("name");
    	adminAuth=tableP.getString("adminauth");
    	Enable=tableP.getString("enable");
    	
    }
    
   if(id.equals(DBid)&&pw.equals(DBpw)&&Enable.equals("1")){
		session.setAttribute("ID",id);
	    session.setAttribute("userName",userName);
	    session.setAttribute("adminAuth",adminAuth);
		response.sendRedirect("../main.jsp");
   }else{%>
   <script>
   		javascript:alert ("관리자에게 문의하세요!");
   		javascript:location.href="../html/login2.html";	
   </script>
   <%
   //response.sendRedirect("../html/login2.html");
   }
   
%>
</body>
</html>