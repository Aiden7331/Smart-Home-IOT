<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="IOT.UserDAO" %>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><jsp:useBean id ="QueryUp" class="IOT.UserDTO" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
QueryUp.setID(request.getParameter("userID"));
QueryUp.setPW(request.getParameter("PW"));
QueryUp.setName(request.getParameter("name"));
String tmp1=request.getParameter("Telnum1");
String tmp2=request.getParameter("Telnum2");
String Telnum="010-"+tmp1+"-"+tmp2;
QueryUp.setTelNum(Telnum);

UserDAO SignUpMaker= new UserDAO();
SignUpMaker.getConnect();
SignUpMaker.Signup(QueryUp, "NormalMember");
%>
<script>
javascript:alert("관리자에게 회원정보가 전송되었습니다. 승인을 기다리세요!");
javascript:location.href("../html/login.html");
</script>
</body>
</html>