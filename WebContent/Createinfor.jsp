<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Bean.*"%>
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
</script>
<script type="text/javascript" async src="style/js/conversion.js"></script>
<script src="style/js/allmobilize.min.js" charset="utf-8"
	id="allmobilize"></script>
<style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>发布新职位-招聘服务-助成招聘-最专业的互联网招聘平台</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="助成招聘  助成招聘">
<meta name="keywords"
	content="互联网招聘, 助成互联网招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 跳槽, 高薪职位, 互联网圈子, IT招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招">
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">

<script type="text/javascript">
	var ctx = "http://www.zhucheng.com";
	console.log(1);
	function myCheck()
      {
        for(var i=0;i<document.form1.elements.length-1;i++)
        {
         if(document.form1.elements[i].value=="")
         {
           alert("当前表单不能有空项");
           document.form1.elements[i].focus();
           return false;
         }
        }
        return true;
        
      }
</script>
<script>
 window.onload=function(){
 
        var txtObj = document.getElementById('txt1');
        var spanObj = document.getElementById('s1');
 
        //自动保存
        txtObj.addBehavior("#default#userData");
 
        var saveTimer= setInterval(function(){
            txtObj.setAttribute('OValue',txtObj.value);
            txtObj.save('SavedData');
 
            spanObj.innerText='数据保存于：'+(new Date());
            setTimeout(function(){
                spanObj.innerText='';
            },1000);
 
        },1000); //每分钟保存一次
 
 
        document.getElementById('btn2').attachEvent('onclick',function(){
            txtObj.load('SavedData');
            alert(txtObj.getAttribute('OValue'));
            //txtObj.value = txtObj.getAttribute('OValue');
        });
    };
    var click=1;
    function add()
    {

   		  if(click==1)
                    {
    	var p=document.getElementById('共建单位1');p.style.display='block';
    	 click=2;
    	}
    	else if(click==2){
    	var p1=document.getElementById('共建单位2');p1.style.display='block';
    	}
    
    }
    function upperCase(phone)
        {
        var phone = document.getElementById(phone).value;
        if(!(/^1[34578]\d{9}$/.test(phone))){ 
            alert("手机号码有误，请重填");  
            return false; 
        } 
        }
         function email(phone)
        {
        var phone = document.getElementById(phone).value;
        if(!(/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/.test(phone))){ 
            alert("电子邮箱有误，请重填");  
            return false; 
        } 
        }
</script>
<link href="http://www.zhucheng.com/images/favicon.ico"
	rel="Shortcut Icon">
<link href="style/css/style.css" type="text/css" rel="stylesheet">
<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="style/css/popup.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
<script src="style/js/additional-methods.js" type="text/javascript"></script>

<script>
	function changetext() {
		var x = document.getElementById("企业法人").removeAttribute('disabled');
		;
		var y = document.getElementById("事业法人").removeAttribute('disabled');
		;
		var z = document.getElementById("社团法人").removeAttribute('disabled');
		;
	}
</script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript">
	var youdao_conv_id = 271546;
</script>
<script src="style/js/conv.js" type="text/javascript"></script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script>
<script src="style/js/js7_jsAddress.js" type="text/javascript"></script>
<script src="style/js/industy.js" type="text/javascript"></script>
<script src="style/js/class.js" type="text/javascript"></script>
<style type="text/css">
.BMap_mask {
	background: transparent url(style/images/img/blank.gif);
}

.BMap_noscreen {
	display: none;
}

.BMap_button {
	cursor: pointer;
}

.BMap_zoomer {
	background-image: url(style/images/img/mapctrls1d3.gif);
	background-repeat: no-repeat;
	overflow: hidden;
	font-size: 1px;
	position: absolute;
	width: 7px;
	height: 7px;
}

.BMap_stdMpCtrl div {
	position: absolute;
}

.BMap_stdMpPan {
	width: 44px;
	height: 44px;
	overflow: hidden;
	background: url(style/images/img/mapctrls2d0.png) no-repeat;
}

.BMap_ie6 .BMap_stdMpPan {
	background: none;
}

.BMap_ie6 .BMap_smcbg {
	left: 0;
	width: 44px;
	height: 464px;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src="style/images/img/mapctrls2d0.png");
}

.BMap_ie6 .BMap_stdMpPanBg {
	z-index: -1;
}

.BMap_stdMpPan .BMap_button {
	height: 15px;
	width: 15px;
}

.BMap_panN, .BMap_panW, .BMap_panE, .BMap_panS {
	overflow: hidden;
}

.BMap_panN {
	left: 14px;
	top: 0;
}

.BMap_panW {
	left: 1px;
	top: 12px;
}

.BMap_panE {
	left: 27px;
	top: 12px;
}

.BMap_panS {
	left: 14px;
	top: 25px;
}

.BMap_stdMpZoom {
	top: 45px;
	overflow: hidden;
}

.BMap_stdMpZoom .BMap_button {
	width: 22px;
	height: 21px;
	left: 12px;
	overflow: hidden;
	background-image: url(style/images/img/mapctrls2d0.png);
	background-repeat: no-repeat;
	z-index: 10;
}

.BMap_ie6 .BMap_stdMpZoom .BMap_button {
	background: none;
}

.BMap_stdMpZoomIn {
	background-position: 0 -221px;
}

.BMap_stdMpZoomOut {
	background-position: 0 -265px;
}

.BMap_ie6 .BMap_stdMpZoomIn div {
	left: 0;
	top: -221px;
}

.BMap_ie6 .BMap_stdMpZoomOut div {
	left: 0;
	top: -265px;
}

