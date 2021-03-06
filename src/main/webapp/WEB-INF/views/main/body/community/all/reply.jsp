<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<hr style="border: 1px solid #dddddd;width: 64%;margin-left: 17%;margin-top: 3%;">
<c:if test="${replyList != null}" >
<c:forEach var="reply" items="${replyList }">
<c:set var="bNo" value="${reply.bNo }"/>
<font size="2">
<b style="color: #01559a; font-size: medium;margin-left: 18%;">
<c:if test="${type != 'noname' }">${reply.nickName }</c:if>
<c:if test="${type eq 'noname' }">익명</c:if>
</b> &nbsp; 

<font size="2" style="color: gray">${reply.regDate }</font> &nbsp;
</font> &nbsp;
<c:if test="${userNo eq reply.writer}">
<input type="button" value="수정" class="reply_bt"  onclick="upReplyForm(${reply.no},${replyMaker.cri.page })"> 
<input type="button" value="삭제" class="reply_bt"  onclick="deleteReply(${reply.no},${reply.bNo },${replyMaker.cri.page })">
</c:if>
<pre style="width: 50%;margin-left: 18%;"><span style="color: #555555;" id="repCont${reply.no }">${reply.content }</span></pre>
<hr style="border: 0.2% solid #dddddd;width: 64%;margin-left: 17%;margin-top: 1%;">
<span id="reply${reply.no }"></span>	
</c:forEach>

<center>
<div class="page">
  <ul class="pagination modal-1" id="pagination">
	<c:forEach begin="1" end="${replyMaker.endPage }" varStatus="stat">
		<li><a href="javascript:listReply(${bNo },${stat.index })">${stat.index }</a></li>
	</c:forEach>
	</ul>
</div>
</center>
</c:if>
