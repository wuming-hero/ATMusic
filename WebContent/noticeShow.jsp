<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告</title>
<style type="text/css">
body {width:700px;margin:0px auto;clear:both;overflow:hidden;}
*{padding:0px;margin:0px;font:12px Arial, Helvetica, sans-serif;list-style: none outside none;}
h3{line-height: 40px;
font-size: 14px;
font-weight: bold;
color: #f4ac4e;
text-align: center;
}
</style>
</head>
<body>
<c:if test="${not empty noticeDetail }">

<h3>${noticeDetail.noticeName }</h3>

<div style="text-indent:21px;line-height: 25px;">${noticeDetail.noticeContent }</div>
<div align="right" style="line-height:25px;">
	<span style="line-height:25px;">发布人:${noticeDetail.mName }</span>
</div>
<div align="right" style="line-height:25px;">
	<span style="line-height:25px;">${fn:substring(noticeDetail.noticeDate,0,19)}</span>
</div>
</c:if>
</body>
</html>