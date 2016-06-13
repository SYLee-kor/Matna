<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
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
=======
<div id="replyAdd" align="left">
		<form name="addForm" style="border: thin; background-color: #f1f1f1;">
			<!-- 입력폼 -->
			<h4>댓글쓰기</h4>
			<input type="hidden" name="repWriter" size="10" value="${userNo }" id="repWriter">
			<textarea rows="3" cols="50" name="repContent" tabindex="0" id="repContent"
				style="width: 500px; height: 80px;"></textarea>
			<input type="button" value="등록" onclick="insertReply('${review.no}')"
				style="width: 50px; height: 80px;"><br>
		</form>
	</div>
	<div id="replyList"  align="left"></div>
	<div id="replyUpdate" style="display:none">
		<form name="upForm_reply">
			<!-- 수정폼 -->
			<h4>댓글 수정</h4>
			<input type="hidden" name="repWriter" size="10" value="${userNo }" id="repWriter_up">
			<textarea rows="3" cols="50" name="repContent" id="repContent_up"></textarea>
			<input type="button" value="등록" onclick="updateReply(${review.no})">
			<input type="button" value="취소" onclick="hideReplyForm()">
		</form>
	</div>
>>>>>>> branch 'master' of https://github.com/SYLee-kor/Matna.git
