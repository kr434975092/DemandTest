<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.error{
	background-color:#003399;
	margin-top:-5%;
	height:100%;
}
.errortit{
	font-family:微软雅黑;
	color:white;
	margin-top:50px;
	margin-left:100px;
	margin-bottom:15px;
	font-size:70px;
}
.errorhr{
	height:5px;
	background-color:white;
	width:82%;
	margin:5px auto;
	border:none;
}
.errorp{
	color:white;
	margin-left:100px;
	margin-top:10px;
	margin-bottom:10px;
}
.errorul{
	list-style:none;
	margin-left:130px;
	color:white;
}
.errorspan{
	color:white;
	margin-left:100px;
	font-family:微软雅黑;
	font-weight:bold;
}
</style>
<title>出错啦!</title>
</head>
<body>
<div class="error">
<h1 class="errortit">:( &nbsp;出错啦!</h1>
<hr class="errorhr"/>
<p class="errorp">错误代码:${errorCode==null?'未知的错误':errorCode}</p>
<p class="errorp">可能是出现了以下问题:</p>
<ul class="errorul">
<li>信息录入格式有误</li>
<li>数据库连接故障</li>
<li>数据读写格式不正确</li>
<li>服务器配置因素</li>
</ul>
<span class="errorspan">我们只收集这些错误信息,如若恢复请尽快联系系统工作人员!&nbsp;&nbsp;&nbsp;&nbsp;:)</span>
</div>
</body>
</html>