<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="5;url=upload.jsp">
<title>扩展名限制跳转</title>
</head>
<body>
<div>
	<span style="color:red;">${requestScope.extErrorTip}</span><br/>
	<span style="color:red;">${requestScope.sizeError}</span><br/>
	<span>5秒后将自动为您跳转到上传页面</span>
</div>
</body>
</html>