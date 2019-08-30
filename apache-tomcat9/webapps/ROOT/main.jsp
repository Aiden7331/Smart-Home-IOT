<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Smart home system - 메인화면</title>
<link rel="stylesheet" href="css/layout_basic.css	">
<link href="css/bootstrap.min.css" rel="stylesheet">
<style>
			/* 메뉴 전체영역에 대한 스타일 */
		#nav {
			list-style-type: none;	/* 불릿 기호 없앰 */
			height: 45px;
			padding: 6px 7px;
			margin: 0;
			background: #7D7D7D;
			border-radius: 1.5em;	/* 모서리 둥글게 */
		}

		/* 서브메뉴 영역에 대한 스타일 */
		#nav ul {
			margin: 0;
			padding: 0;
			list-style: none;
			position: absolute;
			left: 0;
			top: 45px;
			width: 150px;
			background: #DDDDDD;
			border: 1px solid #B4B4B4;
			border-radius: 8px;
			-webkit-box-shadow: 0 1px 3px RGBA(0, 0, 0, 0.3);
			-moz-box-shadow: 0 1px 3px RGBA(0, 0, 0, 0.3);
			box-shadow: 0 1px 3px RGBA(0, 0, 0, 0.3);
			opacity: 0;
		}

		/* 서브메뉴 링크 스타일 */
		#nav ul a {
			font-weight: normal;
			text-shadow: 0 1px 0 #FFFFFF;
			color: #333333;
		}

		/* 서브메뉴 각 항목의 스타일 */
		#nav ul li {
			float: none;
			margin: 0;
			padding: 0;
		}

		/* 서브메뉴 각 항목 위로 마우스를 올렸을 때 */
		#nav ul li:hover a {
			background: #0078FF;
			color: #FFFFFF;
			text-shadow: 0 1px RGBA(0, 0, 0, 0.1);
			border-radius: 0;
		}

		/* 서브메뉴 첫번째 항목의 스타일 */
		#nav ul li:first-child > a {
			-webkit-border-top-left-radius: 8px;
			-moz-border-radius-topleft: 8px;
			-webkit-border-top-right-radius: 8px;
			-moz-border-radius-topright: 8px;
		}

		/* 서브메뉴 마지막 항목의 스타일 */
		#nav ul li:last-child > a {
			-webkit-border-bottom-left-radius: 8px;
			-moz-border-radius-bottomleft: 8px;
			-webkit-border-bottom-right-radius: 8px;
			-moz-border-radius-bottomright: 8px;
		}

		/* 메뉴 각 항목에 대한 스타일 */
		#nav li {
			float: left;			/* li 각 항목을 왼쪽정렬시키기 */
			position: relative;		/* 순서대로 표시 */
			margin: 5px 10px;
			padding: 0;
		}

		/* 메뉴의 링크에 대한 스타일 */
		#nav li a {
			display: block;			/* 영역을 만듦 */
			font-family: "굴림";
			font-weight: 600;
			font-size: 1em;
			padding: 10px 20px;
			color: #E7E5E5;
			text-decoration: none;
			margin: 0;
			border-radius: 1.4em;
			text-shadow: 0 1px 1px RGBA(0, 0, 0, 0.3);	/* 그림자 효과 */
		}

		/* 메인 메뉴 위로 마우스 포인터를 가져갔을 때 서브 메뉴 스타일 */
		#nav li:hover ul {
			opacity: 1;
		}

		/* 메뉴 항목 위로 마우스를 올렸을 때 스타일 */
		#nav li:hover a {
			background: #EBEBEB;
			color: #444444;
			text-shadow: 0 1px 1px RGBA(255, 255, 255, 1);
			border-radius: 1.4em;
			-webkit-box-shadow: 0 1px 1px RGBA(0, 0, 0, 0.2);
			-moz-box-shadow: 0 1px 1px RGBA(0, 0, 0, 0.2);
		}
</style>
<script language="javascript">
  function locationEat() { 
	  document.getElementById('Context').src='contents/eatschedule.jsp'
	  document.getElementById('Side').src='sideBar/navEat.html'
	  }
  function locationwriteMemo(){
	  document.getElementById('Context').src='contents/writeMemo.jsp'
      document.getElementById('Side').src='sideBar/navEat.html'  
  }
  function locationNot() {
	  document.getElementById('Context').src='contents/userNotice.jsp' 
	  document.getElementById('Side').src='sideBar/navArduino.jsp'
  }
  function locationAlarm() { 
	  document.getElementById('Context').src='contents/alarm.jsp'
	  document.getElementById('Side').src='sideBar/navArduino.jsp'
	  }
  function locationTemper() { 
	  document.getElementById('Context').src='contents/temperature.jsp'
	  document.getElementById('Side').src='sideBar/navArduino.jsp'
	  }
  function locationuserAdmin() { 
	  document.getElementById('Context').src='contents/admin/userAdmin.jsp'
	  document.getElementById('Side').src='sideBar/navtab.html'
	  }
  function locationmodifyUser() { 
	  document.getElementById('Context').src='contents/admin/userAdmin.jsp'
	  document.getElementById('Side').src='sideBar/navtab.html'
	  }
  function locationuserApproval() { 
	  document.getElementById('Context').src='contents/admin/Approval.jsp'
	  }
  function locationhomeSetting(){
	  document.getElementById('Context').src='contents/admin/homeSetting.jsp'
	  document.getElementById('Side').src='sideBar/navArduino.jsp'
			  
  }
</script>
</head>
<body>
<!-- 세션 유효성 검사 -->
<%
String Name=null;
if((Name=(String)session.getAttribute("userName"))==null){
	%><script>
	javascript:alert("로그아웃 된 사용자입니다.");
	javascript:location.href("html/login2.html");
	</script><%} %>
<div id="header">
<font style="float:right"><%=Name %>님 환영합니다. <a href="proc/logoutproc.jsp">로그아웃</a></font>
<h2> <a onclick="javascript:location.href='main.jsp'">스마트 홈 시스템</a></h2>
	<div>
	<img src='resource/nav/navbar-logo.jpg' width="100%">
	</div>
	<ul id="nav">
		<li><a href="#">Life</a>
		<ul>
				<li><a href="#" name="Eatting" onclick="locationEat();">Cooking Menu/ Memo</a></li>
				<li><a href="#" name="Notice"  onclick="locationNot();">Family Bulletin Board</a>
			</li></ul></li>
		<li><a href="#">Smart Control</a>
			<ul>
				<li><a href="#" name="alarm"  onclick="locationAlarm();">Alarm</a></li>
				<li><a href="#" name="temperature" onclick="locationTemper();">Temperature</a>
			</li></ul>
		</li> <%if((String)session.getAttribute("adminAuth")!=null&&session.getAttribute("adminAuth").toString().equals("1")){ %>
		<li><a href="#">Management</a>
			<ul>
				<li><a href="#" name="userM" onclick="locationuserAdmin();">User</a></li>
				<li><a href="#" name="Set" onclick="locationhomeSetting();">Home Setting</a>
			</li></ul>
		</li><%} %>
	</ul>
</div>
<div id="contents">
<iframe id="Context" src="mainContext.jsp" style="height:100%; width:100%; border:0; padding:0px; margin-top:20px;"></iframe>
</div>
<div class="sideBar">
<iframe id="Side" src="sideBar/navArduino.jsp" style="height:100%; width:100%; border:0; padding:0px;"></iframe>
</div>
</body>
</html>