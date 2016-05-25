<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册账号</title>
<link href="css/login.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="script/jquery-1.8.1.min.js"></script>
<script type="text/javascript">

/* function checkValue(){
	var name = document.getElementById("user_login").value;
	var pass = document.getElementById("user_passwd").value;
	var repass = document.getElementById("user_repeat").value;
	var email = document.getElementById("user_email").value;
	var flag = false; */
	function checkName(){
		//判断用户名是否已存在
		var name = document.getElementById("user_login").value;
		if(name.length<3 || name.length>20){
			document.getElementById("nametips").innerHTML="用户名不符合要求!";
		}else{
			$.post("userCheck",{name:name,flag:"name"},function(data){
				if(data.success == "true"){
					document.getElementById("nametips").innerHTML="此用户名已被人抢先注册!!";
				}else{
					document.getElementById("nametips").innerHTML="";
				}
			},"json");
		} 
	}
	function checkPass(){
		var pass = document.getElementById("user_passwd").value;
		if(pass.length<5 || pass.length>20){
			document.getElementById("passtips").innerHTML="密码不符合要求!";
			document.getElementById("user_passwd").focus();
		}else{
			document.getElementById("passtips").innerHTML="";
		}
	}
	function checkRepass(){
		var pass = document.getElementById("user_passwd").value;
		var repass = document.getElementById("user_repeat").value;
		if(pass!="" && pass == repass){
			document.getElementById("repasstips").innerHTML="";
		}else{
			document.getElementById("repasstips").innerHTML="两次输入密码不一致!";
		} 
	}
	function checkEmail(){
		var email = document.getElementById("user_email").value;
		//判断邮箱是否已被注册
		if(email.length>0){
			var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		    if(!myreg.test(email)){
		    	document.getElementById("emailtips").innerHTML="请填写正确的邮箱地址!";
		    }else{
				$.post("userCheck",{email:email,flag:"email"},function(data){
					if(data.success=='true'){
						document.getElementById("emailtips").innerHTML="此邮箱已被人抢先注册!!";
					}else{
						document.getElementById("emailtips").innerHTML="";
					}
				},"json");
			}
		}else{
			document.getElementById("emailtips").innerHTML="请填写您常用的邮箱地址!";
		};
	}
//}
function check(){
	var nametips = document.getElementById("nametips").innerHTML;
	var passtips = document.getElementById("passtips").innerHTML;
	var repasstips = document.getElementById("repasstips").innerHTML;
	var emailtips = document.getElementById("emailtips").innerHTML;
	var flag = false;
	if(nametips=="" && passtips=="" && repasstips=="" && emailtips ==""){
		flag = true;
	}
	alert(flag);
	return flag;
}
</script>
</head>
<body>
<div class="pTitle">
    <h2>新用户注册</h2>
</div>
<div class="main">
    <div class="form">
        <form method="post" action="userServlet" id="register-form" autocomplete="off" onsubmit="return check();">
        <dl>
            <dt>用户名：</dt>
            <dd>
                <input type="text" class="form_txt" size="30" name="username" id="user_login" maxlength="30" onblur="checkName();"/><span id="nametips" style="color:red;"></span>
                <p class="intro">3-20位小写字母、数字或汉字（汉字算两位）组成。</p>
            </dd>
        </dl>
        <dl>
            <dt>密码：</dt>
            <dd>
                <input type="password" class="form_txt" size="30" id="user_passwd" name="userpass" maxlength="20" onblur="checkPass();"/><span id="passtips" style="color:red;"></span>
                <p class="intro">密码必须在5-20个字符之间，可由数字和字母或符号组成。</p>
            </dd>
        </dl>
        <dl>
            <dt>确认密码：</dt>
            <dd>
                <input type="password" class="form_txt" size="30" name="user_repeat" id="user_repeat" maxlength="20" onblur="checkRepass();"/><span id="repasstips" style="color:red;"></span>
                <p class="intro">请再输入一遍您上面输入的密码。</p>
            </dd>
        </dl>
        <dl>
            <dt>邮箱：</dt>
            <dd>
                <input type="text" class="form_txt" size="40" name="useremail" id="user_email" onblur="checkEmail();"/><span id="emailtips" style="color:red;"></span>
                <!-- <p class="intro">在您密码丢失时可以帮助您顺利的找回密码，请您提供准确的邮箱地址。</p> -->
            </dd>
        </dl>
        <dl>
            <dd>
               <button type="submit" class="btn_s1">注册</button>
            </dd>
        </dl>
        </form>
    </div>
</div>
</body>
</html>