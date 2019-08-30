<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@page import="IOT.ContextDAO" %>
    <%@page import="IOT.ListDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="cdata" class="IOT.FileDTO"/> 
<jsp:useBean id="rdata" class="IOT.ReplyDTO"/>
<jsp:useBean id="data" class="IOT.ListDTO"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>

<!-- 게시물 출력 부분 -->

<%
String Headinfo=null;

int TotalReply=0;
Headinfo=request.getParameter("Head");
if(Headinfo!=null){
	ContextDAO contents=new ContextDAO();
	TotalReply=contents.getConnect(Headinfo);
	contents.CnextRow(cdata);
%>
<div>
<table class="table table-bordered">
<tr>
<td>글번호 : <%=cdata.getDataList() %></td>
<td>제목 : <%=cdata.getHead() %></td>
<td>작성일 :<%=cdata.getDate() %></td>
<td>글쓴이 : <%=cdata.getWritter() %></td>
<tr>
<td colspan="4" style="width:100%">내용 : <%=cdata.getBody() %></td>
</table>
</div>
<!-- 뎃글 출력 부분 -->
<div>
<%
boolean D;
D=contents.RnextRow(rdata);
if(D){
%>
<table class="table table-striped">
<%for(int i=0; i<TotalReply; i++){ %>
<tr>
<td><%=rdata.getWritter() %></td>
<td><%=rdata.getBody() %></td>
<td><%=rdata.getDate() %></td>
<tr><%contents.RnextRow(rdata); %>
<%} %>
</table>
</div>
<%
}
contents.ExitConnection();
%>
<!-- 뎃글 입력 부분 -->
<div>
<form action="../proc/replyproc.jsp" method="get">
<table>
<tr>
<td><%=session.getAttribute("userName") %>님의 덧글 </td>
<input type="hidden" name="Writter" value="<%=session.getAttribute("userName") %>">
<input type="hidden" name="LetterList" value="<%=Headinfo%>">
<td>
<div class="row">
<div class="col-lg-6">
    <div class="input-group">
      <input type="text" name="Body" class="form-control" placeholder="덧글을 입력해주세요">
      <span class="input-group-btn">
        <button type="submit" class="btn btn-default">저 장</button>
      </span>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
</div><!-- /.row -->

</table>
</form>
</div>
<!-- 버튼 박스 모음 -->
<div class="btn-group" role="group" aria-label="...">
  <button type="button" onclick="javascript:location.href='subscript.jsp'" class="btn btn-default">글쓰기</button>
<%
if(session.getAttribute("userName").equals(cdata.getWritter())){//작성자와 접속자가 같으면 삭제 버튼 노출
%>
<form action="../proc/removeproc.jsp" method="post">
<input type="hidden" name="LetterList" value="<%=Headinfo %>">
  <button type="submit" class="btn btn-default">삭제</button>
</form>
<%
}
%>
</div>
<%
}
%>
<!-- 글목록 출력 부분 -->
<div>
<%
int CurrentPage=0,TotalPage=0;
String pageD=null;
ListDAO list=new ListDAO();
if(request.getParameter("page")==null){ //list 객체 초기화 부분
	if(request.getParameter("Search")!=null){
		TotalPage=list.Search(request.getParameter("Search"), 10, 0);
		CurrentPage=1;
	}else{
		TotalPage=list.getConnect(10,0); //10개의 목록을 불러옴.
		CurrentPage=1;
	}
}else{
	CurrentPage=Integer.parseInt(request.getParameter("page"));
	if(request.getParameter("Search")!=null)
	//CurrentPage=(int)session.getAttribute("page");
		TotalPage=list.Search(request.getParameter("Search"), 10, CurrentPage);
	else
		TotalPage=list.getConnect(10,CurrentPage);
}
list.nextRow(data);

%>
<table class="table">
<tr><td>글목록</td><td>제목</td><td>작성자</td><td>작성일자</td></tr>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%if(list.nextRow(data)){ %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%}if(list.nextRow(data)){ %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%}if(list.nextRow(data)){ %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%}if(list.nextRow(data)){ %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%}if(list.nextRow(data)){ %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%}if(list.nextRow(data)){ %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%}if(list.nextRow(data)){ %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%}if(list.nextRow(data)){ %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%}if(list.nextRow(data)){ %>
<tr><td><jsp:getProperty name="data" property="letterNum"/></td>
<td><a href="userNotice.jsp?Head=<%=data.getLetterNum() %>"><jsp:getProperty name="data" property="LHead"/></a></td>
<td><jsp:getProperty name="data" property="LWritter"/></td>
<td><jsp:getProperty name="data" property="LDate"/></td>
</tr><%}if(list.nextRow(data)) %>

</table>
</div>

<!-- 버튼 툴바 -->

    
 <form class="form-inline"action="userNotice.jsp" method="get">
 <div class="row">
  <div class="col-lg-6">
<div class="btn-group" role="group" aria-label="...">
  <%if(CurrentPage==1){ %>  
  <button disabled="disabled" type="button" class="btn btn-default">이전 페이지</button>
  <%}else{ %>
  <button type="button" class="btn btn-default" onclick="javascript:location.href='userNotice.jsp?page=<%=CurrentPage-1%>'">이전 페이지</button>
  <%} %>


<div class="btn-group" role="group" aria-label="...">
<%
int PageForSearch=0;
if(request.getParameter("Search")!=null)
	for(int i=1; i<=TotalPage; i++){ %>
	  <button type="button" class="btn btn-default" onclick="javascript:location.href='userNotice.jsp?page=<%=i%>&Search=<%=request.getParameter("Search")%>'"><%=i%></button>
	  <%}
else
for(int i=1; i<=TotalPage; i++){ %>
  <button type="button" class="btn btn-default" onclick="javascript:location.href='userNotice.jsp?page=<%=i%>'"><%=i%></button>
  <%} %>
</div>


    
  <%if(CurrentPage<TotalPage){ //옵션 필요.%>  
  <button type="button" class="btn btn-default" onclick="javascript:location.href='userNotice.jsp?page=<%=CurrentPage+1%>'">다음 페이지</button>
  <%}else{ %>
  <button disabled="disabled" type="button" class="btn btn-default">다음 페이지</button>
  <%} %>
    
 </div>
 </div>
 </div>
  <div class="row">
  <div class="col-lg-6">
 <div class="input-group">
      <input type="text" name="Search"class="form-control" placeholder="Search for...">
     
      <span class="input-group-btn">
        <button class="btn btn-default" type="submit">검색</button>
      </span>

	</div>
	 </div>
 </div>
</form>
<div class="btn-group" role="group" aria-label="...">
  <button type="button" onclick="javascript:location.href='subscript.jsp'" class="btn btn-default">글쓰기</button>
</div>
</body>
</html>