<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${replyList != null}" >
<c:forEach var="reply" items="${replyList }">
<font size="2">
<input type="hidden" id="w${reply.no }" value="${reply.writer }">
<input type="hidden" id="c${reply.no }" value="${reply.content }">
<b style="color: teal; font-size: medium;">${reply.nickName }</b> &nbsp; 
<font size="2" style="color: gray">${reply.regDate }</font> &nbsp;
</font> &nbsp;
<c:if test="${userNo eq reply.writer}">
<input type="button" value="수정" onclick="upReplyForm(${reply.no},'${reply.content }')"> 
<input type="button" value="삭제" onclick="deleteReply(${reply.no},${reply.rNo })">
</c:if>
<pre><span style="color: #555555">${reply.content }</span></pre>
<span id="r${reply.no }"></span>
<c:forEach begin="0" end="10"><font color="gray" size="3">...........</font></c:forEach><br>	
</c:forEach>
</c:if>
