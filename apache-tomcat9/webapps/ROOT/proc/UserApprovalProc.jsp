<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="IOT.UserDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:useBean id="QueryDown" class="IOT.UserDTO"></jsp:useBean>
</head>
<body>
<%
UserDAO user=new UserDAO();
user.getConnect();
QueryDown.setID(request.getParameter("ID"));
user.Approval(QueryDown);
response.sendRedirect("../contents/admin/Approval.jsp");
%>
</body>
</html>