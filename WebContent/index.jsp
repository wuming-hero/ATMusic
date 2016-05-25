<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/layout.css">
<script type="text/javascript" src="script/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="script/tab.js"></script>
<title>爱听音乐网</title>
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
			<li>
				<c:url value="singerquery" var="query">
					<c:param name="sortId" value="1"></c:param>
					<c:param name="gender" value="女"></c:param>
					<c:param name="flag" value="singerSort"></c:param>
				</c:url>
				<a href="${query }" target="_blank"><span>华语女歌手</span></a>
				<!-- <a href="singerquery?flag=singerSort&sortId=1&gender=女" target="_blank"><span>华语女歌手</span></a> -->
			</li>
			<li>
				<c:url value="singerquery" var="query">
					<c:param name="sortId" value="1"></c:param>
					<c:param name="gender" value="男"></c:param>
					<c:param name="flag" value="singerSort"></c:param>
				</c:url>
				<a href="${query }" target="_blank"><span>华语男歌手</span></a>
			</li>
			<li>
				<c:url value="singerquery" var="query">
					<c:param name="sortId" value="1"></c:param>
					<c:param name="flag" value="bandSort"></c:param>
				</c:url>
				<a href="${query }" target="_blank"><span>华语组合</span></a>
			</li>
			<li>
				<c:url value="singerquery" var="query">
					<c:param name="sortId" value="3"></c:param>
					<c:param name="gender" value="女"></c:param>
					<c:param name="flag" value="singerSort"></c:param>
				</c:url>
				<a href="${query }" target="_blank"><span>欧美女歌手</span></a>
			</li>
			<li>
				<c:url value="singerquery" var="query">
					<c:param name="sortId" value="3"></c:param>
					<c:param name="gender" value="男"></c:param>
					<c:param name="flag" value="singerSort"></c:param>
				</c:url>
				<a href="${query }" target="_blank"><span>欧美男歌手</span></a>
			</li>
			<li>
				<c:url value="singerquery" var="query">
					<c:param name="sortId" value="3"></c:param>
					<c:param name="flag" value="bandSort"></c:param>
				</c:url>
				<a href="${query }" target="_blank"><span>欧美组合</span></a>
			</li>
			<li>
				<c:url value="singerquery" var="query">
					<c:param name="sortId" value="2"></c:param>
					<c:param name="gender" value="女"></c:param>
					<c:param name="flag" value="singerSort"></c:param>
				</c:url>
				<a href="${query }" target="_blank"><span>日韩女歌手</span></a>
			</li>
			<li>
				<c:url value="singerquery" var="query">
					<c:param name="sortId" value="2"></c:param>
					<c:param name="gender" value="男"></c:param>
					<c:param name="flag" value="singerSort"></c:param>
				</c:url>
				<a href="${query }" target="_blank"><span>日韩男歌手</span></a>
			</li>
			<li>
				<c:url value="singerquery" var="query">
					<c:param name="sortId" value="2"></c:param>
					<c:param name="flag" value="bandSort"></c:param>
				</c:url>
				<a href="${query }" target="_blank"><span>日韩组合</span></a>
			</li>
			<li>
				<c:url value="singerquery" var="query">
					<c:param name="sortId" value="4"></c:param>
					<c:param name="flag" value="others"></c:param>
				</c:url>
				<a href="${query }" target="_blank"><span>其他</span></a>
			</li>
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
<!-- content -->
<div class="center">
	<div class="side">
		<div class="trynHcon">
			<div class="trynFocus">
				<a id="pimg1" target="_blank" href=""><img src="images/liudehua.jpg" /></a>
				<a id="pimg2" target="_blank" style="display: none" href=""><img src="images/chenglong.jpg" /></a> 
				<a id="pimg3" target="_blank" style="display: none" href=""><img src="images/xiaohudui.jpg" /></a>
				<ul id="bq">
					<li class="cur">1</li>
					<li>2</li>
					<li>3</li>
				</ul>
			</div>
		</div>
		<div class="notice">
            <ul>
              <c:if test="${not empty applicationScope.noticeList }">
              <marquee behavior="scroll" direction="up" width="300" height="90" loop="-1" scrollamount="1.5" scrolldelay="0" style="font:50px">
              	<c:forEach items="${applicationScope.noticeList }" var="notice">
              		<li>
              		<c:url value="noticeServlet" var="queryById">
              		   <c:param name="noticeId" value="${notice.noticeId }"></c:param>
              		   <c:param name="action" value="queryById"></c:param>
              		</c:url>
              		<a href="${queryById }" target="_blank">${notice.noticeName }</a>
              		</li>
              	</c:forEach>
              	</marquee>
              </c:if>
            </ul>
        </div>
		<div class="singerBox">
			<div class="singerTitle">
				<h2>热门歌手推荐</h2>
				<p class="tabs" data-for="#hotSingerList">
					<a class="selected" target="_self" href="javascript:cTab('#hotSingerList',0);">华语</a>
					<a class="" target="_self" href="javascript:cTab('#hotSingerList',1);">欧美</a>
					<a class="" target="_self" href="javascript:cTab('#hotSingerList',2);">日韩</a>
				</p>
			</div>
			<div class="singerList" id="hotSingerList">
				<ul style="display: block;">
				<c:forEach items = "${applicationScope.singers }" var = "singer" >
					<li class="singerPic">
					<c:url value ="SingerServlet" var="querySinger">
						<c:param name ="singerName" value="${singer.singerId}"></c:param>
						<c:param name="flag" value="singer"></c:param>
					</c:url>
						<a href="${querySinger }" target="_blank"> 
							<img alt="${singer.singerName }" src="${singer.singerPic }"/> 
							<span>${singer.singerName }</span>
						</a>
					</li>
				</c:forEach>
				</ul>
				<ul style="display:none;">
				<c:forEach items = "${applicationScope.oumeiSingers }" var="singer" >
					<li class="singerPic">
					<c:url value ="SingerServlet" var="querySinger">
						<c:param name ="singerName" value="${singer.singerId}"></c:param>
						<c:param name="flag" value="singer"></c:param>
					</c:url>
						<a href="${querySinger }" target="_blank"> 
							<img alt="${singer.singerName }" src="${singer.singerPic }"/> 
							<span>${singer.singerName }</span>
						</a>
					</li>
				</c:forEach>
				</ul>	
				<ul style="display:none;">
					<c:forEach items = "${applicationScope.rihanSingers }" var = "singer" >
					<li class="singerPic">
					<c:url value ="SingerServlet" var="querySinger">
						<c:param name ="singerName" value="${singer.singerId}"></c:param>
						<c:param name="flag" value="singer"></c:param>
					</c:url>
						<a href="${querySinger }" target="_blank"> 
							<img alt="${singer.singerName }" src="${singer.singerPic }"/> 
							<span>${singer.singerName }</span>
						</a>
					</li>
				</c:forEach>
				</ul>							
			</div>
		</div>
		<div class="hotalbum" >
			<div class="albumTitle">
				<strong>热门专辑排行榜</strong>
				<c:url value="AlbumServlet" var="queryAlbum">
					<c:param name="album" value="queryAllAlbum"></c:param>
				</c:url>
				<a href="${queryAlbum }" style="diaplay:none;">更多..</a>
			</div>
			<div class="albumList">
				<ul>
				<c:forEach items="${applicationScope.albums }" var="album" varStatus="i">
					<li class="">
						<c:url value="albumServlet" var="albumId">
							<c:param name="albumId" value="${album.albumId }"></c:param>
						</c:url>
						<a class="albumPic" href="${albumId }" target="_blank"><img alt="${album.albumName }" src="${album.albumPic }"/></a>
						<p class="albumInfo">
							<small>${i.index+1 }.</small>
							<c:url value="albumServlet" var="albumName">
								<c:param name="albumId" value="${album.albumId }"></c:param>
							</c:url>	
							<a class="albumName" href="${albumName }" target="_blank">${album.albumName }</a>
							<c:url value="singerquery" var="singerName">
							<c:choose>
							<c:when test="${not empty album.singer.singerName }">
								<c:param name="singerName" value="${album.singerId }"></c:param>
								<c:param name="flag" value="singer"></c:param>
							</c:when>
							<c:otherwise>
								<c:param name="singerName" value="${album.bandId }"></c:param>
								<c:param name="flag" value="band"></c:param>
							</c:otherwise>
							</c:choose>
							</c:url>		
							<a class="singerName" href="${singerName }" target="_blank">${album.singer.singerName }${album.band.bandName }</a>						
						</p>
						<p class="albumAction">
							<c:url value="playlist" var="playAlbum">
								<c:param name="albumId" value="${album.albumId }"></c:param>
								<c:param name="action" value="albumPlay"></c:param>
							</c:url>
							<a class="play" href="${playAlbum }" target="view_window">整张播放</a>
						</p>
					</li>
				</c:forEach>
				</ul>
					<script>$('.hotalbum .albumList ul li').mouseover(function(){$(this).addClass('mouseover').siblings('li').removeClass('mouseover');});</script>
			</div>
		</div>
		<div class="genre">
			<div class="genreTitle">
				<h2>推荐曲风</h2>
			</div>
			<div class="genreList">
				<ul>
					<c:forEach items = "${applicationScope.styles}" var="style">
						<li>
							<c:url value="SongServlet" var="querySong">
								<c:param name="styleId" value="${style.styleId}"></c:param>
								<c:param name="styleName" value="${style.styleName}"></c:param>
								<c:param name="type" value="style"></c:param>
							</c:url>
							<a href="${querySong }" target="_blank">${style.styleName}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
	</div>
	<script>tabs("bq li","pimg","cur","","",".pimg");</script>
	
	<div class="containter">
		<div class="album">
			<div class="albumTitle">
				<h2>专辑推荐</h2>
				<p class="tabs" data-for="#albumList">
					<!-- <a class="selected" href="javascript:cTab('#albumList',0);">精选</a> -->
					<a class="selected" href="javascript:cTab('#albumList',0);">华语</a>
					<a class="" href="javascript:cTab('#albumList',1);">欧美</a>
					<a class="" href="javascript:cTab('#albumList',2);">日韩</a>
					<a href="" style="display:none;">更多..</a>
				</p>
			</div>
			<div class="albumList" id="albumList">
				<ul style="display:block" data-selected="true">
					<c:forEach items="${applicationScope.guoyuAlbums }" var="album">
						<li>
							<c:url value="albumServlet" var="albumId">
								<c:param name="albumId" value="${album.albumId}"></c:param>
							</c:url>
							<a class="albumPic" href="${albumId}" target="_blank"><img alt="${album.albumName }" src="${album.albumPic }"/></a>
							<c:url value="playlist" var="albumPlay">
								<c:param name="albumId" value="${album.albumId }"></c:param>
								<c:param name="action" value="albumPlay"></c:param>
							</c:url>
							<a class="albumPlay" href="${albumPlay }" target="_blank">播放整张专辑</a>
							<c:url value="albumServlet" var="albumName">
								<c:param name="albumId" value="${album.albumId }"></c:param>
							</c:url>
							<a class="albumName" title="${album.albumName }" target="_blank" href="${albumName }">${album.albumName }</a>
							<c:url value="singerquery" var="singer">
								<c:choose>
								<c:when test="${not empty album.singer.singerName }">
									<c:param name="singerName" value="${album.singerId }"></c:param>
									<c:param name="flag" value="singer"></c:param>
								</c:when>
								<c:otherwise>
									<c:param name="singerName" value="${album.bandId }"></c:param>
									<c:param name="flag" value="band"></c:param>
								</c:otherwise>								
								</c:choose>
							</c:url>
							<a class="singerName" target="_blank" href="${singer }">${album.singer.singerName }${album.band.bandName }</a>
							<a class="albumDate" target="_self" href="#">${album.issueDate}</a>	
						</li>
					</c:forEach>
				</ul>
				<ul style="display:none">
					<c:forEach items="${applicationScope.oumeiAlbums }" var="album">
						<li>
							<c:url value="albumServlet" var="albumId">
								<c:param name="albumId" value="${album.albumId}"></c:param>
							</c:url>
							<a class="albumPic" href="${albumId}" target="_blank"><img alt="${album.albumName }" src="${album.albumPic }"/></a>
							<c:url value="playlist" var="albumPlay">
								<c:param name="albumId" value="${album.albumId }"></c:param>
								<c:param name="action" value="albumPlay"></c:param>
							</c:url>
							<a class="albumPlay" href="${albumPlay }" target="_blank">播放整张专辑</a>
							<c:url value="albumServlet" var="albumName">
								<c:param name="albumId" value="${album.albumId }"></c:param>
							</c:url>
							<a class="albumName" title="${album.albumName }" target="_blank" href="${albumName }">${album.albumName }</a>
							<c:url value="singerquery" var="singer">
								<c:choose>
								<c:when test="${not empty album.singer.singerName }">
									<c:param name="singerName" value="${album.singerId }"></c:param>
									<c:param name="flag" value="singer"></c:param>
								</c:when>
								<c:otherwise>
									<c:param name="singerName" value="${album.bandId }"></c:param>
									<c:param name="flag" value="band"></c:param>
								</c:otherwise>								
								</c:choose>
							</c:url>
							<a class="singerName" target="_blank" href="${singer }">${album.singer.singerName }${album.band.bandName }</a>
							<a class="albumDate" target="_self" href="#">${album.issueDate}</a>	
						</li>
					</c:forEach>
				</ul>
				<ul style="display:none">
					<c:forEach items="${applicationScope.rihanAlbums }" var="album">
						<li>
							<c:url value="albumServlet" var="albumId">
								<c:param name="albumId" value="${album.albumId}"></c:param>
							</c:url>
							<a class="albumPic" href="${albumId}" target="_blank"><img alt="${album.albumName }" src="${album.albumPic }"/></a>
							<c:url value="playlist" var="albumPlay">
								<c:param name="albumId" value="${album.albumId }"></c:param>
								<c:param name="action" value="albumPlay"></c:param>
							</c:url>
							<a class="albumPlay" href="${albumPlay }" target="_blank">播放整张专辑</a>
							<c:url value="albumServlet" var="albumName">
								<c:param name="albumId" value="${album.albumId }"></c:param>
							</c:url>
							<a class="albumName" title="${album.albumName }" target="_blank" href="${albumName }">${album.albumName }</a>
							<c:url value="singerquery" var="singer">
								<c:choose>
								<c:when test="${not empty album.singer.singerName }">
									<c:param name="singerName" value="${album.singerId }"></c:param>
									<c:param name="flag" value="singer"></c:param>
								</c:when>
								<c:otherwise>
									<c:param name="singerName" value="${album.bandId }"></c:param>
									<c:param name="flag" value="band"></c:param>
								</c:otherwise>								
								</c:choose>
							</c:url>
							<a class="singerName" target="_blank" href="${singer }">${album.singer.singerName }${album.band.bandName }</a>
							<a class="albumDate" target="_self" href="#">${album.issueDate}</a>	
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- 歌曲列表 -->
		<div class="songBox">
			<div class="songRow">
				<div class="songTitle">
					<h2>新歌推荐</h2>
					<p class="tabs" data-for="#newSongList">
						<a class="selected"  href="javascript:cTab('#newSongList',0);">华语</a>
						<a class=""  href="javascript:cTab('#newSongList',1);">欧美</a>
						<a class=""  href="javascript:cTab('#newSongList',2);">日韩</a>		
					</p>
				</div>
				<div class="songList" id="newSongList">
					<ul style="display:block;" data-selected="true">
					<c:forEach items="${applicationScope.songs}" var="song">
						<li>
							<input type="checkbox" name="checked" value="${song.songId}"/>
							<span>
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
							    <a href="${play }" target="view_window">${fn:substring(song.songName,0,fn:indexOf(song.songName,"."))}</a>-
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
							</span>
						</li>
					</c:forEach>
					</ul>
					<!-- 欧美新歌 -->
					<ul style="display:none;">
					<c:if test="${not empty applicationScope.newoumeisongs }">
						<c:forEach items="${applicationScope.newoumeisongs}" var="song">
						<li>
							<input type="checkbox" name="checked" value="${song.songId}"/>
							<span>
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
							    <a href="${play }" target="view_window">${fn:substring(song.songName,0,fn:indexOf(song.songName,"."))}</a>-
							    <c:url value="singerquery" var="query">
							    	<c:choose>
							    		<c:when test="${not empty song.singer.singerName }">
							    			<c:param name="singerName" value="${song.singerId }"/>
							    			<c:param name="flag" value="singer"/>
							    		</c:when>
							    		<c:otherwise>
							    			<c:param name="singerName" value="${song.bandId }"/>
							    			<c:param name="flag" value="band"></c:param>
							    		</c:otherwise>
							    	</c:choose>
							    </c:url>
							    <a title="${song.singer.singerName}${song.band.bandName }" href="${query }" target="_blank">${song.singer.singerName}${song.band.bandName }</a>
							</span>
						</li>
						</c:forEach>
					</c:if>	
					</ul>
					<!-- 日韩新歌 -->
					<ul style="display:none;">
					<c:if test="${not empty applicationScope.newrihansongs }">
						<c:forEach items="${applicationScope.newrihansongs}" var="song">
						<li>
							<input type="checkbox" name="checked" value="${song.songId}"/>
							<span>
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
							    <a href="${play }" target="view_window">${fn:substring(song.songName,0,fn:indexOf(song.songName,"."))}</a>-
							    <c:url value="singerquery" var="query">
							    	<c:choose>
							    		<c:when test="${not empty song.singer.singerName}">
							    			<c:param name="singerName" value="${song.singerId }"/>
							    			<c:param name="flag" value="singer"/>
							    		</c:when>
							    		<c:otherwise>
							    			<c:param name="singerName" value="${song.bandId }"/>
							    			<c:param name="flag" value="band"></c:param>
							    		</c:otherwise>
							    	</c:choose>
							    </c:url>
							    <a title="${song.singer.singerName}${song.band.bandName }" href="${query }" target="_blank">${song.singer.singerName}${song.band.bandName }</a>
							</span>
						</li>
						</c:forEach>
					</c:if>	
					</ul>
					<p class="listAction">
                        <a class="select" href="#newSongList" target="_self">全/反选</a>
                        <a class="play" href="#newSongList"  target="_blank">播放</a>
                        <a class="add" href="#newSongList"  target="_self">加入列表</a>
                    </p>
				</div>
			</div>
			<!-- 网络流行-->
			<div class="songRow">
				<div class="songTitle">
					<h2>网络流行</h2>
					<p class="tabs" data-for="#hotSongList">
						<a class="selected"  href="javascript:cTab('#hotSongList',0);" style="display:none;">日榜</a>
						<a class=""  href="javascript:cTab('#hotSongList',1);" style="display:none;">周榜</a>
						<a href="#" style="display:none;">更多..</a>					
					</p>
				</div>
				<div class="songList" id="hotSongList">
					<ul style="display:block;" data-selected="true">
						<c:if test="${not empty applicationScope.popsongs }">
						<c:forEach items="${applicationScope.popsongs}" var="song">
						<li>
							<input type="checkbox" name="checked" value="${song.songId}"/>
							<span>
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
							    <a href="${play }" target="view_window">${fn:substring(song.songName,0,fn:indexOf(song.songName,"."))}</a>-
							    <c:url value="singerquery" var="query">
							    	<c:choose>
							    		<c:when test="${not empty song.singer.singerName }">
							    			<c:param name="singerName" value="${song.singerId }"/>
							    			<c:param name="flag" value="singer"/>
							    		</c:when>
							    		<c:otherwise>
							    			<c:param name="singerName" value="${song.bandId }"/>
							    			<c:param name="flag" value="band"></c:param>
							    		</c:otherwise>
							    	</c:choose>
							    </c:url>
							    <a title="${song.singer.singerName}${song.band.bandName }" href="${query }" target="_blank">${song.singer.singerName}${song.band.bandName }</a>
							</span>
						</li>
						</c:forEach>
					</c:if>	
					</ul>
					<ul style="display:none;">
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="邓丽君" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
						<li><input type="checkbox" name="newSong" value="新歌"/><span><a href="">你是我的眼</a>-<a title="林宥嘉" href="#">林宥嘉</a></span></li>
					</ul>
					<p class="listAction">
                        <a class="select" href="#hotSongList" target="_self">全/反选</a>
                        <a class="play" href="#hotSongList" target="view_window">播放</a>
                        <a class="add" href="#hotSongList" target="_self">加入列表</a>
                    </p>
				</div>
			
			</div>
			
			<div class="songRow">
				<div class="songTitle">
					<h2>经典老歌</h2>
					<p class="tabs" data-for="#oldSongList">
						<a href="#" style="display:none;">更多..</a>					
					</p>
				</div>
				<div class="songList" id="oldSongList">
					<ul style="display:block;" data-selected="true">
					<c:if test="${not empty applicationScope.classicssongs }">
						<c:forEach items="${applicationScope.classicssongs}" var="song">
						<li>
							<input type="checkbox" name="checked" value="${song.songId}"/>
							<span>
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
							    <a href="${play }" target="view_window">${fn:substring(song.songName,0,fn:indexOf(song.songName,"."))}</a>-
							    <c:url value="singerquery" var="query">
							    	<c:choose>
							    		<c:when test="${not empty song.singer.singerName }">
							    			<c:param name="singerName" value="${song.singerId }"/>
							    			<c:param name="flag" value="singer"/>
							    		</c:when>
							    		<c:otherwise>
							    			<c:param name="singerName" value="${song.bandId }"/>
							    			<c:param name="flag" value="band"></c:param>
							    		</c:otherwise>
							    	</c:choose>
							    </c:url>
							    <a title="${song.singer.singerName}${song.band.bandName }" href="${query }" target="_blank">${song.singer.singerName}${song.band.bandName }</a>
							</span>
						</li>
						</c:forEach>
					</c:if>	
					</ul>
					<p class="listAction">
                        <a class="select" href="#oldSongList" target="_self">全/反选</a>
                        <a class="play" href="#oldSongList" target="_self">播放</a>
                        <a class="add" href="#oldSongList" target="_self">加入列表</a>
                    </p>
				</div>
			</div>	
		</div>
		<script>cButtons("newSongList", "hotSongList", "oldSongList");</script>

		<div class="songBox">
			<div class="songRow">
				<div class="songTitle">
					<h2>会员推荐</h2>
					<p class="tabs">
						<a href="#" style="display:none;">更多..</a>	
					</p>
				</div>
				<div class="songList" id="userSong">
					<ul style="display:block" data-selected="true" >
						<c:if test="${not empty applicationScope.membersongs }">
						<c:forEach items="${applicationScope.membersongs}" var="song">
						<li>
							<input type="checkbox" name="checked" value="${song.songId}"/>
							<span>
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
							    <a href="${play }" target="view_window">${fn:substring(song.songName,0,fn:indexOf(song.songName,"."))}</a>-
							    <c:url value="singerquery" var="query">
							    	<c:choose>
							    		<c:when test="${not empty song.singer.singerName }">
							    			<c:param name="singerName" value="${song.singerId}"/>
							    			<c:param name="flag" value="singer"/>
							    		</c:when>
							    		<c:otherwise>
							    			<c:param name="singerName" value="${song.bandId}"/>
							    			<c:param name="flag" value="band"></c:param>
							    		</c:otherwise>
							    	</c:choose>
							    </c:url>
							    <a title="${song.singer.singerName}${song.band.bandName }" href="${query }" target="_blank">${song.singer.singerName}${song.band.bandName }</a>
							</span>
						</li>
						</c:forEach>
					</c:if>	
					</ul>
					<p class="listAction">
                        <a class="select" href="#hotSongList" target="_self">全/反选</a>
                        <a class="play" href="#hotSongList"  target="_self">播放</a>
                        <a class="add" href="#hotSongList"  target="_self">加入列表</a>
                    </p>
				</div>
			</div>
			<div class="songRow">
				<div class="songTitle">
					<h2>DJ/舞曲</h2>
					<p class="tabs" data-for="#hotSongList">
						<a href="#" style="display:none;">更多..</a>					
					</p>
				</div>
				<div class="songList" id="rankDance">
					<ul style="display:block;" data-selected="true">
					<c:if test="${not empty applicationScope.dancesongs }">
						<c:forEach items="${applicationScope.dancesongs}" var="song">
						<li>
							<input type="checkbox" name="checked" value="${song.songId}"/>
							<span>
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
							    <a href="${play }" target="view_window">${fn:substring(song.songName,0,fn:indexOf(song.songName,"."))}</a>-
							    <c:url value="singerquery" var="query">
							    	<c:choose>
							    		<c:when test="${not empty song.singer.singerName }">
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
							</span>
						</li>
						</c:forEach>
					</c:if>	
					</ul>
					<p class="listAction">
                        <a class="select" href="#hotSongList" target="_self">全/反选</a>
                        <a class="play" href="#hotSongList" target="_self">播放</a>
                        <a class="add" href="#hotSongList" target="_self">加入列表</a>
                    </p>
				</div>
			
			</div>
			<div class="songRow">
				<div class="songTitle">
					<h2>新媒体流行</h2>
					<p class="tabs" data-for="#hotSongList">
						<a href="#" style="display:none;">更多..</a>					
					</p>
				</div>
				<div class="songList" id="rankNetpop">
					<ul style="display:block;" data-selected="true">
						<c:if test="${not empty applicationScope.newpopsongs }">
						<c:forEach items="${applicationScope.newpopsongs}" var="song">
						<li>
							<input type="checkbox" name="checked" value="${song.songId}"/>
							<span>
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
							    <a href="${play }" target="view_window">${fn:substring(song.songName,0,fn:indexOf(song.songName,"."))}</a>-
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
							</span>
						</li>
						</c:forEach>
					</c:if>
					</ul>
					<p class="listAction">
                        <a class="select" href="#oldSongList" target="_self">全/反选</a>
                        <a class="play" href="#oldSongList" target="_self">播放</a>
                        <a class="add" href="#oldSongList" target="_self">加入列表</a>
                    </p>
                    
				</div>
			</div>	
			 <script>cButtons("userSong", "rankDance", "rankNetpop");</script>
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