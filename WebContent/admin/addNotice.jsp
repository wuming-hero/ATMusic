<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加新闻</title>
<script type="text/javascript" src="../script/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
function check(thisform){
	var userName = $("#userName").val();
    var title = $.trim(thisform.title.value);
    var content = $.trim(thisform.content.value);
    if(userName == ''){
    	alert('您没权限操作，请登录后再试'); 
    	return false;
    }else if(title == ''){
        alert('标题不能为空');
        return false;
    }else if(content == ''){
        alert('新闻内容不能为空');
        return false;
    } else{
        return true;
    }
}
</script>
<style type="text/css">
*{
    padding:0px;
    margin:0px;
    font:12px Arial, Helvetica, sans-serif;
    list-style: none outside none;
}
.tit_1 {border-bottom: 1px solid #C9C9C9;font-size: 14px;font-weight: bold;margin: 0 0 15px;padding: 0 30px;}
.input_1{width:610px; height:20px; padding:2px 5px; border:solid 1px #ccc;}
.input_2{width:300px; height:20px; padding:2px 5px; border:solid 1px #ccc;}
.text_1{width:610px; height:96px; padding:5px; border:solid 1px #ccc; color:#333; font-size:12px;}
.text_2{width:610px; height:192px; padding:5px; border:solid 1px #ccc; color:#333; font-size:12px;}
.btn_2{display:inline-block; width:80px; height:25px; border:none; background:url(../images/btn_bg2.png) no-repeat 0 0; color:#fff; font-weight:bold; font-size:12px; line-height:29px; text-align:center; cursor:pointer;float:right;}
.table_1 th {font-weight: normal;text-align: right;vertical-align: text-top;width:100px;}
.table_1 th,.table_1 td{ padding: 6px 2px;}
.obli {color: #FF0000;font-family: Tahoma;font-size: 12px;font-style: normal;text-decoration: none;vertical-align: middle;}
</style>
</head>
<body>
<div class="right">
	<h1 class="tit_1"></h1>
	<form action="../noticeServlet" method="post" onsubmit="return check(this);" accept-charset="utf-8">
		<input type="hidden" name="userName" id="userName" value="${sessionScope.user.mName }"/>
		<input type="hidden" name="noticeId" id="noticeId" value=""/>
		<input type="hidden" name="action" value="save"/>
		<table border="0" cellspacing="0" cellpadding="0" class="table_1">
		<tr>
			<th><dfn class="obli">*</dfn>新闻标题：</th>
			<td><input name="title" type="text" class="input_1" value="" id="title"/></td>
		</tr>
		<tr>
		<th><dfn class="obli">*</dfn>新闻内容：</th>
		<td>
		<ul>
			<li><textarea name="content" id="content" cols="45" rows="5" class="text_2" ></textarea></li>
		</ul>		
		</td>
		</tr>
		<tr>
		<td colspan="2">
			<input name="submit"  type="submit" class="btn_2" value="保存" />
		</td>
		</tr>
		</table>
	</form>
</div>
</body>
</html>