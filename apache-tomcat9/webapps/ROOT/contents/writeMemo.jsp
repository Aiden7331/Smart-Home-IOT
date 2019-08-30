<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--calender 객체가져오기 -->
<%
Calendar time= Calendar.getInstance();
int year=time.get(Calendar.YEAR);
int month=time.get(Calendar.MONTH);
int date=time.get(Calendar.DATE);
String[] option=new String[5];
option[0]=year+"."+month+"."+date;
time.add(Calendar.DAY_OF_MONTH,+1);
month=time.get(Calendar.MONTH);;
date=time.get(Calendar.DAY_OF_MONTH);
option[1]=year+"."+month+"."+date;
time.add(Calendar.DAY_OF_MONTH,+1);
month=time.get(Calendar.MONTH);;
date=time.get(Calendar.DAY_OF_MONTH);
option[2]=year+"."+month+"."+date;
time.add(Calendar.DAY_OF_MONTH,+1);
month=time.get(Calendar.MONTH);;
date=time.get(Calendar.DAY_OF_MONTH);
option[3]=year+"."+month+"."+date;
time.add(Calendar.DAY_OF_MONTH,+1);
month=time.get(Calendar.MONTH);;
date=time.get(Calendar.DAY_OF_MONTH);
option[4]=year+"."+month+"."+date;
%>
<!-- 메모 기능 -->
<div>
<form action="../proc/cookMemoproc.jsp" method="get">
  <div class="form-group">
    <label for="exampleInputEmail1">야채</label>
    <input type="text" name="vegetable" class="form-control" placeholder="야채">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">육류</label>
    <input type="text" name="meat" class="form-control" placeholder="육류">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">유제품</label>
    <input type="text" name="daliy_product" class="form-control" placeholder="유제품">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">간식</label>
    <input type="text" name="snack" class="form-control" placeholder="간식">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">기타</label>
    <input type="text" name="etc" class="form-control" placeholder="기타">
  </div>
   <label for="exampleInputPassword1">구매예정일</label>
  <select multiple name="antiparticipated" class="form-control">
  	<option value="<%=option[0]%>"><%=option[0]%></option>
  	<option value="<%=option[1]%>"><%=option[1]%></option>
  	<option value="<%=option[2]%>"><%=option[2]%></option>
  	<option value="<%=option[3]%>"><%=option[3]%></option>
  	<option value="<%=option[4]%>"><%=option[4]%></option>
  </select>
  <button type="submit" class="btn btn-default">저장</button>
</form>
</div>
</body>
</html>