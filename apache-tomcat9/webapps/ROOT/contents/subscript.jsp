<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*"%>
    
<%
//request.setCharacterEncoding("utf-8");
//response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<title>Insert title here</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
String Writter=null;
if(session.getAttribute("userName")==null){
	%> <script>
	javascript:alert("로그인 해주세요!");
	javascript:location.href='../html/login.html';
	</script><%
}else{
Writter=(String)session.getAttribute("userName");
}%>

<form class="form-horizontal" action="../proc/subscriptproc.jsp" method="post" name="subscriptprocess" accept-charset="utf-8">
  <div class="form-group">
    <label for="indicatorOfWriter" class="col-sm-2 control-label"><%=Writter %> 님의 글</label>
    <input type="hidden" name="LWritter" value="<%=Writter %>">
  </div>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">제목</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="LHead" id="inputEmail3" placeholder="Email">
    </div>
  </div>
  <div class="form-group">
    <label for="inputText" class="col-sm-2 control-label">내용</label>
    <div class="col-sm-10">
      <textarea class="form-control" rows="20" name="LBody"></textarea></div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-default" onclick="javascript:location.href='userNotice.jsp'">취소</button>
      <button type="submit" class="btn btn-default">저장</button>
    </div>
  </div>
</form>


</body>
</html>