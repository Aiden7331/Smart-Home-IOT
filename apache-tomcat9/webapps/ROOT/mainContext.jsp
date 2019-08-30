<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="IOT.ListDAO" %>
<%@ page import="IOT.CookDAO" %>
<jsp:useBean id="data" class="IOT.ListDTO"/>
<jsp:useBean id="QueryDown" class="IOT.CookDTO"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
<div style="width:100%;">
<!--  가족 게시판 출력 부분  -->
<div style="width:50%; float:right;">
<%
int CurrentPage=0,TotalPage=0;
String pageD=null;
ListDAO list=new ListDAO();
if(session.getAttribute("page")==null){ //list 객체 초기화 부분
	TotalPage=list.getConnect(10,0); //10개의 목록을 불러옴.
	CurrentPage=1;
	session.setAttribute("page", CurrentPage);
}else{
	CurrentPage=(int)session.getAttribute("page");
	TotalPage=list.getConnect(10,CurrentPage);
	pageD=request.getParameter("page");
	if(pageD!=null)
		CurrentPage=list.ModifyBeanPage(pageD);
}
if(list.nextRow(data));

%>
최신 게시물&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="contents/userNotice.jsp">더보기</a>
<table class="table table-striped">
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="contents/userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
</tr><%list.nextRow(data); %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="contents/userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
</tr><%list.nextRow(data); %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="contents/userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
</tr><%list.nextRow(data); %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="contents/userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
</tr><%list.nextRow(data); %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="contents/userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
</tr>
</table>
</div>
<!-- 메모 출력 -->
<div style="width:50%; float:left;">
<%
CookDAO COOK=new CookDAO();
int trash=COOK.getConnect();

COOK.nextRow(QueryDown);
%>

<b><font size="3">메모 작성일:<%=QueryDown.getInputDate() %></font></b>
<div style="float:left;">
<dl class="dl-horizontal">
  <dt>야채</dt>
  <dd><%=QueryDown.getVegetable() %></dd>
  <dt>육류</dt>
  <dd><%=QueryDown.getMeat() %></dd>
  <dt>유제품</dt>
  <dd><%=QueryDown.getDaily_product() %></dd>
  <dt>간식</dt>
  <dd><%=QueryDown.getSnack() %></dd>
  <dt>기타</dt>
  <dd><%=QueryDown.getEtc() %></dd>
  <dt>구매예정일</dt>
  <dd><%=QueryDown.getAntiparticipated() %></dd>
</dl>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="contents/eatschedule.jsp">메모 작성하러 가기</a>
</div>
</div>

</div>

</body>
</html>