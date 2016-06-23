<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  <!-- header추가  -->

<script type="text/javascript" src="/matna/resource/SE2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript" src="/matna/resource/jquery/jquery-2.2.3.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($) {
	
  // # 수정 일 경우 수정 창 세팅
  if('${action}'=='modify'){
	
  }
});// document. ready
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "recipe_content",
          sSkinURI: "/matna/resource/SE2/SmartEditor2Skin.html",
         htParams : {
            bUseToolbar : true,
            bUseVerticalResizer : true,
            bUseModeChanger : true,
            fOnBeforeUnload : function() {
            }
         },
          fOnAppLoad : function() {
            if('${action}'=='regist')
        	  oEditors.getById["recipe_content"].exec("PASTE_HTML",
                  [ "글 작성시 공지사항에 룰을 먼저 필독 해 주세요<br>" ]);
         }, 
         fCreator : "createSEditor2"
      });
      $("#submit").click(function() {
         oEditors.getById["recipe_content"].exec("UPDATE_CONTENTS_FIELD", []);
         
         var form = $('#frm');
    		 form.attr("action","/matna/recipe/${action}");
    		 form.submit();
      });
      $("#cancel").click(function() {
		 document.location.href=
			 '/matna/recipe/list?page=${page}&pageType=${pageType}&tabType=${tabType}';
	  })
});
// # 새로운 아이템 리스트에 등록
function registItem() { 
	var newItem = $('[name=item]').val();
	$('[name=item]').val('');
	var itemList = $('#itemList');
	var oldItem = itemList.text();
	if(oldItem != '') itemList.text(oldItem+','+newItem);
	else itemList.text(newItem);
	$('[name=ingredient]').val( itemList.text() );
}
</script>
</head>
<body> 
    <%session.setAttribute("userNo", 1); %>    
	<form name="reviewForm" class="reviewF" id="frm" method="POST" enctype="multipart/form-data">
	<c:if test="${action == 'modify'}">
		<input type="hidden" name="no" value="${recipe.no }">
	</c:if>
    <input type="hidden" name="writer" value="${userNo }">
    <input type="hidden" name="page" value="${page }">
    <input type="hidden" name="pageType" value="${pageType }">
 	<input type="hidden" name="photo" value="${recipe.photo }">
    <h2>
      맛있는 음식 레시피를 작성해주세요~!
    </h2>
    <p class="intro">
     레시피를 작성하는 페이지 입니다.
     글 작성 전, 공지사항에서 룰을 먼저 필독 해 주세요^_^♥
    </p> 
	  <input type="file" name="file">
      <!-- 재료입력란 -->
      <p class="inputfield"><label for="item">재료</label></p> 
	  <div id="itemList"></div>
	  <input type="hidden" name="ingredient">
	    
      <input type="text" id="addr" name="item" required tabindex="4" 
                style="margin-bottom: 10px;" placeholder="재료입력">
      <input type="button" value="등록" onclick="registItem()"/>

  	  <!-- 가격 입력란 -->
  	  <p class="inputfield"><label for="price">가격 </label></p>
  	  <input type="text" name="price" placeholder="가격을 입력해주세요."> 원
 
  	  <!-- 조리시간 입력란 -->
  	  <p class="inputfield"><label for="time">조리 시간(분 단위) </label></p>
  	  <input type="text" name="time" placeholder="조리 시간을 분 단위로 입력해주세요."> 분
  	   
  	  <!-- 난이도 선택란 -->
  	  <p class="inputfield"><label for="difficulty">난이도 </label></p>
  	  <select name="difficulty">
  	  	<option value="상">복잡</option>
  	  	<option value="중">보통</option>
  	  	<option value="하" selected="selected">간단</option>
  	  </select>
  	   
      <!-- 인분 선택란 -->  
      <p class="inputfield"><label for="per">인분 </label></p> 
      <select name="per">
              <option value="1" selected="selected">1인분</option>
              <option value="2">2인분</option>
              <option value="3">3인분</option>
              <option value="4">4인분</option>
      </select>
  
  	 <!-- 요리이름 입력란 -->
  	  <p class="inputfield"><label for="foodName">요리이름 </label></p>
  	  <input type="text" name="foodName" placeholder="요리 이름을 입력해주세요.">
  	  
  	  <!-- 요리 상세내용 입력란 -->
  	  <p class="inputfield"><label for="foodDetail">요리설명 </label></p>
  	  <input type="text" name="foodDetail" placeholder="요리 설명을 입력해주세요.">
  	  
       <!--제목입력란 -->       
       <p class="inputfield"><label for="recipe_title">제목</label></p> 
       <input type="text" id="recipe_title" name="title" placeholder="제목을 입력해주세요~" 
              required tabindex="4" style="margin-bottom: 10px;"/> <br/>
  
       <!--SmartEditor입력란 -->
       <textarea cols="100" rows="35" name="content"
				id="recipe_content" style="width: 700px; height: 350px;"></textarea>
	  
        <!-- 버튼 -->
       <input name="submit" type="submit" id="submit" tabindex="5" value="등록" />
       <input type="button" id="cancel" value="  취소  ">
    </form>
                 
           
    <!-- footer start -->
    <%@include file="/WEB-INF/views/footer.jsp" %>
    <!-- footer end --> 