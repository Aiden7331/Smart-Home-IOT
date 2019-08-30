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
<!-- 회원 승인 입력 폼 -->
<%
int Total,current=0;
UserDAO user=new UserDAO();
user.getConnect();
Total=user.LoadUserInfo();
user.nextRow(QueryDown);
%>
<form method="POST" action="../../proc/UserApprovalProc.jsp" name="Approve">
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
<td>계정승인</td>
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
<td><button type="submit" name="userinfo" value= value="<%=QueryDown.getID()%>">승인</button></tr>
<%
user.nextRow(QueryDown);
}
%>
</table>
</form>
</body>
</html>