<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="IOT.ASDAO" %>
<jsp:useBean id="hw" class="IOT.HWDTO"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
ASDAO controller=new ASDAO();
controller.getConnect();
controller.getRow(hw);
%>
스마트홈 Status
<table class="table table-striped">
<tr>
<td>HW 전원</td>
<td><%=hw.getPower() %></td>
</tr><tr>
<td>거실 온도</td>
<td><%=hw.getLivingTemp() %></td>
</tr><tr>
<td>거실 습도</td>
<td><%=hw.getLivingHumi() %></td>
</tr><tr>
<td>침실 온도</td>
<td><%=hw.getBedTemp() %></td>
</tr><tr>
<td>침실 습도</td>
<td><%=hw.getBedHumi() %></td>
</tr><tr>
<td>주차 차량</td>
<td><%=hw.getPark() %></td>
</tr>
</table>

</body>
</html>