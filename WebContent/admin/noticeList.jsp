<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全部新闻</title>
<style type="text/css">
a:link {color:blue;font-weight:normal;text-decoration: none;}
a:visited {color:blue;font-weight:normal;text-decoration: none;}
a:hover {color:#FF0000;font-weight:normal;text-decoration: none;}
span.addNotice{cursor:pointer;background-image:url("./images/btn_bg2.png");background-repeat: no-repeat;margin-left: 10px;overflow: hidden;padding:5px 5px;width: 76px;height:26px;}
.noticeList{width:700px;overflow:hidden;margin:0 auto;}
.bottom{width:700px;overflow:hidden;margin:0 auto;margin-top:10px;}
.table1{border:1px solid #137DB3;border-width:0px 1px 1px 0px;}
.td{font-family:Arial,"宋体";font-size:12px;color:#000000;border:1px solid #137DB3;border-width: 1px 0px 0px 1px;height:25px;}
</style>
<script type="text/javascript" src="script/jquery-1.8.1.min.js"></script>
<script type="text/javascript" language="javascript"> 
function iFrameHeight() { 
	var ifm= document.getElementById("iframepage"); 
	var subWeb = document.frames ? document.frames["iframepage"].document : ifm.contentDocument; 
	if(ifm != null && subWeb != null) { 
		ifm.height = subWeb.body.scrollHeight; 
	} 
} 
function addNotice(){
	document.getElementById("iframepage").src="admin/addNotice.jsp";
}
function del(noticeId){
	if(confirm("确定要删除?")){
		$.post("./noticeServlet",{noticeId:noticeId,action:"delete"},function(data){
			if(data.success='true'){
				window.location.reload();
			}else{
				//成功不成功都要刷新.
				window.location.reload();
			}
		},"json");
	}
}
function update(noticeId,noticeName,noticeContent){
	var frame = document.getElementById("iframepage");
	frame.src = "admin/addNotice.jsp";
	//alert(noticeName);
	frame.contentWindow.document.getElementById("title").value ="";
}
</script>
</head>
<body>
<div class="noticeList">
	<div>
		<span class="addNotice" onclick="addNotice();">添加新闻</span>
	</div>
<table width="99%" cellpadding="0" cellspacing="0" bgcolor="#E8F2FB" class="table1" style="margin-top: 20px;">
	<tr>
		<td class="td" align="center">序号</td>
		<td class="td" align="center">新闻标题</td>
		<td class="td" align="center">发布时间</td>
		<td class="td" align="center">操作</td>
	</tr>
	<c:if test="${not empty requestScope.noticeList }">
	<c:forEach items="${requestScope.noticeList }" var="notice" varStatus="i">
		<tr>
			<td class="td" align="center">${i.index+1 }</td>
			<td class="td" align="center">
				<c:url value="./noticeServlet" var="queryById">
					<c:param name="noticeId" value="${notice.noticeId }"></c:param>
					<c:param name="action" value="queryById"></c:param>
				</c:url>
				<a href="${queryById }" target="_blank">${notice.noticeName }</a>
			</td>
			<td class="td" align="center">${fn:substring(notice.noticeDate,0,19) }</td>
			<td class="td" align="center">
				<img src="./images/edit.gif" alt="保存" width="16" height="16" style="cursor: pointer;display:none;" onclick="update('${notice.noticeId}','${notice.noticeName}','${notice.noticeContent }')" />
				<img src="./images/del.gif" alt="删除" title="删除" width="16" height="16" style="cursor: pointer;" onclick="del('${notice.noticeId}')" />
			</td>
		</tr>
	</c:forEach>
	</c:if>
</table>
</div>
<div class="bottom">
<iframe src="" width="100%" height="350px"  name="iframepage" id="iframepage" frameborder="0" scrolling="no"></iframe>
</div>
</body>
</html>