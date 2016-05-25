<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<style type="text/css" media="all">
*{padding:0px;margin:0px;font:12px Arial,Helvetica,sans-serif;}
body{width:600px;height:28px;background:url(images/repeat-x.png) left -162px repeat-x;overflow:hidden;}
a{color:#555;text-decoration:none;}
a:hover{color:#06C;}
ul,li{list-style:none;}
.userlogin{width:480px;float:left;height:22px;overflow:hidden;padding-top:4px;display:none;}
.userlogin input{width:114px;height:17px;line-height:17px;border:0px;padding:2px 3px 3px 20px;color:#666;float:left;margin-right:5px;}
.userlogin .login_username{background:url(images/common1.png) 0px -96px no-repeat;}
.userlogin .username_input{background-position:0px -118px;}
.userlogin .login_password{background:url(images/common1.png) 0px -140px no-repeat;}
.userlogin .password_input{background-position:0px -162px;}
.userlogin button.submit{width:55px;height:22px;overflow:hidden;border:0px;background:url(images/common1.png) -83px -74px no-repeat;font-size:0px;line-height:0px;text-indent:-9999px;float:left;margin-right:12px;cursor:pointer;}
.userlogin a{float:left;line-height:22px;text-decoration:none;margin-right:12px;}
.userinfo{padding-top:7px;padding-left:8px;overflow:hidden;line-height:18px;}
.userinfo a:hover{text-decoration:underline;}
.userinfo .welcome{float:left;overflow:hidden;}
.userinfo .welcome .username{font-weight:bold;color:#4691DB;}
.userinfo .usermenu{float:left;overflow:hidden;padding-left:16px;color:#CCC;}
.userinfo .usermenu li{float:left;padding:0px 8px 0px 16px;background-repeat:no-repeat;background-image:url(images/new_icons.gif);overflow:hidden;}
.userinfo .usermenu li a{height:18px;line-height:18px;float:left;padding:0px 4px;}
.userinfo .usermenu li.pm{background-position:3px -499px;}
.userinfo .usermenu li.fav{background-position:3px -558px;}
.userinfo .usermenu li.home{background-position:3px -1261px;}
.userinfo .usermenu li.site{background-position:3px -1229px;}
.userinfo .usermenu li.set{background-position:3px -528px;}
.userinfo .usermenu li.out{background-position:3px -586px;}
</style>
<script type="text/javascript" src="script/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
/* function callback_logout(){
    setTimeout(function(){
        $(".userlogin").show();
        $(".userinfo").hide();
    }, 1);
} */
function login(){
    var user_login  = $("input[name='user_login']");
    var user_passwd = $("input[name='user_passwd']");
    if(user_login.val().length == 0){
        alert('请输入用户名!');
        user_login.focus();
    }else if(user_passwd.val().length == 0){
        alert('请输入登录密码!');
        user_passwd.focus();
    }else{
    	$.post("userServlet",{username:user_login.val(),userpass:user_passwd.val()},function(data,status){
    		if(data.success=='true'){
				window.location.reload();
				//var username = document.getElementById("session").value;
			}else{
				alert("用户名或密码不正确!!!");
			}
		},"json");
    }
}

function logout(){
	if(confirm("确认退出?")){
		$.post("userServlet",function(data,status){
			if(data.success='true'){
				window.location.reload();
			}
		});
	}
}
function init(){
    var greeting, hour = (new Date()).getHours();
    if(hour>=6 && hour<12){
        greeting="上午好!";
    }else if(hour>=12 && hour<18){
        greeting="下午好!";
    }else if(hour>=18 && hour<23){
        greeting="晚上好!";
    }else{
        greeting="夜深了 请注意休息!";
    }
   //var username= document.getElementById("session").value;
   var username= $("#session").val();
    if(username!='' && username.length>0){
        document.getElementById('welcome').innerHTML = '<a href="#" target="_self" class="username" id="username">'+username+'</a> '+greeting;
        document.getElementById('userlogin').style.display='none';
        document.getElementById('userinfo').style.display='block';
    }else{
    	document.getElementById('userlogin').style.display='block';
    	document.getElementById('userinfo').style.display='none';
    }

    $(".login_username")
        .focus(function(){ if($(this).val() == '') $(this).addClass('username_input'); })
        .blur(function(){ if($(this).val() == '') $(this).removeClass('username_input'); });

    $(".login_password")
        .focus(function(){ if($(this).val() == '') $(this).addClass('password_input'); })
        .blur(function(){ if($(this).val() == '') $(this).removeClass('password_input'); });

    if($(".login_username").val()) $(".login_username").addClass('username_input');
    if($(".login_password").val()) $(".login_password").addClass('password_input');
}
$(document).ready(function(){
    init();
});
$(document).keydown(function(e){
    if (e.keyCode === 13)
        login();
});
</script>
</head>
<body>
<input type="hidden" name="session" id="session" value="${sessionScope.user.mName }"/>
<div class="userlogin" id="userlogin">
    <input name="user_login" class="login_username" type="text" value="" />
    <input name="user_passwd" class="login_password" type="password" value="" />
    <button type="button" class="submit" onclick="login();">登陆</button>
    <a href="register.jsp" target="_blank">注册账号</a>
    <!-- <a href="#" target="_blank">忘记密码</a> -->
    <c:if test="${not empty sessionScope.user.mName}">
		<li> 
		 <a href="upload.jsp" onclick="" target="_blank">上传音乐</a>
		</li>
	</c:if>
   
</div>
<div class="userinfo" id="userinfo">
    <p class="welcome" id="welcome"></p>
    <ul class="usermenu">
       <!--  <li class="home"><a href="/" target="_top">用户中心</a></li>
		<li class="fav"><a href="/fav/folder" target="_top">我的收藏</a></li>
		<li class="site"><a href="#" id="site-link" target="_blank">个人主页</a></li>
		<li class="set"><a href="/profile" target="_top">设置</a></li> -->
		<li> <a href="upload.jsp" target="_blank">上传音乐</a></li>
		<c:if test="${sessionScope.user.mName=='admin' }">
			<li> 
			<a href="admin/adminIndex.jsp" target="_blank">后台管理</a>
			</li>
		</c:if>
		<li class="out"><a href="#" target="_self" id="logout"><span onclick="logout();">安全退出</span></a></li>
    </ul>
</div>
</body>
</html>