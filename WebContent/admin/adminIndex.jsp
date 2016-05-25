<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
<style type="text/css">
body {width:960px;margin:0px auto;clear:both;overflow:hidden;}
*{padding:0px;margin:0px;font:12px Arial, Helvetica, sans-serif;list-style: none outside none;}
.top{height:150px;width:960px;align:center;background-image:url("../images/bg2.jpg");}
.top p{padding-top:80px;}
.top p span{font-size:16px;color:#fff;}
.sider {margin-top:100px;width:200px;overflow:hidden;float:left;}
.sider li{margin:5px 3px;padding-top:10px;}
.sider li span{margin:5px 3px;padding-top:10px;cursor:pointer;}
.sider li span.notice{background-image:url("../images/btn_bg2.png");background-repeat: no-repeat;margin-left: 10px;overflow: hidden;padding:5px 5px;width: 76px;height:26px;}
.sider li span.song{background-image:url("../images/btn_bg2.png");background-repeat: no-repeat;margin-left: 10px;overflow: hidden;padding:5px 5px;width: 76px;height:26px;}
.sider li span.comment{background-image:url("../images/btn_bg2.png");background-repeat: no-repeat;margin-left: 10px;overflow: hidden;padding:5px 5px;width: 76px;height:26px;}
.content{padding-top:10px;width:750px;overflow:hidden;}
</style>
<script type="text/javascript" language="javascript"> 
function iFrameHeight() { 
	var ifm= document.getElementById("iframepage"); 
	var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument; 
	if(ifm != null && subWeb != null) { 
		ifm.height = subWeb.body.scrollHeight; 
	} 
} 
function queryNews(){
	document.getElementById("iframepage").src="../noticeServlet?action=queryAll";
}
function songManage(){
	document.getElementById("iframepage").src="../SongServlet?type=songManage";
}
function commentManage(){
	document.getElementById("iframepage").src="../commentServlet?action=queryAll";
}
</script>
</head>
<body>
<div class="center">
<div class="top">
<p>
	<marquee behavior="scroll" direction="right" width="960" height="150" loop="-1" scrollamount="1.5" scrolldelay="0.5" style="font:50px">
		<span>在线音乐网站后台管理系统</span>
	</marquee>
</p>

</div>
<div class="sider">
	<ul>
 		<li><span class="notice" onclick="queryNews();">新闻管理</span></li>
 		<li><span class="song" onclick="songManage();">音乐管理</span></li>
 		<li><span class="comment" onclick="commentManage();">评论管理</span></li>
	</ul>
</div>
<div class="content">
<iframe src="../noticeServlet?action=queryAll" width="100%" height="550px" scrolling="auto" name="iframepage" id="iframepage" frameborder="0"></iframe>
</div>
</div>
</body>
</html>