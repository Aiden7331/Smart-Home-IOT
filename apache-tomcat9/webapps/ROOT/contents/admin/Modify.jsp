<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="IOT.UserDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:useBean id="QueryDown" class="IOT.UserDTO"></jsp:useBean>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
 rel="stylesheet" 
 integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
 crossorigin="anonymous">

 <style>
@CHARSET "UTF-8";

@font-face {
    font-family: 'NanumPen';
    src: url(fonts/NanumFont_TTF_ALL/NanumPen.ttf) format('truetype');
}

@import('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.0/css/bootstrap.min.css') 

.funkyradio div
 {
  clear: both;
  overflow: hidden;
 
}

.funkyradio label {
  width: 170x;
  border-radius: 3px;
  border: 1px solid #D1D3D4;
  font-weight: normal;
 
  
}

.funkyradio input[type="radio" ]:empty,
.funkyradio input[type="checkbox"]:empty {
  display: none;
  
}

.funkyradio input[type="radio"]:empty ~ label,
.funkyradio input[type="checkbox"]:empty ~ label {
  position: relative;
  line-height: 2.5em;
  text-indent: 3.25em;
  margin-top: 2em;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
          
}

.funkyradio input[type="radio"]:empty ~ label:before,
.funkyradio input[type="checkbox"]:empty ~ label:before {
  position: absolute;
  display: block;
  top: 0;
  bottom: 0;
  left: 0;
  content: '';
  width: 2.5em;
  background: #D1D3D4;
  border-radius: 3px 0 0 3px;

}

.funkyradio input[type="radio"]:hover:not(:checked) ~ label,
.funkyradio input[type="checkbox"]:hover:not(:checked) ~ label {
  color: #888;
  
}

.funkyradio input[type="radio"]:hover:not(:checked) ~ label:before,
.funkyradio input[type="checkbox"]:hover:not(:checked) ~ label:before {
  content: '\2714';
  text-indent: .9em;
  color: #C2C2C2;
  }

.funkyradio input[type="radio"]:checked ~ label,
.funkyradio input[type="checkbox"]:checked ~ label {
  color: #777;
  }

.funkyradio input[type="radio"]:checked ~ label:before,
.funkyradio input[type="checkbox"]:checked ~ label:before {
  content: '\2714';
  text-indent: .9em;
  color: #333;
  background-color: #ccc;
  
}

.funkyradio input[type="radio"]:focus ~ label:before,
.funkyradio input[type="checkbox"]:focus ~ label:before {
  box-shadow: 0 0 0 3px #999;
  }

.funkyradio-success input[type="radio"]:checked ~ label:before,
.funkyradio-success input[type="checkbox"]:checked ~ label:before {
  color: #fff;
  background-color: #5cb85c;
  
}

.funkyradio-danger input[type="radio"]:checked ~ label:before,
.funkyradio-danger input[type="checkbox"]:checked ~ label:before {
  color: #fff;
  background-color: #d9534f;
  }

.funkyradio-warning input[type="radio"]:checked ~ label:before,

.funkyradio-warning input[type="checkbox"]:checked ~ label:before {
  color: #fff;
  background-color: #f0ad4e;

}
 
 .body
{font-family:NanumPen;}


 
 </style>


<title>Insert title here</title>
</head>
<body>
<%UserDAO Modifer=new UserDAO();

Modifer.getConnect();
Modifer.LoadUserList(request.getParameter("serialnum"));
Modifer.nextRow(QueryDown);
%>

<div class="col-md-6">

<form action="../../proc/modifyAuthproc.jsp" method="POST">
<input type="hidden" name="serialnum" value="<%=request.getParameter("serialnum")%>"/>
    <b><h4><%=QueryDown.getID() %>님의 관리권한 부여</h4></b>
    <div class="funkyradio">
       
        <div class="funkyradio-success">
            <input type="checkbox" name="radio" id="radio3"  value="web"/>
            <label for="radio3">웹 관리자 권한 부여</label>
        </div>
        
        <div class="funkyradio-danger">
            <input type="checkbox" name="radio" id="radio4" value="cook"/>
            <label for="radio4" >주방 관리자 권한 부여</label>
        </div>
        
        <div class="funkyradio-warning">
            <input type="checkbox" name="radio" id="radio5" value="IOT"/>
            <label for="radio5">IOT 관리자 권한 부여 </label>
        </div>
        <p><p>
        <button type="submit" class="btn btn-warning" value="저장">저장</button>
    </div>
</form>
</div>


</body>
</html>