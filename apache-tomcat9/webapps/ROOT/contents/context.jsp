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

<!-- �Խù� ��� �κ� -->

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
<td>�۹�ȣ : <%=cdata.getDataList() %></td>
<td> ���� : <%=cdata.getHead() %></td>
<td>�۾��� : <%=cdata.getWritter() %></td>
<td>�ۼ��� :<%=cdata.getDate() %></td>
</tr>

<tr>
<td>���� : <%=cdata.getBody() %></td>
</tr>
</table>
</div>
<!-- ���� ��� �κ� -->
<div>
<%
contents.RnextRow(rdata);
%>
<table>
<tr><td>�ۼ���:<%=rdata.getWritter() %></td>
<td>����: <%=rdata.getBody() %></td>
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
if(session.getAttribute("page")==null){ //list ��ü �ʱ�ȭ �κ�
	TotalPage=list.getConnect(10,0); //10���� ����� �ҷ���.
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
<tr><td>�۸��</td><td>����</td><td>�ۼ���</td><td>�ۼ�����</td></tr>
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
���� ������ <%=CurrentPage %>
</div>
<div>
<form method="get" action="userNotice.jsp">
<%if(TotalPage==1){ %>
<input type="submit" value="���� ������">
<%}else{ %>
<input type="submit" value="���� ������">
<%} %>
<input type="hidden" value="previous" id="page">
</form>
<form method="get" action="userNotice.jsp">
<%if(TotalPage==1){ %>
<input type="submit" value="���� ������">
<%}else{ %>
<input type="submit" value="���� ������">
<%} %>
<input type="hidden" value="later" id="page">
</form>
</div>
</body>
</html>