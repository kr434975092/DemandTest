<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>在此处插入标题</title>
<link rel="StyleSheet" href="tree/dtree.css" type="text/css" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="js/msgbox.css" />
<script type="text/javascript" src="js/Calendar.js"></script>
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/TeacherInfo.css"/>
<script type="text/javascript" src="tree/dtree.js"></script>
<style type="text/css">
.dtree{
width:15%;
float:left;
border-right:1px solid blue;
}
body {
	font: 14px/1.5 微软雅黑, 微软雅黑, \5b8b\4f53, sans-serif;
}

ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

a {
	margin-left: 5px;
	color: #07F;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}req

input {
	border: 1px solid #ccc;
	margin: 2px;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

td {
	margin: 0;
	padding: 10px;
}

th {
	border-color: #666666;
	background-color: #dedede;
}

#tj td {
	margin: 0;
	padding: 4px;
	border: 0px solid #ccc;
}
table.user{
	float: left;
	width: 100%;
	height: 40px;
	line-height: 40px;
	background: #5ca4d3;
	margin-bottom: 20px;
}
th{
	background: #5ca4d3;
	border-width:0px;
	border-style:solid;
	border-color:#99999;
}
td.td{
	text-align: center;
	background: #fff;
	border-width:0px;
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
</style>
<script type="text/javascript">
var subjectArr = {
		  数学:{
			 数理逻辑与数学基础:['演绎逻辑学','证明论','递归论','数学基础'],
			 数论:['初等数论','解析数论','代数数论','超越数论','概率数论'],
			 代数学:['线性代数','群论','域论 ','微分代数'],
			 几何学:['几何学基础','欧式几何学','黎曼几何学','微分几何学'],
			 拓扑学:['点集拓扑学','代数拓扑学','低维拓扑学','几何拓扑学'],
			 数理统计:['统计推断','假设检验','贝叶斯统计']
		  },
		  信息科学:{
			  信息安全技术:['密码学','安全协议','系统安全','网络安全','软件安全'],
			  仿真科学技术:['仿真应用','控制系统仿真技术'],
			  控制科学技术:['自动控制应用理论','机电一体化技术','自动化仪器仪表与装置','机器人控制']
		  },
		  物理学:{
			  声学:['普通线性声学','流体动力声学','结构声学和振动','建筑声学与电声学','声学测量方法'],
			  电磁学:['电学','磁学','静电学','静磁学','电动力学'],
			  光学:['几何光学','物理光学','非线性光学'],
			  无线电物理:['电磁波物理','量子无线电物理','微波物理学','超高频无线电物理','统计无线电物理'],
			  电子物理学:['量子电子学','电子离子与真空物理','带电粒子光学']
		  },
		   哲学:
		   {
		        哲学:['哲学','逻辑学','宗教学','伦理学']
		  },
		  经济学:
		  {
		     经济学类:['经济学','经济统计学','国民经济管理','资源与环境经济学','商务经济学','金融工程'],
		     财政学类:['财政学','税收学','能源经济']  
		  },
		  法学:
		  {
		     法学类:['法学','知识产权','监狱学'],
		     社会学类:['社会学','社会工作','人类学','女性学']
		  }
		};
var eiArr = {
	    农林牧渔:
	   {
	     农业:['谷物种植','豆类油料和薯类种植','棉、麻、糖、烟草种植','蔬菜、食用菌及园艺作物种植','水果种植','坚果、含油果、香料和饮料作物种植','中药材种植','草种植及割草'],
	    林业:['林木育种和育苗','造林和更新','森林经营、管护和改培','木材和竹材采运','林产品采集'],
	    畜牧业:['牲畜饲养','家禽饲养','狩猎和捕捉动物','其他畜牧业'],
	    渔业:['水产养殖','水产捕捞'],
	    农林牧渔专业及辅助性活动:['农业专业及辅助性活动','林业专业及辅助性活动','畜牧专业及辅助性活动','渔业专业及辅助性活动']
	   },
	    采矿:
	    {
	     煤炭开采和洗选业:['烟煤和无烟煤开采洗选','褐煤开采洗选','其他煤炭采选'],
	     石油和天然气开采业:['石油开采','天然气开采'],
	     黑色金属矿采选业:['铁矿采选','锰矿、铬矿采选','其他黑色金属矿采选'],
	     有色金属矿采选业:['常用有色金属矿采选','贵金属矿采选','稀有稀土金属矿采选'],
	     非金属矿采选业:['土砂石开采','化学矿开采','采盐','石棉及其他非金属矿采选','煤炭开采和洗选专业及辅助性活动'],
	     开采专业及辅助性活动:['石油和天然气开采专业及辅助性活动','其他开采专业及辅助性活动'],
	     其他采矿业:['其他采矿业'] 
	    }
	}

d = new dTree('d');
d.add(0,-1,"分类浏览");
d.add(1,0,'学科领域');
d.add(2,0,'经济行业');
index = 3;
for(var p in subjectArr){
	d.add(index,1,p,'javascript:','suc');
	var temp1 = index;
	index = index + 1;
	for(var p2 in subjectArr[p]){
		d.add(index,temp1,p2,'javascript:','suc');
		var temp2 = index;
		index = index + 1;
		var list1 = subjectArr[p][p2];
		var len = list1.length;
		for(var i = 0;i<len;i++){
			d.add(index,temp2,list1[i],"javascript:",'suc');
			index = index + 1;
		}
	}
}
for(var p in eiArr){
	d.add(index,2,p,'javascript:','fin');
	var temp1 = index;
	index = index + 1;
	for(var p2 in eiArr[p]){
		d.add(index,temp1,p2,'javascript:','fin');
		var temp2 = index;
		index = index + 1;
		var list1 = eiArr[p][p2];
		var len = list1.length;
		for(var i = 0;i<len;i++){
			d.add(index,temp2,list1[i],"javascript:",'fin');
			index = index + 1;
		}
	}
}

document.write(d);



var tjNum = 1; //条件数量
var infoData = "";
var isPass = 1;
//添加条件
function addTJ() {
    if (tjNum >= 4) {
        return;
    }
    tjNum = tjNum + 1;
    content = "<tr id='"+tjNum+"'><td></td><td><select class='orand' name='orand'><option value='or'>或者</option><option value='and'>并且</option><option value='not'>不含</option></select></td>";
    content += "<td><select class='i-text'><option value='random'>任意词</option><option value='name'>平台名称</option><option value='kind'>建设类型</option><option value='pk'>技术领域</option><option value='pcc'>所属市县</option></select></td>";
    content += "<td><input class='find' type='text' maxlength='15' name='find'/></td>";
    content += "<td><select class='lidu'><option value='1'>模糊</option><option value=''>精确</option></select></td>";
    $("#tj").append(content);
}
//删除条件
function minusTJ() {
    if (tjNum == 1) {
        return;
    }
    $("#" + tjNum).remove();
    tjNum = tjNum - 1;
}
function getItem(){
	
	var orand = $('.orand');
	var key = $('.i-text');
	var value = $('.find');
	var bFind = $('#beforeFind').val();
	var aFind = $('#afterFind').val();
	var lidu = $('.lidu');
	if(bFind != '' && aFind != '' && bFind > aFind){
		alert('结束日期不能在开始日期前!');
		return;
	}
	/*
	if(((bFind==''||bFind==null)&&aFine!='')||(bFind!=''&&(aFine==''||aFine==null))){
		alert('如果填写日期请完整填写!');
		return;
	}
	*/
	if((bFind==''&&aFind!= '')||(bFind!='' && aFind=='')){
		alert('请完整填写日期!');
		return;
	}
	
	var orandList = new Array();
	var keyList = new Array();
	var valueList = new Array();
	var month = new Array();
	var year = new Array();
	var liduList = new Array();
	
	
	for(var i = 0;i<orand.length;i++)
		orandList.push(orand.eq(i).val());
	for(var i = 0;i<key.length;i++)
		keyList.push(key.eq(i).val());
	for(var i = 0;i<value.length;i++)
		valueList.push(value.eq(i).val());
	for(var i = 0;i<lidu.length;i++)
		liduList.push(lidu.eq(i).val());
	if(bFind!=''){
		var date1 = bFind.split('-');
		month.push(date1[1]);
		year.push(date1[0]);
	}
	if(aFind!=''){
		var date2 = aFind.split('-');
		month.push(date2[1]);
		year.push(date2[0]);
	}
	$.ajaxSetup({ 
		cache: false 
		}); 
	
	$.ajax({
	  type:'GET',
	  url:'select',
	  data:{
		   method:'hehe',
		   option:'1',
		   orand:orandList,
		   key:keyList,
		   lidu:liduList,
		   value:valueList,
		   month:month,
		   year:year
	  },
	  success:function(data){
		  $('.user').remove();
		  $('.result').remove();
		  if(data.length>0){
			 $('.show').append("<table class='user'></table>");
			  $('.user').append("<tr><th>平台编号</th><th>平台名称</th><th>技术领域</th><th>认证状态</th></tr>");
				$.each(data,function(index){
					if(data[index].status=='已认证')$('.user').append("<tr><td class='td'><a href='admin?method=query&infoid="+data[index].id+"' target='_blank'>"+data[index].id+"</a></td><td class='td'>"+data[index].name+"</td><td class='td'>"+data[index].pk+"</td><td class='td'>"+data[index].status+"</td></tr>");
					else $('.user').append("<tr><td class='td'>"+data[index].id+"</td><td class='td'>"+data[index].name+"</td><td class='td'>"+data[index].pk+"</td><td class='td'>"+data[index].status+"</td></tr>");
				});
		  }else{
			  $('.show').append("<p class='result' style='margin-left:30px;'>没有符合要求的查询结果!</p>");
		  }
		},
	  dataType:'json'
	});
	
}


d.s = function(nodeId){
	//父
	var pid = this.aNodes[nodeId].pid;
	//祖父
	var ppid = this.aNodes[pid].pid;
	var text1;
	var text2;
	var text3;
	var option;
	if(this.aNodes[ppid].name=='分类浏览'){
		text1 = this.aNodes[nodeId].name;
		option='1';
	}else if(this.aNodes[ppid].name=='学科领域'||this.aNodes[ppid].name=='经济行业'){
		option='2';
		text1 = this.aNodes[pid].name;
		text2 = this.aNodes[nodeId].name;
	}else{
		option='3';
		text1 = this.aNodes[ppid].name;
		text2 = this.aNodes[pid].name;
		text3 = this.aNodes[nodeId].name;
	}
	
	var orand = $('.orand');
	var key = $('.i-text');
	var value = $('.find');
	var bFind = $('#beforeFind').val();
	var aFind = $('#afterFind').val();
	var lidu = $('.lidu');
	if(bFind > aFind && bFind != '' && aFind != ''){
		alert('结束日期不能在开始日期前!');
		return;
	}
	
	
	
	var orandList = new Array();
	var keyList = new Array();
	var valueList = new Array();
	var month = new Array();
	var year = new Array();
	var liduList = new Array();
	
	
	for(var i = 0;i<orand.length;i++)
		orandList.push(orand.eq(i).val());
	for(var i = 0;i<key.length;i++)
		keyList.push(key.eq(i).val());
	for(var i = 0;i<value.length;i++)
		valueList.push(value.eq(i).val());
	for(var i = 0;i<lidu.length;i++)
		liduList.push(lidu.eq(i).val());
	if(bFind!=''){
		var date1 = bFind.split('-');
		month.push(date1[1]);
		year.push(date1[0]);
	}
	if(aFind!=''){
		var date2 = aFind.split('-');
		month.push(date2[1]);
		year.push(date2[0]);
	}
	
	$.ajaxSetup({ 
		cache: false 
		}); 
	
	$.ajax({
		type:'GET',
		  url:'select',
		  data:{
			   method:'hehe',
			   option:'2',
			   orand:orandList,
			   key:keyList,
			   lidu:liduList,
			   value:valueList,
			   month:month,
			   year:year,
			   title:this.aNodes[nodeId].title,
			   option1:option,
			   params1:text1,
			   params2:text2,
			   params3:text3
		  },
		  success:function(data){
			  $('.user').remove();
			  $('.result').remove();
			  if(data.length>0){
				  $('.show').append("<table class='user'></table>");
				  $('.user').append("<tr><th>平台编号</th><th>平台名称</th><th>技术领域</th><th>认证状态</th></tr>");
					$.each(data,function(index){
						if(data[index].status=='已认证')$('.user').append("<tr><td class='td'><a href='admin?method=query&infoid="+data[index].id+"' target='_blank'>"+data[index].id+"</a></td><td class='td'>"+data[index].name+"</td><td class='td'>"+data[index].pk+"</td><td class='td'>"+data[index].status+"</td></tr>");
						else $('.user').append("<tr><td class='td'>"+data[index].id+"</td><td class='td'>"+data[index].name+"</td><td class='td'>"+data[index].pk+"</td><td class='td'>"+data[index].status+"</td></tr>");
					});
			  }else{
				  $('.show').append("<p class='result' style='margin-left:30px;'>没有符合要求的查询结果!</p>");
			  }
			},
		  dataType:'json'
	});
	
}

</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#eeeeee" bgcolor="#eeeeee">
<div style="width:83%;float:right;">
<div id="show" style="background-color: #ffffff; position: relative; margin-top: 5px; margin-left: 10px; border: #ffffff 2px solid">
		<div style="position: relative; min-height: 490px;">
			<div style="background: #eeeeee; position: relative;" align="center">平台信息高级检索</div>
			<fieldset>
				<legend>
					<strong>选择筛选条件：</strong>
				</legend>
				<div style="background-color: #ffffff; position: relative; margin-top: 8px; margin-left: 12px; border: #ffffff 2px solid;">
					<table bgcolor="#FFFFFF" cellspacing="0" cellpadding="0" id="tj">
							<tr>
								<td><span style="margin-left: 29px"><strong>条件:</strong></span></td>
								<td style="width:60px;"><img
									src="images/01.gif"
									onclick="addTJ()" style="cursor: hand;">&nbsp;&nbsp;<img
									src="images/02.gif"
									onclick="minusTJ()" style="cursor: hand;">
								</td>
								<td>
									<select class="i-text" name="search1" id="search1" onchange="showInfo(this.id);">
											<option value='random'>任意词</option><option value='name'>平台名称</option><option value='kind'>建设类型</option><option value='pk'>技术领域</option><option value='pcc'>所属市县</option>
									</select>
								</td>	
								<!-- 第一个条件的输入 -->
								<td id="search1td">
									<input class='find' maxlength="15" name="find" id="find" type="text">	
								</td>		
								<td>
								    <select class='lidu'><option value='1'>模糊</option><option value='2'>精确</option></select>
								</td>															
								<td>
									<input type="submit" class="submit" onclick="getItem()" value="&nbsp;查&nbsp;询&nbsp;" size="30">
								</td>								
							</tr>
					</table>
					<table bgcolor="#FFFFFF" cellspacing="0" cellpadding="0" id="tjt">
					  <tr>
					    <td><span style="margin-left: 22px"><strong>平台批准日期:</strong></span></td>
					    <td><input size='10' onclick='new Calendar().show(this);' id='beforeFind'/>----<input size='10' onclick='new Calendar().show(this);' id='afterFind'/></td>
					  </tr>
					</table>
				</div>
			</fieldset>
			
			<div>
				平台查询结果：
				<div class='show'>
					
				</div>
				</div>
				<!-- <%//@include file="/common/paging.jsp"%> -->
				
			</div>
		</div>
	</div></div>
	<script src="js/jquery-1.9.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$('.info li').click(function() {
				$(this).addClass("active").siblings().removeClass("active");
				$('.basic .select').eq($("ul li").index(this)).addClass("active").siblings().removeClass("active")
			});
			$('.basicInfo ol').on('click','li',function(){
				$(this).addClass('active').siblings().removeClass('active');
			});
			$('.payInfo ol').on('click','li',function(){
				$(this).addClass('active').siblings().removeClass('active');
			});
		</script>
</body>
</html>