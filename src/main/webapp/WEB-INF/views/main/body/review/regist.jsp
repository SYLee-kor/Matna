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
     printGu();
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
      $('[name=score]').val($(this).attr('data-score'));
    /*Save your rate*/
    /*TODO*/
  });
  // # 수정 또는 입력 오류일 경우 수정 창 세팅
  if('${action}'=='modify' || '${errMsgs.isValid}' =='invalid'){
		// # 별 데이터 세팅
		$("[name=score]").val('${preview.score}');
		var thisStar = $('[data-score=${preview.score}]');
		thisStar.removeClass('to_rate').addClass('rated');
		thisStar.parent().find('.star:lt(' + $(this).index() + ')').removeClass('to_rate').addClass('rated');
		thisStar.parent().find('.star:gt(' + $(this).index() + ')').removeClass('no_to_rate').removeClass('rated');
	
		$('[name=parking][value=${preview.parking}]').attr('checked',true);
		$("[name=menu]").val('${preview.menu}');
		$("[name=price]").val('${preview.price}');
		$("[name=addr]").val('${preview.addr}');
		$("[name=recommend]").val('${preview.recommend}');
		$("[name=phone]").val('${preview.phone}');
		$("[name=title]").val('${review.title}');
		$("[name=content]").val('${review.content}');
	}
  	
  	var errMsgs = ['${errMsgs.addr}','${errMsgs.phone}','${errMsgs.recommend}'
  	               ,'${errMsgs.title}','${errMsgs.content}'];
  	var objs = [$('[name=addr]'),$('[name=phone]'),$('[name=recommend]')
  	            ,$('[name=title]'),$('[name=content]')];
	for (var int = errMsgs.length-1; int >= 0; int--) {
			/* alert('errMsgs[] = '+errMsgs[int]); */
		if( errMsgs[int]=='' ) {
		/* 	objs[int].val();
			objs[int].focus(); */
		}
	}
});// document. ready
function printGu() {
	$.ajax({
		url:"/matna/review/guList",
		dataType:"json",
		success:function(result){ // # result는 Array[String] 형태..
			var gu = '<select id="guList" onchange="printDong()" name="gu">';
			gu += '<option value="구">== 구 선택 ==</option>'
			for (var int = 0; int < result.length; int++) {
				gu+='<option value="'+result[int]+'">'+result[int]+'</option>';
			}
			gu += '</select>';
			$('#guSpan').html(gu);
			if('${preview.gu}'.length!=0) $('[name=gu]').val('${preview.gu}');
			printDong();
		},
		error:function(xhr,status,error){
			alert('error : '+error);
		}
	})
}
function printDong() {
	$.ajax({
		url:"/matna/review/dongList",
		data:"gu="+$('#guList').val(),
		dataType:"json",
		success:function(result){ // # result는 Array[String] 형태..
			var dong = '<select id="dongList" name="dong">';
			dong += '<option value="동">== 동 선택 ==</option>'
			for (var int = 0; int < result.length; int++) {
				dong+='<option value="'+result[int]+'">'+result[int]+"</option>";
			}
			dong += '</select>';
			$('#dongSpan').html(dong);
			if('${preview.dong}'.length!=0) $('[name=dong]').val('${preview.dong}');
		},
		error:function(xhr,status,error){
			alert('error : '+error);
		}
	})
}
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
            if('${action}'=='regist')
        	  oEditors.getById["review_content"].exec("PASTE_HTML",
                  [ "글 작성시 공지사항에 룰을 먼저 필독 해 주세요<br>" ]);
         }, 
         fCreator : "createSEditor2"
      });
      $("#submit").click(function() {
         oEditors.getById["review_content"].exec("UPDATE_CONTENTS_FIELD", []);
         var form = $('#frm');
    		 form.attr("action","/matna/review/${action}");
    		 form.submit();
      });
      $("#cancel").click(function() {
		 document.location.href=history.back();
			 /* '/matna/review/list?page=${page}&pageType=${pageType}&tabType=${tabType}'; */
	  })
});
</script>
</head>
<body> 
   <div class="regdiv" style="margin-left: 17%;padding-left:50px ;margin-right: 20%;border: 1px solid #999;" >
   
   <form name="reviewForm" class="reviewF" id="frm" method="POST">
   <c:if test="${action == 'modify'}">
      <input type="hidden" name="no" value="${review.no }">
   </c:if>
    <input type="hidden" name="writer" value="${userNo }">
    <input type="hidden" name="page" value="${page }">
    <input type="hidden" name="tabType" value="${tabType }">
    <input type="hidden" name="pageType" value="${pageType }">
    <h2>
      맛있는 음식 리뷰를 작성해주세요~!
    </h2>
    <p class="intro">
     리뷰를 작성하는 페이지 입니다.
     글 작성 전, 공지사항에서 룰을 먼저 필독 해 주세요^_^♥
    </p> 
    

      <!-- 주소입력란 -->
      <font color='red' face="bold">${errMsgs["e_gu"] }  ${errMsgs["e_dong"] }</font>
      <p class="inputfield"><label for="gudong">구 & 동  & 상세주소</label> 
      <span id="guSpan"></span>
      <span id="dongSpan"></span>
      <br> <font color="red" face="bold">${errMsgs.e_gu }  ${errMsgs.e_dong }</font>
      <input type="text" id="addr" name="addr" required tabindex="4"
                style="margin-bottom: 10px;margin-left: 15.5%;" placeholder="상세주소입력란">
      <font color="red" face="bold">${errMsgs.e_addr }</font> 
      </p>
  
      <!--주차장여부 입력란 -->
     <p class="inputfield"><label for="park">주차장 여부</label></p>
       <div class="toggle-radio">
         <input type="radio" id="yes" name="parking" value="1" checked>
         <input type="radio" id="no" name="parking" value="0">
         <div class="switch">
           <label for="yes">있음</label>
           <label for="no">없음</label>
           <span></span>
         </div>
       </div>
    <div class="new-select">
    <div class="selection">
        <p>
            <span></span>
            <i></i>
        </p>
        <span></span>
    </div>
