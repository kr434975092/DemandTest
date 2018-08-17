<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax测试版</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.button').click(function(){
		$.ajax({
			type:'GET',
			url:'test',
			dataType:'text',
			success:function(data){
				$('.p').html(data);
			},
		    error:function(){
		    	alert('hehehe');
		    }
		});
	});
});
</script>
</head>
<body>
<div>
<p class="p">点击按钮变换内容</p>
<button class="button">点击</button>
</div>
</body>
</html>