.BMap_stdMpType4 .BMap_stdMpZoom .BMap_button {
	left: 0;
	overflow: hidden;
	background: -webkit-gradient(linear, 50% 0, 50% 100%, from(rgba(255, 255, 255, 0.85)),
		to(rgba(217, 217, 217, 0.85)));
	z-index: 10;
	-webkit-border-radius: 22px;
	width: 34px;
	height: 34px;
	border: 1px solid rgba(255, 255, 255, 0.5);
	-webkit-box-shadow: 0 2px 3.6px #CCC;
	display: -webkit-box;
	-webkit-box-align: center;
	-webkit-box-pack: center;
	-webkit-box-sizing: border-box;
}

.BMap_stdMpType4 .BMap_smcbg {
	position: static;
	background: url(style/images/img/mapctrls2d0_mb.png) 0 0 no-repeat;
	-webkit-background-size: 24px 32px;
}

.BMap_stdMpType4 .BMap_stdMpZoomIn {
	background-position: 0 0;
}

.BMap_stdMpType4 .BMap_stdMpZoomIn .BMap_smcbg {
	width: 24px;
	height: 24px;
	background-position: 0 0;
}

.BMap_stdMpType4 .BMap_stdMpZoomOut {
	background-position: 0 0;
}

.BMap_stdMpType4 .BMap_stdMpZoomOut .BMap_smcbg {
	width: 24px;
	height: 6px;
	background-position: 0 -25px;
}

.BMap_stdMpSlider {
	width: 37px;
	top: 18px;
}

.BMap_stdMpSliderBgTop {
	left: 18px;
	width: 10px;
	overflow: hidden;
	background: url(style/images/img/mapctrls2d0.png) no-repeat -23px -226px;
}

.BMap_stdMpSliderBgBot {
	left: 19px;
	height: 8px;
	width: 10px;
	top: 124px;
	overflow: hidden;
	background: url(style/images/img/mapctrls2d0.png) no-repeat -33px bottom;
}

.BMap_ie6 .BMap_stdMpSliderBgTop, .BMap_ie6 .BMap_stdMpSliderBgBot {
	background: none;
}

.BMap_ie6 .BMap_stdMpSliderBgTop div {
	left: -23px;
	top: -226px;
}

.BMap_ie6 .BMap_stdMpSliderBgBot div {
	left: -33px;
	bottom: 0;
}

.BMap_stdMpSliderMask {
	height: 100%;
	width: 24px;
	left: 10px;
	cursor: pointer;
}

.BMap_stdMpSliderBar {
	height: 11px;
	width: 19px;
	left: 13px;
	top: 80px;
	overflow: hidden;
	background: url(style/images/img/mapctrls2d0.png) no-repeat 0 -309px;
}

.BMap_stdMpSliderBar.h {
	background: url(style/images/img/mapctrls2d0.png) no-repeat 0 -320px;
}

.BMap_ie6 .BMap_stdMpSliderBar, .BMap_ie6 .BMap_stdMpSliderBar.h {
	background: none;
}

.BMap_ie6 .BMap_stdMpSliderBar div {
	top: -309px;
}

.BMap_ie6 .BMap_stdMpSliderBar.h div {
	top: -320px;
}

.BMap_zlSt, .BMap_zlCity, .BMap_zlProv, .BMap_zlCountry {
	position: absolute;
	left: 34px;
	height: 21px;
	width: 28px;
	background-image: url(style/images/img/mapctrls2d0.png);
	background-repeat: no-repeat;
	font-size: 0;
	cursor: pointer;
}

.BMap_ie6 .BMap_zlSt, .BMap_ie6 .BMap_zlCity, .BMap_ie6 .BMap_zlProv,
	.BMap_ie6 .BMap_zlCountry {
	background: none;
	overflow: hidden;
}

.BMap_zlHolder {
	display: none;
	position: absolute;
	top: 0;
}

.BMap_zlHolder.hvr {
	display: block;
}

.BMap_zlSt {
	background-position: 0 -380px;
	top: 21px;
}

.BMap_zlCity {
	background-position: 0 -401px;
	top: 52px;
}

.BMap_zlProv {
	background-position: 0 -422px;
	top: 76px;
}

.BMap_zlCountry {
	background-position: 0 -443px;
	top: 100px;
}

.BMap_ie6 .BMap_zlSt div {
	top: -380px;
}

.BMap_ie6 .BMap_zlCity div {
	top: -401px;
}

.BMap_ie6 .BMap_zlProv div {
	top: -422px;
}

.BMap_ie6 .BMap_zlCountry div {
	top: -443px;
}

.BMap_stdMpType1 .BMap_stdMpSlider, .BMap_stdMpType2 .BMap_stdMpSlider,
	.BMap_stdMpType3 .BMap_stdMpSlider, .BMap_stdMpType4 .BMap_stdMpSlider,
	.BMap_stdMpType2 .BMap_stdMpZoom, .BMap_stdMpType3 .BMap_stdMpPan,
	.BMap_stdMpType4 .BMap_stdMpPan {
	display: none;
}

.BMap_stdMpType3 .BMap_stdMpZoom {
	top: 0;
}

.BMap_stdMpType4 .BMap_stdMpZoom {
	top: 0;
}

.BMap_cpyCtrl a {
	font-size: 11px;
	color: #7979CC;
}

.BMap_scaleCtrl {
	height: 23px;
	overflow: hidden;
}

.BMap_scaleCtrl div.BMap_scaleTxt {
	font-size: 11px;
	font-family: Arial, sans-serif;
}

.BMap_scaleCtrl div {
	position: absolute;
	overflow: hidden;
}

.BMap_scaleHBar img, .BMap_scaleLBar img, .BMap_scaleRBar img {
	position: absolute;
	width: 37px;
	height: 442px;
	left: 0;
}

