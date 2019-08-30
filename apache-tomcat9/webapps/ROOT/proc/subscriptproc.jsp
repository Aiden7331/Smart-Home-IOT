<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="IOT.*" %>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="QueryUp" class="IOT.MemoDTO"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<jsp:setProperty property="*" name="QueryUp"/>
<%
	MemoDAO memodao=new MemoDAO();
	memodao.MemoUpdate(QueryUp);
	response.sendRedirect("../contents/userNotice.jsp");
%>

</body>
</html>