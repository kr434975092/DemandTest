<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类浏览</title>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="tree/dtree.js"></script>
<link rel="StyleSheet" href="tree/dtree.css" type="text/css" />
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
d = new dTree('d');
d.add(0,-1,"分类浏览");
d.add(1,0,'学科领域');
d.add(2,0,'经济行业');
index = 3;

for(var p in subjectArr){
	d.add(index,1,p);
	var temp1 = index;
	index = index + 1;
	for(var p2 in subjectArr[p]){
		d.add(index,temp1,p2);
		var temp2 = index;
		index = index + 1;
		var list1 = subjectArr[p][p2];
		var len = list1.length;
		for(var i = 0;i<len;i++){
			d.add(index,temp2,list1[i]);
			index = index + 1;
		}
	}
}


document.write(d);
</script>
</head>
<body>
<div class="hehe">
<!-- <script type="text/javascript">
		d = new dTree('d');
		d.add(0,-1,"分类浏览");
		d.add(1,0,'学科领域');
		d.add(8,0,'经济行业');
		d.add(9,8,'国家级','admin?method=tree&k1=level&k2=国家级');
		d.add(10,8,'省级','admin?method=tree&k1=level&k2=省级');
		document.write(d);
	</script> -->
</div>
</body>
</html>