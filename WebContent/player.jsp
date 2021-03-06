<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>player</title>
<link rel="stylesheet" type="text/css" href="player/player.css"/>
</head>
<body>
<div id="player-panel" class="player">
	<object id="player" style="display:none" classid="clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6">
		<param name="URL" value=""/>
		<param name="autostart" value="-1"/>
		<param name="balance" value="0"/>
		<param name="volume" value="100"/>
		<param name="playcount" value="1"/>
	</object>	
	<div class="head">	
		<div id="current" style="width:8%"></div>
		<div id="status" style="width:80%;text-align:center"></div>
		<div id="total" style="width:8%"></div>
	</div>
	<div class="layer">
		<div id="progress">
			<div id="progress-forword"></div>
			<div id="progress-move"></div>
		</div>
		<div class="control">
			<div class="play">
				<img id="play" src="player/image/play-button-on.gif" style="margin:0 0 0 8px"/>
				<img id="stop" src="player/image/stop-button-on.gif" style="margin:0 0 1px 6px"/>
			</div>
			<div id="select" class="select">
				<input id="previous" type="button" value="上一曲" style="padding:5px 6px 5px 22px" onfocus="this.blur()"/>
				<input id="next" type="button" value="下一曲" style="padding:5px 24px 5px 4px" onfocus="this.blur()"/>
			</div>
			<div class="volume">
				<div class="adjust">
					<img id="volume-minus" src="player/image/volume-minus-button.gif" style="float: left"/>
					音量 
					<img id="volume-add" src="player/image/volume-add-button.gif" style="float: right"/>
				</div>
				<div id="sound">
					<div id="sound-forword"></div>
					<div id="sound-move"></div>
				</div>
			</div>
		</div>
		<div class="playlist">
			<ul class="tab-list">
				<li id="playlist">播放列表</li>
				<li id="recommend" style="background:url(player/image/tab-link-background.gif);display:none;">新歌推荐</li>
			</ul>
			<div class="list" id="playlist-list"></div>
			<div class="list" id="recommend-list" style="display:none;"></div>
			<div class="deal">
				<div style="float:left">
					<input id="all" type="checkbox" onfocus="this.blur()"/><label for="all">全选/反选</label>
				</div>
				<div style="float:right">
					<input id="action-delete" class="action" type="button" value="移除" style="background:url(player/image/music-remove-button.gif) no-repeat" onfocus="this.blur()"/>
					<input id="action-add" class="action" type="button" value="添加" style="background:url(player/image/music-add-button.gif) no-repeat;display:none;" onfocus="this.blur()"/>
				</div>
			</div>
		</div>
		<div class="play-mode">
			播放模式：
			<input id="order" type="button" value="顺 序" onfocus="this.blur()" style="background:url(player/image/order-button-on.gif) no-repeat"/>
			<input id="random" type="button" value="随 机" onfocus="this.blur()" style="background:url(player/image/random-button-hover.gif) no-repeat"/>
			<input id="cycle" type="button" value="单 曲" onfocus="this.blur()" style="background:url(player/image/cycle-button-hover.gif) no-repeat"/>
		</div>
	</div>
</div>
<!-- <div class="lyric">
	<div class="head"></div>
	<div style="height:6px;background-color:#a5c6e6"></div>
	<div class="lyric-show">歌词秀待续</div>
</div> -->
<form action="#" method="post">
	<table id="add-panel" class="music">
		<tr style="height:24px;line-height:24px;background-color:#8cb6e4">
			<td colspan="2" align="right"><a href="javascript:void(0)"  onclick="$('add-panel').style.display='none'">[ × ]</a></td>
		</tr>
		<tr>
			<td width="30%">演唱者：</td>
			<td width="70%"><input id="music-singer" class="text" type="text"/></td>
		</tr>
		<tr>
			<td>歌曲名：</td>
			<td><input id="music-name" class="text" type="text"/></td>
		</tr>
		<tr>
			<td>链接地址：</td>
			<td>
				<input id="music-url" class="text" type="text"/>
				<img id="file" src="player/image/scan-file-button.gif" style="position:absolute;bottom:50px;right:23px"/>				
				<div style="width:0; height:0; overflow:hidden"><input id="file-scan" type="file"/></div>
			</td>
		</tr>
		<tr style="height:40px;line-height:40px">
			<td colspan="2" style="text-align:right;padding-right:18px">
				<input id="confirm" class="action" type="button" value="确 定" onfocus="this.blur()"/>
				<input id="clear" class="action" type="reset" value="清 除" onfocus="this.blur()"/>
			</td>
		</tr>
	</table>
</form>
<div id="message" class="message">
	<div class="head"><a href="javascript:void(0)" onclick="$('message').style.display='none'">[ × ]</a></div>
	<div id="message-info" class="info"></div>
</div>
<script type="text/javascript" src="player/player.js"></script>
</body>
</html>