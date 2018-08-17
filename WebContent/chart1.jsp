<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <style type="text/css">
	.table1 {
		border-bottom-width: 2px;
		align:center;
		border: 1px solid #bac4cb;
    	color: #5e686f;
  	  	background: #e7f2f9;
  	  	width: 1000px;
	}
	.table1 td{
	    display: table-cell;
    	vertical-align: inherit;
    	border: 1px solid #bac4cb;
	}
	.choose{
		color:red
	
	}
	
	.div1{
	float:left;
	width:70px;
	}
	p{
	 width: 1000px;
    height: 40px;
    line-height: 40px;
    background: #5ca4d3;
    color: #fff;
    font-size: 20px;
    text-align: center;
	}
</style>
    <title>My JSP 'chart.jsp' starting page</title>
<script src="js/jquery-3.3.1.js" type="text/javascript"></script>
<script src="js/echarts.js" type="text/javascript"></script>
  </head>
  <script type="text/javascript">
 
  var json=[];
  
	function MyAutoRun(){ 
 $.ajax({ 
    type: "post", 
    url: "Servlet/Cservlet", 
    data:
    {
		"method":"chart1" 
    },
	 success: function (data) {
	 
		json=JSON.parse(data);
		
		chart1();
		},
		error: function() {
            alert("网络异常，请稍后重试");
    		} 
		})
		};
		 
		    window.onload=MyAutoRun();
		 
		  
		
  </script>
  <body>
  <p>筛选结果：</p>
    <table width="1000" class="table1" >
    
  <tr id="Ctable">  
  </tr>
  <tr id="Btable">  
  </tr>
</table>
<div id="main" style="width: 1000px;height:400px;margin-top: 30px"></div>
<div  id="rank" class="div1" >中国</div>
<div id="rank2" class="div1"></div>
<div  id="rank3" class="div1"></div>
  </body>
  <script type="text/javascript">
   var myChart = echarts.init(document.getElementById('main'));
   
   var test=1;//标识省份=1，城市=2，县=3值
   
  function chart1(){
        var key=new Array();
        var value=new Array();
        var i=0;
     	for(var p in json){//遍历json对象的每个key/value对,p为key
     		key[i]=p;
     		value[i]=parseInt(json[p]);
     		i++;
		}
		
        
        
		$("#Ctable").html(" ");
		$("#Btable").html(" ");
		for(var p in json)
		{
			$txt="<td width='70' id='"+p+"'>"+p+"</td>";
			$("#Ctable").append($txt);
		}
		for(var p in json)
		{
			$txt="<td width='70' id='"+parseInt(json[p])+"'>"+parseInt(json[p])+"</td>";
			$("#Btable").append($txt);
		}
		$("#Ctable td").click(function(){
    		$name=$(this).text();
    		
    		test++;
    	if(test==4)
    	{
    		test=1;
    	}
   		$.ajax({ 
    		type: "post", 
   			 url: "Servlet/Cservlet", 
    		data:
    	{
		"method":"chart2",
		"list": $name,
		"test":test
    },
	 success: function (data) {
		rank(test,$name);
		json=JSON.parse(data);
		chart1();
		},
		error: function() {
            alert("网络异常，请稍后重试");
    		} 
		})
    		
		})
        // 指定图表的配置项和数据
      
      	var array = [];
		
		for(var i = 0;  i<key.length; i++){
     	var temp = {name : key[i], value : value[i]};
     	array.push(temp)
		}
        var option = {
            title: {
                text: '年报统计'
            },
            series: [{
                name: '数量',
                type: 'pie',
                radius: '55%',
                data: array
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        }
        
     myChart.on('click', function (params) {
    // 控制台打印数据的名称
    	test++;
    	if(test==4)
    	{
    		test=1;
    	}
   		$.ajax({ 
    		type: "post", 
   			 url: "Servlet/Cservlet", 
    		data:
    	{
		"method":"chart2",
		"list": params.name,
		"test":test
    },
	 success: function (data) {
		rank(test,params.name);
		json=JSON.parse(data);
		chart1();
		},
		error: function() {
            alert("网络异常，请稍后重试");
    		} 
		})
	})
  	
  
  	
  	function rank(test,name)
  	{
  		if(test==1)
  		{
  			$("#rank1").text("")
  			$("#rank2").text("")
  			$("#rank3").text("")
  		}
  		if(test==2)
  		{
  			$("#rank2").text(name+">")
  			$("#rank3").text("")
  		}
  		if(test==3)
  		{
  			$("#rank3").text(name)
  		}
  	
  	}
  	
  	$("#rank2").on("click",function(){
  	
  	  
  		$.ajax({ 
    		type: "post", 
   			 url: "Servlet/Cservlet", 
    		data:
    	{
		"method":"chart2",
		"list": $("#rank2").text(),
		"test":1
    },
	 success: function (data) {
		json=JSON.parse(data);
		rank(1,$("#rank2").text())
		chart1();
		},
		error: function() {
            alert("网络异常，请稍后重试");
    		} 
		})
	})
	
	$("#rank3").on("click",function(){
	
  	  var s=$("#rank2").text()
  	  s=s.substring(0,s.length-1)
  		$.ajax({ 
    		type: "post", 
   			 url: "Servlet/Cservlet", 
    		data:
    	{
		"method":"chart2",
		"list": s,
		"test":2
    },
	 success: function (data) {
		json=JSON.parse(data);
		rank(2,$("#rank2").text())
		chart1();
		},
		error: function() {
            alert("网络异常，请稍后重试");
    		} 
		})
	})
    </script>
</html>
