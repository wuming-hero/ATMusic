<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>singerAndMoreSong</title>
<link rel="stylesheet" type="text/css" href="css/layout.css">
<link href="css/album.css" rel="stylesheet" type="text/css"/>
<link href="css/common.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="script/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="script/tab.js"></script>
<style>
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
<!-- 内容 -->
<c:choose>
<c:when test="${not empty albumDetail.singer.singerName }">
<div class="pageTitle center">
  <h2>
  <c:url value="singerquery" var="querySinger">
  	<c:param name="singerName" value="${albumDetail.singerId }"></c:param>
  	<c:param name="flag" value="singer"></c:param>
  </c:url>
  <a href="${querySinger }">${albumDetail.singer.singerName }</a> - <span>${albumDetail.albumName }</span></h2>
</div>
<div class="center">
  <div class="sidebar">
    <dl class="singerInfo">
      <dt>
         <c:url value="singerquery" var="querySinger">
         	<c:param name="singerName" value="${albumDetail.singerId }"></c:param>
  			<c:param name="flag" value="singer"></c:param>
         </c:url>
	     <a href="${querySinger }"><img src="${albumDetail.singer.singerPic }" alt="${albumDetail.singer.singerName }" /></a>
	  </dt>
    </dl>
  </div>
  <div class="container albumBox">
    <div class="albumPic_300">
	    <a href="#" target="_self">
	    	<img src="${albumDetail.albumPic }" width="300" height="300" />
	    </a> 
    </div>
    <div class="albumInfo">
      <p class="dash"></p>
      <dl class="albumName">
        <dt>专辑：</dt>
        <dd>${albumDetail.albumName }</dd>
      </dl>
      <dl class="singer">
        <dt>歌手：</dt>
        <dd>
	        <c:url value="singerquery" var="querySinger">
	         	<c:param name="singerName" value="${albumDetail.singerId }"></c:param>
	  			<c:param name="flag" value="singer"></c:param>
	         </c:url>	
	        <a href="${querySinger }">${albumDetail.singer.singerName }</a>
        </dd>
      </dl>
      <dl class="pubdate">
        <dt>发行时间：</dt>
        <dd>${albumDetail.issueDate }</dd>
      </dl>
      <dl class="company">
        <dt>唱片公司：</dt>
        <dd>${albumDetail.recCompany}</dd>
      </dl>
    </div>
    <div class="albumAction">
      <dl class="play">
        <dd>
        	<c:url value="playlist"	var="playAlbum">
        		<c:param name="albumId" value="${albumDetail.albumId }"></c:param>
        		<c:param name="action" value="albumPlay"></c:param>
        	</c:url>
        	<a href="${playAlbum }" class="playAlbum" target="view_window">播放整张专辑</a>
        </dd>
      </dl>
    </div>
            
    <div class="cTitle">
      <h3>专辑《${albumDetail.albumName }》的歌曲列表</h3>
    </div>
    <table cellpadding="0" cellspacing="0" border="0" class="songList">
      <thead>
        <tr>
          <td class="songId">序号</td>
          <td class="songTitle">歌曲</td>
          <td class="songAction"><p> <span>播放</span> <span>下载</span></p></td>
        </tr>
      </thead>
      <tbody id="song-list">
      <c:if test="${not empty albumSongList }">
      <c:forEach items="${albumSongList }" var="song" varStatus="i">
      	<tr>
          <td class="songId">${i.index+1 }</td>
          <td class="songTitle">
          	<input type="checkbox" name="checked" value="${song.songId }"/>
          	<c:url value="playlist" var="play">
	          	<c:param name="songName" value="${song.songName }"></c:param>
	          	<c:param name="songPath" value="${song.songPath }"></c:param>
	          	<c:param name="singerName" value="${song.singer.singerName }"></c:param>
	          	<c:param name="action" value="add"></c:param>
          	</c:url>
            <a href="${play }" class="songName" target="view_window">${song.songName }</a>
          </td>
          <td class="songAction">
          <p> 
          	<c:url value="playlist" var="play">
	          	<c:param name="songName" value="${song.songName }"></c:param>
	          	<c:param name="songPath" value="${song.songPath }"></c:param>
	          	<c:param name="singerName" value="${song.singer.singerName }"></c:param>
	          	<c:param name="action" value="add"></c:param>
          	</c:url>
	        <a href="${play }" class="play" target="view_window">播放</a> 
	        <c:url value="downServlet"	var="download">
          		<c:param name="fileName" value="${song.songName }"></c:param>
          		<c:param name="filePath" value="${song.songPath }"></c:param>
         	</c:url>
	        <a href="${download }" class="down" target="_self">下载</a> 
          </p>
          </td>
        </tr>
      </c:forEach>
      </c:if>
        
     </tbody>
    </table>
    <div class="songlistAction">
	    <p>
		    <a href="javascript:void(0);" class="select" onclick="fns.select();">全/反选</a> 
		    <a href="javascript:void(0);" class="play" onclick="fns.play();">播放</a> 
		    <a href="javascript:void(0);" class="add" onmousedown="fns.add();" onmouseup="fns.addlist();">加入列表</a>
	    </p>
    </div>
  </div>
