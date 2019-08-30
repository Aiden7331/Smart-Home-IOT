<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="IOT.UserDAO" %>
<html style=" position: relative; min-height: 100%;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:useBean id="QueryUp" class="IOT.UserDTO"/>
<title>Smart Home System - 회원가입</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body style=" margin-bottom: 60px;">
<!-- ID중복확인 JSP -->
<%
String Status=null;
if(request.getParameter("ID")!=null){
	Status=request.getParameter("ID");
	UserDAO Identifer=new UserDAO();
	Identifer.getConnect();
	Status=Identifer.IdentifyID(Status);
	if(Status.equals("ID가 중복됩니다. 다시 입력해주세요.")){%>
		<script>
		javascript:alert("ID가 중복됩니다. 다시 입력해주세요.");
		javascript:location.href="signup.jsp";
		</script>
		<% }
}
%>
<!-- ID 입력 폼 -->
<div style=" width: auto; max-width: 680px; padding: 0 15px;">

<form action="signup.jsp" method="get" name="SignUp">
<h3 class="page-header">회원가입</h3><p></p>
<div class="input-group">
<span class="input-group-addon" id="basic-addon2">ID</span>
<input type="text" name="ID" class="form-control" placeholder="ID" aria-describedby="basic-addon2"><p></p>
</div>
ID는 13자 이내입니다.

<div class="btn-group" role="group" aria-label="...">
  <button type="submit" name="IdentifyID" class="btn btn-default">중복확인</button>
</div>
<%if(Status!=null){ %>
<%=Status %>
<%} %>
</form>

</div>

<!-- 회원가입 정보 입력 폼-->

<div style=" width: auto; max-width: 680px; padding: 0 15px;">
<form action="proc/signUpProc.jsp" method="post" name="SignUpProc">
<input type="hidden" value="<%=request.getParameter("ID") %>" name="userID">

<div class="input-group">
<span class="input-group-addon" id="basic-addon2">PW</span>
<input type="password" name="PW" class="form-control" placeholder="PassWord" aria-describedby="basic-addon2">
</div>
비밀번호는 8자~13자 이내입니다.

<div class="input-group">
<span class="input-group-addon" id="basic-addon2">이름</span>
<input type="text" name="name" class="form-control" placeholder="Username" aria-describedby="basic-addon2">
</div>

<!-- 전화번호 입력 태그 -->
전화번호 <font color="red">*선택입력</font>
<div class="form-inline">
 <div class="form-group">
    <label for="Telnum1">010-</label>
    <input type="text" maxlength="4" size="4" class="form-control" name="Telnum1" id="Telnum1" placeholder="1234">
  </div>
  <div class="form-group">
    <label for="Telnum2">-</label>
    <input type="text" maxlength="4" size="4" class="form-control" name="Telnum2" id="Telnum2" placeholder="1234">
  </div>
</div>
<p><p>
<!-- 방이름 출력 부분 -->
<div class="btn-group" role="group" aria-label="...">
  <button type="submit" class="btn btn-default">입력완료</button>
  <button type="button" class="btn btn-default" id="ToMain" onclick="javascript:location.href='html/login.html'">메인으로</button>
</div>
</form>
</div>
</body>
</html>