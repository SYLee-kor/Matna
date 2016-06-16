<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/matna/resource/js/communityReply.js"></script>
<div id="replyAddDiv" align="left">
	<!-- 입력폼 -->
	<h4>댓글쓰기</h4>
	<input type="hidden" name="replyWriter" size="10" value="${userNo }" id="replyWriter">
	<input type="hidden" name="type" id="type" value="free" />
	<textarea rows="3" cols="50" name="replyContent" tabindex="0" id="replyContent"
		style="width: 500px; height: 80px;"></textarea>
	<input type="button" value="등록" onclick="insertReply(${board.no})"
		style="width: 50px; height: 80px;"><br>
	</div>
<div id="replyList"  align="left"></div>
<div id="replyUpDiv" style="display:none">
	<!-- 수정폼 -->
	<h4>댓글 수정</h4>
	<input type="hidden" name="replyWriter_up" size="10" value="${userNo }" id="replyWriter_up">
	<input type="hidden" name="type" id="type" value="free" />
	<textarea rows="3" cols="50" name="replyContent_up" id="replyContent_up"></textarea>
	<input type="button" value="등록" onclick="updateReply(${board.no})">
	<input type="button" value="취소" onclick="hideReplyForm()">
</div>
