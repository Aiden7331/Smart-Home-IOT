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
<font color="red">*아이디를 클릭하면 회원정보 수정 및 관리권한을 부여할 수 있습니다.</font><br>
<table class="table table-striped">
<tr>
<td> 목록 </td>
<td> 사용자 ID </td>
<td> 사용자 이름</td>
<td>전화번호</td>
<td>웹 관리자</td>
<td>주부 권한</td>
<td>IOT 관리자</td>
<td>계정삭제</td>
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
<td><button type="submit" onclick="javascript:location.href='../../proc/UserRemoveProc.jsp?serialnum=<%=QueryDown.getSeral()%>'">계정 삭제</button></tr>
</form>
<%user.nextRow(QueryDown);
}
%>
</table>
</body>
</html>