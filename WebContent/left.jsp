<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<title></title>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var menuParent = $('.leftmenu > .ListTitlePanel > div');
	var menuList = $('.menuList');
	$('.leftmenu > .leftmenuP > .ListTitlePanel > .ListTitle').each(function(i){
		$(this).click(function(){
			if($(menuList[i]).css('display')=='none')$(menuList[i]).slideDown(300);
			else $(menuList[i]).slideUp(300);
		});
	});
});
</script>
		
		<link rel="stylesheet" href="css/StudentLeft.css">
	</head>
	<body>
		<div class="nav">
		
			<div class="nav-list">
			<div class="menuList">
				<div class="nav-tit">
					<a href="chart.jsp" target="mainAction">
						<img src="images/personal-msg.png" style="height: 30px" alt="">
						<span>统计柱状图</span>
					</a>
				</div>
				<div class="nav-tit">
					<a href="chart1.jsp" target="mainAction">
						<img src="images/job-msg.png" style="height: 30px" alt="">
						<span>统计饼图</span>
					</a>
				</div>
				<div class="nav-tit">
					<a target="mainAction" href="admin?method=userList">
						<img src="images/archives-msg.png" alt="">
						<span>平台用户列表</span>
					</a>
				</div>
				<div class="nav-tit">
					<a target="mainAction" href="NewFile2.jsp">
						<img src="images/job-msg.png" alt="">
						<span>平台搜索</span>
					</a>
				</div>
				
				</div>
			</div>
		</div>
		
		<script src="js/jquery-1.9.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script>
			$(document).ready(function(){
				$('#personal').on('click',function(){
					$('#personal_child').fadeToggle(300);
				});
				let aLi = $('#personal_child li');
				aLi.on('click',function(){
					$(this).addClass('active').siblings('li').removeClass('active');
				})
			});
		</script>
	</body>
</html>
