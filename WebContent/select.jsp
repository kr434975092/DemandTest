<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
    function objInit(obj){
      return $(obj).html("<option value='请选择'>请选择</option>");
    }
    
    //只写了河北省一组
    var arrData={
      河北省:
      {
        石家庄市:'长安区,桥东区,桥西区,新华区,井陉矿区,裕华区,井陉县,正定县,栾城县,行唐县,灵寿县,高邑县,深泽县,赞皇县,无极县,平山县,元氏县,赵　县,辛集市,藁城市,晋州市,新乐市,鹿泉市',
        唐山市:'路南区,路北区,古冶区,开平区,丰南区,丰润区,滦　县,滦南县,乐亭县,迁西县,玉田县,唐海县,遵化市,迁安市',
        秦皇岛市:'海港区,山海关区,北戴河区,青龙满族自治县,昌黎县,抚宁县,卢龙县',
        邯郸市:'邯山区,丛台区,复兴区,峰峰矿区,邯郸县,临漳县,成安县,大名县,涉　县,磁　县,肥乡县,永年县,邱　县,鸡泽县,广平县,馆陶县,魏　县,曲周县,武安市',
        邢台市:'桥东区,桥西区,邢台县,临城县,内丘县,柏乡县,隆尧县,任　县,南和县,宁晋县,巨鹿县,新河县,广宗县,平乡县,威　县,清河县,临西县,南宫市,沙河市',
        保定市:'新市区,北市区,南市区,满城县,清苑县,涞水县,阜平县,徐水县,定兴县,唐　县,高阳县,容城县,涞源县,望都县,安新县,易　县,曲阳县,蠡　县,顺平县,博野县,雄　县,涿州市,定州市,安国市,高碑店市',
        张家口市:'桥东区,桥西区,宣化区,下花园区,宣化县,张北县,康保县,沽源县,尚义县,蔚　县,阳原县,怀安县,万全县,怀来县,涿鹿县,赤城县,崇礼县',
        承德市:'双桥区,双滦区,鹰手营子矿区,承德县,兴隆县,平泉县,滦平县,隆化县,丰宁满族自治县,宽城满族自治县,围场满族蒙古族自治县',
        沧州市:'新华区,运河区,沧　县,青　县,东光县,海兴县,盐山县,肃宁县,南皮县,吴桥县,献　县,孟村回族自治县,泊头市,任丘市,黄骅市,河间市',
        廊坊市:'安次区,广阳区,固安县,永清县,香河县,大城县,文安县,大厂回族自治县,霸州市,三河市',
        衡水市:'桃城区,枣强县,武邑县,武强县,饶阳县,安平县,故城县,景　县,阜城县,冀州市,深州市'
      }
    };
    
  
    
    var province = "${province}";
    var city = "${city}";
    var country = "${country}";

    
    $.each(arrData,function(pF){
       if(pF==province)$('#selF').append("<option value='"+pF+"' selected>"+pF+"</option>");   //这里的Option没有value值,记得要改
       else $('#selF').append("<option value='"+pF+"'>"+pF+"</option>");
      });
    //构建所在区域的三级联动菜单
      $('#selF').change(function(){
        objInit('#selT');  
        objInit('#selC');	
        $.each(arrData,function(pF,pS){
          if($('#selF option:selected').text()==pF){
            $.each(pS,function(pT,pC){

           		$('#selT').append("<option value='"+pT+"'>"+pT+"</option>");
            });
          //  $('#selT').find("option[value='"+"${city}"+"']").attr("selected","selected");
            $('#selT').change(function(){
              objInit('#selC');
              $.each(pS,function(pT,pC){
                if($('#selT option:selected').text()==pT){
                  $.each(pC.split(","),function(){
             		$('#selC').append("<option value='"+this+"'>"+this+"</option>");
                  })
                }
              })
            });
          }
        })
      });
      $('#selT').change(function(){
    	  objInit('#selC');
    	  $.each(arrData,function(pF,pS){
    		  if($('#selF option:selected').text()==pF){
    			  $.each(pS,function(pT,pC){
    				  if($('#selT option:selected').text()==pT){
    					  $.each(pC.split(","),function(){
    		             		$('#selC').append("<option value='"+this+"'>"+this+"</option>");
    		              });
    				  }
    			  });
    		  }
    	  });
      });
    });
