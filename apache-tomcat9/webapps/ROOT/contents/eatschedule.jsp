<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="IOT.CookDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="QueryDown" class="IOT.CookDTO"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- �ۼ��� �޸� -->
<%
CookDAO COOK=new CookDAO();


if(request.getParameter("remove")!=null){
	COOK.OlnyConnect();
	COOK.rmRow(request.getParameter("remove"));
}
int TotalPage=COOK.getConnect();
int CurrentPage=1;
if(request.getParameter("page")!=null){
	CurrentPage=Integer.parseInt(request.getParameter("page"));
	for(int i=0; i<CurrentPage; i++)
		COOK.nextRow(QueryDown);
}else
COOK.nextRow(QueryDown);
%>

<div class="btn-group" role="group" aria-label="...">
  <button type="button" onclick="javascript:location.href='eatschedule.jsp?remove=<%=QueryDown.getAntiparticipated()%>'" class="btn btn-default">�� �޸� �����ϱ�</button>
</div>

 <h1>�޸� (<%=QueryDown.getInputDate() %>)</h1>
<div>
<dl class="dl-horizontal">
  <dt>��ä</dt>
  <dd><%=QueryDown.getVegetable() %></dd>
  <dt>����</dt>
  <dd><%=QueryDown.getMeat() %></dd>
  <dt>����ǰ</dt>
  <dd><%=QueryDown.getDaily_product() %></dd>
  <dt>����</dt>
  <dd><%=QueryDown.getSnack() %></dd>
  <dt>��Ÿ</dt>
  <dd><%=QueryDown.getEtc() %></dd>
  <dt>���ſ�����</dt>
  <dd><%=QueryDown.getAntiparticipated() %></dd>
</dl>
</div>
<!-- ��ư ���� -->
 <div class="row">
  <div class="col-lg-6">
<div class="btn-group" role="group" aria-label="...">
  <%if(CurrentPage==1){ %>  
  <button disabled="disabled" type="button" class="btn btn-default">���� ������</button>
  <%}else{ %>
  <button type="button" class="btn btn-default" onclick="javascript:location.href='eatschedule.jsp?page=<%=CurrentPage-1%>'">���� ������</button>
  <%} %>


<div class="btn-group" role="group" aria-label="...">
<%
int PageForSearch=0;
for(int i=1; i<=TotalPage; i++){ %>
  <button type="button" class="btn btn-default" onclick="javascript:location.href='eatschedule.jsp?page=<%=i%>'"><%=i%></button>
  <%} %>
</div>

  <%if(CurrentPage<TotalPage){ //�ɼ� �ʿ�.%>  
  <button type="button" class="btn btn-default" onclick="javascript:location.href='eatschedule.jsp?page=<%=CurrentPage+1%>'">���� ������</button>
  <%}else{ %>
  <button disabled="disabled" type="button" class="btn btn-default">���� ������</button>
  <%} %>
    
 </div>
 </div>
 </div>
 
</body>
</html>