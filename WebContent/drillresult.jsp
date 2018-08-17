<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据挖掘结果</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
</head>
<body>
<canvas id="a_canvas" width="1000" height="700"></canvas>
<script type="text/javascript">
(function (){
	 
    window.addEventListener("load", function(){

    	var count = new Array();
        var title = new Array();
    
      var index = 0;
      
      <c:forEach items="${list}" var="lst">
        count[index]="${lst.count}";
        title[index]="${lst.title}";
        index++;
      </c:forEach>
      
      // 获取上下文
      var a_canvas = document.getElementById('a_canvas');
      var context = a_canvas.getContext("2d");


      // 绘制背景
      var gradient = context.createLinearGradient(0,0,0,300);


     // gradient.addColorStop(0,"#e0e0e0");
      //gradient.addColorStop(1,"#ffffff");


      context.fillStyle = gradient;

      context.fillRect(0,0,a_canvas.width,a_canvas.height);

      var realheight = a_canvas.height-15;
      var realwidth = a_canvas.width-40;
      // 描绘边框
      var grid_cols = count.length + 1;
      var grid_rows = 4;
      var cell_height = realheight / grid_rows;
      var cell_width = realwidth / grid_cols;
      context.lineWidth = 1;
      context.strokeStyle = "#a0a0a0";

      // 结束边框描绘
      context.beginPath();
      // 准备画横线
      /*for(var row = 1; row <= grid_rows; row++){
        var y = row * cell_height;
        context.moveTo(0,y);
        context.lineTo(a_canvas.width, y);
      }*/
      
        //划横线
        context.moveTo(0,realheight);
        context.lineTo(realwidth,realheight);
            
         
        //画竖线
      context.moveTo(0,20);
       context.lineTo(0,realheight);
      context.lineWidth = 1;
      context.strokeStyle = "black";
      context.stroke();
          

      var max_v =0;
      
      for(var i = 0; i<count.length; i++){
        if (count[i] > max_v) { max_v =count[i]};
      }
      max_v = max_v * 1.1;
      // 将数据换算为坐标
      var points = [];
      for( var i=0; i < count.length; i++){
        var v= count[i];
        var px = cell_width*(i +1);
        var py = realheight - realheight*(v / max_v);
        //alert(py);
        points.push({"x":px,"y":py});
      }

      //绘制坐标图形
      for(var i in points){
        var p = points[i];
        context.beginPath();
        context.fillStyle="green";
        context.fillRect(p.x,p.y,15,realheight-p.y);
         
        context.fill();
      }
      //添加文字
      for(var i in points)
      {  var p = points[i];
        context.beginPath();
        context.fillStyle="black";
        context.fillText(count[i], p.x + 1, p.y - 15);
         context.fillText(title[i],p.x + 1,realheight+12);
         context.fillText('月份',realwidth,realheight+12);
         context.fillText('资金量',0,10);
          }
    },false);
  })();
   
</script>
</body>
</html>