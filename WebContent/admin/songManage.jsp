<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>songManage</title>
<script type="text/javascript" src="script/jquery-1.8.1.min.js"></script>
<style type="text/css">
a:link {color:blue;font-weight:normal;text-decoration: none;}
a:visited {color:blue;font-weight:normal;text-decoration: none;}
a:hover {color:#FF0000;font-weight:normal;text-decoration: none;}
.table1{border:1px solid #137DB3;border-width:0px 1px 1px 0px;}
.td{font-family:Arial,"宋体";font-size:14px;color:#000000;border:1px solid #137DB3;border-width: 1px 0px 0px 1px;height:25px;}
</style>
<script type="text/javascript">
function del(songId){
	if(confirm("确定要删除?")){
		$.post("SongServlet",{songId:songId,type:"delSong"},function(data){
			if(data.success=='true'){
				window.location.reload();
			}else{
				window.location.reload();
			}
		},"json");
	}
}
</script>
</head>
<body>
<div>
<table width="99%" cellpadding="0" cellspacing="0" bgcolor="#E8F2FB" class="table1" style="margin-top: 20px;">
	<tr>
		<td class="td" align="center">序号</td>
		<td class="td" align="center">音乐名称</td>
		<td class="td" align="center">演唱者</td>
		<td class="td" align="center">操作</td>
	</tr>
	<c:if test="${not empty requestScope.songList }">
	<c:forEach items="${requestScope.songList }" var="song" varStatus="i">
	<tr>
		<td class="td" align="center"">${i.index+1 }</td>
		<td class="td" align="center">
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
		</td>
		<td class="td" align="center">
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
		</td>
		<td class="td" align="center">
			<img src="./images/edit.gif" alt="保存" width="16" height="16" style="cursor: pointer;display:none;" onclick="update();" />
			<img src="./images/del.gif" alt="删除" title="删除" width="16" height="16" style="cursor: pointer;" onclick="del('${song.songId}');" />
		</td>
	</tr>
	</c:forEach>
	</c:if>
</table>
</div>
</body>
</html>