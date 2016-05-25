<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/comment.css" rel="stylesheet" type="text/css" />
<title>comment</title>
<script type="text/javascript" src="script/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
function check(){
	var mName = document.getElementById("session").value;
	var content = document.getElementById("commentContent").value;
	//var singerId = document.getElementById("singerId").value;
	//var bandId = document.getElementById("bandId").value;
	if(mName == "" || mName =="undefined" || mName==null){
		alert("请先登录后再评论!!");
		return false;
	}else{
		if($.trim(content).length<3 || $.trim(content).length>100){
			alert("评论内容须在3~100个字符之间");
			return false;
		}else{
			return true;
		}
	}
}
</script>
</head>
<body>
<c:if test="${not empty requestScope.commentList }">
<c:forEach items="${requestScope.commentList }" var="comment">
	<div class="clist">
    <div class="cinfo">
        <a href="#" class="username" target="_self"><b>${comment.mName }</b></a>
        <span class="datetime">${fn:substring(comment.commentDate,0,19) }</span>
        <span class="floor" style="display:none;">13楼</span>
    </div>
    <div class="content">
        <pre>${comment.commentContent }</pre>
    </div>
</div>
</c:forEach>
</c:if>
<div class="clist" style="display:none;">
    <div class="cinfo">
        <a href="#" class="username" target="_self"><b>IP:122.79.26.*</b></a>
        <span class="datetime">2013-03-15 09:40:38</span>
        <span class="floor" style="display:none;">13楼</span>
    </div>
    <div class="content">
        <pre>不错</pre>
    </div>
</div>
<div class="newcomment" id="newcomment">
    <h2>发表评论</h2>
    <div class="postform">
	<form action="commentServlet" method="post" onsubmit="return check();">
		<input type="hidden" name="session" id="session" value="${sessionScope.user.mName }"/>
		<input type="hidden" name="action" value="save"/>
		<c:if test="${not empty requestScope.singerId }">
			<input type="hidden" name="singerId" id="singerId" value="${requestScope.singerId }"/>
			<input type="hidden" name="flag" value="singer"/>
		</c:if>
		<c:if test="${not empty requestScope.bandId }">
			<input type="hidden" name="singerId" id="bandId" value="${requestScope.bandId}"/>
			<input type="hidden" name="flag" value="band"/>
		</c:if>
        <textarea class="content" onfocus="if(this.value==this.title){this.value=''};" onblur="if(this.value==''){this.value=this.title};" title="在此输入评论内容" tabindex="1" name="commentContent" id="commentContent">在此输入评论内容</textarea>
        <div class="submit">
            <button type="submit" tabindex="6">提交评论</button>
        </div>
    </form>
    </div>
</div>
</body>
</html>