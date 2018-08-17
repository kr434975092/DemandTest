<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>平台用户信息</title>
<style>
table{
    width:100%;
    text-align:center;
	font-family:微软雅黑;
	font-size:20px;
	color:black;
	border-width:1px;
	border-color:#999999;
	border-collapse:collapse;
}
th{
	background: #5ca4d3;
	border-width:0px;
	border-style:solid;
	border-color:#99999;
}
td.td{
	text-align: center;
	background: #fff;
	border-width:0px;
}
td.td > a:link{
	text-decoration:none;
	color:black;
}
td.td > a:visited{
	text-decoration:none;
	color:black;
}
td.td > a:hover{
	text-decoration:none;
	color:blue;
}
td.td > a:active{
	text-decoration:none;
	color:black;
}
ul.pageMenu{
	margin-left:300px;
}
ul.pageMenu > li{
	list-style:none;
	float:left;
}
ul.pageMenu > li > a{
    border: 1px solid black;
    box-shadow: 1px 0 0 rgba(0, 0, 0, 0.1) inset, -1px 0 0 rgba(0, 0, 0, 0.1) inset;
    padding: 9px 15px;
    position: relative;
    text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
    z-index: 2;
    background-color:white;
    text-decoration:none;
}
ul.pageMenu > li > a:link,ul.pageMenu > li > a:visited,ul.pageMenu > li > a:active{
	color:black;
}
ul.pageMenu > li > a:hover{
	color:blue;
}
</style>
</head>
<body>
<table>
<tr><th>平台编号</th><th>平台名称</th><th>技术领域</th><th>认证状态</th></tr>
<c:forEach items="${userList}" var="plat">
<tr><td class="td">
<c:if test="${plat.status==1 }"><a href="admin?method=query&infoid=${plat.infoid}" target="_blank">${plat.infoid}</a></c:if>
<c:if test="${plat.status==0 }">${plat.infoid}</c:if>
</td><td class="td">${plat.name }</td><td class="td">${plat.field }</td><td class="td">${plat.status==1?'已认证':'未认证' }</td></tr>
</c:forEach>

</table>
</body>
</html>