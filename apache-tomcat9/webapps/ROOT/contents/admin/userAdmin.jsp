<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="IOT.UserDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:useBean id="QueryDown" class="IOT.UserDTO"></jsp:useBean>
<link href="../../css/bootstrap.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
int Total,current=0;
UserDAO user=new UserDAO();
user.getConnect();
Total=user.LoadUserList();
user.nextRow(QueryDown);
%>
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
<td><button type="submit" onclick="javascript:window.open('Modify.jsp?serialnum=<%=QueryDown.getSeral()%>','opner','width=230,height=350')"><%=QueryDown.getID()%></td>
<td><%=QueryDown.getName()%></td>
<td><%=QueryDown.getTelNum() %></td>
<td><%=QueryDown.getAdminAuth() %></td>
<td><%=QueryDown.getCookerAuth() %></td>
<td><%=QueryDown.getIOTAdmin() %></td>
<td><button type="submit" onclick="javascript:location.href='../../proc/UserRemoveProc.jsp?serialnum=<%=QueryDown.getSeral()%>'">���� ����</button></tr>
</form>
<%user.nextRow(QueryDown);
}
%>
</table>
</body>
</html>