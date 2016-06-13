<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@include file="/WEB-INF/views/matnaHeader.jsp" %>  
  <!-- header추가  -->


<script type="text/javascript">
jQuery(document).ready(function($) {
	
	// 별점매기기	
  $('.rating .star').hover(function() {
    $(this).addClass('to_rate');
    $(this).parent().find('.star:lt(' + $(this).index() + ')').addClass('to_rate');
    $(this).parent().find('.star:gt(' + $(this).index() + ')').addClass('no_to_rate');
  }).mouseout(function() {
    $(this).parent().find('.star').removeClass('to_rate');
    $(this).parent().find('.star:gt(' + $(this).index() + ')').removeClass('no_to_rate');
  }).click(function() {
    $(this).removeClass('to_rate').addClass('rated');
    $(this).parent().find('.star:lt(' + $(this).index() + ')').removeClass('to_rate').addClass('rated');
    $(this).parent().find('.star:gt(' + $(this).index() + ')').removeClass('no_to_rate').removeClass('rated');
    /*Save your rate*/
    /*TODO*/
  });
});

var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "review_content",
          sSkinURI: "/matna/resource/SE2/SmartEditor2Skin.html",
         htParams : {
            bUseToolbar : true,
            bUseVerticalResizer : true,
            bUseModeChanger : true,
            fOnBeforeUnload : function() {

            }
         },
         fOnAppLoad : function() {
            oEditors.getById["review_content"].exec("PASTE_HTML",
                  [ "글 작성시 공지사항에 룰을 먼저 필독 해 주세요" ]);
         },
         fCreator : "createSEditor2"
      });
      $("#submmit").click(function() {
         if($('[name=phone]').val()==null ||$('[name=phone]').val()==''){
            alert('연락처를 기입해주세요.');
            return false;
         }else if($('#summary').val()==null || $('[name=phone]').val()==''){
            alert('요약을 작성해주세요.');
            return false;
         }
         oEditors.getById["review_content"].exec("UPDATE_CONTENTS_FIELD", []);
         $("#action").val("writeSubmit");
         $("#review_writeForm").submit();
      });
});

</script>
</head>
<body> 
        
    <!-- ================== mini리뷰  =====================   -->  

      <form id="contact-form" method="POST" action="processForm.php" name="ContactForm">
    <h2>
      맛있는 리뷰를 작성해주세요~!
    </h2>
    <p class="intro">
     리뷰를 작성하는 페이지 입니다.
     글 작성 전, 공지사항에서 룰을 먼저 필독 해 주세요^_^♥
    </p> 

      <!-- 주소입력란 -->
      <p class="inputfield"><label for="gudong">구 & 동  & 상세주소</label></p> 
      <span name="gu">
              
      </span>
      <span name="dong">
              
      </span>
      <input type="text" id="addr" name="addr" required tabindex="4" 
                style="margin-bottom: 10px;" placeholder="상세주소입력란">
  
  
      <!--주차장여부 입력란 -->
	  <p class="inputfield"><label for="park">주차장 여부</label></p> 
	    <div class="toggle-radio">
	      <input type="radio" name="rdo" id="yes" checked value="1">
	      <input type="radio" name="rdo" id="no" value="0">
	      <div class="switch">
	        <label for="yes">있음</label>
	        <label for="no">없음</label>
	        <span></span>
	      </div>
	    </div>
	 
  
      <!--메뉴 선택란 -->  
      <p class="inputfield"><label for="menu">메뉴 </label></p> 
      <select name="kind">
              <option> == 메뉴를 선택해주세요 == </option>
              <option>식사</option>
              <option>디저트</option>
              <option>주류</option>
      </select>
  
  
      <!-- 맛 별점매기기  -->  
     <p class="inputfield"><label for="taste">맛 </label></p> 
          <div class="rating left">
            <div class="stars right">
              <a class="star rated"></a>
              <a class="star rated"></a>
              <a class="star rated"></a>
              <a class="star"></a>
              <a class="star"></a>
            </div>
          </div>
      <!-- 서비스 별점매기기  -->
     <p class="inputfield"><label for="service">서비스 </label></p> 
         <div class="rating left">
            <div class="stars right">
              <a class="star rated"></a>
              <a class="star rated"></a>
              <a class="star rated"></a>
              <a class="star"></a>
              <a class="star"></a>
            </div>
          </div>
  
      <!-- 1인비용 선택  -->
     <p class="inputfield"><label for="price">1인 비용 </label></p> 
         <select name="price">
                <option selected="selected"> == 1인 비용 == </option>
                <option value="0,5">5천원 이하</option>
                <option value="5,10" >5천원~1만원</option>
                <option value="10,20">1만원~2만원</option>
                <option value="20,30">2만원~3만원</option>
                <option value="30,50">3만원~5만원</option>
                <option value="50,70">5만원~7만원</option>
                <option value="70,100">7만원 이상</option>
         </select>
  
      <!-- 전화번호입력란 -->
	  <p class="inputfield"><label for="phone">전화번호</label></p> 
	  <input type="text" id="phone" name="phone" placeholder=" 예) 02-224-2424" style="color: #fff;" onfocus="if (this.value == '90') {this.value=''; this.style.color='#000';}" required tabindex="3" /> 
	  
      <!-- 요약입력란 -->
       <p class="inputfield"><label for="summary">요약</label></p> 
       <textarea name="summary" id="summary" tabindex="2"></textarea> 
          
 
       <!--제목입력란 -->       
       <p class="inputfield"><label for="review_title">제목</label></p> 
       <input type="text" id="review_title" name="review_title" placeholder="제목을 입력해주세요~" 
              required tabindex="4" style="margin-bottom: 10px;"/> <br/>
  
       <!--SmartEditor입력란 -->
	   <textarea cols="100" rows="35" name="review_content"
	             id="review_content" style="width: 700px; height: 500px;"></textarea></br>
	  
        <!-- 버튼 -->
       <input name="submit" type="submit" id="submit" tabindex="5" value="등록" />
       <input type="reset" value="  취소  ">
    </form>
                 
           
    <!-- footer start -->
    <%@include file="/WEB-INF/views/footer.jsp" %>
    <!-- footer end --> 
</body>
</html>