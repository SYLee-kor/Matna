<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/matna/resource/SE2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "content",
			sSkinURI : "/matna/resource/SE2/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true,
				bUseVerticalResizer : true,
				bUseModeChanger : true,
				fOnBeforeUnload : function() {
				}
			},
			fCreator : "createSEditor2"
		});
		$("#comm_submit").click(function() {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});
	});
	
	function page_exit() {
		location.href = "/matna/community/list?type="+$('#type').val();
	}

</script>
</head>
<body>
	<br>
	<br>
	<div class="regdiv" style="margin-left: 17%;padding-left:50px ;margin-right: 20%;border: 1px solid #999;" >
	<form id="frm" action="/matna/community/modify" method="post">
		<input type="hidden" name="type" id="type" value="${type }"/>
		<input type="hidden" name="writer" id="writer" value="${userNo}"/>
		<input type="hidden" name="no" id="no" value="${board.no }"/>
		<input type='hidden' name='page' id='page' value ="${cri.page}">
   		<input type='hidden' name='perPageNum' id='perPageNum' value ="${cri.perPageNum}">
   		<input type='hidden' name='searchType' id='searchType' value ="${cri.searchType}">
   		<input type='hidden' name='keyword' id='keyword' value ="${cri.keyword}">
    <h2>
       게시글을 수정해주세요~!
    </h2>
    <p id="intro">
     게시판을 수정하는 페이지 입니다.
     글 작성 전, 공지사항에서 룰을 먼저 필독 해 주세요^_^♥
    </p> 
    
       <!--제목입력란 -->       
       <p id="inputfield"><label for="review_title">제목</label>
       <input type="text" id="review_title" name="title" value="${board.title }"
              required tabindex="4" style="margin-bottom: 10px;"/> </p>
  		 <font color="red" face="bold">${errMsgs.e_title }</font> 
       <!--SmartEditor입력란 -->
   
       <textarea cols="100" rows="35" name="content"
				id="content" style="width: 750px; height: 350px;">${board.content }</textarea>
	   <!-- <textarea cols="100" rows="35" name="content" 
	             id="review_content" style="width: 700px; height: 500px;"></textarea><br/> -->
	   
        <!-- 버튼 -->
        <button id="comm_submit" name="submit" tabindex="5" style="margin-left: 79%;">수정</button>
		<button id="exit" onclick="page_exit();">목록</button>
       
    </form>
	</div>
	 <!-- footer start -->
    <%@include file="/WEB-INF/views/footer.jsp" %>
    <!-- footer end --> 
</body>
</html>