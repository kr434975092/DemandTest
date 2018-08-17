<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在此处插入标题</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/echarts.js"></script>
<style type='text/css'>
td{
   padding-left:10px;
   padding-right:10px;
}

</style>
</head>
<body>
<div>
<table class='table'>
<tr>
  <td class='pcc'><img src='images/01.gif' />地域</td>
  <td class='suc'><img src='images/01.gif' />学科</td>
  <td class='fin'><img src='images/01.gif' />行业</td>
  <td class='year'><img src='images/01.gif' />年份</td>
  </tr>
</table>
</div>
<div id='main' style="width:600px; height: 400px;"></div>
<script type='text/javascript'>
var myChart = echarts.init(document.getElementById('main'));

var pcc = 1;
var suc = 1;
var fin = 1;
var y = 1;
var year = 0;
var ItemNum = 0;
var lastfocus = '';
var focus = '';


var pccList = new Array();
var sucList = new Array();
var finList = new Array();

$('.pcc').click(function(){
	if(pcc==1){
		ItemNum = ItemNum + 1;
		lastfocus = focus;
		focus = 'pcc';
		pcc = 2;
		$(this).find('img').attr('src','images/02.gif');
		if(ItemNum==1){
			$.ajaxSetup({ 
				cache: false 
				}); 
			$.ajax({
				type:'GET',
				url:'drill',
				data:{
					key:focus
				},
				success:function(data){
					
					var value = new Array();
					var len = data.value.length;
					for(var i = 0;i<len;i++)
					    value[i] = parseInt(data.value[i]);
					var option = {
						    title:{
						        text:'ECharts 数据统计'
						    },
						    tooltip:{
						    	trigger:'axis'
						    },
						    toolbox:{
						    	show:true
						    },
						    legend:{
						        data:['用户来源']
						    },
						    xAxis:{
						        data:data.key
						    },
						    yAxis:{

						    },
						    series:[{
						        name:'平台数量',
						        type:'bar',
						        data:value
						    }]
						};
					myChart.setOption(option);
					
				},
				error:function(){
					alert('hehe');
				},
				dataType:'json'
			});
		}
	}else{
		pcc = 1;
		ItemNum = ItemNum - 1;
		focus = lastfocus;
		$(this).find('img').attr('src','images/01.gif');
		pcc.length = 0;
		$.ajaxSetup({ 
			cache: false 
			}); 
		$.ajax({
			type:'GET',
			url:'drill',
			data:{
				key:focus
			},
			success:function(data){
				var value = new Array();
				var len = data.value.length;
				for(var i = 0;i<len;i++)
				    value[i] = parseInt(data.value[i]);
				var option = {
					    title:{
					        text:'ECharts 数据统计'
					    },
					    tooltip:{
					    	trigger:'axis'
					    },
					    toolbox:{
					    	show:true
					    },
					    legend:{
					        data:['用户来源']
					    },
					    xAxis:{
					        data:data.key
					    },
					    yAxis:{

					    },
					    series:[{
					        name:'平台数量',
					        type:'bar',
					        data:value
					    }]
					};
				myChart.setOption(option);
				
			},
			error:function(){
				alert('hehe');
			},
			dataType:'json'
		});
	}
	
});

$('.suc').click(function(){
	if(suc==1){		
		ItemNum = ItemNum + 1;
		focus = 'suc';
		suc = 2;
		$(this).find('img').attr('src','images/02.gif');
		if(ItemNum==1){
			$.ajaxSetup({ 
				cache: false 
				}); 
			$.ajax({
				type:'GET',
				url:'drill',
				data:{
					key:focus
				},
				success:function(data){				
					var value = new Array();
					var len = data.value.length;
					for(var i = 0;i<len;i++)
					    value[i] = parseInt(data.value[i]);
					var option = {
						    title:{
						        text:'ECharts 数据统计'
						    },
						    tooltip:{
						    	trigger:'axis'
						    },
						    toolbox:{
						    	show:true
						    },
						    legend:{
						        data:['用户来源']
						    },
						    xAxis:{
						        data:data.key
						    },
						    yAxis:{

						    },
						    series:[{
						        name:'平台数量',
						        type:'bar',
						        data:value
						    }]
						};
					myChart.setOption(option);
					
				},
				error:function(){
					alert('hehe');
				},
				dataType:'json'
			});
		}
	}else{
		suc = 1;
		ItemNum = ItemNum - 1;
		focus = lastfocus;
		$(this).find('img').attr('src','images/01.gif');
	}
	
});

$('.fin').click(function(){
	if(fin==1){		
		ItemNum = ItemNum + 1;
		focus = 'fin';
		fin = 2;
		$(this).find('img').attr('src','images/02.gif');
		if(ItemNum==1){
			$.ajaxSetup({ 
				cache: false 
				}); 
			$.ajax({
				type:'GET',
				url:'drill',
				data:{
					key:focus
				},
				success:function(data){				
					var value = new Array();
					var len = data.value.length;
					for(var i = 0;i<len;i++)
					    value[i] = parseInt(data.value[i]);
					var option = {
						    title:{
						        text:'ECharts 数据统计'
						    },
						    tooltip:{
						    	trigger:'axis'
						    },
						    toolbox:{
						    	show:true
						    },
						    legend:{
						        data:['用户来源']
						    },
						    xAxis:{
						        data:data.key
						    },
						    yAxis:{

						    },
						    series:[{
						        name:'平台数量',
						        type:'bar',
						        data:value
						    }]
						};
					myChart.setOption(option);
					
				},
				error:function(){
					alert('hehe');
				},
				dataType:'json'
			});
		}
	}else{
		fin = 1;
		ItemNum = ItemNum - 1;
		focus = lastfocus;
		$(this).find('img').attr('src','images/01.gif');
	}
	
});

$('.year').click(function(){
	if(y==1){		
		ItemNum = ItemNum + 1;
		focus = 'year';
		y = 2;
		$(this).find('img').attr('src','images/02.gif');
		if(ItemNum==1){
			$.ajaxSetup({ 
				cache: false 
				}); 
			$.ajax({
				type:'GET',
				url:'drill',
				data:{
					key:focus
				},
				success:function(data){				
					var value = new Array();
					var len = data.value.length;
					for(var i = 0;i<len;i++)
					    value[i] = parseInt(data.value[i]);
					var option = {
						    title:{
						        text:'ECharts 数据统计'
						    },
						    tooltip:{
						    	trigger:'axis'
						    },
						    toolbox:{
						    	show:true
						    },
						    legend:{
						        data:['用户来源']
						    },
						    xAxis:{
						        data:data.key
						    },
						    yAxis:{

						    },
						    series:[{
						        name:'平台数量',
						        type:'bar',
						        data:value
						    }]
						};
					myChart.setOption(option);
					
				},
				error:function(){
					alert('hehe');
				},
				dataType:'json'
			});
		}
	}else{
		y = 1;
		ItemNum = ItemNum - 1;
		focus = lastfocus;
		$(this).find('img').attr('src','images/01.gif');
	}
	
});

myChart.on('click',function(data){
	params.push(data.name);
	$.ajaxSetup({ 
		cache: false 
		}); 
	$.ajax({
		type:'GET',
		url:'drill',
		data:{
			option:'1',
			focus:focus,
			list:params
		},
		success:function(data){
			
		},
		dataType:'json'
	});
});
</script>
</body>
</html>