$(document).ready(function(){
	$(".o1").hide();
	$(".o2").hide();
	$(".o3").hide();
	$(".o4").hide();
	$(".o5").hide();
	
	$(".p1").click(function(){
		//$(".o1").slideToggle("fast");
		var text = $(this).children('img').attr('src');
		if(text=='img/plus.jpg'){
			$(this).children('img').attr('src','img/minus.jpg');
			$(".o1").show();
		}
		if(text=='img/minus.jpg'){
			$(this).children('img').attr('src','img/plus.jpg');
			$(".o1").hide();
		}
	});
	
	$(".p2").click(function(){
		//$(".o1").slideToggle("fast");
		var text = $(this).children('img').attr('src');
		if(text=='img/plus.jpg'){
			$(this).children('img').attr('src','img/minus.jpg');
			$(".o2").show();
		}
		if(text=='img/minus.jpg'){
			$(this).children('img').attr('src','img/plus.jpg');
			$(".o2").hide();
		}
	});
	
	$(".p3").click(function(){
		//$(".o1").slideToggle("fast");
		var text = $(this).children('img').attr('src');
		if(text=='img/plus.jpg'){
			$(this).children('img').attr('src','img/minus.jpg');
			$(".o3").show();
		}
		if(text=='img/minus.jpg'){
			$(this).children('img').attr('src','img/plus.jpg');
			$(".o3").hide();
		}
	});
	
	$(".p4").click(function(){
		//$(".o1").slideToggle("fast");
		var text = $(this).children('img').attr('src');
		if(text=='img/plus.jpg'){
			$(this).children('img').attr('src','img/minus.jpg');
			$(".o4").show();
		}
		if(text=='img/minus.jpg'){
			$(this).children('img').attr('src','img/plus.jpg');
			$(".o4").hide();
		}
	});
	
	$(".p5").click(function(){
		//$(".o1").slideToggle("fast");
		var text = $(this).children('img').attr('src');
		if(text=='img/plus.jpg'){
			$(this).children('img').attr('src','img/minus.jpg');
			$(".o5").show();
		}
		if(text=='img/minus.jpg'){
			$(this).children('img').attr('src','img/plus.jpg');
			$(".o5").hide();
		}
	});
	
});
</script>
<style type="text/css">
table.user{
	width:100%;
    text-align:center;
	font-family:微软雅黑;
	font-size:20px;
	color:black;
	border-width:1px;
	border-color:#999999;
	border-collapse:collapse;
}
th{
	background:#b5cfd2 url('img/cell-blue.jpg');
	border-width:1px;
	border-style:solid;
	border-color:#99999;
}
td.td{
	background:#dcddc0 url('img/cell-grey.jpg');
	border-width:1px;
	border-style:solid;
	border-color:#99999;
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
.button{
	width:70px;
	height:30px;
	color:black;
	font-size:20px;
	background-color:white;
	border:1px solid black;
	margin-top:5px;
	margin-bottom:5px;
}
.button:hover{
	color:blue;
	cursor:pointer;
}
img{
	cursor:pointer;
}
ul.pageMenu{
	margin-left:300px;
}
ul.pageMenu > li{
	list-style:none;
	float:left;
}
ul.pageMenu > li > a{
    border: 1px solid black;
    box-shadow: 1px 0 0 rgba(0, 0, 0, 0.1) inset, -1px 0 0 rgba(0, 0, 0, 0.1) inset;
    padding: 9px 15px;
    position: relative;
    text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
    z-index: 2;
    background-color:white;
    text-decoration:none;
}
ul.pageMenu > li > a:link,ul.pageMenu > li > a:visited,ul.pageMenu > li > a:active{
	color:black;
}
ul.pageMenu > li > a:hover{
	color:blue;
}
</style>
<title>多条件综合查询</title>
</head>
<body>
<form action="admin?method=select" method="post">
<table class="user">
<tr><td colspan="3">多条件综合查询(点击子选项添加条件)</td></tr>
<tr><th colspan="3" class="p1"><img src="img/plus.jpg" style="float:left;"/>选择平台涉及的一个三级学科</th></tr>
<tr class="o1"><td class="td">
<select style="width:100px;" name="一级学科">
<option value="" selected>请选择</option>
<option value="石家庄">石家庄</option>
<option value="保定">保定</option>
<option value="衡水">衡水</option>
</select>
<select style="width:100px;" name="二级学科">
<option value="" selected>请选择</option>
<option value="石家庄">石家庄</option>
<option value="保定">保定</option>
<option value="衡水">衡水</option>
</select>
<select style="width:100px;" name="三级学科">
<option value="" selected>请选择</option>
<option value="石家庄">石家庄市</option>
<option value="保定">保定</option>
<option value="衡水">衡水</option>
</select>
</td></tr>
<tr><th colspan="3" class="p2"><img src="img/plus.jpg" style="float:left;"/>选择所属市县</th></tr>
<tr class="o2"><td class="td">
<select name="province" id="selF"><option value="">请选择</option></select>
<select name="city" id="selT"><option value="">请选择</option></select>
<select name="country" id="selC"><option value="">请选择</option></select>
</td></tr>
<tr><th colspan="3" class="p3"><img src="img/plus.jpg" style="float:left;"/>选择平台涉及的一个经济行业</th></tr>
<tr class="o3"><td class="td">
<select style="width:100px;" name="行业1">
<option value="" selected>请选择</option>
<option value="石家庄">石家庄</option>
<option value="保定">保定</option>
<option value="衡水">衡水</option>
</select>
<select style="width:100px;" name="行业2">
<option value="" selected>请选择</option>
<option value="石家庄">石家庄</option>
<option value="保定">保定</option>
<option value="衡水">衡水</option>
</select>
<select style="width:100px;" name="行业3">
<option value="" selected>请选择</option>
<option value="石家庄">石家庄市</option>
<option value="保定">保定</option>
<option value="衡水">衡水</option>
</select>
</td></tr>
<tr><th colspan="3" class="p4"><img src="img/plus.jpg" style="float:left;"/>选择建设类型</th></tr>
<tr class="o4"><td class="td">
<select class="kind" name="kind"> 
		 <option value="" selected>请选择</option>
       <option value="多单位联合共建">多单位联合共建</option> 

       <option value="依托单位独自建设">依托单位独自建设</option> 
		

   </select>  
</td></tr>
<tr><th colspan="3" class="p5"><img src="img/plus.jpg" style="float:left;"/>选择技术领域</th></tr>
<tr class="o5"><td class="td">
<select class="field" name="field"> 
	   <option value="" selected>请选择</option>
       <option value="产业技术研究院">产业技术研究院</option> 

       <option value="重点实验室">重点实验室</option> 

       <option value="工程技术研究中心">工程技术研究中心</option> 


   </select> 
</td></tr>
<tr><td colspan="3" class="td"><input type="submit" class="button" value="查询"/></td></tr>
</table>
</form>
<c:if test="${st==1 }">
<table class="user">
<tr><td colspan="4">查询结果</td></tr>
<tr><th>平台编号</th><th>平台名称</th><th>技术领域</th><th>认证状态</th></tr>
<c:forEach items="${userList}" var="plat">
<tr><td class="td">
<c:if test="${plat.status==1 }"><a href="admin?method=query&infoid=${plat.infoid}">${plat.infoid}</a></c:if>
<c:if test="${plat.status==0 }">${plat.infoid}</c:if>
</td><td class="td">${plat.name }</td><td class="td">${plat.field }</td><td class="td">${plat.status==1?'已认证':'未认证' }</td></tr>
</c:forEach>
<tr><td style="height:60px;background-color:white;"colspan="4"><ul class="pageMenu">${pageCode }</ul></td></tr>
</table></c:if>
<c:if test="${st==2}">
<table style="width:100%">
<tr><td style="font-size:25px;color:black;padding-top:10px;padding-bottom:10px;text-align:center;">无符合要求的查询结果!</td></tr>
</table>
</c:if>
</body>
</html>