.BMap_scaleHBar {
	width: 100%;
	height: 5px;
	font-size: 0;
	bottom: 0;
}

.BMap_scaleHBar img {
	top: -437px;
	width: 100%;
}

.BMap_scaleLBar, .BMap_scaleRBar {
	width: 3px;
	height: 9px;
	bottom: 0;
	font-size: 0;
	z-index: 1;
}

.BMap_scaleLBar img {
	top: -427px;
	left: 0;
}

.BMap_scaleRBar img {
	top: -427px;
	left: -5px;
}

.BMap_scaleLBar {
	left: 0;
}

.BMap_scaleRBar {
	right: 0;
}

.BMap_scaleTxt {
	text-align: center;
	width: 100%;
	cursor: default;
	line-height: 18px;
}

.BMap_omCtrl {
	background-color: #fff;
	overflow: hidden;
}

.BMap_omOutFrame {
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
}

.BMap_omInnFrame {
	position: absolute;
	border: 1px solid #999;
	background-color: #ccc;
	overflow: hidden;
}

.BMap_omMapContainer {
	position: absolute;
	overflow: hidden;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
}

.BMap_omViewMv {
	border-width: 1px;
	border-style: solid;
	border-left-color: #84b0df;
	border-top-color: #adcff4;
	border-right-color: #274b8b;
	border-bottom-color: #274b8b;
	position: absolute;
	z-index: 600;
}

.BMap_omViewInnFrame {
	border: 1px solid #3e6bb8;
}

.BMap_omViewMask {
	width: 1000px;
	height: 1000px;
	position: absolute;
	left: 0;
	top: 0;
	background-color: #68c;
	opacity: .2;
	filter: progid:DXImageTransform.Microsoft.Alpha(opacity=20);
}

.BMap_omBtn {
	height: 13px;
	width: 13px;
	position: absolute;
	cursor: pointer;
	overflow: hidden;
	background: url(style/images/img/mapctrls1d3.gif) no-repeat;
	z-index: 1210;
}

.anchorBR .BMap_omOutFrame {
	border-top: 1px solid #999;
	border-left: 1px solid #999;
}

.quad4 .BMap_omBtn {
	background-position: -26px -27px;
}

.quad4 .BMap_omBtn.hover {
	background-position: 0 -27px;
}

.quad4 .BMap_omBtn.BMap_omBtnClosed {
	background-position: -39px -27px;
}

.quad4 .BMap_omBtn.BMap_omBtnClosed.hover {
	background-position: -13px -27px;
}

.anchorTR .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
}

.quad1 .BMap_omBtn {
	background-position: -39px -41px;
}

.quad1 .BMap_omBtn.hover {
	background-position: -13px -41px;
}

.quad1 .BMap_omBtn.BMap_omBtnClosed {
	background-position: -26px -41px;
}

.quad1 .BMap_omBtn.BMap_omBtnClosed.hover {
	background-position: 0 -41px;
}

.anchorBL .BMap_omOutFrame {
	border-top: 1px solid #999;
	border-right: 1px solid #999;
}

.quad3 .BMap_omBtn {
	background-position: -27px -40px;
}

.quad3 .BMap_omBtn.hover {
	background-position: -1px -40px;
}

.quad3 .BMap_omBtn.BMap_omBtnClosed {
	background-position: -40px -40px;
}

.quad3 .BMap_omBtn.BMap_omBtnClosed.hover {
	background-position: -14px -40px;
}

.anchorTL .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-right: 1px solid #999;
}

.quad2 .BMap_omBtn {
	background-position: -40px -28px;
}

.quad2 .BMap_omBtn.hover {
	background-position: -14px -28px;
}

.quad2 .BMap_omBtn.BMap_omBtnClosed {
	background-position: -27px -28px;
}

.quad2 .BMap_omBtn.BMap_omBtnClosed.hover {
	background-position: -1px -28px;
}

.anchorR .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	border-top: 1px solid #999;
}

.anchorL .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-right: 1px solid #999;
	border-top: 1px solid #999;
}

.anchorB .BMap_omOutFrame {
	border-top: 1px solid #999;
	border-left: 1px solid #999;
	border-right: 1px solid #999;
}

.anchorT .BMap_omOutFrame {
	border-bottom: 1px solid #999;
	border-right: 1px solid #999;
	border-left: 1px solid #999;
}

.anchorNon .BMap_omOutFrame, .withOffset .BMap_omOutFrame {
	border: 1px solid #999;
}

.BMap_zoomMask0, .BMap_zoomMask1 {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: transparent url(style/images/img/blank.gif);
	z-index: 1000;
}

.BMap_contextMenu {
	position: absolute;
	border-top: 1px solid #adbfe4;
	border-left: 1px solid #adbfe4;
	border-right: 1px solid #8ba4d8;
	border-bottom: 1px solid #8ba4d8;
	padding: 0;
	margin: 0;
	width: auto;
	visibility: hidden;
	background: #fff;
	z-index: 10000000;
}

.BMap_cmShadow {
	position: absolute;
	background: #000;
	opacity: .3;
	filter: alpha(opacity = 30);
	visibility: hidden;
	z-index: 9000000;
}

div.BMap_cmDivider {
	border-bottom: 1px solid #adbfe4;
	font-size: 0;
	padding: 1px;
	margin: 0 6px;
}

div.BMap_cmFstItem {
	margin-top: 2px;
}

div.BMap_cmLstItem {
	margin-bottom: 2px;
}

.BMap_shadow img {
	border: 0 none;
	margin: 0;
	padding: 0;
	height: 370px;
	width: 1144px;
}

.BMap_pop .BMap_top {
	border-top: 1px solid #ababab;
	background-color: #fff;
}

