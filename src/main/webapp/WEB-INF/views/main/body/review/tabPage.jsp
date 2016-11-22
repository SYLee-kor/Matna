<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
<!-- 
#review_photo{
   width :100px;
   height: 70px;
} -->
.prev,.next,.pageIndex,.reviewPhoto,.reviewTitle{
   cursor: pointer;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
     
   $(document).mousedown(function(e){
         $('.pop').each(function(){
                 if( $(this).css('display') == 'block'){
                     var l_position = $(this).offset();
                     l_position.right = parseInt(l_position.left) + ($(this).width());
                     l_position.bottom = parseInt(l_position.top) + parseInt($(this).height());

                     if( ( l_position.left <= e.pageX && e.pageX <= l_position.right )
                         && ( l_position.top <= e.pageY && e.pageY <= l_position.bottom ) )
                     {
                        // alert( 'popup in click' );
                     }
                     else
                     {
                         //alert( 'popup out click' );
                         $(this).hide();
                     }
                 }
             });
         }); 
 });
 
function gbCheck(gbType, rNo, userNo) {
	$.ajax({
		url : '/matna/review/gbCheck',
		data : {
			rNo : rNo,
			gbType : gbType,
			userNo : userNo
		},
		type : "post",
		dataType : "json",
		success : function(result) {
			if (result.result) { // # 좋아요를 누르지 않은 경우
				$('#' + result.gbType).html(result.gbNum);
			} else { // # 이미 좋아요를 누른 경우
				alert('좋아요 / 싫어요 는 한 리뷰당 한번만 가능합니다.');
			}
		},
		error : function(xhr, status, error) {
			alert(status.text);
			alert(error);
			alert(xhr);
		}
	})
}

function goRegist() {
   document.location.href=
      "/matna/review/regist?page=${page}&tabType=${tabType}&pageType=${pageType}";
}

function showContents(no) {
   var moveUrl = "/matna/review/read?no="+no
         +"&pageType=${pageType}&tabType=${tabType}&page=${pageMaker.cri.page}";
   document.location.href=moveUrl;
}

function show_pop(no){
      var bno = '#'+no;
      $(bno).show();
    }
    
function message(nick){
    window.open("/matna/message/listAll?toNickname="+nick+"#tab-3","_blank",
    		"location=no,toolbar=yes,scrollbars=yes,resizable=no,top=50,left=200, width=1000,height=600");
}

function searchWriter(writerR){
   $("#writerR2").val(writerR);
   $('#page').val('1');
   $("#dataForm").submit();
}

