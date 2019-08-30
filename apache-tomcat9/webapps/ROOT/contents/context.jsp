<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="IOT.ContextDAO" %>
    <%@page import="IOT.ListDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="cdata" class="IOT.FileDTO"/> 
<jsp:useBean id="rdata" class="IOT.ReplyDTO"/>
<jsp:useBean id="data" class="IOT.ListDTO"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!-- 게시물 출력 부분 -->

<%
String Headinfo=null;
Headinfo=request.getParameter("Head");

if(Headinfo!=null){
	ContextDAO contents=new ContextDAO();
	contents.getConnect(Headinfo);
	contents.CnextRow(cdata);
%>
<div>
<table>
<tr>
<td>글번호 : <%=cdata.getDataList() %></td>
<td> 제목 : <%=cdata.getHead() %></td>
<td>글쓴이 : <%=cdata.getWritter() %></td>
<td>작성일 :<%=cdata.getDate() %></td>
</tr>

<tr>
<td>내용 : <%=cdata.getBody() %></td>
</tr>
</table>
</div>
<!-- 뎃글 출력 부분 -->
<div>
<%
contents.RnextRow(rdata);
%>
<table>
<tr><td>작성자:<%=rdata.getWritter() %></td>
<td>내용: <%=rdata.getBody() %></td>
<td><%=rdata.getDate() %></td>
<tr>
</table>
</div>
<%
contents.ExitConnection();
}
%>

<div>
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
list.nextRow(data);

%>
<table>
<tr><td>글목록</td><td>제목</td><td>작성자</td><td>작성일자</td></tr>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="context.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%list.nextRow(data); %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="context.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%list.nextRow(data); %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="context.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%list.nextRow(data); %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="context.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%list.nextRow(data); %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="context.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%list.nextRow(data); %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="context.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%list.nextRow(data); %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="context.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%list.nextRow(data); %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="context.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%list.nextRow(data); %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="context.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%list.nextRow(data); %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="context.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr>
</table>
현제 페이지 <%=CurrentPage %>
</div>
<div>
<form method="get" action="userNotice.jsp">
<%if(TotalPage==1){ %>
<input type="submit" value="이전 페이지">
<%}else{ %>
<input type="submit" value="이전 페이지">
<%} %>
<input type="hidden" value="previous" id="page">
</form>
<form method="get" action="userNotice.jsp">
<%if(TotalPage==1){ %>
<input type="submit" value="다음 페이지">
<%}else{ %>
<input type="submit" value="다음 페이지">
<%} %>
<input type="hidden" value="later" id="page">
</form>
</div>
</body>
</html>