<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/layout.css"/>
<link rel="stylesheet" type="text/css" href="css/singerlist.css"/>
<script type="text/javascript" src="script/jquery-1.8.1.min.js"></script>
<title>歌手列表</title>
<style type="text/css">
*{
    padding:0px;
    margin:0px;
    font:12px Arial, Helvetica, sans-serif;
}
</style>
</head>
<body>
<!-- header -->
<div class="head">
	<div class="logo">
		<a href="index.jsp"><img src="images/logo2.png"/></a>
	</div>
	<div class="search">
		<div class="option_selected" id="search_option_selected"></div>
		<div class="search_box">
		<form method="post" action="singerquery" onsubmit="return checkValue();">
			<input type="hidden" name="flag" value="queryAll"/>
			<input type="text" name="keyWord" id="keyWord" />
			<button type="submit">搜索</button>
		</form>
		<script type="text/javascript">
		function checkValue(){
			var keyWord = document.getElementById("keyWord").value;
			if(keyWord.trim().length>0){
				return true;
			}else{
				alert("请输入要查询的关键字!");
				return false;
			}
		}
		</script>
		</div>
		<!-- <p>
		热门:
		<a href="">刘德华</a>
		<a class="x" href="">小沈阳</a>
		<a href="">周华健</a>
		<a class="z" href="">张杰</a>
		<a href="">邓丽君</a>
		<a class="q" href="">曲婉婷</a>
		</p>
		 -->
	</div>
	<div class="nav">
		<ul class="allcate">
			<li><a href="singerquery?flag=singerSort&sortId=1&gender=女" target="_blank"><span>华语女歌手</span></a></li>
			<li><a href="singerquery?flag=singerSort&sortId=1&gender=男" target="_blank"><span>华语男歌手</span></a></li>
			<li><a href="singerquery?flag=bandSort&sortId=1" target="_blank"><span>华语组合</span></a></li>
			<li><a href="singerquery?flag=singerSort&sortId=3&gender=女" target="_blank"><span>欧美女歌手</span></a></li>
			<li><a href="singerquery?flag=singerSort&sortId=3&gender=男" target="_blank"><span>欧美男歌手</span></a></li>
			<li><a href="singerquery?flag=bandSort&sortId=3" target="_blank"><span>欧美组合</span></a></li>
			<li><a href="singerquery?flag=singerSort&sortId=2&gender=女" target="_blank"><span>日韩女歌手</span></a></li>
			<li><a href="singerquery?flag=singerSort&sortId=2&gender=男" target="_blank"><span>日韩男歌手</span></a></li>
			<li><a href="singerquery?flag=bandSort&sortId=2" target="_blank"><span>日韩组合</span></a></li>
			<li><a href="singerquery?flag=others&sortId=4" target="_blank"><span>其他</span></a></li>
		</ul>
	</div>
	<div class="user">
		<div class="left_border"></div>
		<div class="right_border"></div>
		<div class="userbox">
			<iframe frameborder="0" scrolling="no" src="user.jsp"></iframe>
		</div>
	</div>
</div>
<div class="singerCommend center">
    <ul>
    <c:if test="${not empty requestScope.singerList }">
    <c:forEach items="${requestScope.singerList }" var="singer">
    	<li>
    		<c:url value ="SingerServlet" var="querySinger">
				<c:param name ="singerName" value="${singer.singerId}"></c:param>
				<c:param name="flag" value="singer"></c:param>
			</c:url>
	    	<a href="${querySinger}" class="singerPic" target="_blank"><img src="${singer.singerPic }" width="75" height="100" alt="${singer.singerName}" /></a>
	    	<a href="${querySinger}" class="singerName" target="_blank">${singer.singerName }</a>
    	</li>
    </c:forEach>
    </c:if>
    <c:if test="${not empty requestScope.bandList }">
    <c:forEach items="${requestScope.bandList }" var="band">
    	<li>
    		<c:url value ="SingerServlet" var="queryBand">
				<c:param name ="singerName" value="${band.bandId}"></c:param>
				<c:param name="flag" value="band"></c:param>
			</c:url>
	    	<a href="${queryBand}" class="singerPic" target="_blank"><img src="${band.bandPic }" width="75" height="100" alt="${band.bandName}" /></a>
	    	<a href="${queryBand}" class="singerName" target="_blank">${band.bandName }</a>
    	</li>
    </c:forEach>
    </c:if>
        
    </ul>
</div>
<!-- footer -->
<div class="foot">
	 <p class="footer">
		 <a target="_self" href="">关于爱听</a>| 
		 <a target="_self" href="">免责声明</a> |
		 <a target="_self"  href="">隐私声明</a> |
		 <a target="_self"  href="">版权声明</a> |
		 <a target="_self"  href="">招聘信息</a> |
		 <a target="_self"  href="">唱片公司</a> |
		 <a target="_self" href="">联系我们</a> |
		 <a target="_self" href="">帮助中心</a> |
		 <a target="_self" href="">网站联盟</a>
	</p>
    <p class="copyright">
		 Copyright &copy; 2012- <a href="">www.aiting.com</a> All Rights Reserved.
	</p>
	<p class="support">
		<span>闽ICP证101010号</span>|
		<span>闽ICP备101010101号-0</span>|
		<span>闽公网安备10101010101</span>
	</p>
</div>
</body>
</html>