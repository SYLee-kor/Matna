<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${replyList != null}" >
<c:forEach var="reply" items="${replyList }">
<c:set var="rNo" value="${reply.rNo }"/>
<font size="2">
<b style="color: teal; font-size: medium;margin-left: 18%;">${reply.nickName }</b> &nbsp; 
<font size="2" style="color: gray;">${reply.regDate }</font> &nbsp;
</font> &nbsp;
<c:if test="${userNo eq reply.writer}">
<input type="button" value="수정" onclick="upReplyForm(${reply.no},'${reply.content }',${replyMaker.cri.page })"> 
<input type="button" value="삭제" onclick="deleteReply(${reply.no},${reply.rNo },${replyMaker.cri.page })">
</c:if>
<pre style="width: 50%;margin-left: 18%;"><span style="color: #555555;">${reply.content }</span></pre>
<span id="reply${reply.no }"></span>
<c:forEach begin="0" end="10"><font color="gray" size="3">..............</font></c:forEach><br>	
</c:forEach>
<c:forEach begin="1" end="${replyMaker.endPage }" varStatus="stat">
	<a href="javascript:listReply(${rNo },${stat.index })">${stat.index }</a>
</c:forEach>	
</c:if>