.BMap_pop .BMap_center {
	border-left: 1px solid #ababab;
	border-right: 1px solid #ababab;
	background-color: #fff;
}

.BMap_pop .BMap_bottom {
	border-bottom: 1px solid #ababab;
	background-color: #fff;
}

.BMap_shadow, .BMap_shadow img, .BMap_shadow div {
	-moz-user-select: none;
	-webkit-user-select: none;
}

.BMap_checkbox {
	background: url(style/images/img/mapctrls1d3.gif);
	vertical-align: middle;
	display: inline-block;
	width: 11px;
	height: 11px;
	margin-right: 4px;
	background-position: -14px 90px;
}

.BMap_checkbox.checked {
	background-position: -2px 90px;
}

.BMap_pop .BMap_top img, .BMap_pop .BMap_center img, .BMap_pop .BMap_bottom img
	{
	display: none;
}

@media print {
	.BMap_noprint {
		display: none;
	}
	.BMap_noscreen {
		display: block;
	}
	.BMap_mask {
		background: none;
	}
	.BMap_pop .BMap_top img, .BMap_pop .BMap_center img, .BMap_pop .BMap_bottom img
		{
		display: block;
	}
}

.BMap_vectex {
	cursor: pointer;
	width: 11px;
	height: 11px;
	position: absolute;
	background-repeat: no-repeat;
	background-position: 0 0;
}

.BMap_vectex_nodeT {
	background-image: url(style/images/img/nodeT.gif);
}

.BMap_vectex_node {
	background-image: url(style/images/img/node.gif);
}

.iw {
	width: 100%;
	-webkit-box-sizing: border-box;
	border: .3em solid transparent;
	-webkit-background-clip: padding;
}

.iw_rt {
	position: relative;
	height: 46px;
	width: 195px;
	-webkit-box-sizing: border-box;
	display: -webkit-box;
	-webkit-box-align: center;
	margin: 2px 5px 0 2px;
	background-color: rgba(0, 0, 0, 0.8);
	-webkit-box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.3);
	-webkit-border-radius: 2px;
	color: #fff;
}

.iw_rt:after {
	content: "";
	position: absolute;
	left: 50%;
	bottom: -8px;
	width: 0;
	height: 0;
	border-left: 5px solid transparent;
	border-top: 8px solid rgba(0, 0, 0, 0.8);
	border-right: 5px solid transparent;
	margin: 0 0 0 -6px;
}

.iw_s {
	text-align: center;
	vertical-align: middle;
	height: 100%;
	-webkit-box-sizing: border-box;
}

.iw_rt .iw_s1 {
	color: #cbcbcb;
}

.iw_rt b {
	color: #fff;
	font-weight: bold;
}

.iw_rt_gr {
	margin-left: -4px;
}

.iw_busline {
	margin: 32px 0 0 -3px;
}

.iw_busline .iw_cc {
	text-align: center;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	padding: 0 6px;
}

.iw_r {
	-webkit-box-ordinal-group: 3;
}

.iw_r, .iw_l {
	height: 100%;
	font-size: 4.5em;
	text-align: center;
	color: #747474;
	border: none;
	-webkit-box-sizing: border-box;
	-webkit-border-radius: 0;
	line-height: .7em;
	border: 1px solid rgba(255, 255, 255, 0.2);
	width: 41px;
}

.iw_r {
	border-style: none none none solid;
}

.iw_l {
	border-style: none solid none none;
}

.iw_search, .iw_l {
	background:
		url("style/images/img/u20LgruGtNFM8lqnNtfK2JqN3CVeW1gzWj9jThd0xd59R8BBgAAiefGO1Bt1gAAAABJRU5ErkJggg==")
		no-repeat 50% 50%;
	-webkit-background-size: 19px 19px;
}

.iw_line_s, .iw_r {
	background:
		url("style/images/img/wCKLRHq20vjSoVNKWunH4rTBDv5Cv7NKeKfvvU2nINzHAuexzUA7KQTkoB6UxDicKvcqfQQYABaiUBxugCsr20AAAAAElFTkSuQmCC")
		no-repeat 50% 50%;
	-webkit-background-size: 19px 19px;
}

.iw_line {
	height: 64px;
	width: 228px;
	padding: 0 11px;
	line-height: 20px;
}

.iw_bustrans .iw_cc {
	text-align: center;
}

.iw_c {
	color: #FFFFFF;
	text-decoration: none;
	overflow: hidden;
	display: -webkit-box;
	-webkit-box-align: center;
	-webkit-box-flex: 1;
}

.iw_cc {
	-webkit-box-sizing: border-box;
	width: 100%;
	border: none;
}

.gray_background {
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	-khtml-opacity: 0.5;
	opacity: 0.5
}

.light_gray_background {
	filter: alpha(opacity = 70);
	-moz-opacity: 0.7;
	-khtml-opacity: 0.7;
	opacity: 0.7
}

.panoInfoBox {
	cursor: pointer;
}

.panoInfoBox {
	position: relative;
	width: 323px;
	height: 101px;
	margin-bottom: 4px;
	cursor: pointer;
}

.panoInfoBox .panoInfoBoxTitleBg {
	width: 323px;
	height: 19px;
	position: absolute;
	left: 0;
	bottom: 0;
	z-index: 2;
	background-color: #000;
	opacity: .7;
}

.panoInfoBox .panoInfoBoxTitleContent {
	font-size: 12px;
	color: #fff;
	position: absolute;
	bottom: 2px;
	left: 5px;
	z-index: 3;
	text-decoration: none;
}

.RouteAddressOuterBkg {
	position: relative;
	padding: 32px 4px 4px 3px;
	background-color: #ffdd99;
}

.RouteAddressInnerBkg {
	padding: 3px 5px 8px 8px;
	background-color: #ffffff;
}

