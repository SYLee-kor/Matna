<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="/matna/resource/js/communityReply.js"></script>
<div id="replyAddDiv">
   <!-- 입력폼 -->
   
   <h4 style="font-weight: 500; font-size: 20px;">댓글쓰기</h4>
   <input type="hidden" name="replyWriter" size="10" value="${userNo }" id="replyWriter">
   <input type="hidden" name="type" id="type" value="free" />
   <textarea rows="3" cols="50" name="replyContent" tabindex="0" id="replyContent"></textarea>
   <input type="button" value="등록" onclick="insertReply(${board.no})" id="comment"><br>
</div>
<div id="replyList"  align="left"></div>
<div id="replyUpDiv" style="display:none">
   <!-- 수정폼 -->
   <h4 style="width: 50%;margin-left: 18%;">댓글 수정</h4>
   <input type="hidden" name="replyWriter_up" size="10" value="${userNo }" id="replyWriter_up">
   <input type="hidden" name="type" id="type" value="free" />
   <textarea rows="3" cols="50" name="replyContent_up" id="replyContent_up" 
   			style="border:1px solid;border-color:#dddddd; background-color:#fffff5; width: 50%;margin-left: 18%;"></textarea>
   <input type="button" class="reply_bt" value="등록" onclick="updateReply(${board.no})" style="margin-top: 3.6%;">
   <input type="button" class="reply_bt" value="취소" onclick="hideReplyForm()">
</div>