<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="StyleSheet" href="tree/dtree.css" type="text/css" />
	<script type="text/javascript" src="tree/dtree.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.dtree{
width:15%;
float:left;
border-right:1px solid blue;
}
table.user{
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
	background:#b5cfd2 url('img/cell-blue.jpg');
	border-width:1px;
	border-style:solid;
	border-color:#99999;
}
td.td{
	background:#dcddc0 url('img/cell-grey.jpg');
	border-width:1px;
	border-style:solid;
	border-color:#99999;
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
<div>

<!--	<p><a href="javascript: d.openAll();">open all</a> | <a href="javascript: d.closeAll();">close all</a></p>
 d.add(自己的编号，父编号，编号名称，链接地址) -->
	<script type="text/javascript">
		d = new dTree('d');
		d.add(0,-1,"分类浏览");
		d.add(1,0,'建设类型');
		d.add(2,1,'依托单位共建','admin?method=tree&k1=kind&k2=依托单位独自建设');
		d.add(3,1,'多单位联合共建','admin?method=tree&k1=kind&k2=多单位联合共建');
		d.add(4,0,'技术领域');
		d.add(5,4,'产业技术研究院','admin?method=tree&k1=pk&k2=产业技术研究院');
		d.add(6,4,'重点实验室','admin?method=tree&k1=pk&k2=重点实验室');
		d.add(7,4,'工程技术研究中心','admin?method=tree&k1=pk&k2=工程技术研究中心');
		d.add(8,0,'平台级别');
		d.add(9,8,'国家级','admin?method=tree&k1=level&k2=国家级');
		d.add(10,8,'省级','admin?method=tree&k1=level&k2=省级');
		document.write(d);
	</script>
<div style="width:83%;float:right;">
<c:if test="${st==1 }">
<table class="user">
<tr><td colspan="4">查询结果</td></tr>
<tr><th>平台编号</th><th>平台名称</th><th>技术领域</th><th>认证状态</th></tr>
<c:forEach items="${userList}" var="plat">
<tr><td class="td">
<c:if test="${plat.status==1 }"><a href="admin?method=query&infoid=${plat.infoid}">${plat.infoid}</a></c:if>
<c:if test="${plat.status==0 }">${plat.infoid}</c:if>
</td><td class="td">${plat.name }</td><td class="td">${plat.field }</td><td class="td">${plat.status==1?'已认证':'未认证' }</td></tr>
</c:forEach>
<tr><td style="height:60px;background-color:white;"colspan="4"><ul class="pageMenu">${pageCode }</ul></td></tr>
</table></c:if>
<c:if test="${st==2}">
<table style="width:100%">
<tr><td style="font-size:25px;color:black;padding-top:10px;padding-bottom:10px;text-align:center;">无符合要求的查询结果!</td></tr>
</table>
</c:if>
</div>
</div>
</body>
</html>