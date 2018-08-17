<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="js/jquery-1.5.2.min.js"></script>
<script type="text/javascript">
var currentShowCity=0;
$(document).ready(function(){

   $("#province").change(function(){

	   $("#province option").each(function(i,o){

		   if($(this).attr("selected"))

		   {
			  
			   $(".city").hide();

			   $(".city").eq(i).show();
			   
			   currentShowCity = i; 
		   }

	   });

   });

   $("#province").change();
   
   $("input[value='查询']").click(function(){
	   var text = $("#province option:selected").val();
		  if(text=="null"){
			  alert("请选择类别!");
			  return false;
		  }
		  else{
			  $(".city").each(function(i,o){ 
				  if(i == currentShowCity){
					var text = $(".city").eq(i).val();
					$("input[name='k2']").val(text);}});
			  return true;}
   });
	
});


</script>
<style>
.tips{
	text-align:center;
	color:red;
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
table.option{
	width:100%;
	text-align:center;
	font-family:微软雅黑;
	font-size:20px;
	color:black;
	border-width:1px;
	border-color:#999999;
	border-collapse:collapse;
}
#province,.city{
	width:98%;
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
</style>
<title>分类浏览</title>
</head>
<body>
<form action="admin?method=tree" method="post">
<table class="option">
<tr><td colspan="4">分类浏览窗口</td></tr>
<tr><th>分类标准</th><td class="td">
<select id="province" name="k1"> 

   	   <option value="null" selected>请选择类别</option> 

       <option value="kind">建设类型</option> 

       <option value="pk">技术领域</option> 
       
       <option value="level">平台级别</option> 

   </select> 
</td><th>选择类别</th>
<td class="td">
   <select class="city"> 

   		<option value="null">请选择类型</option> 

   </select> 

   <select class="city"> 

       <option value="多单位联合共建">多单位联合共建</option> 

       <option value="依托单位独自建设">依托单位独自建设</option> 
		

   </select>  

   <select class="city"> 

       <option value="产业技术研究院">产业技术研究院</option> 

       <option value="重点实验室">重点实验室</option> 

       <option value="工程技术研究中心">工程技术研究中心</option> 


   </select> 
   
   <select class="city"> 

       <option value="国家级">国家级</option> 

       <option value="省级">省级</option> 

   </select> 
   
</td>
</tr>
<tr>
<td colspan="4" class="td"><input type="submit" class="button" value="查询"/></td>
</tr>
<tr><td><input type="hidden" name="k2" onclick="return run();"/></td></tr>
</table></form>
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