</script>
   
   
  <table class="review_List" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
        <th style="width: 50px;padding: 0px;text-align: center"><span>no</span></th>
        <th style="text-align: center;width: 110px;"><span>image</span></th>
        <th style="text-align: center;width: 600px;"><span>title</span></th>
        <th style="text-align: center;width: 150px;"><span>작성자</span></th>
        <th style="width: 70px;padding: 0px;text-align: center;">조회수</th>
        <th style="width: 75px;padding: 0px;text-align: center;">좋아요!</th>
        <th style="width: 75px;padding: 0px;text-align: center;">싫어요!</th>
        <th style="text-align: center;width: 40px;"><span>date</span></th>
        
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${list }" var="review">
      <tr class="list_lists">
         <td style="width: 50px;padding: 0px;">${review.no}</td>
         <td style="cursor: pointer;" onclick="showContents(${review.no})">${review.photo }</td>
         <td><a href=# style="font-size:13px;" onclick="showContents(${review.no})">${review.title }</a>
           <input type="button" readonly="readonly" class="reply_num"  value="${review.replyCnt }" style="cursor: default;" >
         </td> 
         <td style="text-align: left;">
            <img src="/matna/resource/img/lv${review.mGrade }.jpg"/>
            <a href="javascript:show_pop(${review.no });" style="font-size:13px;">
            ${review.nickName }</a>
            <div align="center" class="pop" id="${review.no }" style="position:absolute; background-color:white; z-index:1; display:none;
                width:150px; height:150px; border:3px solid #ff7359; border-radius:20px;">
                <table align="center" style="margin-top: 3px;">
                   <tr><td><a href="javascript:message('${review.nickName }')" style="font-size:13px;">쪽지보내기</a></td></tr>
                   <tr><td><a href="/matna/item/itemdetail?ino=1&&toNickname=${review.nickName }" style="font-size:13px;">포인트선물</a></td></tr>
                   <tr><td><a href="javascript:searchWriter('${review.nickName }')" style="font-size:13px;">게시글보기</a></td></tr>
                </table>
            </div>
         </td>
         <td>${review.viewCnt }</td> 
         <td>
	         <a href='javascript:gbCheck("good",${review.no },${userNo })'>
	         	<img alt="like" src="/matna/resource/images/good.PNG"><span id="good">${review.good }</span>
	         </a>
         </td> 
         <td>
         	<a href='javascript:gbCheck("bad",${review.no },${userNo })'>
         		<img alt="bad" src="/matna/resource/images/sad.PNG"><span id="bad">${review.bad }</span>
         	</a>
         </td>  
         <td>${review.regdate }</td>
      </tr>
    </c:forEach>
    </tbody>
  </table> 
  <!-- ------ paging 처리--------- -->
   <center>
   <table>
      <tr>
        <td style="width: 500px;">
         <div class="page" align="center">
           <ul class="pagination modal-1" id="pagination">
           <c:if test="${pageMaker.prev }">
              <li><a class="prev" 
              onclick="showPage_${pageType }('${tabType}',${pageMaker.beforePage})">&laquo;</a></li>
           </c:if>
           <li><a class="prev"
              onclick="showPage_${pageType }('${tabType}',${pageMaker.prevPage})">prev</a></li>
           <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" varStatus="stat">
            <c:if test="${pageMaker.cri.page == stat.index }">
            <li><a style="cursor: pointer;" id="pIndex${stat.index }" class="active"
                 onclick="showPage_${pageType }('${tabType}',${stat.index})">${stat.index }</a></li>
            </c:if> 
            <c:if test="${pageMaker.cri.page != stat.index }">
            <li><a style="cursor: pointer;" id="pIndex${stat.index }"
                 onclick="showPage_${pageType }('${tabType}',${stat.index})">${stat.index }</a></li>
            </c:if> 
           </c:forEach>
           <li><a class="next"
              onclick="showPage_${pageType }('${tabType}',${pageMaker.nextPage})">next</a></li>
           <c:if test="${pageMaker.next }">
              <li><a class="next"
                 onclick="showPage_${pageType }('${tabType}',${pageMaker.afterPage})">&raquo;</a></li>
           </c:if>
         </ul>
         </div>
        </td>
        
        <td class="comm_list_td">
           <div class="list_write_bt" id="reviewlist_write_bt">
                <a onclick="goRegist()" style="cursor: pointer;padding-top:5px;"><span><b>글 쓰기</b></span></a>  
           </div>
        </td>
      </tr>
   </table>
   
    <form id="dataForm" action="/matna/main/review/list" method="post">
 <input type="hidden" name="rb" id="rb" value="${tabType}"/>
 <input type="hidden" name="gu" id="gu" value=""/>
 <input type="hidden" name="dong" id="dong" value=""/>
 <input type="hidden" name="money" id="money" value=""/>
 <input type="hidden" name="parking" id="parking" value=""/>
 <input type="hidden" name="date" id="date" value=""/>
 <input type="hidden" name="search" id="search" value=""/>
 <input type="hidden" name="reviewType" id="reviewType" value="search"/>
 <input type="hidden" name="writerR" id="writerR2" value=""/>
 <input type="hidden" name="page" id="page" value=""/>
 </form>

  </center>