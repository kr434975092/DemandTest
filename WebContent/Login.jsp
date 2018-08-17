<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
		<script src="js/jquery-1.9.1.min.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<div class="login">
			<div class="content clearfix">
				<div class="content-left">
					<div class="logo">
						
						<p>创新年报平台管理系统</p>
					</div>
				</div>
				<div class="shu"></div>
				<form action="login" method="post">
				<div class="content-right">
					<div class="login-form">
						<h2>用户登录/LOGIN</h2>
						
						<div class="account clearfix">
							<span>账　号：</span>
							<input type="text" value="" name="id"/>
						</div>
						<div class="password clearfix">
							<span>密　码：</span>
							<input type="password" value="" name="password"/>
						</div>
						
					
							<span id="login" style="width:50px"><input  style="width:50px" type="submit" value="登录" class="btn" /></span>
							<span class="forget" style="width:50px"><input  style="width:50px"  type="submit" value="注册" class="btn"/></span>
					
					</div>
					
				</div>
				</form>
			</div>
		</div>
		<script type="text/javascript">
			
			
		</script>
		<!--<script type="text/javascript">
			$(document).ready(function(){
				if (window.PIE) {
			        $('.rounded').each(function() {
			            PIE.attach(this);
			        });
			    }
			});
		</script>-->
	</body>
</html>
