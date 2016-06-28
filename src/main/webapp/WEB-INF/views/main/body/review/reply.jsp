<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<hr style="border: 1px solid #dddddd;width: 64%;margin-left: 17%;margin-top: 3%;">
<c:if test="${replyList != null}" >
<c:forEach var="reply" items="${replyList }">
<c:set var="rNo" value="${reply.rNo }"/>
<font size="2">
<b style="color: #01559a; font-size: medium;margin-left: 18%;">${reply.nickName }</b> &nbsp; 

<font size="2" style="color: gray;">${reply.regDate }</font> &nbsp;
</font> &nbsp;
<c:if test="${userNo eq reply.writer}">
<input type="button" value="수정" class="reply_bt" onclick="upReplyForm(${reply.no},'${reply.content }',${replyMaker.cri.page })"> 
<input type="button" value="삭제" class="reply_bt" onclick="deleteReply(${reply.no},${reply.rNo },${replyMaker.cri.page })">
</c:if>
<pre style="width: 50%;margin-left: 18%;"><span style="color: #555555;">${reply.content }</span></pre>
<hr style="border: 0.2% solid #dddddd;width: 64%;margin-left: 17%;margin-top: 1%;">
<span id="reply${reply.no }"></span>
</c:forEach>
<center>
<div class="page">
  <ul class="pagination modal-1" id="pagination">
	<c:forEach begin="1" end="${replyMaker.endPage }" varStatus="stat">
		<li><a href="javascript:listReply(${rNo },${stat.index })">${stat.index }</a></li>
	</c:forEach>
	</ul>
</div>
</center>
</c:if>
