<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>平台用户操作界面</title>
</head>
<frameset rows="70,*" cols="*" frameborder="no" border="0" framespacing="0" bordercolor="#B1D8EA">
<frame src="head.jsp" name="topFrame" frameborder="no" scrolling="no"  id="topFrame" title="topFrame"/>
<frameset name="myFrame" cols="220,*" frameborder="no" border="0" framespacing="0">
    <frame src="left.jsp" name="leftFrame" style="padding-left: 0px; padding-top: 0px;" frameborder="no" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frameset name="myFrame" rows="40,*" frameborder="no" border="0" framespacing="0">
      <frame src="navi.jsp" name="navFrame" id="navFrame" scrolling="no" title="manFrame" />
      <frame src="${showPage==null?'help.jsp':showPage}" name="mainAction" frameborder="no" id="manFrame" style="padding-left: 2px" title="manFrame" />
    </frameset>
</frameset>
</frameset>
<body>
</body>
</html>