#RouteAddress_DIV1 {
	margin-top: 5px;
}

.RouteAddressTip {
	position: absolute;
	width: 340px;
	top: 0px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	color: #994c00;
}

.route_tip_con {
	position: absolute;
	top: 145px;
}

.route_tip_con .route_tip {
	position: absolute;
	width: 233px;
	height: 29px;
	color: #803300;
	text-align: center;
	line-height: 29px;
	border: #cc967a solid 1px;
	background: #fff2b2;
	z-index: 100000;
}

.route_tip_con .route_tip span {
	position: absolute;
	top: 0;
	right: 0;
	_right: -1px;
	width: 14px;
	height: 13px;
	background: url(style/images/img/addrPage.png) no-repeat 0 -121px;
	cursor: pointer;
}

.route_tip_con .route_tip_shadow {
	width: 233px;
	height: 29px;
	position: absolute;
	left: 1px;
	top: 1px;
	background: #505050;
	border: 1px solid #505050;
	opacity: 0.2;
	filter: alpha(opacity = 20)
}

.sel_body_body_page {
	margin: 5px 0
}

.sel_n {
	margin-top: 5px;
	overflow: hidden;
}

.sel_n .sel_top {
	background: url(style/images/img/bgs.gif) no-repeat 0 -418px;
	height: 4px;
	font-size: 0px;
}

.sel_n .sel_body_top {
	height: 32px;
	width: 100%;
	background: url(style/images/img/addrPage.png) no-repeat 0 -41px;
}

.sel_n .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
}

.sel_n .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(style/images/img/bgs.gif) no-repeat -79px -387px;
}

.sel_n .sel_body_name {
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #FA8722;
}

.sel_n .sel_body_button {
	float: left;
	width: 55px;
	margin-left: -55px;
	padding-top: 8px;
}

.sel_n .sel_body_button a {
	
}

.sel_n .sel_bottom {
	background: url(style/images/img/bgs.gif) no-repeat 0 -415px;
	height: 4px;
	font-size: 0px;
}

.sel_n .sel_body_body {
	padding: 3px 0 0 0
}

.sel_n1 {
	margin-top: 5px;
	width: 329px;
	overflow: hidden;
}

.sel_n1 .sel_top {
	background: url(style/images/img/bgs.gif) no-repeat 0 -418px;
	height: 4px;
	font-size: 0px;
}

.sel_n1 .sel_body_top {
	height: 31px;
	width: 100%;
	background: url(style/images/img/sel_body_n_top.gif) repeat-x;
}

.sel_n1 .sel_body_top {
	height: 32px;
	width: 100%;
	background: url(style/images/img/addrPage.png) no-repeat 0 -41px
}

.sel_n1 .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
	cursor: pointer;
}

.sel_n1 .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(style/images/img/bgs.gif) no-repeat -79px -387px;
}

.sel_n1 .sel_body_name {
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #FA8722;
}

.sel_n1 .sel_body_button {
	float: left;
	width: 20px;
	height: 31px;
	margin-left: -23px;
	background: url(style/images/img/bgs.gif) no-repeat -253px -382px;
	overflow: hidden;
	zoom: 1;
	cursor: pointer;
}

.sel_n1 .sel_body_button a {
	display: none;
}

.sel_n1 .sel_body_body {
	display: none
}

.sel_n1 .sel_bottom {
	background: url(style/images/img/bgs.gif) no-repeat 0 -415px;
	height: 4px;
	font-size: 0px;
}

.sel_y {
	margin-top: 5px;
	overflow: hidden;
}

.sel_y .sel_top {
	background: url(style/images/img/bgs.gif) no-repeat 0 -439px;
	height: 4px;
	zoom: 1;
	font-size: 0px;
}

.sel_y .sel_body_top {
	height: 32px;
	width: 100%;
	background: url(style/images/img/addrPage.png) no-repeat 0 0
}

.sel_y .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
	cursor: pointer;
}

.sel_y .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(style/images/img/bgs.gif) no-repeat -167px -384px;
}

.sel_y .sel_body_name {
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #5B7BCB;
}

.sel_y .sel_body_button {
	float: left;
	width: 20px;
	height: 31px;
	margin-left: -20px;
	background: url(style/images/img/bgs.gif) no-repeat -269px -297px;
	cursor: pointer;
}

.sel_y .sel_body_button a {
	display: none;
}

.sel_y .sel_body_body {
	display: none;
	height: 0px
}

.sel_y .sel_body_body_div {
	
}

.sel_y .sel_bottom {
	background: url(style/images/img/bgs.gif) no-repeat 0 -436px;
	height: 4px;
	font-size: 0px;
}

.sel_y .sel_body_body_page {
	display: none;
	height: 0px;
}

.sel_x {
	margin-top: 5px;
	width: 329px;
	overflow: hidden;
}

.sel_x .sel_top {
	background: url(style/images/img/bgs.gif) no-repeat 0 -418px;
	height: 4px;
	font-size: 0px;
}

.sel_x .sel_body_top {
	height: 32px;
	width: 100%;
	background: url(style/images/img/addrPage.png) no-repeat 0 -41px;
}

.sel_x .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
}

.sel_x .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(style/images/img/bgs.gif) no-repeat -122px -384px;
}

.sel_x .sel_body_name {
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #FA8722;
}

.sel_x .sel_body_button {
	float: left;
	width: 55px;
	margin-left: -55px;
	padding-top: 8px;
}

.sel_x .sel_body_button a {
	
}

.sel_x .sel_body_body {
	
}

.sel_x .sel_body_body_div {
	padding: 5px 5px 0 5px;
}

