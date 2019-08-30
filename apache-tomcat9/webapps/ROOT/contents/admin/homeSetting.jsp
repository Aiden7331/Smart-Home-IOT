<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="IOT.ASDAO" %>
<jsp:useBean id="hw" class="IOT.HWDTO"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<%

if(request.getParameter("key")!=null){
	ASDAO controller=new ASDAO();
	hw.setMfield(request.getParameter("key"));
	controller.pushConnect(hw);
	}
%>


<h1> HW 수동제어창 </h1>

<div> 거실 에어컨 작동
<button type="button" class="btn btn-default btn-lg" onclick="javascript:location.href='homeSetting.jsp?key=LmotorOn'">
  <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 작동
</button>
</div>
<div> 거실 에어컨 정지
<button type="button" class="btn btn-default btn-lg" onclick="javascript:location.href='homeSetting.jsp?key=LmotorOff'">
  <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 정지
</button>
</div>
<div> 침실 에어컨 작동
<button type="button" class="btn btn-default btn-lg" onclick="javascript:location.href='homeSetting.jsp?key=BmotorOn'">
  <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 작동
</button>
</div>
<div> 침실 에어컨 정지
<button type="button" class="btn btn-default btn-lg" onclick="javascript:location.href='homeSetting.jsp?key=BmotorOff'">
  <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 정지
</button>
</div>
<div> 거실 창문 열기
<button type="button" class="btn btn-default btn-lg" onclick="javascript:location.href='homeSetting.jsp?key=exWinOn'">
  <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 열기
</button>
</div>
<div> 거실 창문 닫기
<button type="button" class="btn btn-default btn-lg" onclick="javascript:location.href='homeSetting.jsp?key=exWinOff'">
  <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 닫기
</button>
</div>

</body>
</html>