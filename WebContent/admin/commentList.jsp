<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评论列表</title>
<style type="text/css">
.table1{border:1px solid #137DB3;border-width:0px 1px 1px 0px;}
.td{font-family:Arial,"宋体";font-size:14px;color:#000000;border:1px solid #137DB3;border-width: 1px 0px 0px 1px;height:25px;}
</style>
<script type="text/javascript" src="script/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
function del(commentId){
	if(confirm("确定要删除?")){
		$.post("commentServlet",{commentId:commentId,action:"del"},function(data){
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
		<td class="td" align="center">评论者</td>
		<td class="td" align="center">评论时间</td>
		<td class="td" align="center">评论内容</td>
		<td class="td" align="center">操作</td>
	</tr>
	<c:if test="${not empty requestScope.commentList }">
	<c:forEach items="${requestScope.commentList }" var="comment" varStatus="i">
	<tr>
		<td class="td" align="center">${i.index+1 }</td>
		<td class="td" align="center">${comment.mName}</td>
		<td class="td" align="center">${fn:substring(comment.commentDate,0,19)}</td>
		<td class="td" align="center">${comment.commentContent }</td>
		<td class="td" align="center">
			<img src="./images/edit.gif" alt="保存" width="16" height="16" style="cursor: pointer;display:none;" onclick="update();" />
			<img src="./images/del.gif" alt="删除" title="删除" width="16" height="16" style="cursor: pointer;" onclick="del('${comment.commentId}');" />
		</td>
	</tr>
	</c:forEach>
	</c:if>
</table>
</div>
</body>
</html>