<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息提示</title>
<style type="text/css">
.parg{
	color:#3399cc;
	font-size:70px;
	margin-top:50px;
	margin-left:50px;
	margin-bottom:30px;
}
#help:link,#help:hover,#help:visited,#help:active{
	text-decoration:none;
	color:blue;
	font-weight:bold;
	margin-top:70px;
	margin-left:50px;
}
</style>
</head>
<body>
<p class="parg">${information==null?'河北创新实验平台':information }</p>
<a id="help" href="help.jsp" target="_blank">填报须知</a>
</body>
</html>