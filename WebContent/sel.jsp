<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>右侧的高级检索</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="js/msgbox.css" />
<script type="text/javascript" src="js/Calendar.js"></script>
<style type="text/css">
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
</style>
<script type="text/javascript">
var tjNum = 1; //条件数量
var infoData = "";
var isPass = 1;<%//=request.getParameter("isPass")%>
//添加条件
function addTJ() {
    if (tjNum >= 4) {
        return;
    }
    tjNum = tjNum + 1;
    content = "<tr id='"+tjNum+"'><td></td><td><select class='orand' name='orand'><option value='or'>或者</option><option value='and'>并且</option><option value='not'>不含</option></select></td>";
    content += "<td><select class='i-text'><option value='random'>任意词</option><option value='name'>平台名称</option><option value='kind'>建设类型</option><option value='pk'>技术领域</option><option value='pcc'>所属市县</option></select></td>";
    content += "<td><input class='find' type='text' maxlength='15' name='find'/></td>";
    content += "<td><select name='lidu'><option value=''>模糊</option><option value=''>精确</option></select></td>";
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
	if(bFind > aFind && bFind != '' && aFind != ''){
		alert('结束日期不能在开始日期前!');
		return;
	}
	
	
	
	var orandList = new Array();
	var keyList = new Array();
	var valueList = new Array();
	var month = new Array();
	var year = new Array();
	
	
	
	for(var i = 0;i<orand.length;i++)
		orandList.push(orand.eq(i).val());
	for(var i = 0;i<key.length;i++)
		keyList.push(key.eq(i).val());
	for(var i = 0;i<value.length;i++)
		valueList.push(value.eq(i).val());
	
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
	
	
	$.ajax({
	  type:'POST',
	  url:'select',
	  data:{
		   method:'hehe',
		   orand:orandList,
		   key:keyList,
		   value:valueList,
		   month:month,
		   year:year
	  },
	  success:function(data){
			alert('获取成功');
		},
	  dataType:'json'
	});
	
}

</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="#B1D8EA" bgcolor="#B1D8EA" onload="getInfoData();">	
	<div id="show" style="background-color: #ffffff; position: relative; margin-top: 5px; margin-left: 10px; border: #ffffff 2px solid">
		<div style="position: relative; min-height: 490px;">
			<div style="background: #C0E4FA; position: relative;" align="center">平台信息高级检索</div>
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
									<input class="demo2_class1" maxlength="15" name="find" id="find" type="text">	
								</td>		
								<td>
								    <select name='lidu'><option value=''>模糊</option><option value=''>精确</option></select>
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
				<div>
					<table width='100%' style="table-layout: fixed" id="list">
					</table>
				</div>
				<!-- <%//@include file="/common/paging.jsp"%> -->
				
			</div>
		</div>
	</div></body>
</html>