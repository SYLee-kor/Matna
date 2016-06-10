<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->
<div id="replyAddDiv" align="left" style="border: thin; background-color: #f1f1f1;">
	<!-- 입력폼 -->
	<h4>댓글 작성</h4>
	<textarea rows="3" cols="50" id="reply_content"
		style="width: 500px; height: 80px;"></textarea>
	<input type="button" value="등록" onclick="insertReply(${review.no },${page})"
		style="width: 50px; height: 80px;"><br>
</div>
<div id="replyListDiv"  align="left"></div>
<div id="replyUpdateDiv" style="display:none">
	<!-- 수정폼 -->
	<h4>댓글 수정</h4>
	<textarea rows="3" cols="50" id="reply_upContent"></textarea>
	<input type="button" value="등록" onclick="modifyReply(${review.no},${page })">
	<input type="button" value="취소" onclick="hideReplyUpDiv()">
</div>