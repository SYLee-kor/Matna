<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  <!-- header추가  -->

<script type="text/javascript" src="/matna/resource/SE2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">
var oEditors = [];
$(function() {
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "free_content",
		sSkinURI : "/matna/resource/SE2/SmartEditor2Skin.html",
		htParams : {
			bUseToolbar : true,
			bUseVerticalResizer : true,
			bUseModeChanger : true,
			fOnBeforeUnload : function() {
			}
		},
		fOnAppLoad : function() {
			oEditors.getById["free_content"].exec("PASTE_HTML",
					[ "글 작성시 공지사항에 룰을 먼저 필독 해 주세요" ]);
		},
		fCreator : "createSEditor2"
	});
	$("#submmit").click(function() {
		oEditors.getById["free_content"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#frm").submit();
	});
});

</script>
</head>
<body> 
	<br>
	<br>
	<div class="regdiv" style="margin-left: 17%;padding-left:50px ;margin-right: 20%;border: 1px solid #999;" >
	<form id="frm" action="/matna/community/write" method="post">
		<input type="hidden" name="type" id="type" value="free"/>
		<input type="hidden" name="writer" id="writer" value="${userNo}"/>
    <h2>
       게시글을 입력해주세요~!
    </h2>
    <p id="intro">
     게시판을 작성하는 페이지 입니다.
     글 작성 전, 공지사항에서 룰을 먼저 필독 해 주세요^_^♥
    </p> 
    
       <!--제목입력란 -->       
       <p id="inputfield"><label for="review_title">제목</label>
       <input type="text" id="review_title" name="title" placeholder="제목을 입력해주세요~"
              required tabindex="4" style="margin-bottom: 10px;"/> </p>
  
       <!--SmartEditor입력란 -->
   
       <textarea cols="100" rows="35" name="content"
				id="free_content" style="width: 750px; height: 350px;"></textarea>
	   <!-- <textarea cols="100" rows="35" name="content" 
	             id="review_content" style="width: 700px; height: 500px;"></textarea><br/> -->
	   
        <!-- 버튼 -->
        <button id="comm_submit" name="submit" tabindex="5" style="margin-left: 79%;">등록</button>
		<button id="exit" onclick="javascript:location.href='/matna/community/list';">취소</button>
       
    </form>
            
    </div>
           
    <!-- footer start -->
    <%@include file="/WEB-INF/views/footer.jsp" %>
    <!-- footer end --> 
</body>
</html>