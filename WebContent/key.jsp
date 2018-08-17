<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("input[type='submit']").click(function(){
		var flag = 1;
		var newpass = $("input[name='newpass']").val();
		var checkpass = $("input[name='checkpass']").val();
		if(newpass==''||checkpass==''||newpass==null||checkpass==null){
			$("#wran").html('密码不能为空');
			flag = 0;
		}
		if(newpass!=''&&checkpass!=''&&newpass!=checkpass){
			$("#wran").html('前后密码不一致');
			flag = 0;
		}
		if(newpass.length!=8||checkpass.length!=8){
			$("#wran").html('密码为8位!');
			flag = 0;
		}
		if(flag==0)return false;
		if(flag==1) return true;
	});
});
</script>
<style type="text/css">
.key{
	margin:10px auto;
	color:black;
	font-size:15px;
}
#wran{
	font-family:微软雅黑;
	margin:10px auto;
	color:black;
	font-size:12px;
	color:red;
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
.uk{
	width:30%;
	margin:10px auto;
	border:1px solid #3399cc;
	padding:10px;
	background:white;
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
</style>
</head>
<body>
<form action="menu?t=keys" method="post">
<div class="uk">
<p class="key">输入新的平台登陆密码:</p>
<input type="password" class="inputpass" name="newpass" placeholder="输入新的平台登陆密码" />
<p class="key">请再输入一次:</p>
<input type="password" class="inputpass" name="checkpass" placeholder="输入新的平台登陆密码" />
<br/><p id="wran"></p><input type="submit" value="确认修改" />
</div>
</form>
</body>
</html>