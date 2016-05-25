<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>音乐上传</title>
<script type="text/javascript">
function uploadCheck(){
	var flag = true;
	var file = document.getElementById("file").value;
	var singer = document.getElementById("singer").value;
	var sMark = document.getElementById("sMark").value;
	var sort = document.getElementById("sort").value;
	var style = document.getElementById("style").value;
	if(file=="" || file.length<1 || file=="null"){
		flag = false;
		document.getElementById("tip").innerHTML = "音乐文件不能为空,请选择文件后再上传!";
		return;
	}else {
		document.getElementById("tip").innerHTML = "";
	}
	if(singer=="" || singer.length<1 || singer == "null"){
		flag = false;
		document.getElementById("tip").innerHTML = "请填写歌手名或乐队名!";
		return;
	}else {
		document.getElementById("tip").innerHTML = "";
	}
	if(sMark=="" || sMark.length<1 || sMark == "null"){
		flag = false;
		document.getElementById("tip").innerHTML = "请填写歌手类别!";
		return;
	}else {
		document.getElementById("tip").innerHTML = "";
	}
	if(sort=="" || sort.length<1 || sort == "null"){
		flag = false;
		document.getElementById("tip").innerHTML = "请音乐分类!";
		return;
	}else {
		document.getElementById("tip").innerHTML = "";
	}
	if(style=="" || style.length<1 || style == "null"){
		flag = false;
		document.getElementById("tip").innerHTML = "请填写音乐曲风!";
		return;
	}else {
		document.getElementById("tip").innerHTML = "";
	}
	if(flag) {
		document.uploadForm.submit();
	}
}
</script>
</head>
<body>
<center>
<form method="post" action="upload" name="uploadForm" enctype="multipart/form-data">
<input type="hidden" name="mId" value="${sessionScope.user.mId }"/>
<table width="400" border="0" style="align:center">
	<tr>
		<td colspan="4">
		<span id="tip" style="color:red;">${requestScope.tips}</span>
		</td>
	</tr>
   <tr>
	 <td width="100" align="center">音乐文件:</td>
     <td width="300" align="center" colspan="3">
     	<input type="file" name="file" id="file" size="30" style="float:left;">
     </td>
   </tr>
   <tr>
   	 <td width="100" align="center">演唱者:</td>
     <td width="150">
     	<input type="text" name="singer" id="singer" value=""/>
     </td>
     <td>
     	<select name="sMark" id="sMark">
     		<option value=""></option>
     		<option value="男">男歌手</option>
     		<option value="女">女歌手</option>
     		<option value="band">乐团</option>
     	</select>
     </td>
      <td></td>
   </tr>
   <tr height="30">
   	 <td width="100" align="center">曲 风:</td>
   	 <td width="100px">
   	 	<select name="style" id="style" style="width:120;">
   	 		<option value=""></option>
   	 		<c:if test="${not empty applicationScope.styles }"></c:if>
   	 		<c:forEach var="style" items="${applicationScope.styles }">
   	 			<option value="${style.styleId}">${style.styleName}</option>
   	 		</c:forEach>
   	 		<option value="" style="width:80px"></option>
   	 	</select>
   	 </td>
   
   	 <td width="60px">分 类:</td>
   	 <td>
   	 	<select name="sort" id="sort">
   	 		<option value=""></option>
   	 		<option value="1">国语</option>
   	 		<option value="2">日韩</option>
   	 		<option value="3">欧美</option>
   	 		<option value="4">其它</option>
   	 	</select>
   	 </td>
   </tr>  
   <tr>
   	 <td colspan="2"></td>
   	 <td><input type="reset" value="清空"/></td>
     <td>
     	<input type="button" name="button" value="上传" onclick="uploadCheck();">
     </td>
  </tr>
</table>
</form>
</center>


</body>
</html>