</div>
</c:when>
<c:otherwise>
<div class="pageTitle center">
  <h2>
  <c:url value="singerquery" var="querySinger">
  	<c:param name="singerName" value="${albumDetail.bandId }"></c:param>
  	<c:param name="flag" value="band"></c:param>
  </c:url>
  <a href="${querySinger }">${albumDetail.band.bandName}</a> - <span>${albumDetail.albumName }</span></h2>
</div>
<div class="center">
  <div class="sidebar">
    <dl class="singerInfo">
      <dt>
         <c:url value="singerquery" var="querySinger">
         	<c:param name="singerName" value="${albumDetail.bandId}"></c:param>
  			<c:param name="flag" value="band"></c:param>
         </c:url>
	     <a href="${querySinger }"><img src="${albumDetail.band.bandPic }" alt="${albumDetail.band.bandName}" /></a>
	  </dt>
    </dl>
  </div>
  <div class="container albumBox">
    <div class="albumPic_300">
	    <a href="#" target="_self">
	    	<img src="${albumDetail.albumPic }" width="300" height="300" />
	    </a> 
    </div>
    <div class="albumInfo">
      <p class="dash"></p>
      <dl class="albumName">
        <dt>专辑：</dt>
        <dd>${albumDetail.albumName }</dd>
      </dl>
      <dl class="singer">
        <dt>歌手：</dt>
        <dd>
	        <c:url value="singerquery" var="querySinger">
	         	<c:param name="singerName" value="${albumDetail.bandId }"></c:param>
	  			<c:param name="flag" value="band"></c:param>
	         </c:url>	
	        <a href="${querySinger }">${albumDetail.band.bandName }</a>
        </dd>
      </dl>
      <dl class="pubdate">
        <dt>发行时间：</dt>
        <dd>${albumDetail.issueDate }</dd>
      </dl>
      <dl class="company">
        <dt>唱片公司：</dt>
        <dd>${albumDetail.recCompany}</dd>
      </dl>
    </div>
    <div class="albumAction">
      <dl class="play">
        <dd>
        	<c:url value="playlist"	var="playAlbum">
        		<c:param name="albumId" value="${albumDetail.albumId }"></c:param>
        		<c:param name="action" value="albumPlay"></c:param>
        	</c:url>
        	<a href="${playAlbum }" class="playAlbum" target="view_window">播放整张专辑</a>
        </dd>
      </dl>
    </div>
            
    <div class="cTitle">
      <h3>专辑《${albumDetail.albumName }》的歌曲列表</h3>
    </div>
    <table cellpadding="0" cellspacing="0" border="0" class="songList">
      <thead>
        <tr>
          <td class="songId">序号</td>
          <td class="songTitle">歌曲</td>
          <td class="songAction"><p> <span>播放</span> <span>下载</span></p></td>
        </tr>
      </thead>
      <tbody id="song-list">
      <c:if test="${not empty albumSongList }">
      <c:forEach items="${albumSongList }" var="song" varStatus="i">
      	<tr>
          <td class="songId">${i.index+1 }</td>
          <td class="songTitle">
          	<input type="checkbox" name="checked" value="${song.songId }"/>
          	<c:url value="playlist" var="play">
	          	<c:param name="songName" value="${song.songName }"></c:param>
	          	<c:param name="songPath" value="${song.songPath }"></c:param>
	          	<c:param name="singerName" value="${song.band.bandName }"></c:param>
	          	<c:param name="action" value="add"></c:param>
          	</c:url>
            <a href="${play }" class="songName" target="view_window">${song.songName }</a>
          </td>
          <td class="songAction">
          <p> 
          	<c:url value="playlist" var="play">
	          	<c:param name="songName" value="${song.songName }"></c:param>
	          	<c:param name="songPath" value="${song.songPath }"></c:param>
	          	<c:param name="singerName" value="${song.band.bandName }"></c:param>
	          	<c:param name="action" value="add"></c:param>
          	</c:url>
	        <a href="${play }" class="play" target="view_window">播放</a> 
	        <c:url value="downServlet"	var="download">
          		<c:param name="fileName" value="${song.songName }"></c:param>
          		<c:param name="filePath" value="${song.songPath }"></c:param>
         	</c:url>
	        <a href="${download }" class="down" target="_self">下载</a> 
          </p>
          </td>
        </tr>
      </c:forEach>
      </c:if>
        
     </tbody>
    </table>
    <div class="songlistAction">
	    <p>
		    <a href="javascript:void(0);" class="select" onclick="fns.select();">全/反选</a> 
		    <a href="javascript:void(0);" class="play" onclick="fns.play();">播放</a> 
		    <a href="javascript:void(0);" class="add" onmousedown="fns.add();" onmouseup="fns.addlist();">加入列表</a>
	    </p>
    </div>
  </div>
</div>
</c:otherwise>
</c:choose>


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