</div>
  
      <!--메뉴 선택란 -->  
      <p class="inputfield"><label for="menu">메뉴 </label> 
      <select name="menu" id="menu" style="margin-left:7%;">
              <option value="menu"> == 메뉴를 선택해주세요 == </option>
              <option value="food">식사</option>
              <option value="desert">디저트</option>
              <option value="drink">주류</option>
      </select>
      <font color="red" face="bold">${errMsgs.e_menu }</font>
      </p>
  	  
  
      <!-- 별점매기기  -->  
          <div class="rating left">
            <div class="stars right">
             <label for="score" id="score" >평점 </label> 
              <a class="star rated" data-score="1" style="margin-left:7%;"></a>
              <a class="star rated" data-score="2"></a>
              <a class="star rated" data-score="3"></a>
              <a class="star" data-score="4"></a>
              <a class="star" data-score="5"></a>
            </div>
          </div>
      <input type="hidden" name="score" value=3>
      
      <!-- 1인비용 선택  -->
     <p class="inputfield"><label for="price">1인 비용 </label> 
         <select name="price" id="price" style="margin-left:3.7%;">
                <option selected="selected" value="0,0"> == 1인 비용 == </option>
                <option value="0,5">5천원 이하</option>
                <option value="5,10" >5천원~1만원</option>
                <option value="10,20">1만원~2만원</option>
                <option value="20,30">2만원~3만원</option>
                <option value="30,50">3만원~5만원</option>
                <option value="50,70">5만원~7만원</option>
                <option value="70,100">7만원 이상</option>
         </select>
      	 <font color="red" face="bold">${errMsgs.e_price }</font>
     </p>
      
      <!-- 전화번호 입력란 -->
	  <p class="inputfield"><label for="phone">전화번호</label> 
	  <input type="text" id="phone" name="phone" placeholder=" 예) 02-224-2424" style="margin-left:3.7%;" onfocus="if (this.value == '90') {this.value=''; this.style.color='#000';}" required tabindex="3" /> 
	  <font color="red" face="bold">${errMsgs.e_phone }</font>
	  </p>
      <!-- 추천메뉴 입력란 -->
       <p class="inputfield"><label for="recommend">추천메뉴</label>
       <input type="text" name="recommend" id="recommend" style="margin-left:3.7%;"> 
       <font color="red" face="bold">${errMsgs.e_recommend }</font>
       </p>
          
 
       <!--제목입력란 -->       
       <p class="inputfield"><label for="review_title">제목</label> 
       <font color="red" face="bold" >${errMsgs["e_title"] }</font>
       <input type="text" id="review_title" name="title" placeholder="제목을 입력해주세요~"
              required tabindex="4" style="margin-bottom: 10px; margin-left:3%;"/> </p>
  
       <!--SmartEditor입력란 -->
       <font color="red">${errMsgs["e_content"] }</font>
       <textarea cols="100" rows="35" name="content"
				id="review_content" style="width: 700px; height: 350px;"></textarea>
	   <!-- <textarea cols="100" rows="35" name="content" 
	             id="review_content" style="width: 700px; height: 500px;"></textarea><br/> -->
	  
        <!-- 버튼 -->
       <input name="submit" type="submit" id="submit" tabindex="5" value="등록" style="margin-left:79%;" />
       <input type="button" id="cancel" value="  취소  ">
    </form>
            
    </div>
           
    <!-- footer start -->
    <%@include file="/WEB-INF/views/footer.jsp" %>
    <!-- footer end --> 
</body>
</html>