.sel_x .sel_bottom {
	background: url(style/images/img/bgs.gif) no-repeat 0 -415px;
	height: 4px;
	font-size: 0px;
}

.sel_x1 {
	margin-top: 5px;
	width: 329px;
	overflow: hidden;
}

.sel_x1 .sel_top {
	background: url(style/images/img/bgs.gif) no-repeat 0 -418px;
	height: 4px;
	font-size: 0px;
}

.sel_x1 .sel_body_top {
	height: 32px;
	width: 100%;
	background: url(style/images/img/addrPage.png) no-repeat 0 -41px
}

.sel_x1 .sel_body_title {
	float: left;
	width: 100%;
	height: 31px;
	cursor: pointer;
}

.sel_x1 .sel_body_sign {
	margin-top: 1px;
	width: 30px;
	height: 31px;
	float: left;
	background: url(style/images/img/bgs.gif) no-repeat -122px -384px;
}

.sel_x1 .sel_body_name {
	margin: 0 20px 0 30px;
	padding: 8px 7px 7px;
	font-size: 14px;
	color: #FA8722;
}

.sel_x1 .sel_body_button {
	float: left;
	width: 55px;
	height: 31px;
	margin-left: -55px;
}

.sel_x1 .sel_body_button a {
	display: none;
}

.sel_x1 .sel_body_body {
	display: none;
	height: 0px;
}

.sel_x1 .sel_body_body_div {
	padding: 5px 5px 0 5px;
}

.sel_x1 .sel_bottom {
	background: url(style/images/img/bgs.gif) no-repeat 0 -415px;
	height: 4px;
	font-size: 0px;
}

.sel_body_citylist {
	height: 100px;
	padding: 0 0 0 5px
}

.sel_body_resitem {
	table-layout: fixed;
	overflow-x: hidden;
	overflow-y: hidden;
}

.sel_body_resitem table {
	margin-right: 5px;
}

.sel_body_resitem tr {
	cursor: pointer;
}

.sel_body_resitem th {
	padding-top: 5px;
	padding-left: 5px;
	text-align: left;
	vertical-align: top;
	width: 22px;
}

.sel_body_resitem th div.iconbg {
	background: url(style/images/img/markers_new_ie6.png) no-repeat scroll 0
		0;
	height: 29px;
	width: 24px;
}

.sel_body_resitem th div.icon {
	cursor: pointer
}

.sel_body_resitem th div#no_0_1, .sel_body_resitem th div#no_1_1 {
	background-position: 0 -64px
}

.sel_body_resitem th div#no_0_2, .sel_body_resitem th div#no_1_2 {
	background-position: -24px -64px
}

.sel_body_resitem th div#no_0_3, .sel_body_resitem th div#no_1_3 {
	background-position: -48px -64px
}

.sel_body_resitem th div#no_0_4, .sel_body_resitem th div#no_1_4 {
	background-position: -72px -64px
}

.sel_body_resitem th div#no_0_5, .sel_body_resitem th div#no_1_5 {
	background-position: -96px -64px
}

.sel_body_resitem th div#no_0_6, .sel_body_resitem th div#no_1_6 {
	background-position: -120px -64px
}

.sel_body_resitem th div#no_0_7, .sel_body_resitem th div#no_1_7 {
	background-position: -144px -64px
}

.sel_body_resitem th div#no_0_8, .sel_body_resitem th div#no_1_8 {
	background-position: -168px -64px
}

.sel_body_resitem th div#no_0_9, .sel_body_resitem th div#no_1_9 {
	background-position: -192px -64px
}

.sel_body_resitem th div#no_0_10, .sel_body_resitem th div#no_1_10 {
	background-position: -216px -64px
}

.sel_body_resitem td {
	line-height: 160%;
	padding: 3px 0 3px 3px;
	vertical-align: top;
}

.sel_body_resitem div.ra_td_title {
	float: left;
	margin-right: 40px;
}

.sel_body_resitem div.ra_td_button {
	float: right;
	width: 40px;
}

.sel_body_resitem div.ra_td_button input {
	height: 18px;
	font-size: 12px;
	width: 40px;
}

.sel_body_resitem div.clear {
	clear: both;
	height: 0px;
	width: 100%;
}

.sel_body_resitem td .selBtn {
	width: 70px;
	height: 29px;
	background: url(style/images/img/addrPage.png) no-repeat -21px -81px;
	text-align: center;
	line-height: 29px;
	visibility: hidden;
	color: #b35900;
	display: inline-block;
	*display: inline;
	*zoom: 1;
}

.sel_body_resitem td .list_street_view_poi {
	display: inline-block;
	float: none;
	margin-right: 6px;
	position: static;
	*vertical-align: -3px;
	_vertical-align: -5px;
	*display: inline;
	*zoom: 1;
}

.selInfoWndBtn {
	width: 70px;
	height: 29px;
	background: url(style/images/img/addrPage.png) no-repeat -21px -81px;
	text-align: center;
	line-height: 29px;
	margin: 0 auto;
	cursor: pointer;
	color: #b35900
}

.sel_body_body td a {
	text-decoration: none;
	cursor: auto;
}

