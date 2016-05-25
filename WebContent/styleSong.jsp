<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/genre.css" rel="stylesheet" type="text/css"/>
<link href="css/common.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="script/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="script/tab.js"></script>
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
<div class="pageTitle center">
    <h2>曲风 - <span>${requestScope.styleName}</span></h2>
</div>
<div class="center">
   <div class="lbar">
       <div class="nexus">
           <dl>
             <dt>推荐曲风</dt>
              <dd>
                  <ul>
                  <c:forEach items = "${applicationScope.styles}" var="style">
                  <li>
                  	<c:url value="SongServlet" var="querySong">
                  		<c:param name="styleId" value="${style.styleId}"></c:param>
                  		<c:param name="styleName" value="${style.styleName}"></c:param>
						<c:param name="type" value="style"></c:param>
                  	</c:url>
                  	<a href="${querySong }" target="_self">${style.styleName}</a>
                  </li>
                  </c:forEach>
                  </ul>
              </dd>
            </dl>
       </div>
    </div>
    <div class="rbox">
        <div class="songList">
           <ul id="song-list-1">
		   <c:forEach items="${requestScope.songs }" var="song">
              <li>
              	<input name="checked" type="checkbox" value="${song.songId }"/>
              	<c:url value="playlist" var="play">
			   		<c:param name="songPath" value="${song.songPath}"/>
			    	<c:param name="songName" value="${song.songName }"/>
			    	<c:choose>
			    		<c:when test="${not empty song.singer.singerName }">
			    			<c:param name="singerName" value="${song.singer.singerName }"/>
			    		</c:when>
			    		<c:otherwise>
			    			<c:param name="singerName" value="${song.band.bandName }"/>
			    		</c:otherwise>
			    	</c:choose>
			    	<c:param name="action" value="add"></c:param>
			    </c:url>
			    <a href="${play }" target="view_window">${fn:substring(song.songName,0,fn:indexOf(song.songName,"."))}</a>
              	-
              	<c:url value="singerquery" var="query">
		    	<c:choose>
		    		<c:when test="${not empty song.singer.singerName}">
		    			<c:param name="singerName" value="${song.singerId }"/>
		    			<c:param name="flag" value="singer"/>
		    		</c:when>
		    		<c:otherwise>
		    			<c:param name="singerName" value="${song.bandId}"/>
		    			<c:param name="flag" value="band"></c:param>
		    		</c:otherwise>
		    	</c:choose>
		    </c:url>
		    <a title="${song.singer.singerName}${song.band.bandName }" href="${query }" target="_blank">${song.singer.singerName}${song.band.bandName }</a>
           </li>
           </c:forEach>
           </ul>
            <div class="listAction">
                <p>
                    <a href="javascript:void(0);" class="select" onclick="fns.select('#song-list-1 input[name=checked]');">全/反选</a>
                    <a href="javascript:void(0);" class="play"  onclick="fns.play('#song-list-1 input[name=checked]');">播放</a>
                    <a href="javascript:void(0);" class="add"  onmousedown="fns.add('#song-list-1 input[name=checked]');" onmouseup="fns.addlist('#song-list-3 input[name=checked]');">加入列表</a>
                </p>
            </div>
		</div>
	</div>
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