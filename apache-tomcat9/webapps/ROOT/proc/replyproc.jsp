<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="IOT.replyUpDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="data" class="IOT.ReplyDTO"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<%
String body=new String (request.getParameter("Body"));
data.setWritter(request.getParameter("Writter"));
data.setLetterList(request.getParameter("LetterList"));
data.setBody(body);
replyUpDAO Reply=new replyUpDAO();
Reply.getConnectAndUpLoad(data);
String JumpURL="../contents/userNotice.jsp?Head="+data.getLetterList();
response.sendRedirect(JumpURL);
%>
</body>
</html>