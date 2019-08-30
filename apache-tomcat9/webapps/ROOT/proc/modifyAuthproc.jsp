<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="IOT.UserDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:useBean id="QueryDown" class="IOT.UserDTO"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%UserDAO Modifer=new UserDAO();

Modifer.getConnect();
Modifer.LoadUserList(request.getParameter("serialnum"));
Modifer.nextRow(QueryDown);
%><%=QueryDown.getSeral() %>
<% 
boolean WEB=false,COOKER=false,IOT=false,Tool=true;
String box[]=request.getParameterValues("radio");
if(box!=null)
for(int i=0; i<box.length; i++){
	%><%=box[i]%><%
if(box[i].equals("web")==true)
	WEB=true;
else if(box[i].equals("cook")==true)
	COOKER=true;
else if(box[i].equals("IOT")==true)
	IOT=true;
}
if(WEB!=true&&COOKER!=true&&IOT!=true)
	Tool=Modifer.ModifyAuth(QueryDown, "NormalMember");
else if(WEB==true&&COOKER!=true&&IOT!=true)
	Tool=Modifer.ModifyAuth(QueryDown, "Admin");
else if(WEB!=true&&COOKER==true&&IOT!=true)
	Tool=Modifer.ModifyAuth(QueryDown, "Cooker");
else if(WEB!=true&&COOKER!=true&&IOT==true)
	Tool=Modifer.ModifyAuth(QueryDown, "IOTAdmin");
else if(WEB==true&&COOKER==true&&IOT!=true)
	Tool=Modifer.ModifyAuth(QueryDown, "CookerWeb");
else if(WEB==true&&COOKER!=true&&IOT==true)
	Tool=Modifer.ModifyAuth(QueryDown, "IOTWeb");
else if(WEB==true&&COOKER==true&&IOT==true)
	Tool=Modifer.ModifyAuth(QueryDown, "Master");
else if(WEB!=true&&COOKER==true&&IOT==true)
	Tool=Modifer.ModifyAuth(QueryDown, "CookerIOT");
%>
<%=Tool %>
</body>
</html>