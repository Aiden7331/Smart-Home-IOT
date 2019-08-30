<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="IOT.dbDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
dbDAO Origin=new dbDAO();
Origin.getConnection();
String SQL="delete from notice where LetterList='"+request.getParameter("LetterList")+"'";
Origin.getQueryUpdate(SQL);
SQL="delete from reply where LetterList='"+request.getParameter("LetterList")+"'";
Origin.getQueryUpdate(SQL);
response.sendRedirect("../contents/userNotice.jsp");
%>
</body>
</html>