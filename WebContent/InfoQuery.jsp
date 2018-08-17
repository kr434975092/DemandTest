<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var kind = "${info.kind}";
	if(kind=="多单位联合共建")$(".kindop1").hide();
	else $(".kindop2").hide();
});
</script>
<style type="text/css">
.temp{
	width:20%;
}
.info{
	border-collapse:collapse;
	font-size:19px;
}
.info tr:nth-child(odd){
	background-color:#3399CC;
	font-weight:bold;
	color:white;
}
.info tr:nth-child(even){
	background-color:#fff;
	font-weight:bold;
	color:#185697;
}
</style>
<title>基本信息查询</title>
</head>
<body>
<table class="info" border="1">
<tr><td colspan="2">平台名称:
<c:if test="${currentname!=null}">${currentname}</c:if><c:if test="${currentname==null}">${info.name}</c:if></td><td colspan="2">平台编号:${info.infoid}</td></tr>
<tr><td colspan="2">批准年月:${info.year}年${info.month}月</td><td colspan="2">批准文号:${info.ig}</td></tr>
<tr><td colspan="4">技术领域:${info.field}</td></tr>
<tr><td colspan="2">平台级别:${info.level}</td><td colspan="2">所属市县:${info.place}</td></tr>
<tr><td colspan="4">平台组织形态:&nbsp;&nbsp;&nbsp;&nbsp;${info.kind}&nbsp;&nbsp;&nbsp;&nbsp;京津冀共建:${info.jj}&nbsp;&nbsp;&nbsp;&nbsp;法人资格:${info.cls}</td></tr>
<tr><td colspan="4">服务的经济行业:1.${ei[0]}&nbsp;&nbsp;&nbsp;&nbsp;2.${ei[1]}&nbsp;&nbsp;&nbsp;&nbsp;3.${ei[2]}&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<tr><td colspan="4">所属的主要学科:1.${si[0]}&nbsp;&nbsp;&nbsp;&nbsp;2.${si[1]}&nbsp;&nbsp;&nbsp;&nbsp;3.${si[2]}&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
<tr class="kindop1"><td rowspan="2" style="text-align:center">依托单位属性</td><td>依托单位名称:${company.name}</td><td colspan="2">社会信用代码:${company.code}</td></tr>
<tr class="kindop1"><td>依托单位法人名称:${company.clr }</td><td>依托单位电话:${company.phone}</td><td>依托单位类型:${company.kind}</td></tr>
<tr class="kindop2"><td colspan="4">共建单位:${ci[0]==null?'':ci[0]}&nbsp;&nbsp;&nbsp;&nbsp;${ci[1]==null?'':ci[1]}&nbsp;&nbsp;&nbsp;&nbsp;${ci[2]==null?'':ci[2]}&nbsp;&nbsp;&nbsp;&nbsp;
${ci[3]==null?'':ci[3]}&nbsp;&nbsp;&nbsp;&nbsp;${ci[4]==null?'':ci[4]}&nbsp;&nbsp;&nbsp;&nbsp;
</td></tr>
<tr><td class="temp" rowspan="2"  style="text-align:center">平台主任信息</td><td>姓名:${director.name}</td><td>性别:${director.sex}</td><td>出生年月:${director.year}年${director.month}月</td></tr>
<tr><td>所学专业:${director.majoy}</td><td>学历:${director.record}</td><td>学位:${director.degree}</td></tr>
<tr><td>职称:${director.title}</td><td>办公电话:${director.telephone}</td><td>手机:${director.phone}</td><td>E-mail:${director.email}</td></tr>
<tr><td colspan="2">平台网站名称:${info.web }</td><td colspan="2">网址:${info.url }</td></tr>
<tr><td colspan="2">平台通讯地址:${info.p }</td><td colspan="2">邮编:${info.e}</td></tr>
</table>
</body>
</html>