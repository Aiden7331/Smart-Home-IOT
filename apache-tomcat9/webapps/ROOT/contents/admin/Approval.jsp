<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="IOT.UserDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<jsp:useBean id="QueryDown" class="IOT.UserDTO"></jsp:useBean>
<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- ȸ�� ���� �Է� �� -->
<%
int Total,current=0;
UserDAO user=new UserDAO();
user.getConnect();
Total=user.LoadUserInfo();
user.nextRow(QueryDown);
%>
<form method="POST" action="../../proc/UserApprovalProc.jsp" name="Approve">
<font color="red">*���̵� Ŭ���ϸ� ȸ������ ���� �� ���������� �ο��� �� �ֽ��ϴ�.</font><br>
<table class="table table-striped">
<tr>
<td> ��� </td>
<td> ����� ID </td>
<td> ����� �̸�</td>
<td>��ȭ��ȣ</td>
<td>�� ������</td>
<td>�ֺ� ����</td>
<td>IOT ������</td>
<td>��������</td>
</tr>
<%for(int list=1; list<=Total; list++){ %>
<tr>
<td><%=list %></td>
<td><%=QueryDown.getID()%></td>
<td><%=QueryDown.getName()%></td>
<td><%=QueryDown.getTelNum() %></td>
<td><%=QueryDown.getAdminAuth() %></td>
<td><%=QueryDown.getCookerAuth() %></td>
<td><%=QueryDown.getIOTAdmin() %></td>
<input type="hidden" name="ID" value="<%=QueryDown.getID()%>"/>
<td><button type="submit" name="userinfo" value= value="<%=QueryDown.getID()%>">����</button></tr>
<%
user.nextRow(QueryDown);
}
%>
</table>
</form>
</body>
</html>