<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>侧边功能向导</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var menuParent = $('.leftmenu > .ListTitlePanel > div');
	var menuList = $('.menuList');
	$('.leftmenu > .leftmenuP > .ListTitlePanel > .ListTitle').each(function(i){
		$(this).click(function(){
			if($(menuList[i]).css('display')=='none')$(menuList[i]).slideDown(300);
			else $(menuList[i]).slideUp(300);
		});
	});
});
</script>
<link rel="stylesheet" type="text/css" href="css/menu.css">
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	font-size: 8px;
	font-family: "Microsoft Yahei", Verdana, Arial, Helvetica, sans-serif
}
.leftmenu {
	border: #bdd7f2 1px solid;
	border-top: #0080c4 3px solid;
	border-bottom: #0080c4 3px solid;
	background: #B1D8EA repeat-y right;
	margin-left: 0px;
}
.leftmenu .ListTitle {
	border-bottom: 1px #98c9ee solid;
	display: block;
	text-align: center;
	font-size:15px;
	height: 25px;
	line-height: 25px;
	cursor: pointer;
	width: 100%;
}
.ListTitlePanel {
	position: relative;
}
.leftbgbt {
	position: absolute;
	background: no-repeat;
	width: 11px;
	height: 52px;
	left: -11px;
	top: -4px;
}
.menuList {
	display: block;
	height: auto;
}

.menuList div {
	height: 25px;
	line-height: 24px;
	border-bottom: 1px #98c9ee dotted;
}

.menuList div a {
	display: block;
	background: #fff;
	line-height: 25px;
	height: 25px;
	font-size:15px;
	font-weight:bold;
	text-align: center;
	color: #185697;
	text-decoration: none;
}

.menuList div a:hover {
	color: #f30;
	background: #0080c4;
	color: #fff;
}
</style>
</head>
<body class="panel" background="#B1D8EA">
<div id="body">
<div style="background: #3FA0F1;; position: relative; height: 30px;" align="center">
<font color="#ffffff" style="top: 4px; position: relative; font-size: 15px;">系统菜单</font>
</div>
<div class="leftmenu">
  <div class="leftmenuP">
    <div class="ListTitlePanel">
      <div class="ListTitle">
        <strong>信息填报</strong>
        <div class="leftbgbt"></div>
      </div>
    </div>
    <div class="menuList">
      <div id="pmsg">
         <a target="mainAction" href="admin?method=userList">平台用户列表</a>
      </div>
      <div>
         <a target="mainAction" href="NewFile2.jsp">平台分类浏览</a>
      </div>
      <div>
         <a target="mainAction" href="NewFile2.jsp">平台综合查询</a>
      </div>
      <div id="logout">
         <a target="_parent" href="Index.jsp">注销平台登陆</a>
      </div>
    </div>
  </div>
</div>
</div>
</body>
</html>