.sel_body_body td a:hover, .sel_body_body td a:focus {
	text-decoration: underline;
}
</style>
<link rel="stylesheet" href="style/css/ui.css">
<link rel="stylesheet" href="style/css/window.css">
</head>
<body>
	<div id="body">
		<div id="header">
			<div class="wrapper">
				<a class="logo" href="#"> <img width="229" height="43"
					alt="助成招聘-专注互联网招聘" src="style/images/logo.png">
				</a>
				<ul id="navheader" class="reset">
					<li><a href="Index.jsp">首页</a></li>
					<li><a href="CompanyList.jsp">招聘</a></li>
					<li><a href="campus.jsp">校园招聘</a></li>
					<li><a rel="nofollow" href="#">我的</a></li>
					<li><a rel="nofollow" href="tool.jsp">工具箱</a></li>
				</ul>
				<ul class="loginTop">
					<li><a href="" rel="nofollow"></a></li>
					<li>|</li>
					<li><a href="" rel="nofollow"></a></li>
				</ul>
			</div>
		</div>
		<!-- end #header -->
		<div id="container">
			<!-- end .sidebar -->
			<div>
				<dl class="company_center_content">
					<dt>
						<h1>
							<em></em>填写基本信息
						</h1>
					</dt>
					<dd>
						<form action="#" method="post"
							id="jobForm" onSubmit="return myCheck()">
							<input type="hidden" value="" name="id"> <input
								type="hidden" value="create" name="preview"> <input
								type="hidden" value="" name="companyName"> <input
								type="hidden" value="c29d4a7c35314180bf3be5eb3f00048f"
								name="resubmitToken">
							<table class="btm">
								<tbody>
									<tr>
										<td><span class="redstar">*</span></td>
										<td>平台级别</td>
										<td><p>
												<label> <input type="checkbox" name="平台级别"
													value="国家级" id="RadioGroup1_0"> 国家级
												</label> <label> <input type="checkbox" name="平台级别"
													value="省级" id="RadioGroup1_1"> 省级
												</label>

											</p></td>
										<td>所在市县</td>
										<td>省：<select id="cmbProvince" name="省"></select> 市：<select
											id="cmbCity" name="市"></select> 区：<select id="cmbArea"
											name="区"></select></td>
									</tr>
									
									<tr>
										<td colspan="2"><p>平台</p>
									    <p>组织形态</p></td>
										<td><p>
												<label> <input type="radio" name="平台组织形态"
													value="内设机构相对独立(无法人资格)" id="RadioGroup1_0">
													内设机构相对独立(无法人资格)
												</label>

											</p>
											<p>
												<label> <input type="radio" name="平台组织形态"
													value="独立法人" id="RadioGroup1_1" onclick="changetext(this)">
													独立法人
												</label>

											</p>
											<p>
												<label> <input disabled="disabled" type="radio"
													name="独立法人" value="企业法人" id="企业法人"> 企业法人
												</label> <label> <input disabled="disabled" type="radio"
													name="独立法人" value="事业法人" id="事业法人"> 事业法人
												</label> <label> <input disabled="disabled" type="radio"
													name="独立法人" value="社团法人" id="社团法人"> 社团法人
												</label></td>

										<td colspan="2"><p>
												<label> <input type="radio" name="建设"
													value="多单位联合共建" id="RadioGroup1_2"> 多单位联合共建
												</label>
											</p>
											<p>
												<label> <input type="radio" name="建设"
													value="依托单位独自建设" id="RadioGroup1_3"> 依托单位独自建设
												</label>
											</p>
											<p>
												京津冀共建: <label> <input type="radio" name="京津冀共建"
													value="是京津冀共建" id="RadioGroup1_4"> 是
												</label> <label> <input type="radio" name="京津冀共建" value=""
													id="RadioGroup1_5"> 否
												</label>
											</p></td>
									</tr>
									<tr>
										<td colspan="2"><p align="center">服务的主要</p> 国民经济行业</td>
										<td colspan="3">
										<select id="main1" name="主业"></select> <select id="main2"
											name="副业"></select> <select id="main3" name="副副业"></select>
									</tr>
									<tr>
										<td colspan="2"><p align="center">所属的主要学科</p></td>
										<td colspan="3"><select id="class1" name="主科"></select> <select
											id="class2" name="副科"></select> <select id="class3" name="副副科"></select></td>
									</tr>
									<tr>
										<td colspan="2">依托单位名称</td>
										<td><input type="text" placeholder="" value=""
											name="依托单位名称" id="positionName9"></td>
										<td colspan="2"><p align="center">依托单位组织机构代码</p> (社会信用代码)
								      <input type="text" placeholder="" value=""
											name="依托单位组织机构代码" id="positionName6"></td>
									</tr>
									
									<tr>
										<td colspan="3">依托单位法人代表姓名
									    <input type="text" placeholder="" value=""
											name="依托单位法人代表姓名" id="positionName10"></td>
										<td colspan="2"><p>办公电话
  ：
										    <input type="text" placeholder="" value="" name="公电话"
											id="phone1"  onblur="upperCase(this.id)">
								        </p></td>
									</tr>
									<tr>
										<td colspan="2">依托单位类型</td>
										<td colspan="3"><p>
												<label> <input type="radio" name="依托单位类型" value="企业"
													id="RadioGroup2_0"> 企业
												</label> <label> <input type="radio" name="依托单位类型"
													value="科研机构" id="RadioGroup2_1"> 科研机 构
												</label> <label> <input type="radio" name="依托单位类型"
													value="高等院校" id="RadioGroup2_2"> 高等院校
												</label> <label> <input type="radio" name="依托单位类型"
													value="政府机构" id="RadioGroup2_3"> 政府机构
												</label> <label> <input type="radio" name="依托单位类型"
													value="其他" id="RadioGroup2_4"> 其他
												</label>
											</p></td>
									</tr>
									<tr>
										<td colspan="2">共建单位</td>
										<td colspan="3"><input type="text" placeholder=""
											value="" name="共建单位" id="positionName14" style="width:100px">
											
											<input type="text" placeholder=""
											value="" name="共建单位1" id="共建单位1" style='display:none;width:50px'>
											<input type="text" placeholder=""
											value="" name="共建单位2" id="共建单位2" style='display:none;width:50px'>
											<button type="button"  onclick="add()">增加</button></td>
									</tr>
								</tbody>
							</table>

							<table class="btm">
								<tbody>
									<tr>
										<td width="41" rowspan="3">平台主任(院长)</td>
										<td width="91">姓名：</td>
										<td width="68"><label for="textfield"></label> <input
											type="text" name="姓名" id="textfield" style="width:50px"></td>
										<td width="77">性别：</td>
										<td width="63"><input type="text" name="性别"
											id="textfield2" style="width:50px"></td>
										<td width="145"><p align="center">出生年月</p></td>
										<td width="122"><input type="text" name="出生年月"
											id="textfield3" style="width:50px"></td>
										<td width="119">职称：</td>
										<td width="178"><input type="text" name="职称"
											id="textfield4" style="width:50px"></td>
									</tr>
									<tr>
										<!--<h3><span>(最高月薪不能大于最低月薪的2倍)</span></h3> -->
										<td>所学专业</td>
										<td colspan="2"><input type="text" name="所学专业"
											id="textfield5" style="width:50px"></td>
										<td>&nbsp;</td>
										<td>学历</td>
										<td><input type="text" name="学历" id="textfield7"
											style="width:50px"></td>
										<td>学位</td>
										<td><input type="text" name="学位" id="textfield9"
											style="width:50px"></td>
									</tr>
									<tr>
										<td>办公电话</td>
										<td colspan="2"><input type="text" name="办公电话"
											id="textfield6" style="width:50px"></td>
										<td>&nbsp;</td>
										<td>手机</td>
										<td><input type="text" name="手机" id="phone2"
											style="width:50px" onblur="upperCase(this.id)"></td>
										<td>E-mail</td>
										<td><input type="text" name="E-mail" id="textfield10"
											style="width:50px" onblur="email(this.id)"></td>
									</tr>
							  </tbody>
						  </table>

							<table class="btm">
								<tbody>
									<tr>
										<td width="125">平台网站名称</td>
										<td width="365"><input type="text" placeholder=""
											value="" name="平台网站名称" id="positionName3"></td>
										<td width="45">网址</td>
										<td width="389"><input type="text" placeholder=""
											value="" name="网址" id="positionName7"></td>
									</tr>
									<tr>
										<td>平台通讯地址</td>
										<td><input type="text" placeholder="" value=""
											name="平台通讯地址" id="positionName5"></td>
										<td>邮编</td>
										<!--<h3><span>(最高月薪不能大于最低月薪的2倍)</span></h3> -->
										<td><input type="text" placeholder="" value="" name="邮编"
											id="positionName8" ></td>
									</tr>
								</tbody>
							</table>
							<table>
								<tbody>
									<tr>
										<td width="25">&nbsp;</td>
										<td colspan="2">&nbsp;</td>
									</tr>
									<tr>
										<td width="25"></td>
										<td colspan="2">&nbsp;</td>
									</tr>
									<tr>
										<td width="25"></td>
										<td colspan="2"><input type="submit" value="提交"
											id="formSubmit" class="btn_32"></td>
									</tr>
								</tbody>
							</table>
						</form>
					</dd>
				</dl>
			</div>
			<!-- end .content -->




			<script src="style/js/jquery.tinymce.js" type="text/javascript"></script>

			<!-- end old -->

			<script src="style/js/jobs.min.js" type="text/javascript"></script>


			<div class="clear"></div>
			<input type="hidden" value="c29d4a7c35314180bf3be5eb3f00048f"
				id="resubmitToken"> <a rel="nofollow" title="回到顶部"
				id="backtop" style="display: none;"></a>
		</div>
		<!-- end #container -->
	</div>
	<!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			<a href="https://www.cnblogs.com/somedayOne/p/8016503.html"
				target="_blank" rel="nofollow">关于我们</a> <a
				href="http://www.baidu.com" target="_blank">互联网公司导航</a> <a
				href="https://www.cnblogs.com/somedayOne/" target="_blank"
				rel="nofollow">助成博客</a> <a
				href="https://uykq1b.fanqier.com/f/fpotly" target="_blank"
				rel="nofollow">用户反馈</a>
			<div class="copyright"></div>
		</div>
	</div>

	<script src="style/js/core.min.js" type="text/javascript"></script>
	<script src="style/js/popup.min.js" type="text/javascript"></script>

	<!--  -->


	<div id="cboxOverlay" style="display: none;"></div>
	<div id="colorbox" class="" role="dialog" tabindex="-1"
		style="display: none;">
		<div id="cboxWrapper">
			<div>
				<div id="cboxTopLeft" style="float: left;"></div>
				<div id="cboxTopCenter" style="float: left;"></div>
				<div id="cboxTopRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxMiddleLeft" style="float: left;"></div>
				<div id="cboxContent" style="float: left;">
					<div id="cboxTitle" style="float: left;"></div>
					<div id="cboxCurrent" style="float: left;"></div>
					<button type="button" id="cboxPrevious"></button>
					<button type="button" id="cboxNext"></button>
					<button id="cboxSlideshow"></button>
					<div id="cboxLoadingOverlay" style="float: left;"></div>
					<div id="cboxLoadingGraphic" style="float: left;"></div>
				</div>
				<div id="cboxMiddleRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxBottomLeft" style="float: left;"></div>
				<div id="cboxBottomCenter" style="float: left;"></div>
				<div id="cboxBottomRight" style="float: left;"></div>
			</div>
		</div>
		<div
			style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
	</div>
	<script type="text/javascript">
	addressInit('cmbProvince', 'cmbCity', 'cmbArea');
	
	
</script>
	<script type="text/javascript">
	addressInit1('main1', 'main2', 'main3');
	</script>
	<script type="text/javascript">
	addressInit3('class1', 'class2', 'class3');
	</script>
</body>
</html>