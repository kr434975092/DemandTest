<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>河北创新技术平台</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
var swit = 0;
$(document).ready(function(){
	var error = "${regerror}";
	if(error!=null&&error!=""){
		$("#reg").css({background:'#2288bb'});
		$("#log").css({background:'#3399cc'});
		$(".login").hide();
		$(".reg").show();
		$("#tip6").html(error);
		swit = 1;
	}
	
	$(".inputid").blur(function(){
		var id = $(".inputid").val();
		if(id==''){
			$('#tip1').html('平台编号不能为空!');
		}else{
			$('#tip1').html('');
		}
	});
	$(".inputpass").blur(function(){
		var password = $(".inputpass").val();
		if(password==''){
			$('#tip2').html('登陆密码不能为空!');
		}else{
			$('#tip2').html('');
		}
	});
	$("#log").click(function(){
		if(swit==1){
			swit = 0;
			$("#log").css({background:'#2288bb'});
			$("#reg").css({background:'#3399cc'});
			$(".login").show();
			$(".reg").hide();
		}
	});
	$(".clickR").click(function(){
		$("#reg").css({background:'#2288bb'});
		$("#log").css({background:'#3399cc'});
		$(".login").hide();
		$(".reg").show();
		swit = 1;
	});
	$("#reg").click(function(){
		if(swit==0){
			swit = 1;
			$("#reg").css({background:'#2288bb'});
			$("#log").css({background:'#3399cc'});
			$(".login").hide();
			$(".reg").show();
		}
	});
	$("input[name='name']").blur(function(){
		var name = $("input[name='name']").val();
		if(name=='')$("#tip3").html('平台名称不能为空!');
		else $("#tip3").html('');
	});
	$("input[name='id1']").blur(function(){
		var id = $("input[name='id1']").val();
		if(id=='')$("#tip4").html('平台编号不能为空!');
		else $("#tip4").html('');
	});
	$("input[name='kind']").blur(function(){
		if(!$("input[name='kind']").is(":checked"))$("#tip5").html('请选择平台类型!');
		else $("#tip5").html('');
	});
	$("input[name='pass']").blur(function(){
		var id = $("input[name='pass']").val();
		if(id=='')$("#tip6").html('登陆密码不能为空!');
		else $("#tip6").html('');
	});
	$("input[name='checkpass']").blur(function(){
		var id = $("input[name='checkpass']").val();
		if(id=='')$("#tip6").html('登陆密码不能为空!');
		else $("#tip6").html('');
	});
	//提交时要验证:1.信息是否填写  2.信息是否按照信息正确填写
	$("input[value='登    陆']").click(function(){
		var flag = 1;
		var id = $(".inputid").val();
		var pass = $(".inputpass").val();
		if(id==''){
			$('#tip1').html('平台编号不能为空!');
			flag = 0;
		}
		if(pass==''){
			$('#tip2').html('登陆密码不能为空!');
			flag = 0;
		}
		if(flag==0)return false;
		if(flag==1)$("form[action='login']").submit();
		//记得后期还要加入信息的正确格式
	});
	$("input[value='确  认  注  册']").click(function(){
		var flag = 1; 
		var name = $("input[name='name']").val();
		var id = $("input[name='id1']").val();
		var pass = $("input[name='pass']").val();
		var checkpass = $("input[name='checkpass']").val();
		if(name==''){
			$("#tip3").html('平台名称不能为空!');
			flag = 0;
		}
		if(id==''){
			$("#tip4").html('平台编号不能为空!');
			flag = 0;
		}
		if(id.length!=10){
			$("#tip4").html('平台编号共10位!');
			flag = 0;
		}
		if(id!=''&&id.indexOf("GA")!=0){
			$("#tip4").html('平台编号是以GA开头的!');
			flag = 0;
		}
		if(!$("input[name='kind']").is(":checked")){
			$("#tip5").html('请选择平台类型!');
			flag = 0;
		}
		if(pass==''||checkpass==''){
			$("#tip6").html('登陆密码不能为空!');
			flag = 0;
		}
		if($.trim(pass)!=$.trim(checkpass)){
			$("#tip6").html('前后密码不一致!');
			flag = 0;
		}if(pass.length!=8||checkpass.length!=8){
			$("#tip6").html('密码为8位!');
			flag = 0;
		}
		if(flag==0)return false;
		if(flag==1)$("form[action='reg']").submit();
	});
})
</script>
<script type="text/javascript">
$(function(){
	
});
</script>
<style type="text/css">
body{
	
	background:url(img/banner.jpg);
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
}
.swit{
	width:120px;
	height:30px;
	margin:0 auto;
	margin-top:2%;
	margin-bottom:0;
}
.button{	
	background:#3399cc;
	padding:10px;
	text-align:center;
	margin:-2px;
	text-decoration:none;
	font-family:微软雅黑;
	color:#fff;
	cursor:pointer;
}
.button:hover{
	background:#2288bb;
}
#log{
	background:#2288bb;
}
.triangle{
	width:0;
	border-top:12x solid transparent;
	border-right:12px solid transparent;
	border-bottom:12px solid #3399cc;
	border-left:12px solid transparent;
	margin:0 auto;
}
.login{
	width:300px;
	margin:0 auto;
}
.tit{
	background:#3399cc;
	padding:15px 0;
	text-align:center;
	color:#fff;
	font-size:30px;
	font-weight:bold;
	font-family:微软雅黑;
	margin:0;
}
form[action='login']{
	background:#fff;
	padding:10px;
	border:1px solid #3399cc;
}
.ii{
	width:90%;
	margin:5px auto;
}
.inputid{
	width:100%;
	height:35px;
	font-size:80%;
	padding-left:40px;
	background:url(img/user.jpg) no-repeat;
	background-position:left;
	border:1px solid gray;
}
.inputpass{
	width:100%;
	height:35px;
	font-size:80%;
	padding-left:40px;
	background:url(img/key.jpg) no-repeat;
	background-position:left;
	border:1px solid gray;
}
.tip{
	color:red;
	height:12px;
	font-size:12px;
	font-family:微软雅黑;
	margin-left:18px;
	margin-top:0;
	margin-bottom:10px;
	padding:0;
}
.tip1{
	color:red;
	height:12px;
	font-size:12px;
	font-family:微软雅黑;
	margin-left:72px;
	margin-top:0;
	margin-bottom:10px;
	padding:0;
}
input[type='submit']{
	width:90%;
	margin:10px auto;
	margin-left:15px;
	margin-top:0;
	background:#3399cc;
	border:0;
	padding:4%;
	font-size:100%;
	color:#fff;
	cursor:pointer;
}
input[type='submit']:hover{
	background:#2288bb;
}
input[type='checkbox']{
	margin-left:15px;
	margin-top:0;
	margin-bottom:10px;
	font-size:10px;
	font-family:微软雅黑;
}
.rr{
	margin-top:0;
	margin-right:15px;
	font-size:15px;
	float:right;
	font-family:微软雅黑;
}
a:visited,a:hover,a:link,a:active{
	color:#2288bb;
	text-decoration:none;
	font-family:微软雅黑;
}
.reg{
	width:300px;
	margin:0 auto;
	display:none;
}
table{
	margin:0 auto;
	font-family:微软雅黑;
	color:gray;
}
form[action='reg']{
	background:#fff;
	padding:5px;
	border:1px solid #3399cc;
}
.ft{
	width:100%;
	height:150px;
	border:none;
	margin-bottom:10px;
}
</style>
</head>
<body>
<div style="width:535px;margin:0 auto;margin-top:30px;">
<img src="img/kjt_logo.png" style="display:block;margin:0 auto 20px auto;"/>
<img src="img/kouhao3.png" style="margin:20px auto 30px auto;"/>
</div>
<div class="swit">
<span class="button" id="log" href="#">登&nbsp;&nbsp;陆</span>
<span class="button" id="reg" href="#">注&nbsp;&nbsp;册</span>
</div>
<div class="login">
<div class="triangle"></div>
<h1 class="tit">平&nbsp;&nbsp;台&nbsp;&nbsp;登&nbsp;&nbsp;陆</h1>
<form action="login" method="post">
<div class="ii"><input type="text" class="inputid" name="id" placeholder="平台编号" value="${pid}"/></div>
<p id="tip1" class="tip"></p>
<div class="ii"><input type="password" class="inputpass" name="password" placeholder="登陆密码" /></div>
<p id="tip2" class="tip">${error}</p>
<input type="checkbox" name="mememory" value="1" />记住账号<p class="rr">没注册?<span class="clickR" style="color:#2288bb;">去注册</span></p>
<input type="submit" value="登    陆" />
</form>
</div>
<div class="reg">
<div class="triangle"></div>
<h1 class="tit">平&nbsp;&nbsp;台&nbsp;&nbsp;注&nbsp;&nbsp;册</h1>
<form action="reg" method="post">
<table>
<tr><td>平台名称:&nbsp;<input type="text" name="name" /><br/>
<p class="tip1" id="tip3"></p>
</td></tr>
<tr><td>平台编号:&nbsp;<input type="text" name="id1" /><br/>
<p class="tip1" id="tip4"></p></td></tr>
<tr><td>平台类型:&nbsp;<input type="radio" name="kind" value="重点实验室" checked/>重点实验室<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="kind" value="工程技术研究中心" />工程技术研究中心<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="kind" value="产业技术研究院" />产业技术研究院<br/>
<p class="tip1" id="tip5"></p></td></tr>
<tr><td>登陆密码:&nbsp;<input type="password" name="pass" /></td></tr>
<tr><td>确认密码:&nbsp;<input type="password" name="checkpass" /><br/>
<p class="tip1" id="tip6">请设置8位密码</p></td></tr>
<tr><td><input type="submit" value="确  认  注  册" /></td></tr>
</table>
</form>
</div>
<iframe src="foot.jsp" class="ft" scrolling="no"></iframe>
</body>
</html>