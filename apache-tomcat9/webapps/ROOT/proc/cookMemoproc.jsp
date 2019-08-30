<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="IOT.CookDAO" %>
    <%@ page import="IOT.CookDTO" %>
    
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
CookDAO Cook=new CookDAO();
CookDTO Data=new CookDTO();

Data.setMeat(request.getParameter("meat"));
Data.setSnack(request.getParameter("snack"));
Data.setAntiparticipated(request.getParameter("antiparticipated"));
Data.setVegetable(request.getParameter("vegetable"));
Data.setEtc(request.getParameter("etc"));
Data.setDaily_product(request.getParameter("daliy_product"));

Cook.OlnyConnect();
Cook.MemoUpdate(Data);

String JumpURL="../contents/eatschedule.jsp";
response.sendRedirect(JumpURL);
%>
</body>
</html>