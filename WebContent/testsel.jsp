<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<title>综合查询</title>
<script type="text/javascript">
$(document).ready(function(){
	$(".tmp").hide();
	$('.plus').click(function(){
		$('.search').append("<div class='option'><select class='tmp1' name='orand'><option value='or'>或者</option><option value='and'>并且</option></select><select class='tmp1' name='random'><option value=''>任意词</option><option value='kind'>建设类型</option><option value='pk'>技术领域</option><option value='pcc'>所属市县</option><option value='su'>涉及学科</option><option value='fa'>涉及行业</option></select><input type='text' class='input' name='context'/><img class='plus1' src='img/plus.jpg'/><img class='minus' src='img/minus.jpg'/></div>");
	});
	$(".search").on("click",".minus",function(){
		$(this).parents(".option").remove();
	})
	$(".search").on("click",".plus1",function(){
		$('.search').append("<div class='option'><select class='tmp1' name='orand'><option value='or'>或者</option><option value='and'>并且</option></select><select class='tmp1' name='random'><option value=''>任意词</option><option value='kind'>建设类型</option><option value='pk'>技术领域</option><option value='pcc'>所属市县</option><option value='su'>涉及学科</option><option value='fa'>涉及行业</option></select><input type='text' class='input' name='context'/><img class='plus1' src='img/plus.jpg'/><img class='minus' src='img/minus.jpg'/></div>");
	});
	
});
</script>
<style type="text/css">
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
.button{
	width:70px;
	height:30px;
	color:black;
	font-size:20px;
	background-color:white;
	border:1px solid black;
	margin-top:5px;
	margin-bottom:5px;
}
.button:hover{
	color:blue;
	cursor:pointer;
}
img{
	cursor:pointer;
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
.option{
	padding:0px;
	height:30px;
	line-height:30px;
	margin-left:250px;
}
.button{
    margin-top:-5px;
	background-color:white;
	color:blue;
	border:1px solid blue;
	height:30px;
}
.button:hover{
	color:blue;
}
.tmp1{
    margin-top:-5px;
	height:30px;

}

.tmp1 > option{
	height:30px;

}
.input{
margin-top:-5px;
	height:30px;
	line-height:30px;
}
</style>
</head>
<body>
<form action="select" method="post">
<p style="color:black;font-size:25px;margin:10px auto;text-align:center;">综合查询检索</p>
<div class="search">
<div class="option">
<select class="tmp" name='orand'><option value=''>空</option></select>



<select class="tmp1" name="random">
<option value="" selected>任意词</option>
<option value="kind">建设类型</option>
<option value="pk">技术领域</option>
<option value="pcc">所属市县</option>
<option value="su">涉及学科</option>
<option value="fa">涉及行业</option>
</select>






<input type="text" class="input" name="context"/>
<input type="submit" class="button" value="检索"/>
<img class="plus" src="img/plus.jpg"/>
</div></div>
</form>
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
</body>
</html>